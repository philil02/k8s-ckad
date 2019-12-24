export TERMINAL=vim

kc() {
  source <(kubectl completion bash)
  alias k=kubectl
  complete -F __start_kubectl k
}
export -f kc