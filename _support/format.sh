#!/usr/bin/env bash

for fn in "$@"; do
  echo "==> $fn"
  cat "$fn" \
    | yarn run -s prettier --stdin-filepath 'file.md' \
    | perl -p0e 's#\n\n\{: #\n\{: #g' \
    | tee "$fn" \
    > /dev/null
done
