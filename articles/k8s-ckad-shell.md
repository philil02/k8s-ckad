# Define kubectl shell helper functions

In order to save time when typing kubectl commands the following custom shell functions should be sourced inside the shell.

## 1. Define `vim` as the default shell editor

```bash
export TERMINAL=vim
```

## 2. Define `k` as an alias for the `kubectl` CLI

```bash
kc() {
  source <(kubectl completion bash)
  alias k=kubectl
  complete -F __start_kubectl k
}
export -f kc
```

## 3. Display the current kubectl context

```bash
cc() {
  kubectl config get-contexts $(kubectl config current-context)
  echo
}
export -f cc
```

# 4. Change the kubectl current namespace

```bash
```
