local function replace_prompt(confirm)
	local old = vim.fn.input("Replace: ")
	if old == "" then
		return
	end

	local new = vim.fn.input("With: ")
	if new == "" then
		return
	end

	old = vim.fn.escape(old, [[\/]])
	new = vim.fn.escape(new, [[\/]])

	if old == new then
		return
	end

	local flags = "g"
	if confirm then
		flags = flags .. "c"
	end

	vim.cmd(string.format("%%s/%s/%s/%s", old, new, flags))
end

vim.keymap.set(
    "n", "<leader>rc",
    function()
        replace_prompt(true)
    end,
    { desc = "Replace word with confirmation"}
)

vim.keymap.set(
    "n", "<leader>ra",
    function()
        replace_prompt(false)
    end,
{ desc = "Replace all without confirmation" })
