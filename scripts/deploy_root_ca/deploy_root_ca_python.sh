#!/usr/bin/env bash

# [bash_init]-[BEGIN]
# Exit whenever it encounters an error, also known as a non–zero exit code.
set -o errexit
# Return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status,
#   or zero if all commands in the pipeline exit successfully.
set -o pipefail
# Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error when performing parameter expansion.
set -o nounset
# Print a trace of commands.
set -o xtrace
# [bash_init]-[END]

# [certificate]-[BEGIN]
# [set_for_python]-[BEGIN]
# Do this in venv, if needed.
python - <<'____HERE'
import certifi
cafile = certifi.where()
with open(cafile, 'ab') as outfile:
    with open('usr/share/ca-certificates/Cryeye_Self_Root_CA.crt', 'rb') as customcafile:
        customca = customcafile.read()
        outfile.write(b'\n')
        outfile.write(customca)
____HERE
# [set_for_python]-[END]
# [certificate]-[END]