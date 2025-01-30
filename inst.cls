%%% inst.cls
%%%
%%% General class for small documents at
%%% Lund University
%%% Centre for Mathematical Sciences
%%% Mathematics, Faculty of Science
%%%
%%% Written by Kjell Elfström
%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{inst}[2013/12/27 Ver. 2.1 Inst Class]

\if@compatibility
  \ClassError{inst}{This class requires the document to start with %
                    \protect\documentclass}{Change \protect\documentstyle%
                    \space to \protect\documentclass\space in your
                    document}
\fi

\newdimen\t@mpa
\newcount\@lasttopage
\newcount\@oldlastpage
\@oldlastpage-1
\@lasttopage-1
\newif\if@cm
\newif\if@sw
%%%%%%%%%%%%%%%%%%%%%%%%% OPTIONS %%%%%%%%%%%%%%%%%%%%%%%%%

% Options to pass on (at least one of each group must be Executed)

\DeclareOption{10pt}{\def\@optptsize{10pt}}
\DeclareOption{11pt}{\def\@optptsize{11pt}}
\DeclareOption{12pt}{\def\@optptsize{12pt}}

\DeclareOption{oneside}{%
\def\@evennumberfoot{\hfil\thepage}%
\def\@turnover{}%
\def\@optside{oneside}%
}
\DeclareOption{twoside}{%
\def\@evennumberfoot{\thepage\hfil}%
\def\@turnover{\@condturnover}%
\def\@optside{twoside}%
}

% Options not to pass on

\DeclareOption{en}{%
\def\l@nguage{\selectlanguage{english}}%
\@swfalse%
}

\DeclareOption{sv}{%
\ExecuteOptions{sw}%
}

\DeclareOption{sw}{%
\def\l@nguage{\selectlanguage{swedish}}%
\@swtrue%
}

\DeclareOption{cmr}{%
\ExecuteOptions{cm}%
}
\DeclareOption{cm}{%
\@cmtrue%
\renewcommand{\rmdefault}{cmr}%
\renewcommand{\sfdefault}{cmss}%
\renewcommand{\ttdefault}{cmtt}%
\let\@instsecfont\relax%
}
\DeclareOption{aga}{%
\@cmfalse%
\renewcommand{\rmdefault}{pad}%
\renewcommand{\sfdefault}{pfr}%
\renewcommand{\ttdefault}{pcr}%
\def\@instsecfont{\usefont{T1}{pfr}{b}{n}}%
}
\DeclareOption{tms}{%
\@cmfalse%
\renewcommand{\rmdefault}{ptm}%
\renewcommand{\sfdefault}{phv}%
\renewcommand{\ttdefault}{pcr}%
\let\@instsecfont\relax%
}

\DeclareOption{lion}{%
\def\huvud{\huvudl}%
}

\DeclareOption{nolion}{%
\def\huvud{\huvudnl}%
}
  
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{lion,aga,sw,twoside,11pt}
\ProcessOptions
\PassOptionsToClass{\@optptsize}{article}
\PassOptionsToClass{\@optside}{article}
\let\@optptsize\relax
\let\@optside\relax
\LoadClass[a4paper]{article}
\RequirePackage[swedish,english]{babel}
%\RequirePackage[T1]{fontenc}
\if@cm\RequirePackage{ae}\fi

% Using LU fonts (Adobe Garamond Pro and Frutiger) if we compile with XeLaTeX
\usepackage{ifxetex}

\ifxetex
	\usepackage{fontspec}
	\setmainfont{AGaramondPro-Regular.otf}[
		Path = fonts/ ,
		BoldFont = AGaramondPro-Bold.otf ,
		ItalicFont = AGaramondPro-Italic.otf ,
		BoldItalicFont = AGaramondPro-BoldItalic.otf ]
	\setsansfont{FrutigerLTStd-Light.otf}[
		Path = fonts/ ,
		BoldFont = FrutigerLTStd-Roman.otf ,
		ItalicFont = FrutigerLTStd-LightItalic.otf ,
		BoldItalicFont = FrutigerLTStd-Italic.otf ]
\else
	\usepackage[latin1]{inputenc}
	\usepackage[T1]{fontenc}
	\usepackage{lmodern}
