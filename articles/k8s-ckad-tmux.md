# Configure tmux shell multiplexer

In order to optimize productivity when developing k8s applications through kubectl CLI, multiple tmux shell windows should be configured, each dedicated to a specific k8s development activity.

## 1. Launching a detached tmux session

```bash
ts() {
  tmux new-session -d -s k8s
}
export -f ts
```

## 2. Watching k8s resources

```bash
tw() {
  tmux select-window -t k8s:0
  tmux send-keys 'kc' C-m
  tmux send-keys 'wk svc,ep,deploy,po,no' C-m
}
export -f tw
```

## 2. Editing k8s resources yaml files

```bash
te() {
  tmux new-window -t k8s:1
  tmux send-keys 'kc' C-m
  tmux send-keys 'vim' C-m
}
export -f te
```

## 3. Running kubectl command