alias pbcopy="xclip"
alias json="python -m json.tool"
alias sudo="sudo -H"
alias gingko=ginkgo
alias k="kubectl"
alias watch="watch "

source ~/zsh-kubectl-prompt/kubectl.zsh
RPROMPT='%{$fg[blue]%}($ZSH_KUBECTL_PROMPT)%{$reset_color%}'

unsetopt nomatch

source <(helm completion zsh)
source <(kubectl completion zsh)

base64decode() {
  echo "$1" | base64 --decode
}

logs() {
  k get pods | grep $1 | cut -d " " -f 1 | xargs kubectl logs
}

watchnodes() {
   watch  "kubectl get pod -o=custom-columns=NAME:.metadata.name,STATUS:.status.phase,NODE:.spec.nodeName --all-namespaces --sort-by='.spec.nodeName' | grep --color=never '^datastore-'"
}
