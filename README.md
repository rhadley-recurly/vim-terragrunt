# vim-terragrunt

This is very much a hack but it works. I don't know what I'm doing.

Vim plugin to format Terragrunt Hashicorp Configuration Language (HCL) files.

This plugin will run terragrunt hclfmt on the current directory on every :w on a .hcl file.

## Usage

Save the file or call `:HclFmt`.

By default vim-terragrunt automatically formats .hcl files.
You can permanently set this configuration in your `~/.vimrc` as follows:

```vim
let g:hcl_fmt_autosave = 0
```

## Install

With [Pathogen](https://github.com/tpope/vim-pathogen):

```vim
git clone https://github.com/rhadley-recurly/vim-terragrunt.git ~/.vim/bundle/vim-terragrunt`
```
