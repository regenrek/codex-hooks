# codex-hooks

Canonical hook assets. Copy these two files into your Codex hooks location.

## Files

- `hooks/instruct/hook_instruct.sh`
- `hooks/instruct/hook_instruct.md`

## Behavior

`hook_instruct.sh` prints `hook_instruct.md` and fails loudly when the file is missing/empty.

## Copy-only workflow

```bash
mkdir -p "${CODEX_HOME:-$HOME/.codex}/hooks/instruct"
cp hooks/instruct/hook_instruct.sh "${CODEX_HOME:-$HOME/.codex}/hooks/instruct/"
cp hooks/instruct/hook_instruct.md "${CODEX_HOME:-$HOME/.codex}/hooks/instruct/"
chmod +x "${CODEX_HOME:-$HOME/.codex}/hooks/instruct/hook_instruct.sh"
```

## Hook wiring

Edit `~/.codex/config.toml` and register this script on the event that runs before each response:

```bash
"${CODEX_HOME:-$HOME/.codex}/hooks/instruct/hook_instruct.sh"
```

Use this config shape:

```toml
[hooks]
pre_turn = ["${CODEX_HOME:-$HOME/.codex}/hooks/instruct/hook_instruct.sh"]
```

How it works:

- the hook runner executes `hook_instruct.sh` on each turn before response generation
- the script prints policy text from `hook_instruct.md` to stdout
- missing/empty policy file exits non-zero to fail fast

If your Codex build does not expose a `[hooks]` config section yet, there is no hook-event setting to change in that build.

## Validate

```bash
hooks/instruct/hook_instruct.sh
```

```bash
CODEX_HOOK_INSTRUCT_FILE=/tmp/missing.md hooks/instruct/hook_instruct.sh
```
