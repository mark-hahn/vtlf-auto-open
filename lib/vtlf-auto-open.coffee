
# vtlf-auto-open

fs = require 'fs-plus'
_  = require "underscore"

module.exports =
class AutoOpen
  
  constructor: (state, vtlfLibPath, @pluginMgr) ->
    ViewOpener = require vtlfLibPath + 'view-opener'
    
    atom.workspace.registerOpener @opener = 
      (filePath, options) =>
        if fs.getSizeSync(filePath) >= 2 * 1048576 
          new ViewOpener filePath, @
        
  @destroy: -> 
    if @singletonInstance
      atom.workspace.unregisterOpener @singletonInstance.opener
  