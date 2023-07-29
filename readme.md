<h1 align="center">💫 VIM</h1>

<p align="center">
  <img alt="Neovim Minimum Version" src="https://img.shields.io/badge/Neovim-0.8.0+-blueviolet.svg?style=flat-square&logo=Neovim&logoColor=white)](https://github.com/neovim/neovim">
  <img alt="GitHub last commit" src="https://img.shields.io/github/last-commit/CosmicNvim/CosmicNvim?style=flat-square&logo=Github">
  <a href="https://discord.gg/EwdrKzVbvJ">
    <img alt="Discord" src="https://img.shields.io/discord/901609359291854899?style=flat-square&logo=Discord">
  </a>
  <a href="https://cosmicnvim.vercel.app/">
    <img alt="Website" src="https://img.shields.io/website?style=flat-square&up_message=live&label=website&url=https%3A%2F%2Fcosmicnvim.vercel.app%2F">
  </a>
</p>

CosmicNvim is a lightweight and opinionated Neovim config for web development,
specifically designed to provide a 💫 COSMIC programming experience!

<img width="2531" alt="Screen Shot 2021-12-19 at 1 25 24 PM" src="https://user-images.githubusercontent.com/3721204/146691358-82a6ff64-1942-4351-ac53-e710a3e48700.png">

## 🚀 Stellar Features

### Native LSP

Full featured native LSP functionality!

