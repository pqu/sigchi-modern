sigchi-modern
=============

A LaTeX document class for ACM SIGCHI conference proceedings.

This class is a re-write of the `sigchi.cls` style to be based on the `article`
class and to work better with modern LaTeX tools and packages.

Example
-------

Refer to `documentation/sample.tex` for a more complete example and
documentation.

```LaTeX
\documentclass[preprint]{sigchi-modern}

\confname{CHI'12}
\confyear{2012}
\confdate{May 5--10}
\conflocation{Austin, Texas, USA}
\procissn{978-1-4503-1015-4/12/05}
\doi{10.1000/182}
\copylicense{\authorlicense}

\usepackage[square,comma,numbers]{natbib}
\bibliographystyle{acm-sigchi-modern}

\begin{document}
\title{Example SIGCHI Conference Proceedings Paper}

\author[1]{Person A}
\author[2]{Person B}
\affiliation[1]{University A\\
                \mailto{a@a.example}}
\affiliation[2]{Company B\\
                \mailto{b@b.example}}

\banner{
  \centering
  \includegraphics{figures/banner}
  \caption{Optional banner figure (spans 2 columns).}
  \label{fig:banner}
}

\maketitle

\begin{abstract}
  \ldots
\end{abstract}

\keywords{Guides; examples; documentation.}
\classification{
  \category{H.5.m}{Information Interfaces and Presentation}{Miscellaneous}
}

\section{Introduction}
\ldots

\bibliography{bibfile}
\end{document}
```

