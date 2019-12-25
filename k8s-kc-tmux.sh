ts() {
  tmux kill-session -t k8s
  tmux new-session -d -s k8s
}

tc() {
  tmux select-window -t $1
  tmux send-keys 'source k8s-kc-helper.sh' C-m
  tmux send-keys 'kc' C-m
}
export -f tc

tw() {
  tc "k8s:0"
  tmux send-keys 'wk svc,ep,deploy,po,no' C-m
}

te() {
  tmux new-window -t k8s:1
  tc "k8s:1"
  tmux send-keys 'vim' C-m
}

tr() {
  tmux new-window -t k8s:2
  tc "k8s:2"
  tmux send-keys 'k run --help'
}

tx() {
  tmux new-window -t k8s:3
  tc "k8s:3"
  tmux send-keys 'k explain --help'
}

tk() {
  ts;tw;te;tr;tx
  tmux select-window -t k8s:0
  tmux attach-session -t k8s  
}
export -f tk