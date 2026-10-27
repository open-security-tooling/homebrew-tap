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
2. This tap's [update workflow](.github/workflows/update.yml) pulls the release, verifies every binary's provenance with `gh attestation verify`, and pushes a branch with the new formula. GitHub signs the commit. Nothing outside this repo can write to it.
3. [CI](.github/workflows/tests.yml) checks the provenance and SHA-256 values again, then installs and tests the formula on macOS and Linux.
4. A maintainer opens the pull request, reviews it and merges it.

Nothing is pushed to `main` directly: the repo has the org's default-branch ruleset (signed commits, pull requests only, no force-push).

## Verify what you installed

```sh
gh attestation verify "$(brew --cache open-security-tooling/tap/threat)" \
  --repo open-security-tooling/threat-model --deny-self-hosted-runners
```
