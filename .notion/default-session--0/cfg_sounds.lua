-- Author: andre-st
-- Since:  2020-03-22
-- About:  Adds sounds to the window manager
--
-- Requires:
--    /usr/bin/aplay                   Program to play sound files (often preinstalled)
--    ~/.notion/wav/wm_activity.wav    Sound file for X11 window notifications: the urgency hint (Notion 'activity')
--    


-- Which apps should be able to trigger a notification sound:
SOUND_ENABLED_APPS = { 
	-- -------------------------------------------------------------------------
	-- Note: All lowercase, region-name patterns compatible with string.find() 
	-- -------------------------------------------------------------------------
	-- Instant messaging clients:
	'signal',
	-- Other chat clients:
	'webchat',  'irssi'
}




local function aplay( path )
	os.execute( '"/usr/bin/aplay" ' .. '"' .. path .. '"' .. ' &' )  -- nonblocking
end


local function getwavdir()
	return os.getenv( 'HOME' ) .. '/.notion/wav'
end


local function aplay_name( name_in_wavdir )
	aplay( getwavdir() .. '/' .. name_in_wavdir )
end


-- Tests whether at least one element in the table t passes the test 
-- implemented by the provided function f. It returns a Boolean value.
-- Equivalent to Javascript's Array.prototype.some() or Java's Stream::anyMatch()
-- or Perl's any() in List::Util
-- This function should be moved to a global/shared source file.
local function table_any( t, f ) 
	for _,v in ipairs( t ) do 
		if f( v ) then
			return true
		end
	end
end


local function hookhandler( reg, how )
	if  how == 'activity'                -- Just urgency hint
	and WRegion.is_activity( reg ) then  -- Don't play sound 2nd time when clicking the hot region
		
		local reg_name_lc  = string.lower( WRegion.name( reg ))
		local is_sound_app = table_any( SOUND_ENABLED_APPS, 
			function( s ) return string.find( reg_name_lc, s ) end )
		
		if is_sound_app then  -- Don't get annoying
			aplay_name( 'wm_activity.wav' )
		end
	end
end


ioncore.get_hook( 'region_notify_hook' ):add( hookhandler )



