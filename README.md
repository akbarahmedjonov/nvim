# ⚡ Neovim Setup

A high-performance, minimalist Neovim configuration built with native package management and modern language server integrations.

---

## 🚀 One-Line Installation

Select the command corresponding to your Linux distribution:

### 🏔️ Arch Linux
```bash
curl -sSL [https://raw.githubusercontent.com/akbarahmedjonov/scripts/main/install.sh](https://raw.githubusercontent.com/akbarahmedjonov/scripts/main/install.sh) | bash
```

📦 Declarative NixOS Setup (Alternative)

For a fully reproducible NixOS configuration, add the following to your configuration.nix or Home Manager config, then clone the repository into your configuration path.
1. Dependencies
Nix

environment.systemPackages = with pkgs; [
  neovim
  git
  gnumake
  gcc
  ripgrep
  fd
  unzip
  
  # LSPs, Linters & Formatters
  pyright
  ruff
  lua-language-server
  stylua
  clang
  rust-analyzer
  rustfmt
  taplo
  nodePackages.typescript-language-server
  nodePackages.prettier
  nodePackages.vscode-langservers-extracted
];

2. Configuration
Bash

git clone [https://github.com/akbarahmedjonov/nvim](https://github.com/akbarahmedjonov/nvim) ~/.config/nvim
