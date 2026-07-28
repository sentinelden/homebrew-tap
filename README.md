# SentinelDen Homebrew tap

Homebrew formulae for [SentinelDen](https://sentinelden.com) command-line tools.

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
threshold or the policy gate failed, `1` bad arguments, `3` internal error,
`4` license verification failed.

### Signed attestations

`--attest` writes a signed record binding the target binary's SHA-256, the
engine version, and a digest of the findings, so whoever receives a report
can confirm it was not edited after the fact:

```bash
sentinelctl audit ./MyApp.ipa --attest report.att.json
sentinelctl verify-report report.att.json --artifact ./MyApp.ipa
```

The signing key is generated per install on first use. It proves the report
came from that machine's copy of the engine. It is not a SentinelDen vendor
key, and an attestation is not a certification of the app.

## What this tap ships

macOS only, universal (Apple Silicon + Intel). The binary is signed with a
Developer ID certificate and notarized by Apple.

A Linux build is not published yet. If you need one for a Linux CI runner,
say so at <https://sentinelden.com/contact?area=Sentinel%20Studio>, it moves
up the queue on demand.

## Related

- [SentinelDen Studio](https://sentinelden.com/audit), the macOS app this
  engine comes from, with the disassembler, Frida runtime instrumentation,
  and report branding.
- [Documentation](https://sentinelden.com/docs/audit)

## License

`sentinelctl` is proprietary software. This repository contains only the
Homebrew formula that installs it.
