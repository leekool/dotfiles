local work_frontmatter = function(note)
    note:add_tag "work"
    local out = { id = note.id, aliases = note.aliases, tags = note.tags }
    if note.metadata ~= nil and require("obsidian").util.table_length(note.metadata) > 0 then
        for k, v in pairs(note.metadata) do
            out[k] = v
        end
    end
    return out
end

local real_frontmatter = function(note)
    note:add_tag "real"
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
                note_frontmatter_func = real_frontmatter
            },
        },
        {
            name = "work",
            path = "~/notes/work",
            strict = true,
            overrides = {
                note_frontmatter_func = work_frontmatter
            },
        },
    },
    note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "_"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
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
        template = nil
    },
})
