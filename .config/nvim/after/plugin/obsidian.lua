local generic_frontmatter = function(note, extra_tag)
    local daily_tag_present = false
    for _, tag in ipairs(note.tags or {}) do
        if tag == "daily" then
            daily_tag_present = true
            break
        end
    end

    if not daily_tag_present then
        note:add_tag(extra_tag)
    end

    local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
            out[k] = v
        end
    end
    return out
end

require("obsidian").setup({
    workspaces = {
        {
            name = "real",
            path = "~/notes/real",
            strict = true,
            overrides = {
                note_frontmatter_func = function(note)
                    return generic_frontmatter(note, "real")
                end,
            },
        },
        {
            name = "work",
            path = "~/notes/work",
            strict = true,
            overrides = {
                note_frontmatter_func = function(note)
                    return generic_frontmatter(note, "work")
                end,
            },
        },
    },
    note_id_func = function(title)
        local suffix = ""
        if title ~= nil then
            suffix = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-]", ""):lower() -- ensure title only contains valid chars
        else
            for _ = 1, 4 do                                                 -- if title nil, 4 random numbers as title
                suffix = suffix .. string.char(math.random(65, 90))
            end
        end
        return suffix .. "_" .. tostring(os.time())
    end,
    completion = {
        nvim_cmp = true,
        min_char = 2,
    },
    daily_notes = {
        folder = "../daily",
        date_format = "%d-%m-%Y",
        alias_format = "%d-%m-%Y",
        default_tags = { "daily" },
        template = "daily"
    },
    templates = {
        folder = "../templates",
        date_format = "%d-%m-%Y",
        time_format = "%H:%M",
    }
})
