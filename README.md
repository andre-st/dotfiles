# Configuration files available to every system user

- GPL
- don't add sensitive info here, use `~/.XXX_local` files instead

## X Window System
- Xmodmap-customized US-keyboard layout with umlauts, accents, euro sign, math. symbols/notations, different quotation marks, short and long dash etc

## X Tiling Tabbed Window Manager: [Notion](https://github.com/raboof/notion)
- customized, less ugly theme
- customized, easy-to-remember key bindings (shortcuts), which are mainly centered around 
  the left/right <kbd>⊞ Win</kbd> key ('Win' like window manager) and the area around the arrow keys to navigate...
	- screens: <kbd>⊞ Win</kbd>+<kbd>←</kbd><kbd>→</kbd>
	- workspaces: <kbd>⊞ Win</kbd>+<kbd>↑</kbd><kbd>↓</kbd>  
		or <kbd>⊞ Win</kbd>+<kbd>Scroll Wheel</kbd>  
		or <kbd>Scroll Wheel</kbd> over the tabs row
	- frames: <kbd>⊞ Win</kbd>+<kbd>Shift</kbd>+<kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd>  
	  with splits via <kbd>⊞ Win</kbd>+(<kbd>Shift</kbd>+)<kbd>S</kbd>
	- tabs: <kbd>⊞ Win</kbd>+<kbd>Tab</kbd>  
		or <kbd>⊞ Win</kbd>+<kbd>\\</kbd> (right tab-key on US-keyboards)  
		or <kbd>⊞ Win</kbd>+<kbd>1</kbd>..<kbd>9</kbd>
	- close tab (program), frame, workspace: <kbd>⊞ Win</kbd>+<kbd>End</kbd> continously
	- program menu: <kbd>⊞ Win</kbd>+<kbd>Enter</kbd>
	- start: terminal <kbd>⊞ Win</kbd>+<kbd>Space</kbd>, mc <kbd>⊞ Win</kbd>+<kbd>E</kbd>, ...
- [a Lua-script](https://github.com/andre-st/dotfiles/blob/master/.notion/default-session--0/cfg_sounds.lua) for notification sounds (X11 urgency hints) for whitelisted apps such as instant messengers like [Signal](https://github.com/signalapp/Signal-Desktop)

## Terminals
- my approach to long paths or command-line space is a multiline prompt, see [.exports](.exports)
  [![Console Screenshot](https://pbs.twimg.com/media/CczYfIfUsAAkzRC.jpg)](https://www.youtube.com/watch?v=_UG-0mt2UQo)
  ([YouTube](https://www.youtube.com/watch?v=_UG-0mt2UQo))

## Vim
- todo
