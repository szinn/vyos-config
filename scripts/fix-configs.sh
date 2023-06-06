#!/bin/vbash
# shellcheck shell=bash
# shellcheck source=/dev/null

# Load secrets into ENV vars
if [ -f "/config/secrets.sops.env" ]; then
  export SOPS_AGE_KEY_FILE=/config/secrets/age.key

  mapfile environmentAsArray < <(
    sops --decrypt "/config/secrets.sops.env" |
      grep --invert-match '^#' |
      grep --invert-match '^\s*$'
  ) # Uses grep to remove commented and blank lines
  for variableDeclaration in "${environmentAsArray[@]}"; do
    export "${variableDeclaration//[$'\r\n']/}" # The substitution removes the line breaks
  done
fi

# Apply environment to container files
restart_containers=""
for file in $(find containers -type f -name "*.tmpl"); do
  cfgfile="${file%.tmpl}"

  shafile=$file.sha256
  if ! test -e $shafile; then
    echo "rebuild" >$shafile
  fi

  newsha=$(envsubst <$file | shasum -a 256 | awk '{print $1}')
  oldsha=$(cat $shafile)

  if ! test $newsha == $oldsha; then
    echo "Configuration changed for $file"
    if ! "$dry_run"; then
      envsubst <"$file" >"$cfgfile"
      echo $newsha >$shafile
      restart_containers="$restart_containers $(echo $file | awk -F / '{print $1}')"
    fi
  fi
done

# Restart containers
for container in $restart_containers; do
  _vyatta_op_run restart container $container
done
