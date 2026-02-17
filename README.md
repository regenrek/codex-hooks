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

Use your hook config to invoke:

```bash
"${CODEX_HOME:-$HOME/.codex}/hooks/instruct/hook_instruct.sh"
```

Attach it to your per-turn/pre-response hook event.

## Validate

```bash
hooks/instruct/hook_instruct.sh
```

```bash
CODEX_HOOK_INSTRUCT_FILE=/tmp/missing.md hooks/instruct/hook_instruct.sh
```
