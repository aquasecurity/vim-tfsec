# vim-tfsec

## What is it?

Vim plugin for tfsec to install and run tfsec.

## Install

1. add the plugin to our list of plugins

  ```
  Plug 'aquasecurity/vim-tfsec'
  ```

2. restart vim and run `:PlugInstall` to install


## Usage

If you don't have `tfsec` already install then you can run `:TfsecInstall` to get the latest version.

If you already hav it, you can run `TfsecUpdate` to get the latest version.

Run `:Tfsec` to get a list of the current tfsec issues in your current directory. The issues will be added to the QuickFix list.


## Example usage

![Usage](using-vim-tfsec.gif)
