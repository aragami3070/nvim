local rust_features = require("utils.rust_features")

return {
    before_init = rust_features.before_init,
    settings = {
        ["rust-analyzer"] = {
            cargo = {
                features = {},
                allTargets = false,
            },
            check = {
                command = "clippy",
                allTargets = false,
            },
        },
    },
}
