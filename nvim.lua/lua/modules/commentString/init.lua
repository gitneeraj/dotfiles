require('kommentary.config').configure_language('javascriptreact', {
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end
})

require('kommentary.config').configure_language('svelte', {
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end
})

--[[ require('kommentary.config').configure_language('default', {
    hook_function = function()
        require('ts_context_commentstring.internal').update_commentstring()
    end
}) ]]
