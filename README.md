# Cryeye Self-signed Root CA

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

### Add rootCA (for Cryeye) certificate to a system:

Make this, if needed to run some scripts and access to services behind certificates signed by this RootCA.

```bash
PATH_TO_SCRIPT="./deploy_root_ca.sh"
wget https://raw.githubusercontent.com/cqr-cryeye-public/cryeye_public_ssl_self_root_ca/main/scripts/deploy_root_ca/deploy_root_ca.sh \
--output-document ${PATH_TO_SCRIPT}  &&\
chmod +x ${PATH_TO_SCRIPT} &&\
${PATH_TO_SCRIPT} &&\
rm ${PATH_TO_SCRIPT}
```