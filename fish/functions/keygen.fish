function keygen
    # if you made the systemd ssh-agent service, point to its socket:
    set -gx SSH_AUTH_SOCK /run/user/(id -u)/ssh-agent.socket
    ssh-add ~/.ssh/id_ed25519
end