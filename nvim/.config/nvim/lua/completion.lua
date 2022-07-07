local cmp_status_ok, cmp = pcall(require, 'cmp')
if not cmp_status_ok then return end
local luasnip_status_ok, luasnip = pcall(require, 'luasnip')
if not luasnip_status_ok then return end
require('luasnip/loaders/from_vscode').lazy_load()

local supertab = function(fallback)
	if luasnip.expandable() then
		luasnip.expand()
	elseif luasnip.expand_or_jumpable() then
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
		['<c-e>'] = cmp.mapping.abort(),
		['<cr>'] = cmp.mapping.confirm({ select = true }),
		['<tab>'] = cmp.mapping(supertab, { 'i', 's', }),
		['<s-tab>'] = cmp.mapping(rsupertab, { 'i', 's', }),
	}),
	sources = {
		{ name = 'luasnip' },
		{ name = 'buffer' },
		{ name = 'path' },
	},
	confirm_opts = {
		behavior = cmp.ConfirmBehavior.Replace,
		select = false,
	},
})
