%% ---------------------------------------------------------------------------------------------
%% LaTeX Base Class Reykjavík University Theses/Dissertations/Books,
%% ---------------------------------------------------------------------------------------------
%% Original Author: Bjórn Þór Jónsson (bjorn AT ru.is)
%% Modified by: Eyjólfur Ingi Ásgeirsson <eyjo AT ru.is>
%% Modified and Maintained by: Joseph Timothy Foley <foley AT ru.is>
%% Refactored/Simplified on 2020-02-03: Joseph Timothy Foley <foley AT ru.is>
%% Questions, comments, complaints: latex-help@LIST.RU.IS
%% Created on 2015-02-27
%% This code is distributed under the MIT license
%% Details at LICENSE.md

%% Reference for class/package writers
%% http://ctan.uib.no/macros/latex/doc/clsguide.pdf

%% --------------- Identification ----------------------------
\newcommand{\fileversion@rubook}{2.0}
\newcommand{\filedate@rubook}{2020/02/03}% must be YYYY/MM/DD!
\newcommand{\fileauthor@rubook}{Joseph Timothy Foley, foley at RU.IS}
\ProvidesClass{rubook}[\filedate@rubook by \fileauthor@rubook]
\NeedsTeXFormat{LaTeX2e}
\typeout{Book Class for Reykjavik University \fileversion@rubook <\filedate@rubook>, by \fileauthor@rubook}

%% ---------------- Critical packages -----------------------------
% Toolbox of many many macros that make a lot of latex code smarter and more robust
% Incl:  \newbool, \ifbool, etc.
% http://texdoc.net/texmf-dist/doc/latex/etoolbox/etoolbox.pdf
\RequirePackage{etoolbox}

%\RequirePackage{ifdraft}
% \RequirePackage{templatetools}
%% Template Tools have a variety of useful macros for template authors
%% https://ctan.math.illinois.edu/macros/latex/contrib/templatetools/templatetools.pdf
%% WARNING:  They seem to be incompatible with memoir
%% \SetTemplateDefinition{Group}{Property}{Code}
%% \UseDefinition{Group}{Property}



%% ---------------- Boolean switches -----------------------------
%% Booleans make it easy to enable and disable parts of the template
\newbool{debug}
\newbool{draftbool}
\newbool{online}
\newbool{proof}

%% ---------------- Declaration of Class Options--------------------
%% Remember that we have \AtEndOfClass{},\AtEndOfPackage{}
%%     \AtBeginDocument{}, \AtEndDocument{}
%% If you want execution conditional on file existence
%%     \IfFileExists{filename}{true}{false}
%%     \InputIfFileExists{filename}{true}{false}
%% For error reporting
%%     \ClassError{class-name}{error-text}{help-text}
%%     \PackageError{class-name}{error-text}{help-text}

% Generalized settings
 \DeclareOption{debug}{%
   \booltrue{debug}
   \typeout{rubook option: debug}%
   \typeout{DEBUG MODE ENABLED!  PREPARE FOR VERBOSITY!}}

 \DeclareOption{draft}{\booltrue{draftbool}}

\DeclareOption{online}{
  \setbool{online}{true}
   %\setbool{covernopagenum}{true}%if there is no left and right, don't put page numbers
  \setbool{coverallpagenum}{true}%or put them on all
   \typeout{rubook option: online}
 }
 
 \DeclareOption{forcegraphics}{%
   \PassOptionsToPackage{final}{graphicx}
   \PassOptionsToPackage{final}{pdfpages}
   \PassOptionsToPackage{final}{hyperref}
   %% add any other elements that should be included in draft
   \finalifforcegraphics{graphicx}%We have to catch graphicx early
   \setbool{forcegraphics}{true}\typeout{rubook option: forcegraphics}%
 }%


%% Memoir class sets up most of what we need
\PassOptionsToClass{12pt,a4paper}{memoir}%Set the default font and paper size

%% ---------------- Execution of Options -----------------------------
\ProcessOptions\relax% this stops searching for a * in \ProcessOptions*
\LoadClassWithOptions{memoir}%Parent class, options passed to it
%% Read page 20 of http://latex-project.org/guides/clsguide.pdf
%% carefully before modifying any of the execution and previous section.
%% ---------------- Package Loading -----------------------------



\ifbool{online}
{\ExecuteOptions{openany}}%% Online format does not have right-vs-left
{\ExecuteOptions{openright}}%% All of our printed formats are going to be opening to the right

%% Now to print the status of all the booleans if debug boolean is set
%% Any boolean testing must be after the \LoadClass otherwise the Option execution
%% has not completed.
\ifbool{debug}{%
  \ifbool{online}{\typeout{rubook bool: online}}{}
  \ifbool{forcegraphics}{\typeout{rubook bool: forcegraphics}}{}
  \ifbool{proof}{\typeout{rubook bool: proof}}{}
  \ifbool{debug}{\typeout{rubook bool: debug}}{}
}{}

