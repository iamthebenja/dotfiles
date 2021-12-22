local lualine = require("lualine")

local config = vim.tbl_extend("force", vim.deepcopy(lualine.get_config()), {
	options = { section_separators = "", component_separators = "" },
	sections = { lualine_x = { "encoding", "filetype" }, lualine_y = {} },
})

lualine.setup(config)
