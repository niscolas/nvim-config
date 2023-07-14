return {
    s("lmod", {
        t { "local M = {}", "", "" },
        t { "M.setup = function()", "" },
        t { "\t" },
        i(0),
        t { "", "" },
        t { "end", "", "" },
        t { "return M" },
    }),
}