%% ---------------- Internationalization -----------------------------
%% Unicode setup
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
% allows UTF encoding, needed for Icelandic and other accented characters

% \RequirePackage[autostyle,strict]{csquotes}
%% http://mirrors.concertpass.com/tex-archive/macros/latex/contrib/csquotes/csquotes.pdf
%% You invoke with \enquote{} and \blockquote{}
%% csquotes must be loaded before babel for AUCTeX
%% autostyle: update style as language changes in document
%% strict: any warnings become errors
%% Don't forget to load Babel!
    
%% Babel allows various automatic text to be in selected languages
%% But to use the options, you have to always load it, even for english
%% The languages must be specified in order.

%% ---------------- Graphics ------------------------------
\RequirePackage{graphicx}
%% GraphicsX converts and includes graphics intelligently

\graphicspath{{graphics/}{Graphics/}{./}}
%% This is a list of folders to search for graphics files to include
%% Each path should be in a {}.  
%% Make sure that the upper/lowercase of the letters matches the folder or
%% you may have weird problems with partners using OSX or Linux.
%% Note that you don't have to put the folder where the .tex file is, it is
%% included automatically, though it is bad practice to put your 
%% graphics there
%% LaTeX will search from left to right in the list, so you can put "cropped" versions
%% in the first directory and it will grab them first. e.g.
%\graphicspath{{graphics-cropped/}{graphics/}{Graphics/}{./}}
%% 
%% If you put a // at the end of the path, it will recursively search for graphics
%% files on unix-based (OSX, Linux, etc.) platforms.


%% ---------------- Fonts -----------------------------
%%%  For help, read http://latex-project.org/guides/fntguide.pdf
%%
%  save the current font size
\newlength{\normaltextsize}
\setlength{\normaltextsize}{\f@size pt}

\RequirePackage{lipsum}% generates some test text
%% usage: \lipsum[STARTNUM-ENDNUM]

%% Font guide at
%% http://latex-project.org/guides/fntguide.pdf

% set the font defaults (if they need to be further adjusted)
%\renewcommand{\encodingdefault}{t1}

%\renewcommand{\rmdefault}{ptm}  % adobe times
%\renewcommand{\sfdefault}{phv}  % adobe helvetica?
%\renewcommand{\ttdefault}{pcr}  % adobe courier
%% cmr  : computer modern roman
%% cmss : computer modern sans oblique
%% cmm  : computer modern math
%% ptm  : (postscript) Adobe Times
%% phv  : (postscript) Adobe Helvetica
%% pcr  : (postscript) Adobe Courier

%\renewcommand{\familydefault}{\sfdefault} % switch to \sfdefault if you want to force sanserif
%% \familydefault should be one of the short letter codes such as "lm" or "ptm"
%\renewcommand{\familydefault}{\rmdefault}

%\renewcommand{\seriesdefault}{m}
%% m  : medium
%% b  : bold
%% bx : bold extended
%% sb : semi bold
%% c  : condensed

%\renewcommand{\shapedefault}{n}
%% n  : upshape (normal)
%% it : italics
%% sl : slanted
%% sc : small caps

%%\fontsize{12pt}{14pt}  % args: fontsize, baselineskip (font+space)
%% normal sequence of increasing sizes:  5,7,8,9,10,12,14.4,17.28,20.74,24.88

%%  Specific fonts
%%  Note that you can leave off elements and it will use the last value set (or default??)
% \def\myfont{\fontencoding{T1}\fontfamily{lm}\fontseries{m}\fontshape{n}\fontsize{14pt}{16pt}\selectfont}
%  \fontsize{SIZE}{BASELINESKIP}

\def\frontcovertitlefont{\fontfamily{phv}\fontseries{b}\fontshape{n}\fontsize{20.74}{24}\selectfont}
\def\frontcovertitletext{\fontfamily{phv}\fontseries{m}\fontshape{n}\fontsize{14.4}{16}\selectfont}
\def\titletitlefont{\fontseries{b}\fontsize{17pt}{20pt}\selectfont}
\def\titletextfont{\fontsize{14pt}{16pt}\selectfont}
\def\titleinfofont{\fontsize{12}{14}\selectfont}
\def\sigtextfont{\fontsize{12pt}{14pt}\selectfont}
\def\warningfont{\fontseries{b}\fontsize{24pt}{28pt}\selectfont}

%%%%%%%%%%%%%%%%%% TextPos Settings %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% These macros allow you to arbitrarily position things on the page
%% This is needed for any cover pages/graphics

\RequirePackage{printlen}% display lengths in arbitrary units
\ifbool{debug}{\PassOptionsToPackage{showboxes}{textpos}}
\RequirePackage[absolute, verbose]{textpos}%

