# Tell latexmk specifically which extensions to clean with -c
$clean_ext = "aux nav synctex.gz vrb snm";

# Explicitly tell latexmk NOT to delete the PDF during a standard -c cleanup
# (Note: -C will still delete it, which is intended)
$cleanup_includes_generated = 0;
