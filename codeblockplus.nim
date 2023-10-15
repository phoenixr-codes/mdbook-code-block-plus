# feel free to open a pull request to make this code more nim-ish because this
# is my first time using this language :)

import std/dom
import std/options
import std/strutils

let codes = document.querySelectorAll("pre > code")
for code in codes:
  var value_icon = none(string)
  var value_lang = none(string)
  var value_filepath = none(string)
  
  let pre = code.parentElement

  for class in splitWhitespace($code.className):
    var attr = split(class, '-', maxsplit = 1)

    # initially set the language to the one defined in the code block
    if attr[0] == "language":
      value_lang = some(attr[1].toUpperAscii())
    
    attr = split(class, '=', maxsplit = 1)
    
    case attr[0]
    of "icon":
      value_icon = some(attr[1])
    of "lang":
      if attr[1] == "none":
        # special identifier "none" resets the language
        value_lang = none(string)
      else:
        value_lang = some(attr[1])
    of "filepath":
      value_filepath = some(attr[1])
    else:
      discard

  if value_icon.isNone() and value_lang.isNone() and value_filepath.isNone():
    continue

  let header = document.createElement("div")
  header.classList.add("cbp-codeheader")
  discard pre.before(header)

  var langinfo = none(Element)
  if value_icon.isSome() or value_lang.isSome():
    langinfo = some(document.createElement("div"))
    langinfo.get().classList.add("cbp-langinfo")

  if value_icon.isSome():
    let icon = document.createElement("span")
    icon.classList.add("cbp-icon")
    icon.classList.add("fa")
    icon.classList.add("fa-" & value_icon.get())
    discard langinfo.get().append(icon)

  if value_lang.isSome():
    let lang = document.createElement("span")
    lang.classList.add("cbp-lang")
    lang.textContent = value_lang.get()
    discard langinfo.get().append(lang)

  if langinfo.isSome():
    discard header.append(langinfo.get())

  if value_filepath.isSome():
    let filepath = document.createElement("span")
    filepath.classList.add("cbp-filepath")
    filepath.textContent = value_filepath.get()
    discard header.append(filepath)
