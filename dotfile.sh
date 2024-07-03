#!/bin/env sh

log () {
  msg="$1"
  printf "%s\n" "$msg" >&2
}
log "dotfile thing running..."

# knowledge base
# * https://www.baeldung.com/linux/aborting-shell-script
panic() {
  msg="$1"

  # red color if tty?
  # if [ $(tty -s) -eq 0 ]; then
  #   printf "\033[0;31m%s\n\033[0m" "$msg" >&2
  # fi

  if [  -n "$msg" ]; then
    log "$msg - aborting"
  else
    log "aborting without cause [:-(]"
  fi
  exit 1
}

# panic if "/etc/lsb-release" do not exist
[ -f /etc/lsb-release ] || panic "'/etc/lsb-release' do not exist"
. /etc/lsb-release

# DOGMA: at this point, refuse to continue if is not "LinuxMint"
[ "$DISTRIB_ID" != "LinuxMint" ] && panic "xperimental! only runs on mint"

# DOGMA: at this point, if no "command" ex·plic·it·ly mentioned, default
# to "analysis" mode
MODE="analysis"
[ -z "$1" ] || MODE="$1"

log "dotfile thing running on '$MODE' mode"
log "dotfile thing stops running"
