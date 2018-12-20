command -buffer Build :wa|:!groff -m latin9 -m ms -R -T pdf % > %:t:r.pdf
command -buffer Run :!xdg-open %:t:r.pdf &
set fileencoding=latin-9
