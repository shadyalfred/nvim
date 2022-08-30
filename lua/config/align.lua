vim.keymap.set('v', 'ga', function() require'align'.align_to_char(2, true, true) end) -- Aligns to 2 characters, looking left and with previews
