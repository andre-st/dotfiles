"
"	file		andre-st_gui.vim
"	brief		Vim color file - light background, works in GUI
"	modified	2007-08-03
"	author		andre-st.github.com
"
"

set bg=light

hi clear

if exists("syntax_on")
    syntax reset
endif

let colors_name = "andre-st_gui"


""" USER INTERFACE COLORS """

hi Normal		guifg=#000000	guibg=#f0f0f0	gui=none

hi ErrorMsg		guifg=#ff0000	guibg=bg	gui=none
hi Visual		guifg=bg	guibg=#4444aa	gui=none
hi VisualNOS		guifg=bg	guibg=#4444aa	gui=none

hi Search		guifg=fg	guibg=#fff600	gui=none
hi IncSearch		guifg=fg	guibg=#fff600	gui=none

hi SpecialKey		guifg=#553300	guibg=bg	gui=none
hi Directory		guifg=#000088	guibg=bg	gui=none
hi WarningMsg		guifg=#ff0000	guibg=bg	gui=none
hi WildMenu		guifg=fg	guibg=#ffff00	gui=none
hi ModeMsg		guifg=fg	guibg=bg	gui=none

hi MoreMsg		guifg=#000088	guibg=bg	gui=none
hi Question		guifg=#000088	guibg=bg	gui=none
hi NonText		guifg=#444444	guibg=bg	gui=none

hi StatusLine		guifg=#ffffff	guibg=#6360a0	gui=none
hi StatusLineNC		guifg=#393676	guibg=#c9c6ff	gui=none
hi VertSplit		guifg=#393676	guibg=#c9c6ff	gui=none
"hi StatusLineNC	guifg=#dddddd	guibg=#333333	gui=none
"hi VertSplit		guifg=#dddddd	guibg=#333333	gui=none


"hi Folded		guifg=#5a5b50	guibg=bg		gui=none
"hi Folded		guifg=#404040 guibg=#e4e4e4		gui=none
"hi Folded		guifg=#a8a8a8	guibg=#fafafa	gui=none
hi Folded		guifg=#a8a8a8	guibg=bg	gui=none


hi FoldColumn		guifg=#005500	guibg=bg	gui=none
hi SignColumn		guifg=#005500	guibg=bg	gui=none
hi LineNr		guifg=#b0b0b0	guibg=bg	gui=none




" look also for UI-color related settings in ~/.gvimrc




""" DIFF """

"hi Cursor		guifg=bg	guibg=fg	gui=none
"hi lCursor		guifg=bg	guibg=fg	gui=none

hi DiffChange	guifg=fg		guibg=#f9ffa0	gui=none
hi DiffAdd		guifg=fg		guibg=#b1eff1	gui=none
"hi DiffDelete	guifg=#a1dfe1	guibg=#d4f0f1	gui=none
hi DiffDelete	guifg=#a1dfe1	guibg=#d2f0f1	gui=none


hi DiffText		guifg=fg		guibg=#ffe77e	gui=none






""" COLORS FOR SYNTAX HIGHLIGHTING """

" main groups
hi Comment       	guifg=#207000	guibg=bg	gui=none
hi Constant       	guifg=#0000FF	guibg=bg	gui=none
hi Statement      	guifg=fg	guibg=bg	gui=bold
hi StatementU		guifg=fg	guibg=bg	gui=underline
hi link Keyword		Statement
hi Underlined		guifg=fg	guibg=bg	gui=underline
"hi Error		guifg=#ffffff	guibg=#AA0000	gui=none
hi Error		guifg=#AA0000	guibg=#FFCCCC	gui=none
hi Todo			guifg=#000000	guibg=#FFFF80	gui=none

" tag syntax
hi Attribute		guifg=fg	guibg=bg	gui=italic

"hi! link String	Constant
hi! String		guifg=#0000AA	guibg=bg	gui=italic
hi! link Character	Constant
hi! link Number		Constant
hi! link Float		Constant
hi! link Boolean	Keyword

hi! link Identifier    	Normal
hi! link Function      	Statement
hi! link Structure	Keyword
hi! link Operator	Normal
hi! link Preproc	Keyword
hi! link Type		Keyword
hi! link Exception	Keyword

hi! link Special	Normal
"hi! Special	guifg=#AB2D32


hi! link Ignore		Normal



hi! link Title		Normal


" doxygen

hi! link doxygenBrief   		Comment
hi! link doxygenComment		Comment
hi! link doxygenComment2		Comment
hi! link doxygenCommentL		Comment
hi! link doxygenParam		Comment
hi! link doxygenParamName	Comment
hi! link doxygenSpecial		Comment
hi! link doxygenBOther		Comment
hi! link doxygenSpecialOnelineDesc Comment
hi! link doxygenSpecialMultilineDesc Comment
hi! link doxygen		Comment


" php
hi! phpDefine		   gui=bold
hi! phpMemberSelector  gui=none
hi! link phpFunctions  Normal
hi! link phpMethods    Normal
hi! link phpIdentifierSimply phpIdentifier
hi! link phpIdentifierComplex phpIdentifier

"hi! phpClassName	guifg=#005B5B	guibg=bg
"hi! phpClassName	guifg=#006b7b	guibg=bg
"hi! phpClassName	guifg=#005b6b	guibg=bg
hi! phpClassName	guifg=#006b7b	guibg=bg
hi! phpType         guifg=fg  guibg=bg


" perl
hi! link perlComment     Comment
hi! link perlPOD         Comment
hi! link podCommand      Comment
hi! link podCmdText      Comment
hi! link podOverIndent   Comment
hi! link podForKeywd     Comment
hi! link podSpecial      Comment
hi! link podFormat       Comment
hi! link podEscape       Comment
hi! link podEscape2      Comment
hi! link podVerbatimLine Comment
hi! link podBoldOpen     Comment
hi! link podItalicOpen   Comment
hi! link podNoSpaceOpen  Comment
hi! link podIndexOpen    Comment
hi! link podItalic       Comment
hi! link podBold         Comment
hi! link podNoSpace      Comment




" html
hi! link HtmlArg	Attribute
hi! link HtmlSpecialChar Statement

" xml
hi! link xmlTagName	Keyword
hi! link xmlEndTag	Keyword
hi! link xmlEntity	Statement
hi! link xmlCData	Comment
hi! link xmlAttrib	Attribute

" javascript
hi! link JavaScriptBraces Normal	

" css
hi! link cssBraces Normal

" FileTree
hi! File        guifg=#111111   guibg=bg   
hi! Directory   guifg=#111111   guibg=bg   gui=bold


" C++
hi! cppClassName	guifg=#006b7b	guibg=bg
"hi! cppClassName	guifg=#800b3b	guibg=bg	gui=none
"hi! cppClassName	guifg=#30007b	guibg=bg	gui=none
