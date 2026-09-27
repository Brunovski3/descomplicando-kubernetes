# Descomplicando Kubernetes

Material de estudos do curso **[Descomplicando Kubernetes — LinuxTips](https://linuxtips.io/)**, feito e documentado por mim, [@Brunovski3](https://github.com/Brunovski3): manifests, exercícios e anotações de aula, organizados por dia.

> O conteúdo/aula é da LinuxTips; os manifests, a organização por dias e as anotações deste repositório são de minha autoria.

Tudo aqui é YAML aplicável com `kubectl apply -f`, com alguns arquivos auxiliares (ConfigMap em `nginx.conf` e script de NFS).

## Estrutura

| Pasta | Conteúdo |
|---|---|
| `Dia-1/` | Cluster multi-node no **kind** (`kind-4nodes.yaml`), templates de Pod e Service |
| `Dia-2/` | Pods na prática: `emptyDir`, limites de recursos, pod `giropops` e exercício/exame |
| `Dia-3/` | **Deployments**: rollout, estratégia `Recreate` e atualização de imagem |
| `Dia-4/` | **ReplicaSet**, liveness/readiness/startup **probes** e **DaemonSet** (node-exporter) |
| `Dia-6/` | Storage: **PV**, **PVC**, **StorageClass** e **NFS** (com script de montagem) |
| `Dia-7/` | **StatefulSet** + Service **headless** com nginx |
| `Dia-8/` | **Secrets**, **ConfigMap** e o `nginx.conf` montado no Pod |
| `Dia-9/` | Aplicação real: **n8n** (Deployment, Service, PVC, Ingress) + **Tailscale** |
| `Dia-10/` | **Ingress** nginx com TLS/**cert-manager**, basic auth e canary release |

## Pré-requisitos

- `kubectl` configurado contra um cluster (kind, minikube, k3s, EKS...)
- `kind` (para reproduzir o cluster do Dia-1)
- Ingress controller (nginx) e `cert-manager` para o Dia-10

## Como usar

```bash
# criar o cluster do Dia-1 (4 nodes)
kind create cluster --config Dia-1/kind-4nodes.yaml

# subir um manifesto
kubectl apply -f Dia-3/deployment.yaml

# acompanhar o rollout
kubectl rollout status deployment/giropops
kubectl rollout undo deployment/giropops
```

## Anotações rápidas

```bash
kubectl get pods -o wide
kubectl describe pod <pod>
kubectl logs -f <pod>
kubectl get ingress,svc,pvc
kubectl explain pod.spec.containers.resources
```

## Licença

Material de estudo — uso livre para aprendizado.
