%% SIGCHI Proceedings Document Class
%% Version 1.7
%% Copyright Philip Quinn (philip.quinn@canterbury.ac.nz), 8 September 2015.
%% All Rights Reserved.
%%
%% This work may be distributed and/or modified under the conditions of the
%% LaTeX Project Public License, either version 1.3 of this license or (at
%% your option) any later version. The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX version
%% 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `author-maintained'.
%%
%% The Current Maintainer of this work is Philip Quinn.
%%
%% This work consists of the file 'sigchi-modern.cls'.
%%
%% INTRODUCTION ==============================================================
%%
%% This document class formats articles in the SIGCHI conference proceedings
%% format. It improves upon previous versions by using modern LaTeX techniques
%% and packages to minimally modify the `article' class. It is easier to work
%% with, more compatible with other packages, and produces tidier output.
%%
%% Refer to the `sigchi-modern-sample.tex' and `sigchi-modern-sample.pdf' files
%% for more complete documentation, and examples using this class and the
%% SIGCHI style.
%%
%% Based on the layout of previous `sigchi.cls' formats by:
%%   Michel Beaudouin-Lafon, William Hudson, Jean-Dean Fekete, Manas Tungare,
%%   Jan O. Borchers, G.K.M Tobin, Olin Shivers, and Kevin B. Theobald.
%%
%% EXAMPLE ===================================================================
%%
%% \documentclass[preprint]{sigchi-modern}
%%
%% \confname{CHI'12}
%% \confyear{2012}
%% \confdate{May 5--10}
%% \conflocation{Austin, Texas, USA}
%% \procissn{978-1-4503-1015-4/12/05}
%% \doi{10.1000/182}
%% \copylicense{\authorlicense}
%%
%% \usepackage{natbib}
%% \bibliographystyle{acm-sigchi-modern}
%%
%% \begin{document}
%% \title{Example SIGCHI Conference Proceedings Paper}
%%
%% \author[1]{Person A}
%% \author[2]{Person B}
%% \affiliation[1]{University A\\
%%                 \mailto{a@a.example}}
%% \affiliation[2]{Company B\\
%%                 \mailto{b@b.example}}
%%
%% \banner{
%%   \centering
%%   \includegraphics{figures/banner}
%%   \caption{Optional banner figure (spans 2 columns).}
%%   \label{fig:banner}
%%  }
%%
%% \maketitle
%%
%% \begin{abstract}
%%   \ldots
%% \end{abstract}
%%
%% \keywords{Guides; examples; documentation.}
%% \classification{
%%   \category{H.5.m}{Information Interfaces and Presentation}{Miscellaneous}
%% }
%%
%% \section{Introduction}
%% \ldots
%%
%% \bibliography{bibfile}
%% \end{document}
%%

\def\fileversion{1.6}
\def\filedate{2015/09/08}
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{sigchi-modern}[\filedate\space\fileversion\space
    SIGCHI Proceedings Format (Modern)]

%% OPTIONS ===================================================================
\RequirePackage{xparse}
\RequirePackage{xifthen}
\newboolean{@preprint} \setboolean{@preprint}{false}
\newboolean{@submission} \setboolean{@submission}{false}
\newboolean{@final} \setboolean{@final}{false}

% One of these options should be set, and toggles certain output/formatting
% options. For example, the author list is rendered for `preprint' and `final`,
% but not `submission'.
\DeclareOption{preprint}{\setboolean{@preprint}{true}}
\DeclareOption{submission}{\setboolean{@submission}{true}}
\DeclareOption{final}{\setboolean{@final}{true}}

% Prohibit these options
\DeclareOption{onecolumn}{\OptionNotUsed}
\DeclareOption{a4paper}{\OptionNotUsed}
\DeclareOption{11pt}{\OptionNotUsed}
\DeclareOption{12pt}{\OptionNotUsed}
\DeclareOption{14pt}{\OptionNotUsed}

% Inherit from the `article' class
\ExecuteOptions{10pt,oneside,letterpaper,twocolumn}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions
\LoadClass{article}

%% BASIC PACKAGES ============================================================
\RequirePackage[usenames,dvipsnames,svgnames]{xcolor}
\RequirePackage{url}