- 📘 Go-to definition
- 🔍 Find references/type def/declaration
- 💡 Code actions
- 🚨 Statusline diagnostics
- 🔧 Formatting/linting thanks to [null-ls](https://github.com/jose-elias-alvarez/null-ls.nvim)

#### Additional features

- Custom rename and code action popups via [Cosmic-UI](https://github.com/CosmicNvim/cosmic-ui)
- Amazing default theme via [tokyonight.nvim](https://github.com/folke/tokyonight.nvim)
- UI enhancements via [noice](https://github.com/folke/noice.nvim)
- Enhanced syntax highlighting via [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- Dashboard via [dashboard-nvim](https://github.com/glepnir/dashboard-nvim)
- Custom statusline via [lualine](https://github.com/nvim-lualine/lualine.nvim)
- Explore files via [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)
- Fuzzy finder via [Telescope](https://github.com/nvim-telescope/telescope.nvim)
- Floating terminal with [vim-floaterm](https://github.com/voldikss/vim-floaterm)
- Auto LSP/formatter/linter installation via [mason.nvim](https://github.com/williamboman/mason.nvim)
- Autocompletion via [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- Additional TypeScript support via [nvim-lsp-ts-utils](https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils)
- Snippet support via [LuaSnip](https://github.com/L3MON4D3/LuaSnip)
- Session management via [auto-session](https://github.com/rmagatti/auto-session)
- Additional custom highlighting
- Floating windows for references, renaming, diagnostics, code actions and more!

_While CosmicNvim is geared specifically toward TypeScript/JavaScript development, it should be able to provide a great
experience with any LSP supported language._

## 🛠 Installation

### Quick guide

#### Prerequisites

- Neovim (+0.8.0)
- [Node.js](https://nodejs.org/en/)
- [prettierd](https://github.com/fsouza/prettierd) (for prettier formatting w/null_ls, optional)
- [eslint_d](https://www.npmjs.com/package/eslint_d) (for eslint w/null_ls, optional)

#### Install

```bash
  # move to config dir
  cd ~/.config
  # back up current config
  cp -r nvim nvim.backup
  # clone repository
  git clone git@github.com:CosmicNvim/CosmicNvim.git nvim
  # open nvim and install plugins
  nvim
```

By default, this will assume the Cosmic git directory is placed at `vim.fn.stdpath('config')`, i.e. `~/.config/nvim`.
If you are symlinking your pulled repo to `~/.config/nvim`, you must define the shell environment variable
`COSMICNVIM_INSTALL_DIR` that points to your installation.

Additional CosmicNvim installation [details](https://github.com/CosmicNvim/CosmicNvim/wiki/Installation).

Additional LSP server installation [details](https://github.com/CosmicNvim/CosmicNvim/wiki/Installing-LSP-servers).

CosmicNvim uninstallation [details](https://github.com/CosmicNvim/CosmicNvim/wiki/Uninstalling-CosmicNvim).

## 🎨 Theming

_New documentation coming soon!_

## ⚙️ Configuration

[General Info](./lua/cosmic/config/examples/readme.md)

[Cosmic configurations](./lua/cosmic/config/examples/config.lua)

[Add additional vim options](./lua/cosmic/config/examples/editor.lua)

## ✨ Cosmic Commands

### Update CosmicNvim

Updates CosmicNvim to the latest version

```vimcommand
:CosmicUpdate
```

## 🗺 Default Mappings

[File navigation](./lua/cosmic/plugins/telescope/mappings.lua)

[File explorer](./lua/cosmic/plugins/nvim-tree/mappings.lua)

[Terminal](./lua/cosmic/plugins/terminal/mappings.lua)

[LSP](./lua/cosmic/lsp/mappings.lua)

[Other](./lua/cosmic/mappings.lua)

## 📷 Screenshots

[See more](https://github.com/CosmicNvim/CosmicNvim/wiki/Screenshots)

## Plugins

[outward selection](https://stackoverflow.com/questions/70937148/vi-increases-the-visual-selection-but-can-i-reduce-the-visual-selection-in-a)

## Configs

- [ ] [Ecosse](https://github.com/ecosse3/nvim)
- [ ] [react-setup](https://www.libhunt.com/posts/841129-my-neovim-setup-for-react-typescript-tailwind-css-etc)
- [ ] [react nvim setup](https://rudra.dev/posts/setting-up-vim-for-react/)
- [ ] [vim typescript](https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim)
- [ ] [setp by setp llsp nextjs](https://levelup.gitconnected.com/a-step-by-step-guide-to-configuring-lsp-in-neovim-for-coding-in-next-js-a052f500da2)
- [ ] [dev daily react setup](https://app.daily.dev/posts/iIOJZ8joP)
- [ ] [TypeScript react dev](https://medium.com/@s1n7ax/neovim-for-typescript-react-development-fdc7082c8a78)
- [ ] [mats config](https://dev.to/craftzdog/my-neovim-setup-for-react-typescript-tailwind-css-etc-58fb)
- [ ] [sonar lint](https://www.sonarsource.com/products/sonarlint/)
- [ ] [lvim](https://www.libhunt.com/r/gnmearacaun/lvim)
- [ ] [oni2](https://www.libhunt.com/r/oni2)
- [ ] [doom-nvim](https://github.com/doom-neovim/doom-nvim)
- [ ] [leoVim](https://github.com/coderj001/LeoVim)
- [ ] [vim visual multi](https://www.libhunt.com/r/vim-visual-multi)
- [ ] [hop.nvim](https://www.libhunt.com/r/hop.nvim)
- [ ] [nvim window picker](https://github.com/s1n7ax/nvim-window-picker)
- [ ] [nvim window picker](https://www.libhunt.com/r/nvim-window-picker)
- [ ] [react extract nvim](https://github.com/napmn/react-extract.nvim)
- [ ] [lspsaga](https://github.com/nvimdev/lspsaga.nvim)
- [ ] [indent blankline](https://github.com/lukas-reineke/indent-blankline.nvim)
- [ ] [vim sneak](https://github.com/justinmk/vim-sneak)
- [ ] [coq nvim](https://github.com/ms-jpq/coq_nvim)
- [ ] [catppuccin nvim](https://github.com/catppuccin/nvim)
- [ ] [leap](https://github.com/ggandor/leap.nvim)
- [ ] [trouble](https://github.com/folke/trouble.nvim)
- [ ] [null ls](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [ ] [neorg](https://github.com/nvim-neorg/neorg)
- [ ] [LazyVim](https://github.com/LazyVim/LazyVim)
- [ ] [ale](https://github.com/dense-analysis/ale)
- [ ] [coc](https://github.com/neoclide/coc.nvim)
- [ ] [nvim setup](https://github.com/sergiornelas/nvim)
- [ ] []()
