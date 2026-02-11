local init = {};

function setup()
  require("statusline");
  require("indent-line");
  require("todo");
  require("neotree");
  require("pretty-input");
  require("lsp");
  -- require("cmp");
  require("completion");
  require("debugger");
  require("pairs");
  require("conflicts");
  require("lab-runner");
  -- require("claude");
  require("unit-test");
  require("treesitter");
  require("neckpain");
  require("fuzzyfinder");
end
init.setup = setup;

return init;
