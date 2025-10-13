# Configs — Dotfiles & Desktop Setup (Arch + Hyprland)

A curated collection of my daily‑driver configs for **Arch Linux** on **Wayland/Hyprland**. Clean visuals, fast startup, and pragmatic defaults. These files are meant to be copy‑pasted or symlinked selectively—use what you need, ignore the rest.

> Target stack: Arch Linux • Hyprland • fish • kitty • Waybar • rofi • dunst • fastfetch • Starship • Code – OSS • Firefox • qt5ct/qt6ct • wlogout • xsettingsd • systemd (user) • custom fonts

---

## ✨ Highlights

* **Wayland‑native** setup tuned for Hyprland
* **Readable UI**: fonts, colors, and sensible spacing
* **Keyboard‑centric** flow (Hyprland + rofi + kitty)
* **Fast terminal** experience (fish + Starship + aliases)
* **Minimal dependencies** and clear separation by app

---

## 🗂 What’s inside

```
ARCH_INSTALL_REMINDER_ENG.md  # short post‑install notes (EN)
ARCH_INSTALL_REMINDER_RUS.md  # краткий пост‑инсталл чек‑лист (RU)
Code - OSS/                   # VS Code (OSS) settings & extensions list
dunst/                        # notifications (Wayland/X11)
fastfetch/                    # system info banner (neofetch‑style)
Firefox/                      # browser profile tweaks (optional)
fish/                         # shell config (functions, abbreviations)
Fonts/                        # curated fonts to install system‑wide
gtk-3.0/                      # GTK3 theme, icons, fonts
hyde/                         # helper scripts/snippets used with HyDE
hypr/                         # Hyprland config (bindings, rules, layout)
kitty/                        # terminal config (fonts, cursor, padding)
LICENSE                       # license (MIT)
Pictures/                     # screenshots & artwork
qt5ct/                        # Qt5 theming outside KDE
qt6ct/                        # Qt6 theming outside KDE
README.md                     # this file
rofi/                         # launcher/switcher themes & config
starship/                     # Starship prompt config (TOML)
systemd/                      # user services/timers (if any)
vim/                          # minimal Vim tweaks
waybar/                       # status bar modules & styles
wlogout/                      # logout/suspend/reboot menu theme
xsettingsd/                   # XSettings for GTK integration on Wayland
```

---

## 🚀 Quick start (safe approach)

> **Tip:** If you’re new to dotfiles, copy things gradually. Start with fonts, terminal, shell, and Hyprland.

```bash
# 1) clone
mkdir -p ~/Sandbox && cd ~/Sandbox
git clone https://github.com/zudaR107/Configs configs
cd configs

# 2) backup your current configs (highly recommended)
mkdir -p ~/.config.backup && rsync -av ~/.config/ ~/.config.backup/

# 3) install fonts (system‑wide)
sudo mkdir -p /usr/local/share/fonts/custom
sudo rsync -av --delete ./Fonts/ /usr/local/share/fonts/custom/
sudo find /usr/local/share/fonts/custom -type d -exec chmod 755 {} \;
sudo find /usr/local/share/fonts/custom -type f -exec chmod 644 {} \;
sudo fc-cache -f -v

# 4) copy selective configs (pick what you need)
rsync -av ./fish/ ~/.config/fish/
rsync -av ./kitty/ ~/.config/kitty/
rsync -av ./hypr/ ~/.config/hypr/
rsync -av ./waybar/ ~/.config/waybar/
rsync -av ./rofi/ ~/.config/rofi/
rsync -av ./dunst/ ~/.config/dunst/
rsync -av ./starship/ ~/.config/starship/
rsync -av ./qt5ct/ ~/.config/qt5ct/
rsync -av ./qt6ct/ ~/.config/qt6ct/
rsync -av ./xsettingsd/ ~/.config/xsettingsd/

# 5) apply shell + prompt
chsh -s /usr/bin/fish
# then log out/in and verify starship is enabled in fish config

# 6) restart your Wayland session for themes/fonts to settle
reboot
```

