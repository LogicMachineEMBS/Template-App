apptype = (io.exists('/lib/genohm-scada') or is_cloud) and 'knx' or 'canx'
devmode = true

if apptype == 'knx' then
  require('apps')
  if ngx then
    language = getlanguage()
  end
else
  package.path = '/usr/lib/lua/?.lua;/usr/share/lua/?.lua'
  package.cpath = '/usr/lib/lua/?.so'
  _G.canx = require('applibs.canx')
end