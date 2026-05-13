# Codex Local Computer Use

Local Codex marketplace wrapper for Computer Use.

This repository intentionally does **not** include the proprietary OpenAI
`Codex Computer Use.app` bundle, signatures, icons, provisioning profiles, or
other binary assets. It only contains local marketplace metadata and helper
scripts for machines that already have a licensed Computer Use bundle installed
by Codex.

## What is included

- `.agents/plugins/marketplace.json`: local marketplace entry.
- `plugins/computer-use-local-wrapper/.codex-plugin/plugin.json`: plugin metadata.
- `plugins/computer-use-local-wrapper/.mcp.json`: MCP server command pointing at a local app bundle.
- `scripts/install_from_existing_bundle.sh`: copies an existing local bundle into this repo for local testing.

## Local setup

From the repository root:

```bash
./scripts/install_from_existing_bundle.sh
```

The script looks for a local Computer Use bundle in common Codex cache paths and
copies it to:

```text
plugins/computer-use-local-wrapper/Codex Computer Use.app
```

That `.app` directory is ignored by git and must not be committed or published.

## Use as a Codex local marketplace

Point Codex at this repository as a local plugin marketplace, or copy the
`.agents/plugins/marketplace.json` pattern into your own local marketplace.

The marketplace entry uses a local source:

```json
{
  "source": "local",
  "path": "./plugins/computer-use-local-wrapper"
}
```

## License

The wrapper metadata and helper scripts in this repository are MIT licensed.
The OpenAI Computer Use app bundle is not included and remains subject to its
own license and terms.

This project is not affiliated with or endorsed by OpenAI.
