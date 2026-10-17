local dap = require('dap')
dap.adapters.go = {
  type = 'executable';
  command = 'node';
  args = {vim.fn.expand('~/dap/vscode-go/dist/debugAdapter.js')};
}
dap.configurations.go = {
  {
    type = 'go';
    name = 'Debug';
    request = 'launch';
    showLog = true;
    dlvToolPath = vim.fn.exepath('dlv');
    program = '${file}'
  },
}
