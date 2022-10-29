local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

function InstallPipPackage(package_name, bin)
    vim.notify('install pip package ' .. package_name)
    bin = bin or false
    local file = vim.env.VIRTUAL_ENV .. '.venv/bin/' .. package_name
    if bin and file_exists(file) then
        vim.notify(vim.g.python3_host_prog .. ' -m pip install --force-reinstall '  .. package_name)
        os.execute(vim.g.python3_host_prog .. ' -m pip install --force-reinstall '  .. package_name)
    else
        if os.execute(vim.g.python3_host_prog .. ' -m pip show '  .. package_name .. '> /dev/null') ~= 0 then
            vim.notify(vim.g.python3_host_prog .. ' -m pip install -U  '  .. package_name)
            os.execute(vim.g.python3_host_prog .. ' -m pip install -U  '  .. package_name)
        end
    end
end

-- vim.schedule(function()
--     pcall(install_pip_package, 'pynvim')
-- end)
-- vim.schedule(function()
--     pcall(install_pip_package, 'mypy', true)
-- end)
-- vim.schedule(function()
--     pcall(install_pip_package, 'flake8', true)
-- end)
-- vim.schedule(function()
--     pcall(install_pip_package, 'isort', true)
-- end)
-- vim.schedule(function()
--     pcall(install_pip_package, 'djlint', true)
-- end)

-- pcall(install_pip_package, 'pynvim')
-- pcall(install_pip_package, 'mypy', true)
-- pcall(install_pip_package, 'flake8', true)
-- pcall(install_pip_package, 'isort', true)
-- pcall(install_pip_package, 'djlint', true)

