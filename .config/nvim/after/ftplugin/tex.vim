command -buffer Build :wa|:!pdflatex %
command -buffer Run :!xdg-open %:t:r.pdf &
