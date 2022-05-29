--
-- Ion core configuration file
-- http://folk.ntnu.no/bronner/temp/ion3/ionconf/node7.html
-- http://notion.sourceforge.net/notionconf/node7.html


-- 
-- Bindings. This includes global bindings and bindings common to
-- screens and all types of frames only. See modules' configuration 
-- files for other bindings.
--



function tabs_flip_screen( tab )
	WRegion.set_tagged( tab, 'set' );
	screen_id = WScreen.id( WRegion.screen_of( ioncore.current() ) ) == 0 and 1 or 0;
	screen    = ioncore.find_screen_id( screen_id );
	region    = ioncore.navi_first( screen, 'any' );
	ioncore.tagged_attach( region );
end


function tag_and_next( tab, x )
	WRegion.set_tagged( tab, 'toggle' );
	WFrame.switch_next( x );
end


function switch_neighbour_workspace()
	screen_id = WScreen.id( WRegion.screen_of( ioncore.current() ) ) == 0 and 1 or 0;
	screen    = ioncore.find_screen_id( screen_id );
	WScreen.switch_next( screen );
end


function audio_louder()
	ioncore.exec( 'pactl set-sink-volume  @DEFAULT_SINK@  +2500' )
end

function audio_quieter()
	ioncore.exec( 'pactl set-sink-volume  @DEFAULT_SINK@  -5000' )
end

function audio_mute()
	ioncore.exec( 'pactl set-sink-volume  @DEFAULT_SINK@  0' )
end





-- WScreen context bindings
--
-- The bindings in this context are available all the time.
--
-- The variable META should contain a string of the form 'Mod1+'
-- where Mod1 maybe replaced with the modifier you want to use for most
-- of the bindings. Similarly ALTMETA may be redefined to add a 
-- modifier to some of the F-key bindings.

defbindings( "WScreen", 
{
	-- Navigate monitors/screens on a multihead setup:
	kpress( META.."Right",            "ioncore.goto_next_screen()"   ),
	kpress( META.."Left",             "ioncore.goto_prev_screen()"   ),
	kpress( META.."Shift+1",          "ioncore.goto_nth_screen( 0 )" ),  -- Go to screen 0 (Multihead)
	kpress( META.."Shift+2",          "ioncore.goto_nth_screen( 1 )" ),  -- Go to screen 1 (Multihead)
	
	-- Navigate workspaces on the current screen:
	kpress( META.."Up",               "WScreen.switch_prev( _ )" ),
	kpress( META.."Down",             "WScreen.switch_next( _ )" ),
	mpress( META.."Button4",          "WScreen.switch_prev( _ )" ),
	mpress( META.."Button5",          "WScreen.switch_next( _ )" ),
	mpress(       "Button4",          "WScreen.switch_prev( _ )" ),
	mpress(       "Button5",          "WScreen.switch_next( _ )" ),
	kpress( META.."slash",            "switch_neighbour_workspace()" ),
	
	-- Navigate frames within the current workspace:
	kpress( META.."Shift+Right",      "ioncore.goto_next( _chld, 'next' )" ),
	kpress( META.."Shift+Left",       "ioncore.goto_next( _chld, 'prev' )" ),
	kpress( META.."Shift+Up",         "ioncore.goto_next( _chld, 'up'   )" ),
	kpress( META.."Shift+Down",       "ioncore.goto_next( _chld, 'down' )" ),
	
	-- Adjust audio volume on status bar:
	mpress( META.."Control+Button4",  "audio_louder()" ),
	mpress( META.."Control+Button5",  "audio_quieter()" ),
	
	-- Display the window list menu:
	mpress( "Button2",                "mod_menu.pmenu( _, _sub, 'windowlist' )" ),
	mpress( "Button3",                "mod_menu.pmenu( _, _sub, 'mainmenu'   )" ),
	kpress( META.."Return",           "mod_menu.menu( _, _sub, 'mainmenu', {big=true} )" ), -- Show main menu
	kpress( META.."F9",               "ioncore.create_ws( _ )"                           ), -- New workspace
})



-- Client window bindings
--
-- These bindings affect client windows directly.

defbindings( "WClientWin", 
{
	-- Nudge the client window. This might help with some programs' resizing problems.
	submap( META.."W", 
	{
		-- Kill client owning the client window.
		kpress( "C", "WClientWin.kill( _ )" ),
			
		-- Send next key press to the client window. Some programs may not allow this by default.
		kpress( "Q", "WClientWin.quote_next( _ )" ),
	}),
})



-- Client window group bindings

defbindings( "WGroupCW", {})


-- WMPlex context bindings
--
-- These bindings work in frames and on screens. The innermost of such
-- contexts/objects always gets to handle the key press. Most of these 
-- bindings define actions on client windows. (Remember that client windows 
-- can be put in fullscreen mode and therefore may not have a frame.)

defbindings( "WMPlex", 
{
	kpress_wait( META.."End", "WRegion.rqclose_propagate( _, _sub )" ),  -- Close active tab/frame/...
})



-- Frames for transient windows ignore this bindmap

defbindings( "WMPlex.toplevel", 
{
	kpress( META..'Shift+backslash', "tabs_flip_screen( _sub )"        ),  -- Move tab to last active frame of other screen
	kpress( ALTMETA.."F3",           "mod_query.query_exec( _ )"       ),  -- Command line (never used this way)
	kpress( ALTMETA.."F9",           "mod_query.query_workspace( _ )"  ),  -- Query or create workspace
	kpress( META.."G",               "mod_query.query_gotoclient( _ )" ),  -- Query client window
	kpress( META.."Insert",          "ioncore.tagged_attach( _ )"      ),  -- Attach tagged tabs to win
	
	kpress( META.."E",               "ioncore.exec_on( _, 'urxvt -cd /home/a/_todo -e mc' )" ),
	kpress( META.."H",               "ioncore.exec_on( _, 'urxvt -e htop' )" ),
	kpress( META.."space",           "ioncore.exec_on( _, 'urxvt -cd /home/a/_todo' )" ),
	kpress( META.."I",               "ioncore.exec_on( _, '~/.notion/scripts/invert.sh' )" ),
	kpress( META.."Pause",           "ioncore.exec_on( _, 'xlock -mode blank'     )" ),  -- Lock computer
	kpress( META.."Print",           "ioncore.exec_on( _, '~/.notion/scripts/screenshot.sh' )" ),
	kpress( META.."K",               "ioncore.exec_on( _, 'pkill -9 -o -- chromium' )" ),
	kpress( META.."Q",               "ioncore.exec_on( _, '~/.notion/scripts/shutdown.sh' )" ),
	kpress( META.."F6",              "ioncore.exec_on( _, '~/.notion/scripts/shutdown.sh 60' )" ),
	kpress( META.."F7",              "ioncore.exec_on( _, '~/.notion/scripts/shutdown.sh 120' )" ),
	kpress( META.."P",               "ioncore.exec_on( _, '~/.notion/scripts/paste.sh' )" ),
	
	-- Adjust audio volume:
	kpress( META.."period",          "audio_louder()"  ),
	kpress( META.."comma",           "audio_quieter()" ),
	kpress( META.."M",               "audio_mute()"    ),
})



-- WFrame context bindings
--
-- These bindings are common to all types of frames. The rest of frame
-- bindings that differ between frame types are defined in the modules' 
-- configuration files.

