# Edward-Weston-CV
This is my CV. View it on GitHub Pages: https://geekyed.github.io/Edward-Weston-CV/ ([PDF](https://geekyed.github.io/Edward-Weston-CV/Edward-Weston-CV.pdf)).

## How it's built
`index.md` is the only source file. `build/build.sh` turns it into `index.html` (using `build/template.html`) and `Edward-Weston-CV.pdf` (headless Chrome). The generated files are not committed.

On every push to `main`, the GitHub Action in `.github/workflows/build.yml` runs the build and deploys the result to GitHub Pages. The build fails if `index.html` is 5 KB or more when gzipped.

Pages must be set to deploy from **GitHub Actions** (Settings > Pages > Build and deployment > Source).

To preview locally: `./build/build.sh` (needs Node and Chrome), then open `index.html`. The output is git-ignored.
