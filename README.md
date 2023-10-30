# CryEye Self-signed Root CA

Self-signed Root CA certificate for Cryeye-related services. 

Useful for "internal network" environment.

Add this certificate to your browser and/or system.

### Add RootCA in Chrome:

- Go to [chrome://settings/certificates](chrome://settings/certificates)
- Go to **Authorities** tab
- Click **Import**
- Select **Cryeye_Self_Root_CA.crt** from **certs/Cryeye_Self_Root_CA/**
- Check **Trust this certificate for identifying websites**
- Click **OK**

### Add rootCA (for CryEye) certificate to a system:

Make this, if needed to run some scripts and access to services behind certificates signed by this RootCA.

Can be used in docker.

```bash
SCRIPT_NAME="deploy_root_ca_system.sh"
PATH_TO_SCRIPT="./${SCRIPT_NAME}"
wget https://raw.githubusercontent.com/cqr-cryeye-public/cryeye_public_ssl_self_root_ca/main/scripts/deploy_root_ca/${SCRIPT_NAME} \
--output-document ${PATH_TO_SCRIPT}  &&\
chmod +x ${PATH_TO_SCRIPT} &&\
${PATH_TO_SCRIPT} &&\
rm ${PATH_TO_SCRIPT}
```

Need to run this script with root privileges, if run in a local system.

```bash
sudo su
```

### Add rootCA (for CryEye) certificate to a python environment:

You need to have "certifi" package installed.

Run it from a python environment, where you want to add this certificate. For example, from a virtual environment.

```bash
SCRIPT_NAME="deploy_root_ca_system.sh"
PATH_TO_SCRIPT="./${SCRIPT_NAME}"
wget https://raw.githubusercontent.com/cqr-cryeye-public/cryeye_public_ssl_self_root_ca/main/scripts/deploy_root_ca/${SCRIPT_NAME} \
--output-document ${PATH_TO_SCRIPT}  &&\
chmod +x ${PATH_TO_SCRIPT} &&\
${PATH_TO_SCRIPT} &&\
rm ${PATH_TO_SCRIPT}
```