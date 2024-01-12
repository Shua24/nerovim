# Nerovim
My dotfiles (or distro) for Neovim

# Installing
The first step of installing is as easy as just cloning the git repository
```
$ git clone https://github.com/Shua24/nerovim ~/.config/nvim
```

To avoid unnecessary errors, remove `.git`.
```
$ rm -rf ~/.config/nvim/.git
```

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
```
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
```
config = function()
    ...
end
```
is only necessary if there's a `require()` directive in the documentation. Here's another format example that's frequently used to configure a plugin.
```
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
where `plugin_alias` can be whatever you want, since it is a variable that's assigned to a `require() ` directive.

# Additional notes
Please note these things if the plugin's configuration is quite long and/or contains many dependencies to configure.
1. If the plugin's default configuration contains many dependencies to configure or has so many things to configure as an option, it's best to
stick to the defaults and learn how to customise the said plugin according to the documentation later.
2. If the documentation of a plugin is conscise, containing the necessary details to customise the plugin itself, it's best to copy the default
attributes and read further about the documentation to customise the said plugin.
This is all done to prevent your configuration from breaking neovim with errors, unless you learnt a lot about lua, the main language used to configure plugins.
