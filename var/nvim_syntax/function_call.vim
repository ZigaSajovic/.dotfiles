syntax match _Paren "?=(" contains=cParen,cCppParen
syntax match _FuncCall "\<\h\w*\>\s*(\@=" contains=_Operator,_Paren
hi link _FuncCall Function
