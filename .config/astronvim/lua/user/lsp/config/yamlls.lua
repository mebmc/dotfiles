return {
    settings = {
        yaml = {
            editor = {
                formatOnType = true,
            },
            format = {
                enable         = true,
                singleQuote    = false,
                bracketSpacing = true,
            },
            keyOrdering = false,
            schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json"
            },
            schemas = {
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = "*.gitlab-ci.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = "compose*.{yml,yaml}",
                ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
                ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}"
            }
        }
    }
}
