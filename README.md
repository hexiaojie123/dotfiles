My personal dotfiles which contain config and binary;

[toc]

# Setup
Set up by using [dotbot](https://github.com/anishathalye/dotbot/):

```
git clone git@github.com:hexiaojie123/dotfiles.git
cd dotfiles
git submodule sync --quiet --recursive
git submodule update --init --recursive
# default yaml is install.conf.yaml which will bring config
./install
# binary linux yaml will bring binary
./install -c install.bin.linux.yaml
# binary mac yaml will bring binary
./install -c install.bin.mac.yaml
```

# Overview
- using [dotbot](https://github.com/anishathalye/dotbot/) to manage dotfile
- using [zinit](https://github.com/zdharma-continuum/zinit) as **zsh** plugin management
- using [wezterm](https://github.com/wezterm/wezterm) as terminal emulator

# Binary
Which can easily installed by brew.
## Executable
### Catalogue
- bat
    - aarch64: bat-v0.26.0-x86_64-unknown-linux-musl from github
    - x86_64: bat-v0.26.0-aarch64-unknown-linux-musl from github
- btop
    - aarch64: btop-aarch64-linux-musl (v1.4.5) from github
    - x86_64: btop-x86_64-linux-musl (v1.4.5) from github
- delta
    - aarch64: delta 0.18.2 **compiled**
    - x86_64: delta-0.18.2-x86_64-unknown-linux-musl from github
- dust
    - aarch64: dust-v1.2.3-aarch64-unknown-linux-musl from github
    - x86_64: dust-v1.2.3-x86_64-unknown-linux-musl from github
- eza
    - aarch64: v0.23.4 [+git] **compiled**
    - x86_64: eza_x86_64-unknown-linux-musl (v0.23.4) from github
- fastfetch
    - aarch64: fastfetch 2.55.1-26 (aarch64) **compiled**
    - x86_64: fastfetch 2.55.1-26 (x86_64) **compiled**
- fd
    - aarch64: fd-v10.3.0-aarch64-unknown-linux-musl from github
    - x86_64: fd-v10.3.0-x86_64-unknown-linux-musl from github
- fzf
    - aarch64: fzf-0.67.0-linux_arm64 from github
    - x86_64: fzf-0.67.0-linux_amd64 from github
- gitstatus
    - aarch64: gitstatusd-linux-aarch64 from github
    - x86_64: gitstatusd-linux-x86_64 from github
- pueue:
    - aarch64: pueue-aarch64-unknown-linux-musl (v4.0.1) from github
    - x86_64: pueue-x86_64-unknown-linux-musl (v4.0.1) from github
- ripgrep
    - aarch64: ripgrep 15.1.0 (rev cd1f981bea) **compiled**
    - x86_64: ripgrep-15.1.0-x86_64-unknown-linux-musl from github
- tldr
    - aarch64: tlrc v1.12.0 (implementing the tldr client specification v2.3) **compiled**
    - x86_64: tlrc-v1.12.0-x86_64-unknown-linux-musl from github
- zellij
    - aarch64: zellij-aarch64-unknown-linux-musl (v0.43.1) from github
    - x86_64: zellij-x86_64-unknown-linux-musl (v0.43.1) from github
- zoxide
    - aarch64: zoxide-0.9.8-aarch64-unknown-linux-musl from github
    - x86_64: zoxide-0.9.8-x86_64-unknown-linux-musl from github
- zsh
    - aarch64: zsh-5.8-linux-aarch64 from github (zsh-bin)
    - x86_64: zsh-5.8-linux-x86_64 from github(zsh-bin)

### Compile
#### eza (liked rust compile)
**Based on alpine aarch64 & x86_64**
Change target to specify version:
- aarch64-unknown-linux-musl
- x86_64-unknown-linux-musl
```shell
git clone https://github.com/eza-community/eza.git
cd eza
TARGET=aarch64-unknown-linux-musl
RUSTFLAGS="-C target-feature=+crt-static"
cargo build --release --target $TARGET
```

#### fastfetch
**Based on alpine aarch64 & x86_64**
Change compile platform to specify version:
```shell
git clone https://github.com/fastfetch-cli/fastfetch
cd fastfetch
cmake -S . -B build \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_EXE_LINKER_FLAGS="-static -s" \
  -DBUILD_SHARED_LIBS=OFF
cmake --build build --target fastfetch -j$(nproc)
```
