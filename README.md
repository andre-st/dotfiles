# Configuration files available to every system user

- GPL
- don't add sensitive info here, use `~/.XXX_local` files instead

## X Window System
- Xmodmap-customized US-keyboard layout with umlauts, accents, euro sign, math. symbols/notations, different quotation marks, short and long dash etc

## X Tiling Tabbed Window Manager: [Notion](https://github.com/raboof/notion)
- customized, less ugly theme (flat design)
- customized, easy-to-remember key bindings (shortcuts), which are mainly centered around 
  the left/right <kbd>⊞ Win</kbd> key ('Win' like window manager) and the area around the arrow keys:
	| Action | Shortcut |
	|--------|----------|
	| Switch screens | <kbd>⊞ Win</kbd>+<kbd>←</kbd><kbd>→</kbd>
	| Switch workspaces | <kbd>⊞ Win</kbd>+<kbd>↑</kbd><kbd>↓</kbd>  or  <kbd>⊞ Win</kbd>+<kbd>Scroll Wheel</kbd> or <kbd>Scroll Wheel</kbd> over the tabs row
	| Switch frames | <kbd>⊞ Win</kbd>+<kbd>Shift</kbd>+<kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd>  
	| Split frames (horz.) | <kbd>⊞ Win</kbd>+(<kbd>Shift</kbd>+)<kbd>S</kbd>
	| Switch tabs | <kbd>⊞ Win</kbd>+<kbd>Tab</kbd> or <kbd>⊞ Win</kbd>+<kbd>\\</kbd> (right-side Tab-key on [US-keyboards](https://i.imgur.com/aLCC3Me.png)) or <kbd>⊞ Win</kbd>+<kbd>1</kbd>..<kbd>9</kbd>
	| Close tab (program), frame, workspace | <kbd>⊞ Win</kbd>+<kbd>End</kbd> continously
	| Move tabs | <kbd>⊞ Win</kbd>+<kbd>Delete</kbd> to tag tabs and <kbd>⊞ Win</kbd>+<kbd>Insert</kbd> (here tagging works like 'tag and switch to next tab', so you can easily tag multiple tabs in a row)
	| Program menu | <kbd>⊞ Win</kbd>+<kbd>Enter</kbd>
	| Start terminal | <kbd>⊞ Win</kbd>+<kbd>Space</kbd>
	| Lock display (xlock) | <kbd>⊞ Win</kbd>+<kbd>Pause</kbd>
	| Screenshot | <kbd>⊞ Win</kbd>+<kbd>Print</kbd>
	| ... |
- [a Lua-script](https://github.com/andre-st/dotfiles/blob/master/.notion/default-session--0/cfg_sounds.lua) for notification sounds (X11 urgency hints) for whitelisted apps such as instant messengers like [Signal](https://github.com/signalapp/Signal-Desktop)
	- free beep sound files:
		[1](https://commons.wikimedia.org/wiki/File:Tone_440Hz.ogg), 
		[2](https://commons.wikimedia.org/wiki/File:Luftr%C3%BCssel.ogg), 
		[3](https://commons.wikimedia.org/wiki/File:CloudMagic_5.ogg), 
		[4](https://commons.wikimedia.org/wiki/File:ZASFX_ADSR_no_sustain.ogg), 
		[5](https://commons.wikimedia.org/wiki/File:ZASFX_ADSR_1s_release.ogg), 
		[6](https://commons.wikimedia.org/wiki/File:CommaPytha.ogg), 
		[7](https://commons.wikimedia.org/wiki/File:Sound_Effect_-_Door_Bell.ogg)

## Terminals
- my approach to long paths or command-line space is a multiline prompt, see [.exports](.exports)
  [![Console Screenshot](https://pbs.twimg.com/media/CczYfIfUsAAkzRC.jpg)](https://www.youtube.com/watch?v=_UG-0mt2UQo)
  ([YouTube](https://www.youtube.com/watch?v=_UG-0mt2UQo))

## Vim
- todo