% It's preferable to load `hyperref' last, as it conflicts with some packages.
% If something needs to be loaded after hyperref, or to use \hypersetup, use
% \AtBeginDocument again.
\AtBeginDocument{%
  \RequirePackage[pdftex,pdfstartview=FitH,colorlinks=true]{hyperref}%
  \hypersetup{%
    citecolor=ForestGreen,%
    urlcolor=BlueViolet,%
    linkcolor=Maroon,%
    filecolor=Mulberry%
  }%
}

% Only colour links in preprint mode so authors can see where they are.
\ifthenelse{\boolean{@submission} \OR \boolean{@final}}{%
  \AtBeginDocument{\hypersetup{%
    linkcolor=black, citecolor=black, filecolor=black, urlcolor=black%
  }}%
}{}

%% PAGE GEOMETRY =============================================================
\twocolumn
\flushbottom

% This is the frame described in the sample document:
%   \RequirePackage[letterpaper,twocolumn,%
%                   text={7in,9.25in},top=0.75in,columnsep=0.33in,%
%                   hcentering]{geometry}
% But the original SIGCHI LaTeX template produces this:
\RequirePackage[letterpaper,twocolumn,%
                text={7.1in,9.06in},top=0.87in,columnsep=0.33in,%
                hcentering]{geometry}
% (and is slightly off-centre.)

\setlength{\parindent}{0pt}       % Width of paragraph indentation
\setlength{\partopsep}{0pt}

\doublehyphendemerits=9999        % No consecutive hyphens
\brokenpenalty=9999               % No words broken across pages
\widowpenalty=9999                % No widows at the bottom of pages
\clubpenalty=99999                % No orphans at the top of pages
\interfootnotelinepenalty=9999    % Don't break footnotes

% Mark overfull lines in preprint mode with a solid box.
\ifthenelse{\boolean{@preprint}}{\setlength{\overfullrule}{5pt}}{}

%% FORMATTING ================================================================
%% Fonts
% Times for rm and math; Helvetica for sans
\RequirePackage{newtxtext}
\RequirePackage[cmintegrals]{newtxmath}
\RequirePackage[scaled]{helvet}
\RequirePackage[T1]{fontenc}
\renewcommand{\ttdefault}{cmtt}  % Computer Modern for tt

% Shrink the baseline a bit on \normalsize
\renewcommand{\normalsize}{%
  \@setfontsize\normalsize\@xpt{11.5\p@}%
  \abovedisplayskip 9pt plus 2pt minus 4.5pt%
  \belowdisplayskip \abovedisplayskip%
  \abovedisplayshortskip \z@ plus 3pt%
  \belowdisplayshortskip 5.4pt plus 3pt minus 3pt%
  \let\@listi\@listI%
}

%% Sections
\RequirePackage{titlesec}
\RequirePackage{textcase}

\titleformat*{\section}%
  {\baselineskip=14pt\sffamily\bfseries\small\MakeTextUppercase}
\titleformat*{\subsection}{\baselineskip=14pt\sffamily\small\bfseries}
\titleformat*{\subsubsection}{\baselineskip=14pt\sffamily\itshape\small}

