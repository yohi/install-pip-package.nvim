local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

local function install_pip_package(package_name, bin)
    print(package_name)
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

install_pip_package('pynvim')

return {
    setup = install_pip_package
}
