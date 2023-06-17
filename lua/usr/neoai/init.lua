local M = {}

M.keymap = {
    summarize_text = {
        keys = "<Leader>as",
        desc = "[A]I [S]ummarize Text",
    },
    generate_commit_msg = {
        keys = "<Leader>ac",
        desc = "[A]I Generate [C]ommit Message",
    },
}

M.setup = function()
    require("neoai").setup {
        ui = {
            output_popup_text = "NeoAI",
            input_popup_text = "Prompt",
            width = 30, -- As percentage eg. 30%
            output_popup_height = 80, -- As percentage eg. 80%
            submit = "<Enter>", -- Key binding to submit the prompt
        },
        models = {
            {
                name = "openai",
                model = "gpt-3.5-turbo",
                params = nil,
            },
        },
        register_output = {
            ["g"] = function(output)
                return output
            end,
            ["c"] = require("neoai.utils").extract_code_snippets,
        },
        inject = {
            cutoff_width = 75,
        },
        prompts = {
            context_prompt = function(context)
                return "Hey, I'd like to provide some context for future "
                    .. "messages. Here is the code/text that I want to refer "
                    .. "to in our upcoming conversations:\n\n"
                    .. context
            end,
        },
        mappings = {
            ["select_up"] = "<C-k>",
            ["select_down"] = "<C-j>",
        },
        open_api_key_env = "OPENAI_API_KEY",
        shortcuts = {
            {
                name = "textify",
                key = M.keymap.summarize_text.keys,
                desc = M.keymap.summarize_text.desc,
                use_context = true,
                prompt = [[
                    Please rewrite the text to make it more readable, clear,
                    concise, and fix any grammatical, punctuation, or spelling
                    errors
                ]],
                modes = { "v" },
                strip_function = nil,
            },
            {
                name = "gitcommit",
                key = M.keymap.generate_commit_msg.keys,
                desc = M.keymap.generate_commit_msg.desc,
                use_context = false,
                prompt = function()
                    return [[
                        Using the following git diff generate a consise and clear git commit message, it must use Conventional Commits standard. The title and topic should be informative.
                        It should be in the following layout:
                        <type>[optional scope]: <description>

                        [optional body]

                        You are allowed to also have multope optional scopes like, feat(lsp, treesiter):
                        The description that is informative of the changes made, and a body that is a more and anything that May seem important.
                    ]] .. vim.fn.system("git diff --cached")
                end,
                modes = { "n" },
                strip_function = nil,
            },
        },
    }
end

return M
