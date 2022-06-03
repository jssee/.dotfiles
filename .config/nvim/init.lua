--Initialize a global table to add my own functions to the lua enviroment
_G.My = {}

-- load utilities
require("jh.utils.map").setup()
require("jh.utils.path").setup()

-- configuration
require "jh.settings"
require "jh.mappings"
require "jh.plugins"
