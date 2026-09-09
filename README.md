# Remnanode fork with pinned official Xray

Builds [remnawave/node](https://github.com/remnawave/node) images against a chosen
[XTLS/Xray-core](https://github.com/XTLS/Xray-core) release.

## Image tags

| Tag | Meaning |
|-----|---------|
| `3.4.1-x26.9.9` | remnanode `3.4.1` + Xray `v26.9.9` |
| `latest` | last successful build |
| `3.4.1` | same as latest build for that remnanode version |
| `x26.9.9` | same as latest build for that Xray version |

```bash
docker pull ghcr.io/raaad1on/remnanode:3.4.1-x26.9.9
```

## Release

Push a tag matching `{node}-x{xray}`:

```bash
git tag 3.4.1-x26.9.9
git push origin 3.4.1-x26.9.9
```

Or run **Build & Push Docker Image** via Actions → workflow_dispatch
(empty inputs = latest remnawave/node + latest XTLS/Xray-core).

## Blackhole 204 (official Xray)

```json
{
  "tag": "204",
  "protocol": "blackhole",
  "settings": {
    "response": {
      "type": "custom",
      "customResponseData": "SFRUUC8xLjEgMjA0IE5vIENvbnRlbnQNCkNvbm5lY3Rpb246IGNsb3NlDQoNCg=="
    }
  }
}
```

## Upstream sync

Daily workflow checks remnawave/node for updates and opens a PR into this fork.
After merging, cut a new `{node}-x{xray}` tag to rebuild.
