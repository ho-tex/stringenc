#!/usr/bin/env texlua


module = "stringenc"

textfiles = {"README.md"}
unpackfiles = {'stringenc.dtx'}
installfiles = {'*.def','*.sty','*.dtx','*.pdf',}


packtdszip  = true

tdslocations={
"doc/latex/stringenc/stringenc.pdf",
"source/latex/stringenc/stringenc.dtx",
"tex/generic/stringenc/stringenc.sty",
"tex/generic/stringenc/se-ascii-print.def",
"tex/generic/stringenc/se-ascii.def",
"tex/generic/stringenc/se-clean7bit.def",
"tex/generic/stringenc/se-cp1250.def",
"tex/generic/stringenc/se-cp1251.def",
"tex/generic/stringenc/se-cp1252.def",
"tex/generic/stringenc/se-cp1257.def",
"tex/generic/stringenc/se-cp437.def",
"tex/generic/stringenc/se-cp850.def",
"tex/generic/stringenc/se-cp852.def",
"tex/generic/stringenc/se-cp855.def",
"tex/generic/stringenc/se-cp858.def",
"tex/generic/stringenc/se-cp865.def",
"tex/generic/stringenc/se-cp866.def",
"tex/generic/stringenc/se-dec-mcs.def",
"tex/generic/stringenc/se-iso-8859-1.def",
"tex/generic/stringenc/se-iso-8859-10.def",
"tex/generic/stringenc/se-iso-8859-11.def",
"tex/generic/stringenc/se-iso-8859-13.def",
"tex/generic/stringenc/se-iso-8859-14.def",
"tex/generic/stringenc/se-iso-8859-15.def",
"tex/generic/stringenc/se-iso-8859-16.def",
"tex/generic/stringenc/se-iso-8859-2.def",
"tex/generic/stringenc/se-iso-8859-3.def",
"tex/generic/stringenc/se-iso-8859-4.def",
"tex/generic/stringenc/se-iso-8859-5.def",
"tex/generic/stringenc/se-iso-8859-6.def",
"tex/generic/stringenc/se-iso-8859-7.def",
"tex/generic/stringenc/se-iso-8859-8.def",
"tex/generic/stringenc/se-iso-8859-9.def",
"tex/generic/stringenc/se-koi8-r.def",
"tex/generic/stringenc/se-mac-centeuro.def",
"tex/generic/stringenc/se-mac-cyrillic.def",
"tex/generic/stringenc/se-mac-roman.def",
"tex/generic/stringenc/se-nextstep.def",
"tex/generic/stringenc/se-pdfdoc.def",
"tex/generic/stringenc/se-utf16le.def",
"tex/generic/stringenc/se-utf32be.def",
"tex/generic/stringenc/se-utf32le.def",
"tex/generic/stringenc/se-utf8.def"
}
 
packtdszip  = true

maxprintline=10000
checkruns = 2



function update_tag(file,content,tagname,tagdate)

local tagpattern="(%d%d%d%d[-/]%d%d[-/]%d%d) v(%d+[.])(%d+)"
local oldv,newv
if tagname == 'auto' then
  local i,j,olddate,a,b
  i,j,olddate,a,b= string.find(content, tagpattern)
  if i == nil then
    print('OLD TAG NOT FOUND')
    return content
  else
    print ('FOUND: ' .. olddate .. ' v' .. a .. b )
    oldv = olddate .. ' v' .. a .. b
    newv = tagdate .. ' v'  .. a .. math.floor(b + 1)
    print('USING OLD TAG: ' .. oldv)
    print('USING NEW TAG: ' .. newv)
    local oldpattern = string.gsub(oldv,"[-/]", "[-/]")
    content=string.gsub(content,"{Version}{" .. oldpattern,'##OLDV##')
    content=string.gsub(content,oldpattern,newv)
    content=string.gsub(content,'##OLDV##',"{Version}{" .. oldv)
    content=string.gsub(content,'%-%d%d%d%d Oberdiek Package','-' .. os.date("%Y") .. " Oberdiek Package")
    content = string.gsub(content,
        '%% \\end{History}',
	'%%   \\begin{Version}{' .. newv .. '}\n%%   \\item Updated\n%%   \\end{Version}\n%% \\end{History}')
    return content
  end
else
  error("only automatic tagging supported")
end

end


