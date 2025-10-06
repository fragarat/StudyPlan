# StudyPlan

LaTeX Study Plan Template using LU fonts

## Description

This repository contains a LaTeX template for creating personalized study plans, designed to use LU's official fonts. The template includes:

- **Visual Style**: Institutional LU fonts.
- **Format**: `.tex` file ready to compile.
- **Additional Files**: Classes and styles required for compilation.

## Repository Structure

```text
StudyPlan/
├── fonts/                # Font files
├── HOW TO COMPILE.txt    # Compilation instructions
├── StudyPlanTemplate.tex # Main LaTeX template
├── inst.cls              # Custom LaTeX class
├── logoLUeng.eps         # English logo
├── logoLUsv.eps          # Swedish logo
├── references.bib        # BibTeX bibliography
└── signature.png         # Signature image
```

## Compilation Instructions

1. **Requirements**: Make sure you have a LaTeX compiler installed that supports system fonts, such as [TeX Live](https://www.tug.org/texlive/) or [MiKTeX](https://miktex.org/).  
   You will also need **XeLaTeX** (or **LuaLaTeX**) to compile this template with LU fonts.
2. **Necessary Files**: Place all repository files in the same directory.
3. **Compile**: Run the following command in your terminal:

```bash
xelatex StudyPlanTemplate.tex
```

## Customization

- **Fonts**: The template uses LU's official fonts. To use other fonts, modify the `inst.cls` file.
- **Content**: Edit `StudyPlanTemplate.tex` to add or modify your study plan content.
- **Logos**: Replace `logoLUeng.eps` and `logoLUsv.eps` with the logos in your preferred language.

## Contributing

Contributions are welcome! To improve this template:

1. Fork the repository.
2. Create a new branch (`git checkout -b new-feature`).
3. Commit your changes (`git commit -am 'Add new feature'`).
4. Push to the branch (`git push origin new-feature`).
5. Open a Pull Request on GitHub.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

