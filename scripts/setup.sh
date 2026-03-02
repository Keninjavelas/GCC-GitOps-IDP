# 0. Set the correct project ID based on your logs
gcloud config set project influential-sky-488915-u9

# 1. Enable APIs
gcloud services enable container.googleapis.com cloudbuild.googleapis.com artifactregistry.googleapis.com

# 2. Create Artifact Registry
gcloud artifacts repositories create my-repo --repository-format=docker --location=us-central1

# 3. Create GKE Autopilot Cluster
gcloud container clusters create-auto gitops-cluster --location us-central1

# 4. Install ArgoCD
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# 5. Expose ArgoCD UI (LoadBalancer)
kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'