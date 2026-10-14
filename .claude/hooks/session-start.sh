#!/bin/bash
# Registra REA (MCP + skill) en Claude Code al iniciar una sesión cloud.
set -euo pipefail

[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] || exit 0

REA_VERSION="6.5.0"

# Idempotente: si el registro ya está alineado, no hace nada.
if grep -q "rea-agents@${REA_VERSION}" "$HOME/.claude.json" 2>/dev/null \
  && [ -f "$HOME/.claude/skills/reverse-engineer-anything/SKILL.md" ]; then
  exit 0
fi

npx -y "rea-agents@${REA_VERSION}" setup --client claude_code --yes --json >/dev/null
