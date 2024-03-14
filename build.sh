pandoc --from=markdown --to=typst -o typst/README.typ README.md
typst compile typst/main.typ ./main.pdf
