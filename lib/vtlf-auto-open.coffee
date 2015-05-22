
# vtlf-auto-open

fs = require 'fs-plus'
{CompositeDisposable} = require 'atom'

module.exports =
class AutoOpen

  @type = 'singleton'

  constructor: (pluginMgr, state, vtlfLibPath) ->
    Viewer = require vtlfLibPath + 'viewer'

    @subs = new CompositeDisposable
    @subs.add atom.workspace.addOpener (uri) ->
      if fs.getSizeSync(uri) >= 2 * 1048576
        new Viewer uri

  destroy: ->
    @subs?.dispose()
