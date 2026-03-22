return {
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<leader>gd", "", desc = "+diffview", mode = { "n", "v" } },
			{ "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "Diffview Open" },
			{ "<leader>gdc", "<cmd>tabclose<cr>", desc = "Diffview Close" },
			{ "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "Diffview File History" },
		},
	},
	{
		"polarmutex/git-worktree.nvim",
		version = "^2",
		dependencies = { "ibhagwan/fzf-lua" },
		config = function()
			require("git-worktree").setup()
		end,
		keys = {
			{ "<leader>gw", "", desc = "+git-worktree", mode = { "n", "v" } },
			{
				"<leader>gws",
				function()
					require("fzf-lua").fzf_exec(function(fzf_cb)
						local worktrees = require("git-worktree").get_worktrees()
						for _, wt in ipairs(worktrees) do
							fzf_cb(wt.path)
						end
						fzf_cb()
					end, {
						prompt = "Worktrees> ",
						actions = {
							["default"] = function(selected)
								require("git-worktree").switch_worktree(selected[1])
							end,
						},
					})
				end,
				desc = "Manage Worktrees",
			},
			{
				"<leader>gwc",
				function()
					local branch = vim.fn.input("Branch: ")
					if branch ~= "" then
						require("git-worktree").create_worktree(branch, branch)
					end
				end,
				desc = "Create Worktree",
			},
		},
	},
}