**Prefer symlinks?** Use `stow`:

```bash
sudo pacman -S stow
cd ~/Sandbox/configs
stow -v -t ~/.config fish kitty hypr waybar rofi dunst starship qt5ct qt6ct xsettingsd
```

---

## 🔧 Per‑component notes

* **Hyprland (`hypr/`)**

  * Keybindings mirror a macOS‑like layout: **Cmd** = Super/Win.
  * Includes sane tiling, scratchpad, screenshots, and float rules.
* **Waybar (`waybar/`)**

  * Modules for workspaces, audio, network, clock, battery, and more.
  * CSS tuned for readable padding and font sizes.
* **rofi (`rofi/`)**

  * App launcher + window switcher with a clean theme.
* **kitty (`kitty/`)**

  * Ligatures on, crisp font rendering, comfortable line height.
* **fish (`fish/`)**

  * Handy abbreviations/functions; integrates **Starship** prompt.
  * Adds user paths (e.g., `$HOME/.local/bin`) when needed.
* **dunst (`dunst/`)**

  * Subtle, legible notifications (works fine on Wayland/X11 via portals).
* **Qt theming (`qt5ct/`, `qt6ct/`)**

  * Unified look for Qt apps outside of full KDE.
* **xsettingsd (`xsettingsd/`)**

  * Ensures GTK settings (font, theme, cursor) are respected under Wayland.
* **Code – OSS (`Code - OSS/`)**

  * Settings and extension list for a consistent editor setup.

---

## 📸 Screenshots

See **`Pictures/`** for sample looks (desktop, terminal, keybindings, etc.).

---

## ✅ Requirements & assumptions

* Arch Linux (or compatible) with recent packages
* Wayland session with **Hyprland**
* A compositor/portal stack compatible with screenshots & notifications
* For shell setup: `fish`, `starship`
* For theming: `qt5ct`, `qt6ct`, GTK theme and icon theme installed

Optional but recommended:

```bash
sudo pacman -S --needed hyprland waybar rofi dunst kitty fish starship fastfetch qt5ct qt6ct \
  ripgrep fd btop wl-clipboard grim slurp swayimg # adjust to taste
```

> If you use **HyDE** (Hyprland Desktop Enhancer), these configs play nicely with it. You can still mix & match.

---

## 🔒 Security & privacy

* Review configs before copying. Some tools (e.g., fastfetch) may show host/user info.
* Browser and editor settings are optional—apply selectively.
* Keep your secrets (SSH/GPG tokens, API keys) **out** of dotfiles.

---

## 🧩 Troubleshooting

* **Fonts look off** → Rebuild cache (`fc-cache -f -v`) and relog.
* **Qt apps ignore theme** → Run `qt5ct`/`qt6ct` and select theme/fonts.
* **Waybar modules missing** → Ensure the needed binaries are installed and on `PATH`.
* **Rofi not themed** → Confirm the config path is `~/.config/rofi` and theme is referenced.
* **Fish not default** → `chsh -s /usr/bin/fish` then log out/in.

---

## 📜 License

This repository is licensed under the **GNU General Public License v3.0 (GPL-3.0)**.  
You may copy, distribute, and modify this project under the terms of GPLv3. When distributing
modified versions, you must provide the source code, state your changes, and keep the same license.

See the full text in [`LICENSE`](./LICENSE).

> Note: Some directories may contain third-party assets (e.g., fonts or themes) that may be
> licensed separately. Please check the respective subfolders/files for their specific licenses.

---

## 🙌 Contributing

Issues and PRs are welcome—just keep changes scoped and consistent with the current style. Screenshots of improvements are appreciated.

---

## 💡 Tip: Safe rollback

Before experimenting, snapshot your current configs:

```bash
mkdir -p ~/.config.rollback_$(date +%Y%m%d)
rsync -av ~/.config/ ~/.config.rollback_$(date +%Y%m%d)/
```

If something breaks, restore selectively from the rollback directory.
