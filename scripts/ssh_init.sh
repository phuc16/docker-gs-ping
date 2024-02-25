function init_ssh() {
    local SSH_PRIVATE_KEY="$1"

    which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )
    eval $(ssh-agent -s)
    mkdir -p ~/.ssh
    mkdir -p ~/.ssh
    chmod 700 ~/.ssh
    echo "$SSH_PRIVATE_KEY" > ~/.ssh/id_rsa
    chmod 600 ~/.ssh/id_rsa
    ssh-keyscan -t rsa github.com >> ~/.ssh/known_hosts
    chmod 644 ~/.ssh/known_hosts
}