%% These commands set the units in \begin{textblock} when not 
%%  directly specified
%% We set them to the page sizes so we can align from them
\setlength{\TPHorizModule}{\paperwidth}
\setlength{\TPVertModule}{\paperheight}
%\setlength{\TPMargin}{2mm} %% margins inside the textblock*
\textblockorigin{0mm}{0mm} % start everything near the top-left corner

%%%%%%%%%%%%%%%%% Colors %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
%% Setting colors in text
%% Usage:
%% \textcolor{rured}{Some text.}
%% {\color{rured}Some text.}
\RequirePackage{xcolor}
\definecolor{rugray}{rgb}{0.2,0.2,0.2}
\definecolor{rured}{rgb}{0.84,0.10,0.13}

%% ---------------- Main Code -----------------------------
%%  Remember that we can declare commands (to make fragile things safe)
%%  The * form is for ``short'' commands, not longer than a paragraph
%%       \DeclareRobustCommand{cmd}[num][default]{definition}
%%       \DeclareRobustCommand*{cmd}[num][default]{definition}
%%  For checking if commands are redefined
%%       \CheckCommand{cmd}[num][default]{definition}

%% Spacing modes from the memoir class
%\SingleSpacing{} % single spacing
%\OnehalfSpacing{} % one and a half
%\DoubleSpacing{} % Double spacing, very ugly.

%% The official guidelines say to put the page in the middle bottom, but
%% that was clearly written for the MS Word users.  We follow proper book setup.

%% Comprehensive list of styles for memoir is in 7.2 (page 106)
%% If you need to adjust the style on the chapters, modify chapter
%% predefined styles:
%% empty: no header nor footer
%% plain: page num in bot center
%% simple:  pagenum and marks on top outer edges
%\makeoddhead{chapter}{}{}{} %to change only one side

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% DRAFT AND PROOF MARKS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\draftmark}{}
\newcommand{\draftbigmark}{}

\ifbool{proof}{\renewcommand{\draftmark}{{\color{blue}\textsc{Proof}}}%
  \renewcommand{\draftbigmark}{{\color{blue}\warningfont{}*** \draftmark{} *** \\PLEASE DO NOT DISTRIBUTE\\}}}{}
\ifbool{draftbool}{\renewcommand{\draftmark}{{\color{red}\textsc{Draft}}}%
  \renewcommand{\draftbigmark}{{\color{red}\warningfont{}*** \draftmark{} *** \\PLEASE DO NOT DISTRIBUTE\\}}}{}%

\ifboolexpr{bool {draftbool} or bool {proof}}{
  \makeoddfoot{cover}{}{\thepage}{\draftmark}
  \makeevenfoot{cover}{\draftmark}{\thepage}{}
  \makeoddfoot{plain}{}{\thepage}{\draftmark}
  \makeevenfoot{plain}{\draftmark}{\thepage}{}
  \makeoddfoot{simple}{}{}{\draftmark}
  \makeevenfoot{simple}{\draftmark}{}{}
  \makeoddfoot{empty}{}{}{\draftmark}
  \makeevenfoot{empty}{\draftmark}{}{}
}{}

\newcommand{\coverchapter}[1]{\clearforchapter\pagestyle{cover}\chapter{#1}\thispagestyle{cover}}

%%% Section numbering and the Table of Contents
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55
\maxsecnumdepth{subsubsection}  % default by \mainmatter in preamble
%\setsecnumdepth{subsubsection}  % can be changed later
\maxtocdepth{subsubsection}  % default by \mainmatter in preamble
%\settocdepth{subsubsection}  % can be changed later

%%% Code to include files if they exist
\newcommand{\InputIfExists}[1]{\IfFileExists{#1}{\input{#1}}{}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% TWEAKS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 
%% Some adjustments to float placement
\setcounter{topnumber}{5} \def\topfraction{1} \setcounter{bottomnumber}{4}
\def\bottomfraction{1} \setcounter{totalnumber}{10} \def\textfraction{0}
\def\floatpagefraction{.5}

%\def\@makefnmark{\rlap{\@textsuperscript{\@thefnmark}}}
%% Not sure why there was a footnote adjustment on the cover
%% Disabling for now.

%% Penalties for various text placement issues
\clubpenalty=10000%% orphan lines
\widowpenalty=10000%% widow lines
\hfuzz=1pt%% avoid overfilled hboxes
\vfuzz=5pt%% avoid overfilled vboxes
%\newcommand{\draftnote}[1]{\ifdraft{{\color{gray}#1}}}

\AtEndDocument{
\typeout{*******************************************************************}
\typeout{Make sure you print this at 100\% scaling on A4 paper.}
\typeout{This is not the default on many computers, so watch out!}
\typeout{Any adjustment to the size will mess up margins and text alignment.}
\typeout{*******************************************************************}
\typeout{}
}

%%% Local Variables:
%%% mode: latex
%%% TeX-master: "DEGREE-NAME-YEAR"
%%% End:
