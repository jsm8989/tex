\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{aybufbe}  [2021/06/21 v1 LaTeX document class for AYBU FBE thesis]
\newcommand\@ptsize{}
\newif\if@restonecol
\newif\if@titlepage
\newif\if@openright

\renewcommand\@ptsize{2}

\if@compatibility\else
\DeclareOption{oneside}{\@twosidefalse \@mparswitchfalse}
\fi

\DeclareOption{twoside}{\@twosidetrue  \@mparswitchtrue}
\DeclareOption{draft}{\setlength\overfullrule{5pt}}

\if@compatibility\else
\DeclareOption{final}{\setlength\overfullrule{0pt}}
\fi

\DeclareOption{titlepage}{\@titlepagetrue}

\if@compatibility\else
\DeclareOption{notitlepage}{\@titlepagefalse}
\fi

\if@compatibility
\else
\DeclareOption{openright}{\@openrighttrue}
\DeclareOption{openany}{\@openrightfalse}
\fi

\if@compatibility\else
\DeclareOption{onecolumn}{\@twocolumnfalse}
\fi

\DeclareOption{twocolumn}{\@twocolumntrue}
\DeclareOption{openbib}{%
  \AtEndOfPackage{%
   \renewcommand\@openbib@code{%
      \advance\leftmargin\bibindent
      \itemindent -\bibindent
      \listparindent \itemindent
      \parsep \z@
      }%
   \renewcommand\newblock{\par}}%
}

\ExecuteOptions{12pt,oneside,onecolumn,final,openany}
\ProcessOptions
\input{size1\@ptsize.clo}

\setlength\parskip {\baselineskip}   %%%% paragraflar arasinda bir bos satir birakmak icin %%%
%\setlength\parindent {5mm}           %%%% paragrafin ilk satiri 0.5cm iceriden basliyacak %%%
\setlength\parindent {0mm}           %%%% paragrafin ilk satiri 0cm iceriden basliyacak %%%

