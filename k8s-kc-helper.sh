# Define kubectl shell helper functions
# In order to save time when typing kubectl commands the following custom shell functions should be sourced inside the shell.

## 1. Define `vim` as the default shell editor
export TERMINAL=vim

## 2. Define `k` as an alias for the `kubectl` CLI
kc() {
  source <(kubectl completion bash)
  alias k=kubectl
  complete -F __start_kubectl k
}
export -f kc

## 3. Display the current kubectl context
cc() {
  kubectl config get-contexts $(kubectl config current-context)
  echo
}
export -f cc

## 4. Change the kubectl current namespace
cn() {
  kubectl config set-context --current --namespace=$1
  cc
}
export -f cn

## 5. Watch a kubectl command
w() {
  watch -n 1 -- "bash -c 'source ./k8s-kc-helper.sh;$1'"
}
export -f w

## 6. Watch a set of k8s resources
wk() {
  w "cc;kubectl get $1 --output=wide"
}
export -f wk