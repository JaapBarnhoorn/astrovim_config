local directories = {
  "packages/balie-auth-guard",
  "packages/digid-auth-guard",
  "packages/service-types",
  "error-message-library",
  "form-validation-library",
  "matomo-library",
  "devtools-component-package",
  "micro-frontend-core-library",
  "design-system-component-package",
  "helpdesk-component-package",
  "helpdesk-web-app",
  "digid-machtigen-component-package",
  "digid-machtigen-aanmaken-component-package",
  "digid-machtigen-activeren-component-package",
  "digid-machtigen-application-shell",
  "balie-machtigen-component-package",
  "balie-web-app",
}
local scopes = {}

for _, directory in ipairs(directories) do
  local entry = {
    name = directory,
    dirs = {
      directory,
    },
    on_select = function() vim.cmd("cd ~/Websites/digid/art-eco-system/" .. directory) end,
  }
  table.insert(scopes, entry) -- Add the entry to the result table
end

return {
  "smartpde/neoscopes",
  opts = {
    scopes = scopes,
  },
}
