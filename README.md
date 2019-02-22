I am currently working on [Arch Linux](http://archlinux.org/) using the [GNOME 3](https://www.gnome.org/) desktop environment. In order to avoid distraction I appreciate the default settings. Here is a short list customized applications and components:

- **Terminal**: [st](https://st.suckless.org/) (no patches)
- **Shell**: [Zsh](https://www.zsh.org/) with [Antibody](https://getantibody.github.io/) for extensions and [Spaceship](https://github.com/denysdovhan/spaceship-prompt) prompt
- **Editor**: [Neovim](https://www.vim.org/) with [Airline](https://github.com/vim-airline/vim-airline) using the [Ayu](https://github.com/ayu-theme/ayu-vim) color scheme
- **Font**: [Fira Code](https://mozilla.github.io/Fira/)
- **Icons**: [Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme)

## Usage

Files are managed using [GNU Stow](https://www.gnu.org/software/stow/)

```sh
git clone https://github.com/re1/dots && cd dots
stow all the packages you want
```

## Contribution

If you like this repository (and also if you hate it) feel free to create a pull request.
