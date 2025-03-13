local M = {}

function M.setup()
    require("gitlens.git_blame").setup()
    -- WIP require("gitlens.git_history").setup()
end

return M


