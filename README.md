# Edward-Weston-CV
This is my CV. View it on GitHub Pages: https://geekyed.github.io/Edward-Weston-CV/ ([PDF](https://geekyed.github.io/Edward-Weston-CV/Edward-Weston-CV.pdf)). It is also served from my homelab at https://cv.edweston.uk.

## How it's built
`index.md` is the only source file. `build/build.sh` turns it into `index.html` (using `build/template.html`) and `Edward-Weston-CV.pdf` (headless Chrome). The generated files are not committed.

On every push to `main`, the GitHub Action in `.github/workflows/build.yml` runs the build, deploys the result to GitHub Pages, and publishes `ghcr.io/geekyed/edward-weston-cv` through the reusable workflow in [homelab-deploy](https://github.com/geekyed/homelab-deploy). The image is a tiny nginx container serving the same two files; the mini polls `:main` every five minutes. The build fails if `index.html` is 5 KB or more when gzipped.

Pages must be set to deploy from **GitHub Actions** (Settings > Pages > Build and deployment > Source).

## Preview locally
To preview the site: `./build/build.sh` (needs Node and Chrome), then open `index.html`. The output is git-ignored.

To preview the exact container the homelab runs:

```sh
./build/build.sh
docker compose up --build
open http://127.0.0.1:8081
```

See [DEPLOY.md](DEPLOY.md) for the release order, tunnel setup, and rollback.
