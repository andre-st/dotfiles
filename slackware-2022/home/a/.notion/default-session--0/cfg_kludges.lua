--
-- Options to get some programs work more nicely (or at all)
--




defwinprop{
  class = "de.ruegenmagic.abmahnbild.GuiLauncherXXX",
  float = true
}

defwinprop{
  class = "chromium-browserXXX",
  float = true
}




--defwinprop{
--  class = "Gimp",
--  instance = "gimp",
--  float = true
--}

defwinprop{
  class = "Gimp",
  role = "gimp-toolbox",
  float = true,
    max_size = { w = 400, h = 700},
    min_size = { w = 250, h = 250},
}

defwinprop{
  instance = "xscreenruler",
  float = true
}

defwinprop{
  class = "Gimp",
  role = "gimp-dock",
  float = true,
    max_size = { w = 400, h = 700},
    min_size = { w = 250, h = 250},
}

defwinprop{
  class = "Gimp",
  role = "gimp-message-dialog",
  float = true
}

defwinprop{
  class = "Gimp",
  role = "gimp-image-new",
  float = true
}

defwinprop{
  class = "Gimp",
  role = "gimp-startup",
  float = true
}



defwinprop{
    class = "AcroRead",
    instance = "documentShell",
    acrobatic = true
}


defwinprop{
    class = "Xpdf",
    instance = "openDialog_popup",
    ignore_cfgrq = true,
}


-- Put all dockapps in the statusbar's systray, also adding the missing
-- size hints necessary for this to work.
defwinprop{
    is_dockapp = true,
    statusbar = "systray",
    max_size = { w = 64, h = 64},
    min_size = { w = 64, h = 64},
}


-- You might want to enable these if you really must use XMMS. 
--[[
defwinprop{
    class = "xmms",
    instance = "XMMS_Playlist",
    transient_mode = "off"
}

defwinprop{
    class = "xmms",
    instance = "XMMS_Player",
    transient_mode = "off"
}
--]]



-- Define some additional title shortening rules to use when the full
-- title doesn't fit in the available space. The first-defined matching 
-- rule that succeeds in making the title short enough is used.
ioncore.defshortening("(.*) - Mozilla(<[0-9]+>)", "$1$2$|$1$<...$2")
ioncore.defshortening("(.*) - Mozilla", "$1$|$1$<...")
ioncore.defshortening("XMMS - (.*)", "$1$|...$>$1")
ioncore.defshortening("[^:]+: (.*)(<[0-9]+>)", "$1$2$|$1$<...$2")
ioncore.defshortening("[^:]+: (.*)", "$1$|$1$<...")
ioncore.defshortening("(.*)(<[0-9]+>)", "$1$2$|$1$<...$2")
ioncore.defshortening("(.*)", "$1$|$1$<...")





-- Flash player opens full-screen windows from Firefox with size
-- request 200x200.  It closes them if they lose focus, but also if
-- they get focus too quickly.  Therefore set focus 200 ms after
-- such a window is mapped (this may need to be adjusted on slower
-- computers).

_NET_WM_STATE            = ioncore.x_intern_atom('_NET_WM_STATE', false)
_NET_WM_STATE_FULLSCREEN = ioncore.x_intern_atom('_NET_WM_STATE_FULLSCREEN', false)

function is_fullscreen(cwin)
    local state = ioncore.x_get_window_property(cwin:xid(), _NET_WM_STATE, 4, 1, true)
    if state then
	for k, v in pairs(state) do
	    if v == _NET_WM_STATE_FULLSCREEN then
	        return true
	    end
        end
    end
    return false
end

defwinprop {
    class = "<unknown>",
    instance = "<unknown>",
    match = function(prop, cwin, id) return is_fullscreen(cwin); end,
    switchto = false,
    flash_fullscreen = true,
}

ioncore.get_hook('clientwin_do_manage_alt'):add(
    function(cwin, table)
	local winprop = ioncore.getwinprop(cwin)
	if winprop and winprop.flash_fullscreen then
	    local timer = ioncore.create_timer()
	    timer:set(200, function() cwin:goto() end)
	    return true
	else
	    return false
        end
    end
)

-- Get correct winprop class/instance: See ~/.ion3/default-session-0/windowinfos.lua
-- ioncore.get_hook('clientwin_do_manage_alt'):add(
--     function(cwin, table)
--     ioncore.write_savefile("windowinfos", cwin:get_ident())
-- end)

                  
