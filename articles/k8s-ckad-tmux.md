# Configure tmux shell multiplexer for k8s development

In order to optimize productivity when developing k8s applications through kubectl CLI, multiple tmux shell windows should be [configured](#8-sample-shell-tmux-helper-file), each dedicated to a specific k8s development activity.

## 1. Launching a detached tmux session

```bash
ts() {
  tmux new-session -d -s k8s
}
```

## 2. Configuring a tmux window for kubectl usage

```bash
tc() {
  tmux select-window -t $1
  tmux send-keys 'source k8s-kc-helper.sh' C-m
  tmux send-keys 'kc' C-m
}
export -f tc
```

## 3. Watching k8s resources

```bash
tw() {
  tc "k8s:0"
  tmux send-keys 'wk svc,ep,deploy,po,no' C-m
}
```

## 4. Editing k8s resources yaml files

```bash
te() {
  tmux new-window -t k8s:1
  tc "k8s:1"
  tmux send-keys 'vim' C-m
}
```

## 5. Running kubectl command

```bash
tr() {
  tmux new-window -t k8s:2
  tc "k8s:2"
  tmux send-keys 'k run --help'
}
```

## 6. Explaining kubectl command

```bash
tx() {
  tmux new-window -t k8s:3
  tc "k8s:3"
  tmux send-keys 'k explain --help'
}
```

## 7. Configuring and attaching tmux session

```bash
tk() {
  ts;tw;te;tr;tx
  tmux select-window -t k8s:0
  tmux attach-session -t k8s  
}
export -f tk
```

## 8. Sample shell tmux helper file

[k8s-kc-tmux.sh](../k8s-kc-tmux.sh)

[k8s-kc-helper.sh](../k8s-kc-helper.sh)

```bash
source ./k8s-kc-helper.sh
kc
source ./k8s-kc-tmux.sh
tk
```
