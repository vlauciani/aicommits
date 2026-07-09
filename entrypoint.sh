#!/bin/sh
#
# Entrypoint for the aicommits container.
#
# aicommits reads its settings only from ~/.aicommits, never from the
# environment. This script bridges that gap: it translates a known set of
# environment variables (injected via `docker run --env-file`) into
# `aicommits config set` calls, then hands control to aicommits itself.

set -eu

# Git refuses to operate on the bind-mounted repo because it is owned by the
# host user's uid, not root. Marking it safe here removes a manual step that
# every user used to hit on first run.
#
# It must go into the *system* config: the user's ~/.gitconfig is bind-mounted
# as a single file, and git writes config via a temp-file rename that cannot
# replace a mount point (EBUSY, "Resource busy"). git honours safe.directory
# from system config too, and /etc/gitconfig lives in the writable layer.
git config --system --add safe.directory /git

cd /git

# Design: an explicit allowlist keeps the unrelated variables that Docker
# always injects (PATH, HOME, ...) out of the config. Adding a future
# aicommits setting is a one-line change to the loop below.
set_if_present() {
    KEY="$1"
    VALUE="$(printenv "${KEY}" || true)"
    # Trim surrounding whitespace and any trailing CR. `docker --env-file`
    # keeps these verbatim, so a hand-edited profile with a trailing space or
    # Windows line endings would yield e.g. "conventional ", which aicommits
    # rejects as an invalid value. None of our keys carry meaningful spaces.
    VALUE="$(printf '%s' "${VALUE}" | tr -d '\r' | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//')"
    if [ -n "${VALUE}" ]; then
        aicommits config set "${KEY}=${VALUE}"
    fi
}

for KEY in OPENAI_API_KEY OPENAI_BASE_URL OPENAI_MODEL type locale timeout; do
    set_if_present "${KEY}"
done

exec aicommits
