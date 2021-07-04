require('kommentary.config').configure_language('javascriptreact', {
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end
})

require('kommentary.config').configure_language('svelte', {
    single_line_comment_string = 'auto',
    multi_line_comment_strings = 'auto',
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end
})

