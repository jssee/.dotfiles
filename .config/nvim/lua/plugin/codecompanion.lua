return {
    "olimorris/codecompanion.nvim",
    config = true,
    opts = {
        adapters = {
            anthropic = function()
                return require("codecompanion.adapters").extend("anthropic", {
                    env = {
                        api_key = "cmd:op read op://personal/Anthropic_API/credential --no-newline",
                    },
                })
            end,
            openai = function()
                return require("codecompanion.adapters").extend("openai", {
                    env = {
                        api_key = "cmd:op read op://personal/OpenAI_API/credential --no-newline",
                    },
                })
            end,
        },
        strategies = {
            chat = {
                adapter = "openai",
            },
            inline = {
                adapter = "openai",
            },
            agent = {
                adapter = "openai",
            },
        },
    },
}
