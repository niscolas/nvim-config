local luasnip = require("luasnip")
local s = luasnip.snippet
local sn = luasnip.snippet_node
local isn = luasnip.indent_snippet_node
local t = luasnip.text_node
local i = luasnip.insert_node
local f = luasnip.function_node
local c = luasnip.choice_node
local d = luasnip.dynamic_node
local r = luasnip.restore_node
local events = require("luasnip.util.events")
local ai = require("luasnip.nodes.absolute_indexer")
local fmt = require("luasnip.extras.fmt").fmt
local m = require("luasnip.extras").m
local lambda = require("luasnip.extras").l

local indent = "    "

local function simple_cs_method(signature)
    return {
        t(signature .. "()"),
        t { "", "{", indent },
        i(0),
        t { "", "}" },
    }
end

return {
    s("awake", simple_cs_method("private void Awake")),

    s("onenable", simple_cs_method("private void OnEnable")),

    s("start", simple_cs_method("private void Start")),

    s("update", simple_cs_method("private void Update")),

    s("fixedupdate", simple_cs_method("private void FixedUpdate")),

    s("lateupdate", simple_cs_method("private void LateUpdate")),

    s("ondisable", simple_cs_method("private void OnDisable")),

    s("ondestroy", simple_cs_method("private void OnDestroy")),

    s("header", { t("[Header("), i(0), t(")]") }),

    s("sfield", { t { "[SerializeField]", "" }, i(0) }),

    s("fsfield", { t { "[field: SerializeField]", "" }, i(0) }),

    s("isfield", { t { "[Inject, SerializeField]", "" }, i(0) }),

    s("fisfield", { t { "[field: Inject, SerializeField]", "" }, i(0) }),
}
