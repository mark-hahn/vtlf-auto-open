
# vtlf-auto-open

fs = require 'fs-plus'

module.exports =
class AutoOpen
  
  @type = 'singleton'
  
  constructor: (pluginMgr, state, vtlfLibPath) ->
    Viewer = require vtlfLibPath + 'viewer'
    
    @opener = (filePath, options) =>
      if fs.getSizeSync(filePath) >= 2 * 1048576 
        new Viewer filePath
        
    atom.workspace.registerOpener @opener
    
  destroy: -> atom.workspace.unregisterOpener @opener
  