\def\ps@headings{%
  \let\@oddfoot\@empty
  \def\@oddhead{{\slshape\rightmark}\hfil\thepage}%
  \let\@mkboth\markboth
  \def\chaptermark##1{%
    \markright {\MakeUppercase{%
      \ifnum \c@secnumdepth >\m@ne
          \@chapapp\ \thechapter. \ %
      \fi
      ##1}}}}

\def\ps@myheadings{%
  %  \let\@oddfoot\@empty\let\@evenfoot\@empty  eylem normal sayfa numaralarinin orta ve asagida olmasini sagliyor
    \def\@evenhead{} %{\thepage\hfil\slshape\leftmark}%
    \def\@oddhead{} %{{\slshape\rightmark}\hfil\thepage}%
    \let\@mkboth\@gobbletwo
    \let\chaptermark\@gobble
    \let\sectionmark\@gobble
    }
\if@titlepage
  \newcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\huge \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@authoruppercase
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}
\else
\newcommand\maketitle{\par
  \begingroup
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
    \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
    \long\def\@makefntext##1{ \parindent 1em\noindent
            \hb@xt@1.8em{%
                \hss\@textsuperscript{\normalfont\@thefnmark}}##1}%
    \if@twocolumn
      \ifnum \col@number=\@ne
        \@maketitle
      \else
        \twocolumn[\@maketitle]%
      \fi
    \else
      \newpage
      \global\@topnum\z@   % Prevents figures from going at top of page.
      \@maketitle
    \fi
    \thispagestyle{plain}\@thanks
  \endgroup
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

\def\@maketitle{%
  \newpage
  \null
  \vskip 2em%
  \begin{center}%
  \let \footnote \thanks
    {\huge \@title \par}%
    \vskip 1.5em%
    {\large
      \lineskip .5em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
    \vskip 1em%
    {\large \@date}%
  \end{center}%
  \par
  \vskip 1.5em}
\fi

\newcommand*\chaptermark[1]{}
%\setcounter{secnumdepth}{6}
\setcounter{secnumdepth}{7}
\newcounter {part}
\newcounter {chapter}
\newcounter {section}[chapter]
\newcounter {subsection}[section]
\newcounter {subsubsection}[subsection]
\newcounter {paragraph}[subsubsection]
\newcounter {subparagraph}[paragraph]
\renewcommand \thepart {\@Roman\c@part}
\renewcommand \thechapter {}
\renewcommand \thesection {\@arabic\c@chapter.\@arabic\c@section}
\renewcommand\thesubsection   {\thesection.\@arabic\c@subsection}
\renewcommand\thesubsubsection{\thesubsection.\@arabic\c@subsubsection}
\renewcommand\theparagraph    {\thesubsubsection.\@arabic\c@paragraph}
\renewcommand\thesubparagraph {\theparagraph.\@arabic\c@subparagraph}
\newcommand\@chapapp{\chaptername}
\newcommand\part{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \thispagestyle{plain}%
  \if@twocolumn
    \onecolumn
    \@tempswatrue
  \else
    \@tempswafalse
  \fi
  \null\vfil
  \secdef\@part\@spart}

\def\@part[#1]#2{%
    \ifnum \c@secnumdepth >-2\relax
      \refstepcounter{part}%
      \addcontentsline{toc}{part}{\thepart\hspace{1em}#1}%
    \else
      \addcontentsline{toc}{part}{#1}%
    \fi
    \markboth{}{}%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \ifnum \c@secnumdepth >-2\relax
       \huge\bfseries \partname\nobreakspace\thepart
       \par
       \vskip 20\p@
     \fi
     \Huge \bfseries #2\par}%
    \@endpart}

\def\@spart#1{%
    {\centering
     \interlinepenalty \@M
     \normalfont
     \Huge \bfseries #1\par}%
    \@endpart}

\def\@endpart{\vfil\newpage
              \if@twoside
               \if@openright
                \null
                \thispagestyle{empty}%
                \newpage
               \fi
              \fi
              \if@tempswa
                \twocolumn
              \fi}

%%\newcommand\chapter{\if@openright\cleardoublepage\else\clearpage\fi

\newcommand{\chapfnt}{\fontsize{24}{25}}
\newcommand{\chapsfnt}{\fontsize{16}{19}}
\newcommand{\secfnt}{\fontsize{14}{17}}
\newcommand{\ssecfnt}{\fontsize{12}{14}}

\newcommand\chapter{
                    \thispagestyle{plain}%
                    \global\@topnum\z@
                    \@afterindentfalse
                    \secdef\@chapter\@schapter}
\def\@chapter[#1]#2{\ifnum \c@secnumdepth >\m@ne
                         \refstepcounter{chapter}%
                         \typeout{\@chapapp\space\thechapter.}%
                         \addcontentsline{toc}{chapter}%
                                   {\protect#1 -- #2}%
                    \else
                      \addcontentsline{toc}{chapter}{#1 -- #2}%% cift tik tek tik olursa contentste de oyle gösteriyor
                    \fi
                    \chaptermark{#1}%
                    \addtocontents{lof}{\protect\addvspace{0\p@}}%
                    \addtocontents{lot}{\protect\addvspace{0\p@}}%
                    \if@twocolumn
                      \@topnewpage[\@makechapterhead[#1]{#2}]%% cift tik tek tik olursa contentste de oyle gösteriyor
                    \else
                      \@makechapterhead[#1]{#2}%
                      \@afterheading
                    \fi}


\def\@makechapterhead[#1]#2{%
    \begin{flushleft}
    \bfseries\Huge#1\\
    \vspace{4mm}
    \Large#2
    \end{flushleft}
}

%\def\@makechapterhead[#1]#2{%
%    \begin{center}
%    \bfseries#1\\
%    #2
%    \end{center}
%}

\def\@schapter#1{\if@twocolumn
                   \@topnewpage[\@makeschapterhead{#1}]%
                 \else
                   \@makeschapterhead{#1}%
                   \@afterheading
                 \fi}

\def\@makeschapterhead#1{%
  {\parindent \z@ \raggedright
    \normalfont
    \interlinepenalty\@M
    \Huge \bfseries  \small#1\par\nobreak
    \vskip 10\p@
  }}

\newcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\normalfont\bfseries\large \vspace{-8mm}}
}

\newcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\bfseries \vspace{-8mm}}}

\newcommand\subsubsection{\@startsection{subsubsection}{3}{5mm}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\normalfont\itshape \vspace{-8mm}}}

\newcommand\paragraph{\@startsection{paragraph}{4}{5mm}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\normalfont\itshape}}

\newcommand\subparagraph{\@startsection{subparagraph}{5}{5mm}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\normalfont\itshape}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% itemize, enumerate %%%%%%%%%%%%%%%%%%%%%%%%
\if@twocolumn
  \setlength\leftmargini  {2em}
\else
  \setlength\leftmargini  {2.2em}
\fi
\leftmargin  \leftmargini
\setlength\leftmarginii  {1.2em}
\setlength\leftmarginiii {1.2em}
\setlength\leftmarginiv  {1.2em}
\if@twocolumn
  \setlength\leftmarginv  {.5em}
  \setlength\leftmarginvi {.5em}
\else
  \setlength\leftmarginv  {1em}
  \setlength\leftmarginvi {1em}
\fi
\setlength  \labelsep  {.5em}
\setlength  \labelwidth{\leftmargini}
\addtolength\labelwidth{-\labelsep}
\@beginparpenalty -\@lowpenalty
\@endparpenalty   -\@lowpenalty
\@itempenalty     -\@lowpenalty







\renewcommand\theenumi{\@arabic\c@enumi}
\renewcommand\theenumii{\@alph\c@enumii}
\renewcommand\theenumiii{\@roman\c@enumiii}
\renewcommand\theenumiv{\@Alph\c@enumiv}
\newcommand\labelenumi{\theenumi.}
\newcommand\labelenumii{(\theenumii)}
\newcommand\labelenumiii{\theenumiii.}
\newcommand\labelenumiv{\theenumiv.}
\renewcommand\p@enumii{\theenumi}
\renewcommand\p@enumiii{\theenumi(\theenumii)}
\renewcommand\p@enumiv{\p@enumiii\theenumiii}
\newcommand\labelitemi{\textbullet}
\newcommand\labelitemii{\normalfont\bfseries \textendash}
\newcommand\labelitemiii{\textasteriskcentered}
\newcommand\labelitemiv{\textperiodcentered}
\newenvironment{description}
               {\list{}{\labelwidth\z@ \itemindent -\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\endlist}

\newcommand*\descriptionlabel[1]{\hspace\labelsep
                                \normalfont\bfseries #1}

\if@titlepage
  \newenvironment{abstract}{%
      \titlepage
      \null\vfil
      \@beginparpenalty\@lowpenalty
      \begin{center}%
        \bfseries \abstractname
        \@endparpenalty\@M
      \end{center}}%
     {\par\vfil\null\endtitlepage}
\else
  \newenvironment{abstract}{%
      \if@twocolumn
        \section*{\abstractname}%
      \else
        \small
        \begin{center}%
          {\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}%
        \end{center}%
        \quotation
      \fi}
      {\if@twocolumn\else\endquotation\fi}
\fi

\newenvironment{verse}
               {\let\\\@centercr
                \list{}{\itemsep      \z@
                        \itemindent   -1.5em%
                        \listparindent\itemindent
                        \rightmargin  \leftmargin
                        \advance\leftmargin 1.5em}%
                \item\relax}
               {\endlist}

\newenvironment{quotation}
               {\list{}{\listparindent 1.5em%
                        \itemindent    \listparindent
                        \rightmargin   \leftmargin
                        \parsep        \z@ \@plus\p@}%
                \item\relax}
               {\endlist}

\newenvironment{quote}
               {\list{}{\rightmargin\leftmargin}%
                \item\relax}
               {\endlist}

\if@compatibility
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\z@
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
    }
\else
\newenvironment{titlepage}
    {%
      \if@twocolumn
        \@restonecoltrue\onecolumn
      \else
        \@restonecolfalse\newpage
      \fi
      \thispagestyle{empty}%
      \setcounter{page}\@ne
    }%
    {\if@restonecol\twocolumn \else \newpage \fi
     \if@twoside\else
        \setcounter{page}\@ne
     \fi
    }
\fi



\newcommand\appendix{\par
  \setcounter{chapter}{0}%
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\thechapter{\@Alph\c@chapter}}
\setlength\arraycolsep{5\p@}
\setlength\tabcolsep{6\p@}
\setlength\arrayrulewidth{.4\p@}
\setlength\doublerulesep{2\p@}
\setlength\tabbingsep{\labelsep}
\skip\@mpfootins = \skip\footins
\setlength\fboxsep{3\p@}
\setlength\fboxrule{.4\p@}
\@addtoreset {equation}{chapter}
\renewcommand\theequation{\ifnum \c@chapter>\z@ \thechapter\fi\@arabic\c@chapter.\@arabic\c@equation}
%%denklem numaralandırma






%%%% figures and tables %%%%
\newcounter{figure}[chapter]
\renewcommand\thefigure{\ifnum \c@chapter>\z@ \thechapter\fi\@arabic\c@chapter.\@arabic\c@figure} %%%%% figure numbering%%%%%
\def\fps@figure{tbp}
\def\ftype@figure{1}
\def\ext@figure{lof}
\def\fnum@figure{\figurename\nobreakspace\thefigure}
\newenvironment{figure}
               {\@float{figure}}
               {\end@float}
\newenvironment{figure*}
               {\@dblfloat{figure}}
               {\end@dblfloat}


\newcounter{table}[chapter]
\renewcommand \thetable
     {\ifnum \c@chapter>\z@ \thechapter\fi \@arabic\c@chapter.\@arabic\c@table}  %%%%% table numbering%%%%%
\def\fps@table{tbp}
\def\ftype@table{2}
\def\ext@table{lot}
\def\fnum@table{\tablename\nobreakspace\thetable}
\newenvironment{table}
               {\@float{table}}
               {\end@float}
\newenvironment{table*}
               {\@dblfloat{table}}
               {\end@dblfloat}


\newlength\abovecaptionskip
\newlength\belowcaptionskip
\setlength\abovecaptionskip{3\p@}       %%%%% line spacing between figure and its caption below %%%%%
\setlength\belowcaptionskip{3\p@}       %%%%% line spacing between table and its caption above %%%%
\long\def\@makecaption#1#2{%
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1 #2}%
  \ifdim \wd\@tempboxa &gt;\hsize
    #1 #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}


\DeclareOldFontCommand{\rm}{\normalfont\rmfamily}{\mathrm}
\DeclareOldFontCommand{\sf}{\normalfont\sffamily}{\mathsf}
\DeclareOldFontCommand{\tt}{\normalfont\ttfamily}{\mathtt}
\DeclareOldFontCommand{\bf}{\normalfont\bfseries}{\mathbf}
\DeclareOldFontCommand{\it}{\normalfont\itshape}{\mathit}
\DeclareOldFontCommand{\sl}{\normalfont\slshape}{\@nomath\sl}
\DeclareOldFontCommand{\sc}{\normalfont\scshape}{\@nomath\sc}
\DeclareRobustCommand*\cal{\@fontswitch\relax\mathcal}
\DeclareRobustCommand*\mit{\@fontswitch\relax\mathnormal}
\newcommand\@pnumwidth{1.2em}
\newcommand\@tocrmarg{0em} % E, \newcommand\@tocrmarg{2.25em}
\newcommand\@dotsep{0.4}
\setcounter{tocdepth}{4}
\newlength{\tclineskip}
\setlength{\tclineskip}{\baselineskip}
\def\@addcontentsline#1#2#3{\if@filesw \begingroup
\let\label\@gobble \let\index\@gobble \let\glossary\@gobble
\def\protect##1{\string\string\string##1\string\space
   \space}\@temptokena{\thepage}%
\edef\@tempa{\immediate\write
\@auxout{\string\@writefile{#1}{\protect
     \contentsline{#2}{#3}{\the\@temptokena}}}}\@tempa
   \if@nobreak \ifvmode\nobreak\fi\fi\endgroup\fi}
  
%% TABLE OF CONTENTS %%
\newcommand\tableofcontents{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\contentsname
        \thispagestyle{plain}
        %\begin{flushright}
            %\pagename
        %\end{flushright}
        \@mkboth{%
           \MakeUppercase\contentsname}{\MakeUppercase\contentsname}}%
\setlength\parskip{0\p@ \@plus \p@}
%\setlength\parskip{-1mm}

    \@starttoc{toc}%
    \parskip 5mm
    \if@restonecol\twocolumn\fi
    }
    

    
\newcommand*\l@part{\@dottedtocline{0}{0em}{0em}}
%\newcommand*\l@chapter{\bfseries\@dottedtocline{0}{0em}{0em}}
\newcommand*\l@chapter[2]{%
    \addpenalty{-\@highpenalty}%
    \vskip -0.75em \@plus\p@ %%%% alper toc chapter boslugu
    \setlength\@tempdima{0em}%
    \begingroup
%     \parindent \z@ \rightskip \@pnumwidth %%%%%%%
%     \parfillskip -\@pnumwidth %%%%%%%
      \leavevmode \bfseries\@dottedtocline{0}{0em}{0em}{\normalsize#1}{\bfseries#2} %E
%      \advance\leftskip\@tempdima %%%%%%%
%      \hskip -\leftskip %%%%%%%
%%      \small#1\nobreak\hfil \nobreak\hb@xt@\@pnumwidth{\hss #2}\par %%%%%%%
%      \penalty\@highpenalty %%%%%%%
    \vskip 1.0em
    \endgroup
  }
\newcommand*\l@section{\@dottedtocline{1}{5mm}{1.8em}}
\newcommand*\l@subsection{\@dottedtocline{2}{10mm}{2.4em}}
\newcommand*\l@subsubsection{\@dottedtocline{3}{15mm}{3.2em}}
\newcommand*\l@paragraph{\@dottedtocline{4}{20mm}{4em}}
\newcommand*\l@subparagraph{\@dottedtocline{5}{25mm}{4.2em}}

\newcommand\listoffigures{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listfigurename}%
        \thispagestyle{plain}
        %\begin{flushright}
         %   {\bf\pagename}
        %\end{flushright}
      \@mkboth{\MakeUppercase\listfigurename}%
              {\MakeUppercase\listfigurename}%
              \setlength\parskip{0\p@ \@plus \p@} % extra satır aralığını ayarlamak için (E)
    \@starttoc{lof}
    \if@restonecol\twocolumn\fi
    \setlength\parskip {12pt}
    }
    
    

%\newcommand*\l@figure{\@dottedtocline{1}{-4.9em}{4.9em}}
\newcommand*\l@figure{\@dottedtocline{1}{0em}{4.9em}}

\newcommand\listoftables{%
    \if@twocolumn
      \@restonecoltrue\onecolumn
    \else
      \@restonecolfalse
    \fi
    \chapter*{\listtablename}%
        \thispagestyle{plain}
        %\begin{flushright}
         %   {\bf\pagename}
        %\end{flushright}
      \@mkboth{%
          \MakeUppercase\listtablename}%
         {\MakeUppercase\listtablename}%
         \setlength\parskip{0\p@ \@plus \p@} % extra satır aralığını ayarlamak için (E)
    \@starttoc{lot}%
    \if@restonecol\twocolumn\fi
    \setlength\parskip {12pt}
    }
%\newcommand*\l@table{\@dottedtocline{1}{0em}{4.9em}}
\let\l@table\l@figure


\newdimen\bibindent
\setlength\bibindent{1.5em}
\newenvironment{thebibliography}[1]
     {\chapter*{\bibname}%
      \@mkboth{\MakeUppercase\bibname}{\MakeUppercase\bibname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}
\newcommand\newblock{\hskip .11em\@plus.33em\@minus.07em}
\let\@openbib@code\@empty
\newenvironment{theindex}
               {\if@twocolumn
                  \@restonecolfalse
                \else
                  \@restonecoltrue
                \fi
                \twocolumn[\@makeschapterhead{\indexname}]%
                \@mkboth{\MakeUppercase\indexname}%
                        {\MakeUppercase\indexname}%
                \thispagestyle{plain}\parindent\z@
                \thispagestyle{plain}\z@
                \parskip\z@ \@plus .3\p@\relax
                \columnseprule \z@
                \columnsep 35\p@
                \let\item\@idxitem}
               {\if@restonecol\onecolumn\else\clearpage\fi}
\newcommand\@idxitem{\par\hangindent 40\p@}
\newcommand\subitem{\@idxitem \hspace*{20\p@}}
\newcommand\subsubitem{\@idxitem \hspace*{30\p@}}
\newcommand\indexspace{\par \vskip 10\p@ \@plus5\p@ \@minus3\p@\relax}
\renewcommand\footnoterule{%
  \kern-3\p@
  \hrule\@width.4\columnwidth
  \kern2.6\p@}
\@addtoreset{footnote}{chapter}
\newcommand\@makefntext[1]{%
%%    \parindent 1em%
%    \parindent 5mm
    \noindent    %%footnote verirken numaradan sonra enter yapiyordu%%
    \hb@xt@1.8em{\hss\@makefnmark}#1}
\def\today{\ifcase\month\or
  January\or February\or March\or April\or May\or June\or
  July\or August\or September\or October\or November\or December\fi
  \space\number\day, \number\year}
\setlength\columnsep{10\p@}
\setlength\columnseprule{0\p@}


\pagestyle{plain}

\pagenumbering{arabic}
\if@twoside
\else
  \raggedbottom
\fi
\if@twocolumn
  \twocolumn
  \sloppy
  \flushbottom
\else
  \onecolumn
\fi

\endinput
%%
%aet


%%%%% added by jamie
\urlcolor=cyan