# нормализация клавиш Backspace, Delete, Home и Down
bindkey "^[[3~" delete-char
bindkey "^?" backward-delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[H' beginning-of-line
bindkey '^[OH' beginning-of-line
bindkey '^[[4~' end-of-line
bindkey '^[[F' end-of-line
bindkey '^[F' end-of-line
bindkey '^[OF' end-of-line
