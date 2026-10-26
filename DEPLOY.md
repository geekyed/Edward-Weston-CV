# Deploying the CV

There are two deployments from one build:

| Target | What runs | How it updates |
|---|---|---|
| GitHub Pages | `index.html` + `Edward-Weston-CV.pdf` | The `build` job uploads `_site` to Pages. |
| Homelab | `ghcr.io/geekyed/edward-weston-cv` | The mini polls `:main` every 300 seconds. |

Both use the same files produced by `build/build.sh`, so the public Pages copy
and the homelab copy cannot drift.

## The image

`Dockerfile` is a thin `nginx-unprivileged` image. It copies the built files; it
does not run Node or Chrome. The `build` job in `.github/workflows/build.yml`
builds the site, uploads `_site` as the `cv-site` artifact, and the `publish` job
calls the reusable workflow in [homelab-deploy](https://github.com/geekyed/homelab-deploy)
with `artifact: cv-site`. That workflow unpacks the artifact into the build
context, builds `linux/arm64`, and pushes `:main` and `:<sha>` to GHCR.

The homelab side lives in that repo: `services/edward-weston-cv/compose.yml` is
the deployed contract, and `bin/deploy` pulls it, waits for the image healthcheck,
and rolls back if the new container never becomes healthy.

## Release order

1. **Merge the homelab-deploy change first.** Its reusable workflow must have the
   `artifact` input on the default branch before this repo's workflow can call it.
2. **Merge this repo.** Wait for the `publish` job to push
   `ghcr.io/geekyed/edward-weston-cv:main`.
3. **Install the agent on the mini.** The image must exist first; otherwise the
   first pull fails and the agent exits without starting anything. That is the
   intended fail-safe, not a bug.

   ```bash
   cd ~/dev/homelab-deploy
   git pull
   mkdir -p .secrets
   touch .secrets/edward-weston-cv.env
   ./bin/register edward-weston-cv install
   ```

   The CV has no secrets. `bin/deploy` still requires the env file to exist, so
   an empty file is enough.

4. **Add the tunnel rule.** In the Cloudflare Zero Trust dashboard, map
   `cv.edweston.uk` to `http://127.0.0.1:8081`. The container binds loopback only,
   so the tunnel is the sole ingress.

5. **Verify both paths.**

   ```bash
   cd ~/dev/homelab-deploy
   ./bin/register edward-weston-cv status
   curl -fsS http://127.0.0.1:8081/ >/dev/null && echo local ok
   curl -fsS https://cv.edweston.uk/ >/dev/null && echo tunnel ok
   ```

## Deploying without waiting

The launchd agent polls every five minutes. To run it now:

```bash
cd ~/dev/homelab-deploy
./bin/register edward-weston-cv run
```

To bypass launchd entirely:

```bash
./bin/deploy edward-weston-cv
```

## Rollback

Pin the previous sha in `.secrets/edward-weston-cv.env` and deploy:

```sh
EDWARD_WESTON_CV_TAG=8598b8b...    # a :<sha> tag from a previous build
```

Remove the line to follow `:main` again. Every build publishes a sha tag
alongside `:main`, so there is always a previous image to pin.

As with every homelab service, never run `docker system prune -a` on the mini:
it deletes the untagged images a rollback needs.

## Local container

```bash
./build/build.sh
docker compose up --build
open http://127.0.0.1:8081
```

`./build/build.sh` needs Node and Chrome. The Docker build only needs the two
generated files; it never runs Chrome itself.
