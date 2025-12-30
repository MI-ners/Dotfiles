vim.pack.add({
    { src = "https://github.com/nvimdev/dashboard-nvim" },
})

local db_colors = {
    bg = "#0f0b18",
    violet = "#bd5eff",
    cyan = "#8be9fd",
    pink = "#ff757f",
    green = "#50fa7b",
    fg = "#dcd7ea",
    comment = "#6272a4",
}

local status_ok, dashboard = pcall(require, "dashboard")
if not status_ok then
    print("Dashboard not found!")
    return
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "dashboard",
    callback = function()
        vim.b.miniindentscope_disable = true
    end,
})

dashboard.setup({
    theme = "doom",
    config = {
        header = {
            "",
            "                                                                       ",
            "                                                                       ",
            "                                                                       ",
            "                                                                       ",
            "                                                                       ",
            "                                                                       ",
            " ███▄ ▄███▓ ██▓ ███▄    █ ▓█████  ██▀███    ██████  ██▓███   ▄████▄   ",
            " ▓██▒▀█▀ ██▒▓██▒ ██ ▀█   █ ▓█   ▀ ▓██ ▒ ██▒▒██    ▒ ▓██░  ██▒▒██▀ ▀█   ",
            " ▓██    ▓██░▒██▒▓██  ▀█ ██▒▒███   ▓██ ░▄█ ▒░ ▓██▄   ▓██░ ██▓▒▒▓█    ▄  ",
            " ▒██    ▒██ ░██░▓██▒  ▐▌██▒▒▓█  ▄ ▒██▀▀█▄    ▒   ██▒▒██▄█▓▒ ▒▒▓▓▄ ▄██▒ ",
            " ▒██▒   ░██▒░██░▒██░   ▓██░░▒████▒░██▓ ▒██▒▒██████▒▒▒██▒ ░  ░▒ ▓███▀ ░ ",
            " ░ ▒░   ░  ░░▓  ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒▓ ░▒▓░▒ ▒▓▒ ▒ ░▒▓▒░ ░  ░░ ░▒ ▒  ░ ",
            " ░  ░      ░ ▒ ░░ ░░   ░ ▒░ ░ ░  ░  ░▒ ░ ▒░░ ░▒  ░ ░░▒ ░       ░  ▒    ",
            " ░      ░    ▒ ░   ░   ░ ░    ░     ░░   ░ ░  ░  ░  ░░       ░         ",
            "        ░    ░           ░    ░  ░   ░           ░           ░ ░       ",
            "",
        },

        center = {

            { action = "Pick files", desc = " Find File ", icon = " ", key = "f" },
            { action = "Pick grep_live", desc = " Find Text ", icon = " ", key = "g" },
            { action = "lua vim.pack.update()", desc = " Update Plugins ", icon = " ", key = "u" },
            { action = "e $MYVIMRC", desc = " Config ", icon = " ", key = "c" },
            { action = "qa", desc = " Quit ", icon = " ", key = "q" },
        },

        footer = function()
            return { "      " }
        end,
    },
})

vim.api.nvim_set_hl(0, "DashboardHeader", { fg = db_colors.violet })
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = db_colors.cyan, italic = true })
vim.api.nvim_set_hl(0, "DashboardIcon", { fg = db_colors.pink })
vim.api.nvim_set_hl(0, "DashboardDesc", { fg = db_colors.fg })
vim.api.nvim_set_hl(0, "DashboardKey", { fg = db_colors.green, bold = true })
vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = db_colors.comment })
vim.opt_local.fillchars = { eob = " " }
