sigchi-modern
=============

A LaTeX document class for ACM SIGCHI conference proceedings.

This class is a rewrite of the `sigchi.cls` style. It is based on the `article`
class and works better with modern LaTeX tools and packages.

Example
-------

Refer to `documentation/sample.tex` for a more complete example and
documentation.

```LaTeX
\documentclass[preprint]{sigchi-modern}

\confname{CHI'20}
\confyear{2020}
\confdate{April 25--30}
\conflocation{Honolulu, HI, USA}
\procissn{978-1-4503-6708-0/20/04}
\doi{10.1000/182}
\copylicense{\authorlicense}

\usepackage{natbib}
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
\begin{CCS}
  \ccsdesc[500]{Human-centered computing~Human computer interaction (HCI)}
  \ccsdesc[300]{Human-centered computing~Haptic devices}
  \ccsdesc[100]{Human-centered computing~User studies}
\end{CCS}

\section{Introduction}
\ldots

\bibliography{bibfile}
\end{document}
```
