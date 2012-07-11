" Highlight Class and Function names
syn match    cCustomParen1    "("
syn match    cCustomParen2    ")"
syn match    cCustomFunc     "\w\+\s*(" contains=cParen,cCppParen,cCustomParen1,cCustomParen2
syn match    cCustomFunc     "\w\+\s*(" contains=cParen,cCppParen,cCustomParen1,cCustomParen2
syn match    cCustomScope    "::"
syn match    cCustomClass    "\w\+\s*::" contains=cCustomScope

hi def link cCustomFunc  Function
hi def link cCustomClass Function
