return {
    "mason-org/mason.nvim",
    lazy = false,

    opts = {
        ui = {
            check_outdated_packages_on_open = true,
            auto_update_packages = true,

            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    }
}
