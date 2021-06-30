require('neoscroll').setup({
    -- All these keys will be mapped to their corresponding default scrolling animation
    -- mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>', '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
    hide_cursor = true, -- Hide cursor while scrolling
    stop_eof = true, -- Stop at <EOF> when scrolling downwards
    use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
    respect_scrolloff = false, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    easing_function = nil -- Default easing function
})

local t = {}
-- Syntax: t[keys] = {function, {function arguments}}
-- t['<Leader>su'] = {'scroll', {'-vim.wo.scroll', 'true', '250'}}
-- t['<Leader>ss'] = {'scroll', {'vim.wo.scroll', 'true', '250'}}
--[[ t['<C-b>'] = {'scroll', {'-vim.api.nvim_win_get_height(0)', 'true', '450'}}
t['<C-f>'] = {'scroll', {'vim.api.nvim_win_get_height(0)', 'true', '450'}} ]]
t['<Leader>u'] = {'scroll', {'-0.30', 'false', '100'}}
t['<Leader>n'] = {'scroll', {'0.30', 'false', '100'}}
--[[ t['zt'] = {'zt', {'250'}}
t['zz'] = {'zz', {'250'}}
t['zb'] = {'zb', {'250'}} ]]

require('neoscroll.config').set_mappings(t)
