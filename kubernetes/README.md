# Elastic Cloud on Kubernetes
Using ECK provide a easy way to deploy Elastic Stack.

## File Organization
- **config**: Yaml files that deploy Kubernets secrets used to configure services.
- **install**: ECK provider install steps.
- **manifest**: Manifests used to deploy ECK features

## Startup process
First you need to install ECK provider. On ./install/elastic-operator.sh you can configure the version.

```bash
chmod +x ./install/elastic-operator.sh
./install/elastic-operator.sh
```

After that, you can run the startup-environment.sh to deploy ECK stacks. In this file it's possible to configure what will be deployed and if running in a local Kubernets.

```bash
chmod +x ./startup-environment.sh
./startup-environment.sh
```

## Cleanup process
You can run the cleanup script to remove all components created. **The persistent storage will be deleted too.**

```bash
chmod +x ./cleanup-environment.sh
./cleanup-environment.sh
```