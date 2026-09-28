# SentinelDen Homebrew tap

Homebrew formulae for [SentinelDen](https://sentinelden.com) command-line tools, and
a cask for the SentinelDen Studio app.

## SentinelDen Studio (app)

```bash
brew install --cask sentinelden/tap/sentinelden-studio
```

The notarized app for macOS 26 or later. It updates itself, so `brew upgrade` leaves
it alone.

## sentinelctl

The headless build of the SentinelDen Studio audit engine. Audits iOS and
Android app binaries and writes SARIF, CycloneDX SBOM, Markdown, HTML, a
MASVS/MASTG evidence pack, and issue-tracker JSON, with a policy-as-code
exit-code gate for CI.

```bash
brew install sentinelden/tap/sentinelctl
```

```bash
sentinelctl audit ./build/MyApp.ipa \
  --policy standard \
  --sarif    sentinel-report.sarif.json \
  --sbom     sentinel-sbom.cdx.json \
  --evidence sentinel-evidence.md
```

Exit codes make it a build gate: `0` clean, `2` findings exceeded the
threshold or the policy gate failed, `1` bad arguments, `3` internal error.
`verify-report` also exits `4` when no `--signer` was pinned, because the
signature is then only self-asserted.

### Signed attestations

`--attest` writes a signed record binding the audited file's SHA-256, the
engine version, and a digest of the whole report (score, findings, fixes and
MASVS/CWE tags), so whoever receives a report can confirm it was not edited
after the fact:

```bash
sentinelctl audit ./MyApp.ipa --json report.json --attest report.att.json
sentinelctl verify-report report.att.json --signer <auditor-pubkey> --artifact ./MyApp.ipa --report report.json
```

For an `.ipa` or `.apk` the hash is of the archive itself (from 1.10.1; earlier
versions hashed the executable inside an `.ipa`). For an `.app` folder it is
the executable inside it.

The signing key is generated per install on first use. It proves the report
came from that machine's copy of the engine. It is not a SentinelDen vendor
key, and an attestation is not a certification of the app.

## What this tap ships

macOS 14 (Sonoma) or newer, universal (Apple Silicon + Intel). The binary is
signed with a Developer ID certificate and notarized by Apple.

For Linux CI there is a GitHub Action: [sentinelden/sentinelctl-action](https://github.com/sentinelden/sentinelctl-action). It fetches a static binary for x86_64 or arm64 and checks its SHA-256 against both the published checksum and a digest committed in the Action before running it. Both builds are on 1.7.2.

## Related

- [SentinelDen Studio](https://sentinelden.com/audit), the macOS app this
  engine comes from, with the disassembler, Frida runtime instrumentation,
  and report branding.
- [Documentation](https://sentinelden.com/docs/audit)

## License

`sentinelctl` is proprietary software. This repository contains only the
Homebrew formula that installs it.
