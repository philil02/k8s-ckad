ts() {
  tmux new-session -d -s k8s
}
export -f ts

tw() {
  tmux select-window -t k8s:0
  tmux send-keys 'kc' C-m
  tmux send-keys 'wk svc,ep,deploy,po,no' C-m
}
export -f tw

te() {
  tmux new-window -t k8s:1
  tmux send-keys 'kc' C-m
  tmux send-keys 'vim' C-m
}
export -f te