source ~/.config/fish/functions/network.fish
fish_add_path -g /home/nx/.local/bin
oh-my-posh init fish --config '/home/nx/.cache/oh-my-posh/themes/cloud-native-azure.omp.json' | source
# # -- start: ssh-agent env for fish --
# set -gx SSH_AUTH_SOCK /run/user/(id -u)/ssh-agent.socket
# # load your key if not already loaded
# ssh-add -l >/dev/null 2>&1; or ssh-add ~/.ssh/id_ed25519 </dev/null
# # -- end: ssh-agent env --


if status is-interactive
    command -v direnv &>/dev/null && direnv hook fish | source
    command -v zoxide &>/dev/null && zoxide init fish --cmd cd | source

    # -- start: ssh-agent env for fish --
    set -gx SSH_AUTH_SOCK /run/user/(id -u)/ssh-agent.socket
    # load your key if not already loaded
    ssh-add -l >/dev/null 2>&1; or ssh-add ~/.ssh/id_ed25519 </dev/null
    # -- end: ssh-agent env --


    # Better ls
    alias ls='eza --icons --group-directories-first -1 -lah'
    alias vim='nvim .'
    alias code='code .'
    alias dot='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    alias pushdot='git -C ~/.config push'

    # Cursor per mode (these are Kitty-friendly keywords)
    set -g fish_cursor_default block blink
    set -g fish_cursor_insert beam blink
    set -g fish_cursor_replace underline
    set -g fish_cursor_visual block

    # Abbrs
    abbr gd 'git diff'
    abbr ga 'git add .'
    abbr gc 'git commit -am'
    abbr gl 'git log'
    abbr gs 'git status'
    abbr gst 'git stash'
    abbr gsp 'git stash pop'
    abbr gp 'git push'
    abbr gpl 'git pull'
    abbr gsw 'git switch'
    abbr gsm 'git switch main'
    abbr gb 'git branch'
    abbr gbd 'git branch -d'
    abbr gco 'git checkout'
    abbr gsh 'git show'

    abbr l ls
    abbr ll 'ls -l'
    abbr la 'ls -a'
    abbr lla 'ls -la'

    fastfetch
end
