-- used to format code
return {
    "nvimtools/none-ls.nvim",
    config = function()
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                -- stylua is for Lua
                null_ls.builtins.formatting.stylua,
                -- prettier is for JS, JSX, TS, HTML, CSS, JSON, MarkDown, YAML
                null_ls.builtins.formatting.prettier.with({
                    filetypes = {"html", "css", "json", "yaml", "markdown" },
                }),
                -- black is for Python
                null_ls.builtins.formatting.black,
                -- isort is for Python import statements
                null_ls.builtins.formatting.isort,
                -- gofmt is for Go
                null_ls.builtins.formatting.gofmt,
                -- goimports is for go import statements
                null_ls.builtins.formatting.goimports,
                -- google_java_format is for Java
                null_ls.builtins.formatting.google_java_format,
                -- shfmt is for Bash
                null_ls.builtins.formatting.shfmt,
                -- sql_formatter is for SQL
                null_ls.builtins.formatting.sqlfmt,
                -- phpcsf is for check code standard violations
                null_ls.builtins.formatting.phpcsfixer,
                -- phpcbf is for fixing PHP code violations 
                null_ls.builtins.formatting.phpcbf,
                --dart_format is for Dart
                --null_ls.builtins.formatting.dart_format,
                -- clang_format is for C, C++, and family
                null_ls.builtins.formatting.clang_format.with({
                    disabled_filetypes = { "java" },
                }),
                -- asmfmt is for Assembly, formats like go code
                null_ls.builtins.formatting.asmfmt,
            },
        })
    end,
}
