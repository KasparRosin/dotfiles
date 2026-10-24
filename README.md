# dotfiles

Managed with [chezmoi](https://www.chezmoi.io). One branch for every OS.

## New machine

```sh
sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ~/.local/bin init --apply KasparRosin
```

chezmoi asks for the git email once per machine.

## How OS differences work

`chezmoi init` works out `.osid` (`debian`, `ubuntu`, `darwin`, ...) and `.wsl`
in `.chezmoi.toml.tmpl`. See them with `chezmoi data | grep -E 'osid|wsl'`.

- Most files are the same everywhere and are plain files, not templates.
- `*.tmpl` files have small `{{ if eq .chezmoi.os "darwin" }}` blocks for the
  parts that differ (e.g. Homebrew paths in `dot_zshenv.tmpl`).
- Install scripts live in `.chezmoiscripts/<os>/`. Each is wrapped in an
  `{{ if }}` for its OS, so on other machines it renders empty and chezmoi
  skips it. Scripts directly in `.chezmoiscripts/` run everywhere.
- WSL-only bits go in an `{{ if .wsl }}` block inside the distro's script.

To add an OS (e.g. Ubuntu): copy `.chezmoiscripts/debian/` to
`.chezmoiscripts/ubuntu/` and change `eq .osid "debian"` to `eq .osid "ubuntu"`.

Preview another OS without having it:

```sh
chezmoi --override-data '{"chezmoi":{"os":"darwin"},"osid":"darwin"}' \
  execute-template < dot_zshenv.tmpl
```

The 2024 macOS/Ubuntu setup is kept in the `archive/macos-2024` tag.
