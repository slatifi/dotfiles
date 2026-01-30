# Tell latexmk specifically which extensions to clean with -c
$clean_ext = "aux bbl bcf blg idx ind ist lof lot out toc acn acr alg glg glo gls glsdefs fls log nav fdb_latex run.xml snm spl synctex.gz pyg vrb post out";

# Explicitly tell latexmk NOT to delete the PDF during a standard -c cleanup
# (Note: -C will still delete it, which is intended)
$cleanup_includes_generated = 0;
