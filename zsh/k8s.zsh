alias k='kubectl'

alias kctx='kubectl config use-context $(kubectl config get-contexts -o=name | fzf)'

# config things
alias kconf='kubectl config'
alias kconfs='kubectl config get-contexts'
alias kconfd='kubectl config delete-context'
alias kconfu='kubectl config use-context'
alias khome='kubectl config use-context docker-for-desktop'

# Get things
alias kg='kubectl get'
alias kgall='kubectl get deploy,svc,pods'
alias kaf='kubectl apply -f'
alias kcf='kubectl create -f'
alias kdf='kubectl delete -f'
alias kdes='kubectl describe'
alias kgc='kubectl get cronjobs'
alias kge='kubectl get endpoints'
alias kgd='kubectl get deploy'
alias kgj='kubectl get jbos'
alias kgp='kubectl get pods'
alias kgn='kubectl get nodes'
alias kgs='kubectl get service'
alias kgstore='kubectl get storageclass'
alias kgpJSON='kubectl get pods -o=json'
alias kpf='kubectl port-forward'
alias kgcs='kubectl get componentstatuses'

# Delete things
alias kdel='kubectl delete'
alias krmf='kubectl delete -f'
alias kdp='kubectl delete pods'
alias kds='kubectl delete service'
alias kdd='kubectl delete deploy'
alias kdi='kubectl delete ingress'
alias kdiALL='kubectl delete ingress --all-namespaces'

# Useful non-operation things
alias ka='kubectl apply -f'
alias kl='kubectl logs '
alias klf='kubectl logs -f'
alias kx='kubectl exec -i -t'

# Save this in bash.rc or zsh.rc, update the file path if needed.
# Usage: kube clusterA
function kube() {
  export KUBECONFIG=~/k8sconfig/${1}/kubeconfig
}

# TMP
function autoappTunnel() {
  PORT="$1"
  ssh dahn@bastion -L ${PORT}:localhost:${PORT}
}
