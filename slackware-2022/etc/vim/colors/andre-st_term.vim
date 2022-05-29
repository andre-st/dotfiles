" Vim color file
" author: andre-st.github.com
"
" mit URXVT getestet, braucht mehr als 16 Farben-Terminal
"
" ./colortest.sh -w -s fuer Farbnummern
" guter Hintergrund fuer ObviousMode: Insert 35, Command 23


set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="andre-st_term"


hi Normal       term=NONE     cterm=NONE     ctermfg=231        ctermbg=DarkBlue
hi NonText      term=NONE     cterm=NONE     ctermfg=21         ctermbg=DarkBlue
hi Statement    term=NONE     cterm=NONE     ctermfg=227        ctermbg=DarkBlue
hi link Keyword Statement
hi Special      term=NONE     cterm=NONE     ctermfg=79         ctermbg=DarkBlue
hi Constant     term=NONE     cterm=NONE     ctermfg=46         ctermbg=DarkBlue
hi Comment      term=NONE     cterm=NONE     ctermfg=244        ctermbg=DarkBlue
hi Preproc      term=NONE     cterm=NONE     ctermfg=Cyan       ctermbg=DarkBlue
hi Type         term=NONE     cterm=NONE     ctermfg=Cyan       ctermbg=DarkBlue
hi Identifier   term=NONE     cterm=NONE     ctermfg=85         ctermbg=DarkBlue
hi StatusLine   term=bold     cterm=bold     ctermfg=81         ctermbg=27
hi StatusLineNC term=NONE     cterm=NONE     ctermfg=81         ctermbg=27
hi Visual       term=NONE     cterm=NONE     ctermfg=Black      ctermbg=DarkCyan
hi Search       term=NONE     cterm=NONE     ctermbg=85
hi VertSplit    term=NONE     cterm=NONE     ctermfg=17         ctermbg=17
hi Directory    term=NONE     cterm=NONE     ctermfg=Green      ctermbg=DarkBlue
hi WarningMsg   term=standout cterm=NONE     ctermfg=Red        ctermbg=DarkBlue
hi Error        term=NONE     cterm=NONE     ctermfg=White      ctermbg=Red
hi Cursor                                    ctermfg=Black      ctermbg=76
hi LineNr                                    ctermfg=22         ctermbg=DarkBlue



hi! link SpecialKey NonText
hi! link Character	Constant
hi! link Number	Constant
hi! link Float		Constant
hi! link Boolean	Constant

hi! link Identifier	Normal
hi! link Function  	Statement
hi! link Structure	Keyword
hi! link Operator	Normal
hi! link Preproc	Keyword
"hi! link Type		Keyword
hi! link Exception	Keyword

hi! link Ignore	Normal
hi! link Title		Normal


" Doxygen
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
hi! link doxygen			Comment

" tags
hi! link Attribute Normal


" PHP
hi! link phpDefine		     Keyword
hi! link phpStorageClass      Keyword
hi! link phpMemberSelector    Normal
hi! link phpFunctions         Normal
hi! link phpMethods           Normal
hi! link phpIdentifierSimply  phpIdentifier
hi! link phpIdentifierComplex phpIdentifier
hi! link phpType              Type
hi! link phpClassName         phpType
hi! link phpClasses           phpType


" Perl
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


" HTML
hi! link HtmlArg	Attribute
hi! link HtmlSpecialChar Statement
hi! link HtmlLink   Identifier

" XML
hi! link xmlTagName	Keyword
hi! link xmlEndTag	Keyword
hi! link xmlEntity	Statement
hi! link xmlCData	Comment
hi! link xmlAttrib	Attribute

" Javascript
hi! link JavaScriptBraces Normal	

" CSS
hi! link cssBraces Normal

" C++
hi! cppClassName	ctermfg=Cyan	ctermbg=DarkBlue

" Java
hi! link javaAnnotation    Special
hi! link javaAssert        Keyword
hi! link javaBoolean       Constant
hi! link javaBranch        Keyword
hi! link javaClassDecl     Keyword
hi! link javaConditional   Keyword
hi! link javaConstant      Constant
hi! link javaError         Keyword
hi! link javaExceptions    Keyword
hi! link javaExternal      Keyword
hi! link javaMethodDecl    Keyword
hi! link javaOperator      Keyword
hi! link javaRepeat        Keyword
hi! link javaScopeDecl     Keyword
hi! link javaStatement     Keyword
hi! link javaStorageClass  Keyword
hi! link javaType          Type
hi! link javaTypedef       Keyword
hi! link javaUserLabelRef  Normal
hi! link javaVarArg        Normal

hi! link javaClasses       Type
hi! link javaTodo          Special
hi! link javaClassName     Type     


