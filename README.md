# Nerovim
My dotfiles (or distro) for Neovim

# Installing
The first step of installing is as easy as just cloning the git repository
```bash
$ git clone https://github.com/Shua24/nerovim ~/.config/nvim
```

To avoid unnecessary errors, remove `.git`.
```bash
$ rm -rf ~/.config/nvim/.git
```

# Plugins for changing the looks:
1. [Alpha-nvim (goolord/alpha-nvim)](https://github.com/goolord/aplha-nvim) - Dashboard plugin
2. [Lualine.nvim (nvim-lualine/lualine.nvim)](https://github.com/nvim-lualine/lualine.nvim) - The plugin that draws the bottom line
3. [Noice.nvim (folke/noice.nvim)](https://github.com/folke/noice.nvim) - A plugin that sets a complete IDE-like interface for you

# Colorscheme plugins
1. [Rose Pine (rose-pine/nvim)](https://github.com/rose-pine/nvim)
2. [Oxocarbon (nyoom-engineering/oxocarbon.nvim)](https://github.com/nyoom-engineering/oxocarbon.nvim)
3. [Catppuccin (catppuccin/nvim)](https://github.com/catppuccin/nvim)
4. [Melange (savq/melange-nvim)](https://github.com/savq/melange-nvim)
5. [Tokyonight (folke/tokyonight.nvim)](https://github.com/folke/tokyonight.nvim)
6. [Tender (jacoborus/tender.vim)](https://github.com/jacoborus/tender.vim)
7. [Gruvbox (ellisonleao/gruvbox.nvim)](https://github.com/ellisonleao/gruvbox.nvim)

# File manager plugins along with its dependencies
1. [Neotree (nvim-neo-tree/neo-tree.nvim)](https://github.com/nvim-neo-tree/neo-tree.nvim) - Main file manager
2. [Oil (stevearc/oil.nvim)](https://github.com/stevearc/oil.nvim) - A plugin that lets you to edit files as if it's a text
3. [Nui (MunifTanjim/nui.nvim)](https://github.com/MunifTanjim/nui.nvim) - An user interface component, Neotree's dependency
4. [Neovim Web Devicons (nvim-tree/nvim-web-devicons)](https://github.com/nvim-tree/nvim-web-devicons) - File icons for Neotree
5. [Telescope.nvim (nvim-telescope/telescope.nvim)](https://github.com/nvim-telescope/telescope.nvim)
6. [Telescope UI (nvim-telescope/telescope-ui-select.nvim)](https://github.com/nvim-telescope/telescope-ui-select.nvim) - Change neovim core stuff like code action to use telescope

# Default LSP and code completion plugins
1. [Tree-sitter (nvim-treesitter/nvim-treesitter)] - Converts source codes to abstract syntax trees to help LSP plugins.
2. [Mason (williamboman/mason.nvim)](https://github.com/williamboman/mason.nvim) - LSP manager plugin
3. [mason-lspconfig (williamboman/mason-lspconfig.nvim)](https://github.com/williamboman/mason-lspconfig.nvim) - Mason's dependency
4. [None LS (nvimtools/none-ls.nvim)](https://github.com/nvimtools/null-ls.nvim) - A plugin to generalise language servers as one
5. [Nvim-cmp (hrsh7th/nvim-cmp)](https://github.com/hrsh7th/nvim-cmp) - The main plugin for code completion for LSPs
6. [cmp-nvim-lsp (hrsh7th/cmp-nvim-lsp)](https://github.com/hrsh7th/cmp-nvim-lsp) - A plugin to add LSP support
7. [cmp_luasnip (saadparwaiz1/cmp_luasnip)](https://github.com/saadparwaiz1/cmp_luasnip) - Completion source for `nvim-cmp`
8. [Luasnip (L3MON4D3/LuaSnip)](https://github.com/L3MON4D3/LuaSnip) - Main plugin for snippets
9. [Friendly Snippets (rafamadriz/friendly-snippets)](https://github.com/rafamadriz/friendly-snippets) - A plugin to add VSCode-like snippets
10. [nvim-lspconfig (neovim/nvim-lspconfig)](https://github.com/neovim/nvim-lspconfig) - The main plugin to add LSP support

# Other plugins
1. [Autopairs (jiangmiao/auto-pairs)](https://github.com/jiangmiao/auto-pairs) - Automatic pairing for quotes and parantheses
2. [Toggleterm (akinsho/toggleterm.nvim)](https://github.com/akinsho/toggleterm.nvim) - VSCode-like terminal integration

# Configuring LSPs
Don't forget to configure the LSP dependencies in case there's a functionality that's not working by doing these steps.
1. Go to Mason or type `:Mason` to execute Mason.
2. Install `stylua` from the formatter section.
3. Install `lua_lsp` from the LSP section.
and do the same steps for the different language servers that you need.
# Adding new plugins
Adding new plugins is as easy as adding another `*.lua` file from the `plugins` directory. The structure is similar to the
directory structure for lazyvim.
```
~/.config/nvim
├── lua
│   │   └── main-config.lua # general configuration for neovim
│   └── plugins
│       ├── plugin[1].lua # plugin[1]'s config, including the keymaps.
│       ├── **
│       └── plugin[n].lua # ... and so on
└── # Other configs if necessary
```

# Configuring new plugins
A plugin's format is usually the github repository, minus the github URL, usually known as the short URL. Here's an example with the tokyonight plugin.
```
folke/tokyonight.nvim
```

To configure a new plugin, just add a new spec. The format is as follows.
```lua
return {
    "[plugin_short_url]",
    -- if there's any dependencies:
    dependencies = {
        "[plugin_dependency_short_url]"
    },
    -- keymaps and other things (see the plugin's documentation)
    config = function()
        vim.keymap.set("MODE", "KEYBIND", "COMMAND<CR>") -- An example of a set keymap
    end
    -- Other options if necessary (see the plugin's documentation)
}
```
Please note that the snippet here
```lua
config = function()
    ...
end
```
is only necessary if there's a `require()` directive in the documentation. Here's another format example that's frequently used to configure a plugin.
```lua
return {
    "[plugin_short_url]",
    -- configuration attributes if necessary
    config = function()
        local [plugin_alias] = require("plugin_name")
        plugin_alias.setup({
            -- attributes/parameters (see the plugin's documentation)
        })
        -- set the keymap here
    end
}
```
where `plugin_alias` can be whatever you want, since it's just a variable assigned to a `require()` directive

# Changing the theme
To change the theme, assuming you're already on `~/.config/nvim`, go to `lua/plugins/themes.lua` and then add the following code to your theme of choice. Here's an example.
```lua
-- other colorscheme plugins
{
    "[plugin_short_url]"
    -- attribute configurations (if there are any)
    config = function()
        vim.cmd("colorscheme [theme_name]")
    end,
},
-- the rest of the plugins' configuration(s)
```

# Additional notes
Please note these things if the plugin's configuration is quite long and/or contains many dependencies to configure.
1. If the plugin's default configuration contains many dependencies to configure or has so many things to configure as an option, it's best to stick to the defaults and learn how to
customise the said plugin according to the documentation later.
2. If the documentation of a plugin is conscise, containing the necessary details to customise the plugin itself, it's best to copy the default attributes and read further about the 
documentation to customise the said plugin.
This is all done to prevent your configuration from breaking neovim with errors, unless you learnt a lot about lua, the main language used to configure plugins.