defbindings( "WFrame", 
{
	mpress( "Button3",        "mod_menu.pmenu( _, _sub, 'ctxmenu' )" ),  -- Display context menu
	kpress( META.."R",        "WFrame.begin_kbresize( _ )"           ),  -- Begin move/resize mode
	
	-- Switch the frame to display the object indicated by the tab
	mclick( "Button1@tab",    "WFrame.p_switch_tab( _ )" ),
	mclick( "Button2@tab",    "WFrame.p_switch_tab( _ )" ),
	
	mdrag( "Button1@border",  "WFrame.p_resize( _ )" ),  -- Resize frame
	mdrag( META.."Button3",   "WFrame.p_resize( _ )" ),  -- Resize frame
	mdrag( META.."Button1",   "WFrame.p_move( _ )"   ),  -- Move frame
	
	-- Move objects between frames by dragging and dropping the tab
	mdrag( "Button1@tab",     "WFrame.p_tabdrag( _ )" ),
	mdrag( "Button2@tab",     "WFrame.p_tabdrag( _ )" ),
	
	-- Switch workspace
	mpress( META.."Button4",  "_:parent():switch_prev( _ )" ),
	mpress( META.."Button5",  "_:parent():switch_next( _ )" ),
	mpress( "Button4",        "_:parent():switch_prev( _ )" ),
	mpress( "Button5",        "_:parent():switch_next( _ )" ),
	
	-- Adjust audio volume
	mpress( META.."Control+Button4", "audio_louder()" ),
	mpress( META.."Control+Button5", "audio_quieter()" ),
})



-- Frames for transient windows ignore this bindmap

defbindings( "WFrame.toplevel", {
	-- Tag current tab within the frame
	kpress( META.."T",            "tag_and_next( _sub, _ )", "_sub:non-nil" ),
	kpress( META.."Delete",       "tag_and_next( _sub, _ )", "_sub:non-nil" ),
	kpress( META.."apostrophe",   "tag_and_next( _sub, _ )", "_sub:non-nil" ),
	
	-- Switch to nth tab within the frame
	kpress( META.."1",            "WFrame.switch_nth( _, 0 )" ),
	kpress( META.."2",            "WFrame.switch_nth( _, 1 )" ),
	kpress( META.."3",            "WFrame.switch_nth( _, 2 )" ),
	kpress( META.."4",            "WFrame.switch_nth( _, 3 )" ),
	kpress( META.."5",            "WFrame.switch_nth( _, 4 )" ),
	kpress( META.."6",            "WFrame.switch_nth( _, 5 )" ),
	kpress( META.."7",            "WFrame.switch_nth( _, 6 )" ),
	kpress( META.."8",            "WFrame.switch_nth( _, 7 )" ),
	kpress( META.."9",            "WFrame.switch_nth( _, 8 )" ),
	kpress( META.."0",            "WFrame.switch_nth( _, 9 )" ),
	
	-- Move current object within the frame left/right
	kpress( META.."bracketright", "WFrame.inc_index( _, _sub )", "_sub:non-nil" ),
	kpress( META.."bracketleft",  "WFrame.dec_index( _, _sub )", "_sub:non-nil" ),
	
	-- Switch to next/previous object within the frame
	kpress( META.."backslash",    "WFrame.switch_next( _ )" ),
	kpress( META.."Tab",          "WFrame.switch_next( _ )" ),
	kpress( META.."BackSpace",    "WFrame.switch_prev( _ )" ),
})



-- Bindings for floating frames.

defbindings( "WFrame.floating", 
{
	mdblclick( "Button1@tab",    "WFrame.set_shaded( _, 'toggle' )" ),  -- Toggle shade mode
	mpress(    "Button1@tab",    "WRegion.rqorder( _, 'front' )"    ),  -- Raise the frame
	mpress(    "Button1@border", "WRegion.rqorder( _, 'front' )"    ),  -- "
	mclick(    META.."Button1",  "WRegion.rqorder( _, 'front' )"    ),  -- "
	mclick(    META.."Button3",  "WRegion.rqorder( _, 'back' )"     ),  -- Lower the frame
	mdrag(     "Button1@tab",    "WFrame.p_move( _ )"               ),  -- Move the frame
})



-- WMoveresMode context bindings
-- 
-- These bindings are available keyboard move/resize mode. The mode
-- is activated on frames with the command begin_kbresize (bound to
-- META.."R" above by default).

