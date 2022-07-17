local status, cmp = pcall(require, 'cmp')
if not status then return end
local status, luasnip = pcall(require, 'luasnip')
if not status then return end
require('luasnip/loaders/from_vscode').lazy_load()

local supertab = function(fallback)
	if luasnip.expand_or_jumpable() then
		luasnip.expand_or_jump()
	else
		fallback()
	end
end

local rsupertab = function(fallback)
	if luasnip.jumpable(-1) then
		luasnip.jump(-1)
	else
		fallback()
	end
end

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		['<c-e>']   = cmp.mapping.abort(),
		['<c-y>']   = cmp.mapping.confirm({ select = true }),
		['<tab>']   = cmp.mapping(supertab, { 'i', 's', }),
		['<s-tab>'] = cmp.mapping(rsupertab, { 'i', 's', }),
	}),
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
})
