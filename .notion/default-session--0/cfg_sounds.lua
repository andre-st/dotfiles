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
	'discord'    ,  'ebuddy'    ,  'facebook'    ,  'firechat'   ,  'gadu'     ,
	'gajim'      ,  'icq'       ,  'jami'        ,  'jitsi'      ,  'kadu'     ,
	'kakaotalk'  ,  'kik'       ,  'mcabber'     ,  'palringo'   ,  'paltalk'  ,
	'pidgin'     ,  'psi'       ,  'retroshare'  ,  'ricochet'   ,  'riot.im'  ,
	'sicher'     ,  'signal'    ,  'phone'       ,  'skype'      ,  'slack'    ,
	'snapchat'   ,  'surespot'  ,  'telegram'    ,  'trencent'   ,  'threema'  ,
	'trillian'   ,  'viber'     ,  'wechat'      ,  'whatsapp,'  ,  'wickr'    ,
	'wire'       ,
	-- Other chat clients:
	'webchat'    ,  'irssi'
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


-- tests whether at least one element in the table t passes the test 
-- implemented by the provided function f. It returns a Boolean value.
-- Equivalent to Javascript's Array.prototype.some() or Java's Stream::anyMatch()
-- or Perl's any() in List::Util
-- This function should be moved to a global/shared source file.
local function table_any( t, f ) 
	for _,v in ipairs( t ) do 
		local r = f( v )
		if r then
			return true
		end
	end
	return false
end


local function hookhandler( reg, how )
	local reg_name_lc          = string.lower( WRegion.name( reg ))
	local is_sound_enabled_app = table_any( SOUND_ENABLED_APPS, 
			function( s ) return string.find( reg_name_lc, s ) end )
	
	if  how == 'activity'              -- Just urgency hint
	and WRegion.is_activity( reg )     -- Don't play sound 2nd time when clicking the hot region
	and is_sound_enabled_app           -- Don't get annoying
	then
		aplay_name( 'wm_activity.wav' )
	end
end


ioncore.get_hook( 'region_notify_hook' ):add( hookhandler )



