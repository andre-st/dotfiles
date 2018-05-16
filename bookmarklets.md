# Web Browser [Bookmarklets](https://en.wikipedia.org/wiki/Bookmarklet)

Tested with Chromium (ECMAScript 6) and a Desktop-PC

## UnCSS
Improve readability of long texts by replacing all original styles with better line-heights, font sizes, paragraph margins, few colors etc.
```
javascript: (function() { function every(sel) { return Array.from(document.getElementsByTagName(sel)); } function hasPrevText(e) { while( e = e.previousSibling ) if (e.nodeType != Node.COMMENT_NODE) return true; return false; } function rmAtts(arr) { arr.forEach(e => { while (e.attributes.length > 0) e.removeAttribute(e.attributes[0].name); }); } const b = document.body; const hcss = 'line-height: 1.25em; font-size:'; rmAtts(every('font')); rmAtts(every('table')); rmAtts(every('td')); Array.from(document.styleSheets).forEach(s => s.disabled = true); every('*' ).forEach(e => e.style.cssText = 'line-height: inherit; font-size: inherit;'); every('h1').forEach(e => e.style.cssText = hcss + '1.7em;'); every('h2').forEach(e => e.style.cssText = hcss + '1.5em;'); every('h3').forEach(e => e.style.cssText = hcss + '1.2em;'); every('h4').forEach(e => e.style.cssText = hcss + '1.1em;'); every('br') .filter (e => hasPrevText(e)) .forEach(e => e.insertAdjacentHTML('afterend', '<br>')); rmAtts(every('body')); b.style.cssText = 'background-color: #efefef; margin: 2em auto 5em auto; max-width: 800px; font-size: 16pt; line-height: 1.5em;'; })();
```
