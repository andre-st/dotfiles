-- Author: andre-st
-- Since:  2020-03-22
-- 
-- Adds sounds to the window manager:
--    1. X11 window notifications: the urgency hint  (win 'activity')
--    2.
--
-- Requires
--    ~/.notion/wav/wm_activity.wav
--

local function aplay( path )
	os.execute( '"/usr/bin/aplay" ' .. '"' .. path .. '"' .. ' &' )  -- nonblocking
end


local function getwavdir()
	return os.getenv ( "HOME" ) .. '/.notion/wav'
end


local function aplay_name( name_in_wavdir )
	aplay( getwavdir() .. '/' .. name_in_wavdir )
end


local function hookhandler( reg, how )
	if how == 'activity' then
		aplay_name( 'wm_activity.wav' )
	end
end


ioncore.get_hook( 'region_notify_hook' ):add( hookhandler )



