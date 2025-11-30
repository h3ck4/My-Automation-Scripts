#!/usr/bin/bash
code() {
    # Check if the 'offline' namespace exists
    if ! ip netns list | grep -q "offline"; then
        # Create the 'offline' namespace if it doesn't exist
        sudo ip netns add offline
    fi

    # Execute the command in the 'offline' namespace
    sudo ip netns exec offline su h3ck4 -c "code $@"
}

# this file ensures when you add it to your bashrc file, it'll make your vscode work as offline.
# why? since vscode gathers your log and IDK how many things! this file will make it absolutely zero connection,
# so how do i switch? good question, i do have this file mixed with .desktop file that i have 2 separate launcher to vscode that i can basically choose between them!! yeah