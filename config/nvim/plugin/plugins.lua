local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function()
    use({
        "NTBBloodbath/galaxyline.nvim",
        config = function()
            require("galaxyline.themes.spaceline")
        end,
        requires = { "kyazdani42/nvim-web-devicons", opt = true }
    })

    if packer_bootstrap then
        require('packer').sync()
    end
end)
