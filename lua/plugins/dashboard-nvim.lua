local function default_header()
    return {
        '', '', '',
        -- NOTE: https://patorjk.com/software/taag/#p=display&h=0&v=0&c=lua&f=ANSI%20Shadow&t=Aragami_3070%0
        -- font = ascii shadow

        -- " █████╗ ██████╗  █████╗  ██████╗  █████╗ ███╗   ███╗██╗",
        -- "██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔══██╗████╗ ████║██║",
        -- "███████║██████╔╝███████║██║  ███╗███████║██╔████╔██║██║",
        -- "██╔══██║██╔══██╗██╔══██║██║   ██║██╔══██║██║╚██╔╝██║██║",
        -- "██║  ██║██║  ██║██║  ██║╚██████╔╝██║  ██║██║ ╚═╝ ██║██║",
        -- "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝",

        " █████╗ ██████╗  █████╗  ██████╗  █████╗ ███╗   ███╗██╗        ██████╗  ██████╗ ███████╗ ██████╗ ",
        "██╔══██╗██╔══██╗██╔══██╗██╔════╝ ██╔══██╗████╗ ████║██║        ╚════██╗██╔═████╗╚════██║██╔═████╗",
        "███████║██████╔╝███████║██║  ███╗███████║██╔████╔██║██║         █████╔╝██║██╔██║    ██╔╝██║██╔██║",
        "██╔══██║██╔══██╗██╔══██║██║   ██║██╔══██║██║╚██╔╝██║██║         ╚═══██╗████╔╝██║   ██╔╝ ████╔╝██║",
        "██║  ██║██║  ██║██║  ██║╚██████╔╝██║  ██║██║ ╚═╝ ██║██║███████╗██████╔╝╚██████╔╝   ██║  ╚██████╔╝",
        "╚═╝  ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝ ╚═╝  ╚═╝╚═╝     ╚═╝╚═╝╚══════╝╚═════╝  ╚═════╝    ╚═╝   ╚═════╝ ",
        '', '', ''
    }
end

require('dashboard').setup {
    theme = 'doom',
    config = {
        header = default_header(),
        center = {
            {
                icon = '󰙅 ',
                icon_hl = 'Directory',
                desc = 'Open tree',
                desc_hl = 'String',
                key = 'f',
                keymap = 'SPC f',
                key_hl = 'Number',
                action = ':Neotree float'
            },
            {
                icon = '󰈞 ',
                icon_hl = 'Directory',
                desc = 'Find files',
                desc_hl = 'String',
                key = 'o',
                keymap = 'SPC o',
                key_hl = 'Number',
                action = ':Telescope find_files'
            },
            {
                icon = ' ',
                icon_hl = 'Directory',
                desc = 'Which key',
                desc_hl = 'String',
                key = 'NULL',
                keymap = 'SPC',
                key_hl = 'Number',
            },
            {
                icon = ' ',
                icon_hl = 'Directory',
                desc = 'Find text',
                desc_hl = 'String',
                key = 'w',
                keymap = 'SPC f w',
                key_hl = 'Number',
                action = ':Telescope live_grep'
            },
            {
                icon = ' ',
                icon_hl = 'Directory',
                desc = 'Git Braches',
                desc_hl = 'String',
                key = 'b',
                keymap = 'SPC g b',
                key_hl = 'Number',
                action = ':Telescope git_branches'
            },
            {
                icon = '󰊳 ',
                icon_hl = 'Directory',
                desc = 'Update',
                desc_hl = 'String',
                action = 'Lazy update',
                key = 'u',
                key_hl = 'Number',
            }

        }
    }
}
