# Edward-Weston-CV
This is my CV. View it on GitHub Pages: https://geekyed.github.io/Edward-Weston-CV/ ([PDF](https://geekyed.github.io/Edward-Weston-CV/Edward-Weston-CV.pdf)).

## How it's built
`index.md` is the source. `build/build.sh` turns it into `index.html` (using `build/template.html`) and `Edward-Weston-CV.pdf` (headless Chrome). The GitHub Action in `.github/workflows/build.yml` runs this on every push that changes `index.md` or `build/`, and commits the output. The build fails if `index.html` is 5 KB or more when gzipped.

To build locally: `./build/build.sh` (needs Node and Chrome).
