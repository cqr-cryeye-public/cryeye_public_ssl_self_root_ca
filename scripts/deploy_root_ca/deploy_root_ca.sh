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
# [download_and_set_for_system]-[BEGIN]
wget https://raw.githubusercontent.com/cqr-cryeye-public/cryeye_public_ssl_self_root_ca/main/certs/Cryeye_Self_Root_CA/Cryeye_Self_Root_CA.crt \
--output-document /usr/share/ca-certificates/Cryeye_Self_Root_CA.crt

cp /usr/share/ca-certificates/Cryeye_Self_Root_CA.crt /usr/lib/ssl/certs/Cryeye_Self_Root_CA.crt
update-ca-certificates
# [download_and_set_for_system]-[END]

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