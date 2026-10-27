# open-security-tooling/homebrew-tap

Homebrew formulae for [open-security-tooling](https://github.com/open-security-tooling) tools.

```sh
brew install open-security-tooling/tap/threat
```

Installing by the full name trusts only that formula. To use the short name (`brew install threat`), trust it first:

```sh
brew trust --formula open-security-tooling/tap/threat
```

## How formulae get here

1. A tool's release workflow publishes an immutable GitHub release with signed build provenance.
2. Within the hour, this tap's [update workflow](.github/workflows/update.yml) pulls the release, verifies every binary with `gh attestation verify` (built by the tool's release workflow, from the release tag, on GitHub's runners), and commits the new formula. GitHub signs the commit. Nothing outside this repo can write to it.
3. [CI](.github/workflows/tests.yml) checks the provenance and SHA-256 values again, then installs and tests the formula on macOS and Linux.

Only the update workflow commits to `main` directly; every other change needs a signed commit and a pull request.

## Verify what you installed

```sh
gh attestation verify "$(brew --cache open-security-tooling/tap/threat)" \
  --repo open-security-tooling/threat-model --deny-self-hosted-runners
```
