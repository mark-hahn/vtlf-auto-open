
# vtlf-auto-open

fs = require 'fs-plus'

module.exports =
class AutoOpen
  
  @type = 'singleton'
  
  constructor: (pluginMgr, state, vtlfLibPath) ->
    ViewOpener = require vtlfLibPath + 'view-opener'
    
    @opener = (filePath, options) =>
      if fs.getSizeSync(filePath) >= 2 * 1048576 
        new ViewOpener filePath
        
    atom.workspace.registerOpener @opener
    
  destroy: -> atom.workspace.unregisterOpener @opener
  