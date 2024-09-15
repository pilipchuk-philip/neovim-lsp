import subprocess

config_files = {
    "zshrc_mac": "~/.zshrc",
    "wewzterm_mac.lua": "~/.wezterm.lua",
    ".tmux.conf": "~/.tmux.conf",
}

brew_apps = [
    "bat",
    "fd",
    "fzf",
    "gum",
    "htop",
    "lazygit",
    "neovim",
    "lua",
    "lua-language-server",
    "luajit",
    "luarocks",
    "tmux",
    "tree-sitter",
    "zsh-autosuggestions",
    "jq",
    "lsd",
    "zoxide",
    "font-powerline-symbols",
    "wget",
    "delta",
    "ripgrep",
    "sqlite",
    "sesh",
    "topgrade",
]
brew_casc = [
    "wezterm",
]


def result_printer(cmd):
    print("------------------------------")
    print(f"CMD: {cmd}")
    print("------------------------------")


def command_caller(cmd):
    p = subprocess.Popen(
        f"{cmd}",
        shell=True,
        stdout=subprocess.PIPE,
        stderr=subprocess.STDOUT,
    )
    for line in p.stdout.readlines():
        print(line)
    result_printer(cmd)


def brew_installer():
    cask_cmds = [f"brew install --cask {a}" for a in brew_casc]
    cmds = [f"brew install {a}" for a in brew_apps]
    apps = cask_cmds + cmds
    for app in apps:
        command_caller(app)


def mac_files_linker():
    for name, destination in config_files.items():
        cmd = f"cp {name} {destination}"
        command_caller(cmd)
        result_printer(cmd)


if __name__ == "__main__":
    brew_installer()
    mac_files_linker()
