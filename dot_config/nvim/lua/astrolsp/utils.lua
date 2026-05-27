local M = {}

function M.supports_method(client, method, bufnr)
  return client ~= nil and client.supports_method ~= nil and client:supports_method(method, bufnr)
end

return M
