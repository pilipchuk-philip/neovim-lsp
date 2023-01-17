require("wilder").setup({
    modes = {':', '/', '?'},
    next_key = '<TAB>',
})
require("wilder").set_option('renderer', require("wilder").popupmenu_renderer(
    require("wilder").popupmenu_border_theme({
        left = {' ', require("wilder").popupmenu_devicons()},
        highlighter = require("wilder").basic_highlighter(),
        min_width = '100%',
        min_height = '20%',
        max_height = '10%',
        highlights = {
            border = 'Normal', -- highlight to use for the border
        },
        border = 'rounded',
    })
))

