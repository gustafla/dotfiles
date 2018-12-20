command -buffer Build :wa|:!groff -m ms -keRt -T pdf % > %:t:r.pdf
command -buffer Run :!xdg-open %:t:r.pdf &
