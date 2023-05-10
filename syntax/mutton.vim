if exists('b:current_syntax')
  finish
endif
let b:current_syntax = 'mutton'

let s:cpo_save = &cpoptions
set cpoptions&vim

syntax case match

syntax region muttonComment start="# " end="$" contains=@Spell

syntax match muttonHeader "^mutton\s\+\(template\|module\|resource\)\s\+v1$"

syntax keyword muttonArgumentText argument
syntax keyword muttonOutputText output

syntax keyword muttonConstantText constant
syntax keyword muttonImportText import
syntax keyword muttonInstanceText instance
syntax keyword muttonModuleText module

syntax keyword muttonScalarType Boolean String Integer

syntax keyword muttonBoolean true false

syntax region muttonString start=/"/ skip=/\\\\\|\\"/ end=/"/ contains=muttonEscape
syntax match muttonEscape display contained "\\."

syntax match muttonInteger "\<\%(0\|[1-9][0-9]*\)\>"

highlight default link muttonComment      Comment

highlight default link muttonHeader       Special

highlight default link muttonArgumentText Label
highlight default link muttonOutputText   Label

highlight default link muttonConstantText Statement
highlight default link muttonImportText   Include
highlight default link muttonInstanceText Statement
highlight default link muttonModuleText   Statement

highlight default link muttonScalarType   Type

highlight default link muttonBoolean      Boolean
highlight default link muttonString       String
highlight default link muttonEscape       SpecialChar
highlight default link muttonInteger      Number

let &cpoptions = s:cpo_save
unlet s:cpo_save
