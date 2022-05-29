-- Author:   andre-st
-- Since:    2020-03-22
-- Modified: 2020-03-23
-- About:    Adds sounds to the window manager
--
-- Requires:
--    /usr/bin/aplay                   Program to play sound files (often preinstalled)
--    ~/.notion/wav/wm_activity.wav    Sound file for X11 window notifications: the urgency hint (Notion 'activity')
--    


-- Which apps should be able to trigger a notification sound:
SOUND_ENABLED_APPS = { 'Signal', 'webchat', 'irssi', 'Chime' }  -- region-name substrings

-- Location of the sound files:
SOUND_DIR = os.getenv( 'HOME' ) .. '/.notion/wav'




local function aplay( path )
	ioncore.exec( 'aplay ' .. '"' .. path .. '"' )  -- nonblocking
end


local function aplay_name( name_in_sound_dir )
	aplay( SOUND_DIR .. '/' .. name_in_sound_dir )
end


-- Equivalent to Javascript's Array.prototype.some() or 
-- Java's Stream::anyMatch() or Perl's any() in List::Util
local function table_any( t, f ) 
	for _,v in ipairs( t ) do if f( v ) then return true end end
end


local function hookhandler( reg, how )
	if  how == 'activity'                -- Just X11 urgency hint
	and WRegion.is_activity( reg ) then  -- Don't play sound 2nd time when clicking the hot region
		local reg_name     = WRegion.name( reg )
		local is_sound_app = table_any( SOUND_ENABLED_APPS, 
			function( s ) return string.find( reg_name, s ) end )
		
		if is_sound_app then  -- Don't get annoying
			aplay_name( 'wm_activity.wav' )
		end
	end
end


ioncore.get_hook( 'region_notify_hook' ):add( hookhandler )