defbindings( "WMoveresMode", 
{
	kpress( "AnyModifier+Escape","WMoveresMode.cancel(_)"),  -- Cancel resize mode
	kpress( "AnyModifier+Return","WMoveresMode.finish(_)"),  -- End resize mode

	-- Grow in specified direction
	kpress( "Left",        "WMoveresMode.resize(_, 1, 0, 0, 0)" ),
	kpress( "Right",       "WMoveresMode.resize(_, 0, 1, 0, 0)" ),
	kpress( "Up",          "WMoveresMode.resize(_, 0, 0, 1, 0)" ),
	kpress( "Down",        "WMoveresMode.resize(_, 0, 0, 0, 1)" ),
	kpress( "F",           "WMoveresMode.resize(_, 1, 0, 0, 0)" ),
	kpress( "B",           "WMoveresMode.resize(_, 0, 1, 0, 0)" ),
	kpress( "P",           "WMoveresMode.resize(_, 0, 0, 1, 0)" ),
	kpress( "N",           "WMoveresMode.resize(_, 0, 0, 0, 1)" ),

	-- Shrink in specified direction
	kpress( "Shift+Left",  "WMoveresMode.resize(_,-1, 0, 0, 0)" ),
	kpress( "Shift+Right", "WMoveresMode.resize(_, 0,-1, 0, 0)" ),
	kpress( "Shift+Up",    "WMoveresMode.resize(_, 0, 0,-1, 0)" ),
	kpress( "Shift+Down",  "WMoveresMode.resize(_, 0, 0, 0,-1)" ),
	kpress( "Shift+F",     "WMoveresMode.resize(_,-1, 0, 0, 0)" ),
	kpress( "Shift+B",     "WMoveresMode.resize(_, 0,-1, 0, 0)" ),
	kpress( "Shift+P",     "WMoveresMode.resize(_, 0, 0,-1, 0)" ),
	kpress( "Shift+N",     "WMoveresMode.resize(_, 0, 0, 0,-1)" ),

	-- Move in specified direction
	kpress( META.."Left",  "WMoveresMode.move(_,-1, 0)" ),
	kpress( META.."Right", "WMoveresMode.move(_, 1, 0)" ),
	kpress( META.."Up",    "WMoveresMode.move(_, 0,-1)" ),
	kpress( META.."Down",  "WMoveresMode.move(_, 0, 1)" ),
	kpress( META.."F",     "WMoveresMode.move(_,-1, 0)" ),
	kpress( META.."B",     "WMoveresMode.move(_, 1, 0)" ),
	kpress( META.."P",     "WMoveresMode.move(_, 0,-1)" ),
	kpress( META.."N",     "WMoveresMode.move(_, 0, 1)" ),
})


--
-- Menu definitions
--
dopath( "cfg_mainmenu" )


-- Context menu (frame/client window actions)
defctxmenu( "WFrame", "Frame", 
{
	menuentry( "Close",         "WRegion.rqclose_propagate(_, _sub)"                 ),
	menuentry( "Toggle tag",    "WRegion.set_tagged(_sub, 'toggle')", "_sub:non-nil" ),
	menuentry( "Attach tagged", "WFrame.attach_tagged(_)"                            ),
	menuentry( "Clear tags",    "ioncore.clear_tags()"                               ),
	menuentry( "Window info",   "mod_query.show_tree(_, _sub)"                       ),
	menuentry( "Kill",          "WClientWin.kill(_sub)", "_sub:WClientWin"           ),

	submenu("Main menu", "mainmenu"),
})


-- Context menu for screens
defctxmenu( "WScreen", "Screen", 
{
	menuentry("New workspace",       "ioncore.create_ws(_)"            ),
	menuentry("New empty workspace", "ioncore.create_ws(_, nil, true)" ),
	menuentry("Close workspace",     "WRegion.rqclose(_sub)"           ),
})

