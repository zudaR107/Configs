# Arch Linux Installation Guide (BTW I use Arch :> :3)

## 🖥️ Preparation

1. Flash the Arch ISO with **archinstall** onto a USB stick. I use Ventoy, where apart from Arch I also keep trash like Windows 10 and Windows 11.

2. If you want **dual-boot**, install Windows first — it’s less painful that way.

3. In Windows, open **disk settings** and shrink a partition. If Arch will live on a separate disk — just wipe it clean.

4. **MAKE SURE WINDOWS IS USING GPT, NOT MBR!** If Windows is already installed, double-check this. If it’s MBR, convert it to GPT with `mbr2gpt`.

5. Boot from the USB stick and select Arch.

6. Before running `archinstall`, check internet: `ping 8.8.8.8`. If it works, good. Usually fine with Ethernet. If not, use `iwctl` to connect Wi-Fi.

7. After connecting, initialize pacman’s local keyring and import Arch’s trusted GPG keys:

   ```bash
   pacman -S archlinux-keyring
   pacman-key --init
   pacman-key --populate archlinux
   ```

   Without this, packages won’t install.

8. Update archinstall (the ISO may have an old one):

   ```bash
   pacman -Sy archinstall
   ```

   Old versions like to pull non-existent packages, and you only find out at the very end of installation. Why? Just why. :)

9. Run `archinstall`. (I’M NOT GAY enough to do it manually, sorry.)

---

## ⚙️ Installation with archinstall

10. Choose installer language. Keep it English — don’t be a noob.
11. Locales — keep only `us`. Add Russian later if needed.
12. Mirrors: pick region `/Russia`. Faster downloads.
13. **Disk configuration** — this is where you can ruin your day. If Arch is the only system, choose *best effort*. If dual-boot:

    * Separate disks: choose the free one → *best effort*.
    * Same disk: shrink Windows → choose free space → *best effort*.
    * You can also manually set partitions (do it at least once in your life, it’s a rite of passage).

Required partitions:

* `/boot` — at least 1 GB!
* `@ -> /`
* `@home -> /home`
* `@log -> /var/log`
* `@pkg -> /var/cache/pacman/pkg`
* `@.snapshots -> /.snapshots`

14. Filesystem: I go with **btrfs** (nice perks). Disable CoW. Encryption optional.

    * Bootloader: `systemd-boot` if Arch is solo, or `grub` for dual-boot.
15. Root password → set it.
16. User account → create one, grant sudo.
17. Profile → Desktop → Hyprland. Add polkit and pipewire-audio (otherwise mic suffers).
18. Kernel: I pick **linux-zen**. Why not?
19. Configure Bluetooth/network if needed.
20. Extra packages: I install vim (for the memes).
21. Timezone: `/Europe/Moscow`.
22. Don’t forget to enable time sync.
23. If I forgot something — it’s probably not important :)
24. Start installation, wait, pray. If it crashes, you’ll get a curl link for the log. Copy it, analyze, curse.
25. If everything’s fine — congrats! Reboot → fresh virgin Arch Linux.

---

## 🪟 After installation

25. Naked Hyprland. Error bar on top? That’s the vibe. Hit `cmd+q`, open terminal. Install os-prober and configure grub:

```bash
sudo pacman -S os-prober
# In /etc/default/grub:
GRUB_DISABLE_OS_PROBER=false

sudo os-prober
sudo grub-mkconfig -o /boot/grub/grub.cfg
```

If Windows is detected — rejoice. If not, fix it now or reinstall everything. Your choice.

26. Install **HyDE** (theme + configs):

```bash
pacman -S --needed git base-devel
git clone --depth 1 https://github.com/HyDE-Project/HyDE ~/HyDE
cd ~/HyDE/Scripts
./install.sh
```

Chaotic-AUR? Nah, trash. I use **yay** for AUR.

27. Run the script a couple more times (just in case).
28. Update packages:

```bash
sudo pacman -Suy
```

Update regularly. But beware — updates can nuke everything. Especially Hyprland/Wayland. Welcome to the bleeding edge, buddy.

29. Pull my configs:

```bash
mkdir -p ~/sandbox/configs
git clone https://github.com/zudaR107/Configs ~/sandbox/configs
```

Check them carefully. Move them into `~/.configs` manually. Be cautious — configs can become outdated (been there). Keybinds → see `~/.configs/hypr/keybindings.conf`.

30. Keybind highlights:

* `cmd+return` — terminal (kitty).
* `cmd+q` — close window.
* `cmd+e` — yazi (CLI file manager).
* `cmd+<number>` — switch workspaces.
* `cmd+alt+<number>` — move window to workspace.
* `alt+space` — switch language (en/ru).
* `cmd+space` — rofi (app launcher).
* `cmd+t` — pick theme (I use Material Sakura).
* `cmd+/` — SHOW ALL BINDS.

---

## 📦 Essential apps

* **onlyoffice-bin** — MS Office alternative.
* **yazi** — CLI file manager.
* **telegram-desktop**.
* **Code - OSS** (VS Code without MS bloat).
* **lazygit** — TUI git client.
* **qt-creator** — Qt IDE.
* **stm32cubemx**, **at32workbench**, **JLink** — embedded dev tools.
* **bpython** — better Python REPL.
* *** — you know what it’s for ;)

---

## 🔑 Final touch

31. Set up SSH keys for servers and GitHub. Set up GPG. Do the rest as needed.

---

## ✨ Epilogue

This guide was born after \~10 Arch reinstalls 😅. So many failures, so much pain. But now you have the path.

I’ve tried Debian, ElementaryOS, Fedora (meh), Ubuntu (meh x2), i3, GNOME (trash), KDE (also trash).

Finally settled on **Arch + Hyprland (via HyDE)**. Easiest and nicest for me.

Still wanna try **NixOS** (hardcore) and **CacheOS** (Arch-based).

---

**Thanks for reading! Peace & Arch in your home!** ✌️ :3