\fi

%%%%%%%%%%%%%%%%%%%% LANGUAGES %%%%%%%%%%%%%%%%%%%%%%%%%%%%

\let\@instselectlanguage\selectlanguage

\renewcommand{\selectlanguage}[1]{%
\@instselectlanguage{#1}%
\iflanguage{swedish}{%
\def\@logo{logoLUsv}%
\def\university{Lunds universitet}%
\def\centrum{Matematikcentrum}%
\def\division{Matematik NF}%
\def\turnover{Var god v{\"a}nd!}}{%
\def\@logo{logoLUeng}%
\def\university{Lund University}%
\def\centrum{Centre for Mathematical Sciences}%
\def\division{Mathematics, Faculty of Science}%
\def\turnover{Please, turn over!}}%
\mark{\turnover}
}

%%%%%%%%%%%%%%%%%%%% HANDLING FONTS %%%%%%%%%%%%%%%%%%%%%%%

\usepackage{ifxetex}

\ifxetex
	\usepackage{fontspec}
	\setmainfont{AGaramondPro-Regular.otf}[
	Path = fonts/ ,
	BoldFont = AGaramondPro-Bold.otf ,
	ItalicFont = AGaramondPro-Italic.otf ,
	BoldItalicFont = AGaramondPro-BoldItalic.otf ]
	\setsansfont{FrutigerLTStd-Light.otf}[
	Path = fonts/ ,
	BoldFont = FrutigerLTStd-Roman.otf ,
	ItalicFont = FrutigerLTStd-LightItalic.otf ,
	BoldItalicFont = FrutigerLTStd-Italic.otf ]
\else
	\usepackage[latin1]{inputenc}
	\usepackage[T1]{fontenc}
	\usepackage{lmodern}
\fi

\newdimen\m@infontsize

\m@infontsize 1\@ptsize.0pt
\def\he@dfontsize{0.818\m@infontsize}
\def\he@dskipsize{1.37\m@infontsize}

\def\he@dsize@l{13.21\m@infontsize}
\def\lion@size{8.68\m@infontsize}

\newcommand{\@setheadfont}{\fontsize{\he@dfontsize}{\he@dskipsize
}\usefont{T1}{pfr}{l}{z}}
\newcommand{\@setheadifont}{\fontsize{\he@dfontsize}{\he@dskipsize
}\usefont{T1}{pfr}{l}{iz}}
\newcommand{\@setheadbfont}{\usefont{T1}{pfr}{b}{z}}
\newcommand{\@setheadlinefont}{\usefont{T1}{pfr}{m}{n}\Large\bfseries}
\newcommand{\@setsignfont}{\fontsize{\he@dfontsize}{\he@dskipsize}\usefont{T1}{pfr}{l}{n}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MARGINS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newdimen\m@rgin
\newdimen\headlm@rgin
\newdimen\headtm@rgin
\m@rgin 3cm
\headlm@rgin 2cm
\headtm@rgin 10mm
\topmargin 0pt
\headheight 0pt
\headsep 0pt
\textheight 297 true mm
\advance\textheight by -2 true in
\footskip40pt
\advance\textheight by -30pt
\textwidth 210 true mm
\advance\textwidth by -2\m@rgin
\evensidemargin-1in
\advance\evensidemargin by \m@rgin
\oddsidemargin\evensidemargin

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% HEAD %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{tikz}
\RequirePackage{graphicx}

\newcommand{\huvudl}[2]{%
{%
\parindent0pt\topskip0pt\nointerlineskip%
\par\t@mpa-1in\advance\t@mpa by\headtm@rgin%
\vspace*{\t@mpa}%
\t@mpa\m@rgin%
\advance\t@mpa by -\headlm@rgin%
\hspace*{-\t@mpa}%
\hbox{\vbox  to\he@dsize@l{\hbox{\includegraphics[height=\lion@size]{\@logo}}\vfil%
\hbox{\@setheadfont\centrum}%
\settoheight{\t@mpa}{\@setheadifont\division}%
\advance\t@mpa-\he@dskipsize%
\vskip-\t@mpa\nointerlineskip%
\hbox{\@setheadifont\division}%
}}\hfill\hbox{\vbox to\he@dsize@l{\hbox{}\hbox{}\hbox{\@setheadbfont#1}\vfil}}%
}\vskip3\bigskipamount\nointerlineskip\par%
\ifx\@empty#2\@empty\relax\else{\noindent\@setheadlinefont#2}\vskip2.3ex \@plus.2ex\par\fi%
}%

\newcommand{\huvudnl}[2]{%
{%
\parindent0pt\topskip0pt\nointerlineskip%
\par\t@mpa-1in\advance\t@mpa by\headtm@rgin%
\vspace*{\t@mpa}%
\t@mpa\m@rgin%
\advance\t@mpa by -\headlm@rgin%
\hspace*{-\t@mpa}%
\hbox{\vtop{%
\hbox{\@setheadfont\university}%
\settoheight{\t@mpa}{\@setheadfont\centrum}%
\advance\t@mpa-\he@dskipsize%
\vskip-\t@mpa\nointerlineskip%
\hbox{\@setheadfont\centrum}%
\settoheight{\t@mpa}{\@setheadifont\division}%
\advance\t@mpa-\he@dskipsize%
\vskip-\t@mpa\nointerlineskip%
\hbox{\@setheadifont\division}%
}}\hfill\hbox{\vtop{\hbox{}\hbox{\@setheadbfont#1}}}%
}\vskip3\bigskipamount\nointerlineskip\par%
\ifx\@empty#2\@empty\relax\else{\noindent\@setheadlinefont#2}\vskip2.3ex \@plus.2ex\par\fi%
}%

\def\he@d{\huvud{}{}}

\newcommand{\head}[2]{%
\def\he@d{\huvud{#1}{#2}}%
}

%%%%%%%%%%%%%%%%%% section commands %%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\@instsecfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\@instsecfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\@instsecfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {3.25ex \@plus1ex \@minus.2ex}%
                                    {-1em}%
                                    {\@instsecfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\@instsecfont\normalsize\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%% page styles %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\def\@printsignature{{\t@mpa\m@rgin%
\advance\t@mpa by -\headlm@rgin%
\mbox{}\hspace{-\t@mpa}%
\@setsignfont\s@gn}}

\renewcommand{\ps@empty}{%

\let\@oddhead\@empty
\let\@evenhead\@empty
\def\@oddfoot{\normalfont\ifnum\c@page=1\@printsignature\fi\hfil}
\let\@evenfoot\@empty}

\renewcommand{\ps@plain}{%
\let\@oddhead\@empty
\let\@evenhead\@empty
\def\@oddfoot{\normalfont\ifnum\c@page=1\@printsignature\fi\it\hfil\@turnover}%
\let\@evenfoot\@empty}

\newcommand{\ps@numbers}{%
\let\@oddhead\@empty
\let\@evenhead\@empty
\def\@oddfoot{\normalfont\ifnum\c@page=1\@printsignature\fi\hfil\thepage}
\def\@evenfoot{\@evennumberfoot}}

\newcommand{\setsignature}[1]{\def\s@gn{#1}}
\def\s@gn{\@empty}
\pagestyle{plain}

%%%%%%%%%%%%%%%%% BEGIN AND END %%%%%%%%%%%%%%%%%%%%%

\AtBeginDocument{\l@nguage\he@d}

\AtEndDocument{\mark{}\clearpage\advance\c@page by-1
\ifnum\@lasttopage=\c@page\@turnovererror\else\ifnum\@oldlastpage=-1\else\ifnum\@oldlastpage=\c@page\else\@turnovererror\fi\fi\fi{\immediate\write\@mainaux{\string\global\string\@oldlastpage=\the\c@page}}\advance\c@page
by1}

\def\@turnovererror{\ClassWarningNoLine{inst}{''Turn
over'' possibly misplaced. Rerun to fix it}}

\def\@condturnover{%
\ifnum\c@page=\@oldlastpage\else%
\settowidth{\t@mpa}{\botmark}\ifdim\t@mpa=0.0pt\else%
\global\@lasttopage\c@page\botmark\fi\fi%
}