% Add a period after \paragraph headings
\newcommand*{\@periodafter}[1]{#1.}
\titleformat{\paragraph}[runin]%
  {\baselineskip=14pt\sffamily\itshape\small}%
  {\theparagraph}{\z@}{}[\@periodafter]

% Avoid the \parskip after headings
\titlespacing{\section}{0pt}{\z@}{-\parskip}
\titlespacing{\subsection}{0pt}{\z@}{-\parskip}
\titlespacing{\subsubsection}{0pt}{\z@}{-\parskip}
\titlespacing{\paragraph}{0pt}{\z@}{0.5em}

\setlength{\parskip}{1ex plus 2pt minus 1pt}
\setlength{\parindent}{0pt}

\setcounter{secnumdepth}{0}

% Captions
\RequirePackage[font={small,bf,rm},labelsep=period]{caption}
  
% Floats
\renewcommand{\topfraction}{0.7}     % Max. fraction of a page for top floats
\renewcommand{\bottomfraction}{0.3}  %  "      "      "      "  bottom floats
\renewcommand{\dbltopfraction}{0.7}  %  "      "      " two-column floats
\renewcommand{\textfraction}{0.3}    % Min. fraction of a page for text

% Min. fraction of a float page for floats
\renewcommand{\floatpagefraction}{0.7}
% Min. fraction of a float page for two-column floats
\renewcommand{\dblfloatpagefraction}{0.7}

\setcounter{topnumber}{2}     % Max. floats at the top of a page
\setcounter{bottomnumber}{2}  % Max. floats at the bottom of a page
\setcounter{totalnumber}{4}   % Max. floats on a page (total)
\setcounter{dbltopnumber}{2}  % Max. number of two-column floats on a page

% Space between adjacent floats
\setlength{\floatsep}{10pt plus 2pt minus 1pt}
% Space between float and text
\setlength{\textfloatsep}{12pt plus 0pt minus 2pt}

% Only number pages in non-final versions
\ifthenelse{\boolean{@preprint} \OR \boolean{@submission}}
  {\pagestyle{plain}\pagenumbering{arabic}}
  {\pagestyle{empty}}

% Footnotes
\RequirePackage[hang,flushmargin]{footmisc}

% Bibliography
\AtBeginDocument{%
  \@ifpackageloaded{natbib}{%
    \setcitestyle{square,comma,numbers}%
    % Simpler numbering in bibliography 
    \renewcommand*{\@biblabel}[1]{\hfill#1.}%
    \setlength{\bibsep}{0pt}%
    \renewcommand*{\bibfont}{%
      % Ragged right with hyphenation
      \leftskip\z@ plus 2em%
      \@rightskip\z@ plus 2em%
      \rightskip\z@skip%
      \parfillskip\@flushglue%
      \parindent\z@%
    }%
  }{}%
}

% Reduce spacing between list items
\RequirePackage{enumitem}
\setlist{noitemsep,topsep=-\parskip,parsep=\z@,leftmargin=2em}

%% COMMANDS ==================================================================
\definecolor{preprint}{rgb}{0.5, 0.5, 0.5}

% Commands to insert text that should only be rendered in `preprint`,
% `submission`, or `final` mode.
\newcommand{\preprintonly}[1]%
  {\ifthenelse{\boolean{@preprint}}{\textcolor{preprint}{#1}}{}}
\newcommand{\submissiononly}[1]{\ifthenelse{\boolean{@submission}}{#1}{}}
\newcommand{\finalonly}[1]{\ifthenelse{\boolean{@final}}{#1}{}}
\newcommand{\hideforsubmission}[1]{\ifthenelse{\boolean{@submission}}{}{#1}}

% Special sections for author keywords/ACM classification
\newcommand*{\keywords}[1]{%
  \subsection*{Author Keywords}%
  #1\hypersetup{pdfkeywords={#1}}%
}

\newcommand*{\classification}{\subsection*{ACM Classification}}
% Takes three or four arguments, depending on the depth in the classification
\DeclareDocumentCommand\category{m m m o}{%
  #1 [\textbf{#2}] #3%
  \IfValueT{#4}{ -- \textit{#4}}%
}

% Deprecated
\newcommand*{\terms}[1]{%
  \subsection*{General Terms}%
  #1%
}

%% TITLE & AUTHORS ===========================================================

% Remove any `\\' from \title when assigning PDF metadata
\AtBeginDocument{\pdfstringdefDisableCommands{\let\\\empty}}

% A `banner' figure can be stored before \maketitle with this command. The 
% content will be rendered after the author block, in a figure spanning both
% columns.
\newboolean{@banner} \setboolean{@banner}{false}
\newcommand{\@banner}{}
\newcommand{\banner}[1]{\gdef\@banner{#1}\setboolean{@banner}{true}}

\renewcommand{\maketitle}{%
  \par\begingroup%
    {\twocolumn[%
      \@maketitle%
      \ifthenelse{\boolean{@banner}}{%
        \vskip -1ex%
        \begingroup%
          \def\@captype{figure}%
          \@banner%
        \endgroup\par%
        \vskip\baselineskip}{}%
      ]%
    \@copyrightspace}%
  \endgroup%
  \global\let\maketitle\relax}

\renewcommand{\@maketitle}{%
  \newpage\thispagestyle{empty}%
  \begin{center}%
    % Title
    {\sffamily\bfseries\huge\baselineskip 20pt \@title \par}%
     \hypersetup{pdftitle={\@title}}%
    \vspace{0.5ex}%
    % Author block
    \ifthenelse{\boolean{@preprint} \OR \boolean{@final}}%
      {\@author}%
      {\phantom{\@author}}%
  \end{center}%
  \vskip -1ex%
}
\newcommand*{\email}[1]{#1}
\newcommand*{\mailto}[1]{\href{mailto:#1}{\email{#1}}}

%% Authors
% Authors are set using one \author{} for each author, and one \affiliation{}
% for each affiliation. The blocks are formatted automatically.
\newcounter{@authors}         % Number of authors
\newcounter{@affiliations}    % Number of affiliations

% These commands store the generated TeX to be output for the author block and
% are appended to with each call to \author or \affiliation.
\newcommand{\@authorlist}{}   % Author names (formatted)
\newcommand{\@affillist}{}    % Affiliations (formatted)
\newcommand{\@authorpostscript}{}  % Extra stuff below the authors/affiliations

% A comma-separated list of author names
\newcommand{\@autoauthorlist}{}   % Set internally by \author
\newcommand{\@pdfauthorlist}{}    % User-override
\newcommand*{\authorlist}[1]{\renewcommand{\@pdfauthorlist}{#1}} 

% Text styling for names/affiliations
\newcommand*{\authorname}[1]{\large\textbf{#1}}
\newcommand{\authoraffil}[1]{\fontsize{11}{13}\normalfont{#1}}

% Spacing between names/affiliations
\newlength{\authorsep} \setlength{\authorsep}{2em}
\newlength{\affilsep}  \setlength{\affilsep}{\authorsep}

% Width of each author name/affiliation block to ensure proper centring
\newlength{\authorwidth} \setlength{\authorwidth}{8em}
\newlength{\affilwidth}  \setlength{\affilwidth}{15em}

% Add a new author \@authorlist.
% The first parameter is an optional number/symbol to distinguish authors of
% different/multiple affiliations.
\renewcommand*{\author}[2][]{%
  \addtocounter{@authors}{1}%
  \begingroup%
    \let\protect\@unexpandable@protect%
    \@temptokena=\expandafter{\@authorlist}% 
    \xdef\@authorlist{\the\@temptokena%  Append this author to existing list
      \ifnum\value{@authors}>1%  Second (or later) author...
       % Spacing between author names
       \hskip\authorsep%
      \else%  First author...
       % Add some padding to \authorwidth so it's not too tight
       \advance\authorwidth by 2em%
      \fi%
      \protect\parbox[t]{\authorwidth}{%
        \protect\centering%
        \protect\authorname{#2}\if\relax#1\else$^{#1}$\fi%
      }%
    }%
  \xdef\@autoauthorlist{\@autoauthorlist\ifnum\value{@authors}>1, \fi#2}%
  \endgroup%
}

% Add a new affiliation to \@affillist using the same pattern as \author
\newcommand{\affiliation}[2][]{%
  \addtocounter{@affiliations}{1}%
  \begingroup%
    \let\protect\@unexpandable@protect%
    \@temptokena=\expandafter{\@affillist}%
    \xdef\@affillist{\the\@temptokena%
      \ifnum\value{@affiliations}>1%
        \hskip\affilsep%
      \fi%
      \protect\parbox[t]{\affilwidth}{%
        \protect\centering%
        \if\relax#1\else\authoraffil{$^{#1}$}\fi\protect\authoraffil{#2}%
      }}%
  \endgroup%
}

% Content block after the affiliations (e.g., email addresses)
\newcommand{\authorpostscript}[1]{\renewcommand{\@authorpostscript}%
                                 {\protect\authoraffil{#1}}}

% Render author block
\renewcommand{\@author}{%
  \parbox[b]{\textwidth}{%
    \begin{center}%
      {\@authorlist}%  Authors
      \par\vspace{1ex}%
      {\@affillist}%  Affiliations
      \ifthenelse{\equal{\@authorpostscript}{}}{}%
       {\par\vspace{1ex}\@authorpostscript}%  Postscript
    \end{center}%
    % Set the PDF author info for preprint and final versions
    \ifthenelse{\boolean{@preprint} \OR \boolean{@final}}%
      {\ifthenelse{\equal{\@pdfauthorlist}{}}%
      {\ifnum\value{@affiliations}>0%
        \hypersetup{pdfauthor={\@autoauthorlist}}\fi}
      {\hypersetup{pdfauthor={\@pdfauthorlist}}}}%
  }%
}

%% COPYRIGHT SECTION =========================================================
% These should be set for the particular conference/proceedings that the
% article appears in.
\newtoks\confname     \global\confname={XXX'XX}
\newtoks\confyear     \global\confyear={20XX}
\newtoks\confdate     \global\confdate={January 1--2}
\newtoks\conflocation \global\conflocation={City, Country}
\newtoks\procissn     \global\procissn={XXX-X-XXXX-XXXX-X/XX/XX}
\newtoks\procyear     \global\procyear={\the\confyear}
\newtoks\procprice    \global\procprice={\$15.00}
\newtoks\doi          \global\doi={10.1000/182}

\newcommand{\copyconf}%
  {\textit{\the\confname}, \the\confdate, \the\confyear, \the\conflocation.}

\newcommand{\acmcopyright}{%
  Permission to make digital or hard copies of all or part of this work 
  for personal or classroom use is granted without fee provided that 
  copies are not made or distributed for profit or commercial advantage 
  and that copies bear this notice and the full citation on the first 
  page. Copyrights for components of this work owned by others than ACM 
  must be honored. Abstracting with credit is permitted. To copy otherwise, 
  or republish, to post on servers or to redistribute to lists, requires 
  prior specific permission and/or a fee. Request permission from
  \mailto{permissions@acm.org}.\\
  \copyconf\\
  Copyright \the\procyear\ ACM \the\procissn\ldots\the\procprice.\\
  \href{http://dx.doi.org/\the\doi}{http://dx.doi.org/\the\doi}}
\newcommand{\authorlicense}{%
  Permission to make digital or hard copies of all or part of this work 
  for personal or classroom use is granted without fee provided that 
  copies are not made or distributed for profit or commercial advantage 
  and that copies bear this notice and the full citation on the first 
  page. Copyrights for components of this work owned by others than the 
  author(s) must be honored. Abstracting with credit is permitted. To 
  copy otherwise, or republish, to post on servers or to redistribute to 
  lists, requires prior specific permission and/or a fee. Request 
  permissions from \mailto{permissions@acm.org}.\\
  \copyconf\\
  Copyright is held by the owner/author(s). Publication rights licensed 
  to ACM.\\
  ACM \the\procissn\ldots\the\procprice.\\
  \href{http://dx.doi.org/\the\doi}{http://dx.doi.org/\the\doi}}
\newcommand{\openlicense}{%
  Permission to make digital or hard copies of part or all of this work 
  for personal or classroom use is granted without fee provided that 
  copies are not made or distributed for profit or commercial advantage
  and that copies bear this notice and the full citation on the first 
  page. Copyrights for third-party components of this work must be 
  honored. For all other uses, contact the owner/author(s). Copyright 
  is held by the author/owner(s).\\
  \copyconf\\
  ACM \the\procissn.\\
  \href{http://dx.doi.org/\the\doi}{http://dx.doi.org/\the\doi}}

% Set by the author to one of the above three options
\newtoks\copylicense \global\copylicense={\authorlicense}

\newcommand{\copynotice}{\the\copylicense}
\newcommand{\@copybox}%
  {\parbox[b]{\linewidth}{\baselineskip 9pt\scriptsize\copynotice}}

\RequirePackage{picture}  % Required to use real units in `picture`
\DeclareCaptionType{copyrightbox}
\newtoks\@copyrightnotice
\newcommand{\@copyrightspace}{%
  \@float{copyrightbox}[b!]%
    \begin{center}%
      \setlength{\unitlength}{1pc}%
      \newlength{\@copyheight} \settoheight{\@copyheight}{\@copybox}%
      \begin{picture}(\linewidth, \@copyheight - 1pc)%
        \put(0,0){\scriptsize\@copyrightnotice}%
      \end{picture}%
    \end{center}%
  \end@float%
}

% Only output the notice for the final version
\renewcommand{\@copyrightnotice}{\ifthenelse{\boolean{@final}}{\@copybox}{}}
        
%% EOF =======================================================================
