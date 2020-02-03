%% ---------------------------------------------------------------------------------------------
%% LaTeX Class Reykjavík University Theses/Dissertations/Books,
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
\newcommand{\fileversion@ruthesis}{$Revision: 361 $}
\newcommand{\filedate@ruthesis}{2020/02/03}% must be YYYY/MM/DD!
\newcommand{\fileauthor@ruthesis}{Joseph Timothy Foley, foley at RU.IS}
\ProvidesClass{ruthesis}[\filedate@ruthesis by \fileauthor@ruthesis]
\NeedsTeXFormat{LaTeX2e}
\typeout{Base Thesis Class for Reykjavik University \fileversion@ruthesis <\filedate@ruthesis>, by \fileauthor@ruthesis}

%% ---------------- Critical packages -----------------------------
% Toolbox of many many macros that make a lot of latex code smarter and more robust
% Incl:  \newbool, \ifbool, etc.
% http://texdoc.net/texmf-dist/doc/latex/etoolbox/etoolbox.pdf
\RequirePackage{etoolbox}

%% Command to remove things if we are draft mode
\RequirePackage{ifdraft}

%% ---------------- Boolean switches -----------------------------
%% Booleans make it easy to enable and disable parts of the template
\newbool{online}
\newbool{proof}
\newbool{debug}
\newbool{times}%Use the official Times or Times New Roman font (TVD MSc rules)

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
\DeclareOption{online}{
  \setbool{online}{true}
   %\setbool{covernopagenum}{true}%if there is no left and right, don't put page numbers
  \setbool{coverallpagenum}{true}%or put them on all
   \typeout{ruthesis option: online}
 }

 \DeclareOption{forcegraphics}{%
   \PassOptionsToPackage{final}{graphicx}
   \PassOptionsToPackage{final}{pdfpages}
   \PassOptionsToPackage{final}{hyperref}
   %% add any other elements that should be included in draft
   \finalifforcegraphics{graphicx}%We have to catch graphicx early
   \setbool{forcegraphics}{true}\typeout{ruthesis option: forcegraphics}%
 }%
 \DeclareOption{debug}{%
   \booltrue{debug}
   \typeout{ruthesis option: debug}%
   \typeout{DEBUG MODE ENABLED!  PREPARE FOR VERBOSITY!}}

% Hacks and options still being worked on.

%% Memoir class sets up most of what we need
\PassOptionsToClass{12pt,a4paper}{memoir}%Set the default font and paper size

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
%% now we pass the remaining unused options to our parent class
%% If you need to make warnings about options regarding packages
%% \PackageWarning{packagename}{Unknown option '\CurrentOption'}%


%% ---------------- Execution of Options -----------------------------
\ProcessOptions\relax% this stops searching for a * in \ProcessOtions*

%% Alternative way to subclass.  Disable the other option processing
%% if you enable it.  This will dump all options onto the parent class
%\ProcessOptions\LoadClassWithOptions{article}
%% Read page 20 of http://latex-project.org/guides/clsguide.pdf
%% carefully before modifying any of the execution and previous section.
%% ---------------- Package Loading -----------------------------
\LoadClass{memoir}% our parent class.

\ifbool{online}
{\ExecuteOptions{openany}}%% Online format does not have right-vs-left
{\ExecuteOptions{openright}}%% All of our printed formats are going to be opening to the right

%% Now to print the status of all the booleans if debug boolean is set
%% Any boolean testing must be after the \LoadClass otherwise the Option execution
%% has not completed.
\ifbool{debug}{%
  \ifbool{online}{\typeout{ruthesis bool: online}}{}
  \ifbool{forcegraphics}{\typeout{ruthesis bool: forcegraphics}}{}
  \ifbool{proof}{\typeout{ruthesis bool: proof}}{}
  \ifbool{debug}{\typeout{ruthesis bool: debug}}{}
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

%% Outside PhD cover we hardcode for consistency
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

%% We need the paralist and dashrule package in order to format the BSc cover
\RequirePackage{paralist}
\RequirePackage{dashrule}

%% Default is at RU
\newcommand{\Institution@ruthesis}{Reykjav\'{\i}k University}%
\newcommand{\InstitutionAddress@ruthesis}{Menntavegur 1\\101 Reykjavík, Iceland}
\newcommand{\InstitutionPhone}{+354 599 6200}
\newcommand{\InstitutionURL}{www.ru.is}%

%% Some may need a different front logo
\newcommand{\frontlogo@ruthesis}{ru-logo}
\newcommand{\setFrontLogo}[1]{\renewcommand{\frontlogo@ruthesis}{#1}}

\newcommand{\setTitle}[2]{%
  \setMainTitle{#1}
  \setTitleCover{#2}
  \setTitleInternal{#1}
}
\newcommand{\setMainTitle}[1]{\renewcommand{\title@ruthesis}{#1}}
\newcommand{\setTitleCover}[1]{\renewcommand{\titleCover@ruthesis}{#1}}
\newcommand{\setTitleInternal}[1]{\renewcommand{\titleInternal@ruthesis}{#1}}

\newcommand{\setAbstract}[1]{\renewcommand{\abstract@ruthesis}{#1}}


\def\author#1{\def\and{, }
  \gdef\author@ruthesis{#1}
  \gdef\authorSignature@ruthesis{#1}
  \gdef\authorHeader@ruthesis{#1}
}
\def\setAuthorSignature#1{\gdef\authorSignature@ruthesis{#1}}
\def\setAuthorHeader#1{\gdef\authorHeader@ruthesis{#1}}
\def\author@ruthesis{??\@warning{***No author name.***}}


\newlength{\savedparindent}
\newcommand{\disableindents}{\setlength{\parindent}{0pt}}
\newcommand{\enableindents}{\setlength{\parindent}{\savedparindent}}

%% Clean up some formatting for the text
\renewcommand{\thepage}{\roman{page}}

%% Footnote adjustments. These are mostly unnecessary
% \let\footnoterule\relax \null % Turn off the footnote rule line
%\renewcommand{\thefootnote}{\scriptsize\arabic{footnote}} %to fix large footnote text errors in some documents

\renewcommand{\bibname}{Bibliography} %Renaming the bibliography section (if omitted it will be named "references")

%% ---------------------------------------------------------------------------------------------
%%  Setup the formatting at the beginning of the document (Front material)
%% TODO: use the memoir \frontmatter \mainmatter \backmatter
%%  See documentation, page 73

\AtBeginDocument{
  \frontmatter
  \setlength{\savedparindent}{\parindent}  % save the current parindent
  \SingleSpacing%
}

%% Disable clearforchapter on formats that do not need blank pages
\ifbool{online}{\renewcommand{\clearforchapter}{\newpage}}{}
\ifdraft{\renewcommand{\clearforchapter}{\newpage}}
  % waste less blank pages in draft mode
  % see p123 http://ctan.uib.no/macros/latex/contrib/memoir/memman.pdf


\newenvironment{cover}% commonalities for the cover material
{\thispagestyle{cover}%
  \pagestyle{cover}%
  \clearforchapter% clear to chapter setting if note online
  \disableindents%
  \titletextfont\SingleSpacing}%
{\setlength{\TPMargin}{0mm} %% margins inside the textblock
  \enableindents{}\newpage}%

\newenvironment{coverleft}%This is material that is OK being on the
                          %backside
{\thispagestyle{cover}%
  \pagestyle{cover}%
  \ifbool{online}{}{\cleartoverso}%
  %\clearforchapter% clear to chapter setting  
  \disableindents%
  \titletextfont\SingleSpacing}%
{\setlength{\TPMargin}{0mm} %% margins inside the textblock
  \enableindents{}\newpage}%




\newcommand{\frontcover}{
  \printedcover{}
}

%%%%%%%%%%%%%%%% MARGINS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% WARNING: memoir class has its own margin macros
%%    Do not use the geometry package unless you know what you are doing

% \newlength{\pagecenterx}%
% \setlength{\pagecenterx}{\stockwidth/2}
% \newlength{\pagecentery}
% \setlength{\pagecentery}{\stockheight/2}
% \newlength{\covernowinmarginl}
% \setlength{\covernowinmarginl}{30mm}

% \setlength{\TPMargin}{0mm} %% margins inside the textblock*

% \newcommand{\defaultmargins}{
%   % \semiisopage
%   % The MS word template uses even 25.4mm margins, this is not as good if is bound
%   \setlrmarginsandblock{30mm}{25.4mm}{*}
%   % {left}{right}{ratio}, * for calculate
  
%   \setulmarginsandblock{25.4mm}{25.4mm}{*} 
%   % {upper}{lower}{ratio} * for calculate
%   \checkandfixthelayout% implement the margins
% }
% \defaultmargins{}  % this macro is in case something messes with the margins

%% Some debugging code to check length calculation.
\newcommand{\showlengths@ruthesis}{
  \uselengthunit{mm} % showlen package
  Lengths: (with round off error from floats)\\
  covermarginl:\printlength{\covermarginl}\\
  covermarginr:\printlength{\covermarginr}\\
  covermargint:\printlength{\covermargint}\\
  covermarginb:\printlength{\covermarginb}\\
  coverwindowheight:\printlength{\coverwindowheight}\\
  pagecenterx:\printlength{\pagecenterx}\\
  pagecentery:\printlength{\pagecentery}\\
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% DRAFT AND PROOF MARKS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\draftmark}{}
\newcommand{\draftbigmark}{}

\ifdraft{
  \renewcommand{\draftmark}{{\color{red}\textsc{Draft}}}{}
  \renewcommand{\draftbigmark}{{\color{red}\warningfont{}*** \draftmark{} *** \\PLEASE DO NOT DISTRIBUTE\\}}{}%
  }{}
  


%% ----- PRINTED FRONT COVER ----------------------------------------------------------
%% This cover will be on the outside (not with window)
\newcommand{\printedcover}{
  \begin{covernonum}
    \setlength{\TPMargin}{0mm} %% margins inside the textblock*
    \sffamily    
    \begin{textblock*}{\textwidth}[0.5,0.5](\pagecenterx,68mm)%
      {\centering\includegraphics[width=55mm]{\frontlogo@ruthesis}\\}%
    %
    \setSingleSpace{1.8}\SingleSpacing%
    \begin{textblock*}{\textwidth}[0,0](\covernowinmarginl,120mm)%
      \textcolor{rugray}{\frontcovertitlefont\titleCover@ruthesis}\par%
      %% Originally title was forced uppercase, but no-one seems to have
      %%   noticed, so I'm removing it.
    \end{textblock*}%
    %
    \setSingleSpace{1.5}\SingleSpacing%    
    \begin{textblock*}{\textwidth}[0,0](\covernowinmarginl,222mm)%
      \begin{minipage}{\textwidth}
        \textcolor{rugray}{ 
          \frontcovertitletext{}
          \textbf{\author@ruthesis}\\% 
          \degreelong@ruthesis\\% 
          \whensigned@ruthesis\\%
          \School@ruthesis\\%
          \Institution%        
        }\par
        \vspace*{5mm}
        \textcolor{rured}{
          \frontcovertitlefont{}
          \ifbool{projectreport}{}{\degreeabbrv@ruthesis{}} \documenttype@ruthesis
        }\par
        \vspace*{3mm}
        {\scriptsize\color{rugray}\Bookidnumber}%                 
      \end{minipage}
    \end{textblock*}        
  \setSingleSpace{1.0}
  \end{covernonum}
  \newpage\quad%% I am not sure why we must put this to ensure that the covers don't overlap
  \newpage  % without this, page numbers show up.  Weird.
}
  
\newcommand{\DegreeAndDepartment@ruthesis}{\textbf{\degreelong@ruthesis{} (\degreeabbrv@ruthesis)  in \program@ruthesis{} 
    \adddegree@ruthesis}}

\newcommand{\placelogo@ruthesis}[2]{%
  \begin{textblock*}{\textwidth}[0.5,0.5](\windowcenterx,#1)%
    {\centering\includegraphics[width=#2]{\frontlogo@ruthesis}\\}%
  \end{textblock*}
}

%% ----- INTERNAL TITLE PAGE WITH COMMITTEE ---------------------------------------------------
%% TODO: make counter for supervisors in the very rare case that there
%%    is only one supervisor
\newcommand{\supervisors@ruthesis}{\item No Advisor}
\newcommand{\supervisors}[1]{\renewcommand{\supervisors@ruthesis}[1]{#1}}
\newcommand{\supervisorheading@ruthesis}{Supervisor}
\newcommand{\setSupervisorHeading}[1]{\renewcommand{\supervisorheading@ruthesis}{#1}}

\newcommand{\examiners@ruthesis}{\item No Examiner}
\newcommand{\examiners}[1]{\renewcommand{\examiners@ruthesis}[1]{#1}}
\newcommand{\examinerheading@ruthesis}{%
  \ifbool{deptscs}{Examining Committee}{\MLExaminer}}
\newcommand{\setExaminerHeading}[1]{\renewcommand{\examinerheading@ruthesis}{#1}}

\newcommand{\personinfo}[5]{
  \item[]  #1, #2\\#3, #4, #5 %Stub to be customized later
}
% base definition, we redefine it when format changes

\newcommand{\internaltitlewithcommittee}{
  \begin{cover}
    \quad\vfill% we center vertically so it looks nice
    \SingleSpacing%
    \begin{centering}
      \includegraphics[width=4cm]{\frontlogo@ruthesis}\\
      \vspace{2\baselineskip}
      {\titletitlefont\titleInternal@ruthesis\\}%
      \vspace{\baselineskip}
      {\titletextfont% 
        by\\
        \vspace{\baselineskip}
        \author@ruthesis{}\\
        \vspace{2\baselineskip}        
        \documenttype@ruthesis{} %
        of \ects@ruthesis{} ECTS credits%
        submitted to the \School@ruthesis\ \\%
        at \Institution{} in partial fulfillment\\% 
        of the requirements for the degree of \\%
        \textbf{\degreelong@ruthesis}}\\
      
      \vspace{\baselineskip}
      \whensigned@ruthesis{}\\      
    \end{centering}
    {\titletextfont%
      \vspace{2\baselineskip}
      % change \personinfo to make the entries needed
      % Because this is inside a command, we escape the #1 as ##1      
      \renewcommand{\personinfo}[5]{\item[]  ##1, ##2\\##3, ##4, ##5}
      \setlength{\pltopsep}{0.5\baselineskip}  % first/top space
      \setlength{\plparsep}{0.5\baselineskip} % space between entries
      \setlength{\plitemsep}{0.5\baselineskip} % space between lines
      \MLThesisCommittee{}:
      \begin{compactitem}[\hspace{10mm}]
        \supervisors@ruthesis{}
        \examiners@ruthesis{}
      \end{compactitem}
      \vspace{\baselineskip}
      \examinerheading@ruthesis:
      \begin{compactitem}[\hspace{10mm}]
        \supervisors@ruthesis{}
        \examiners@ruthesis{}
      \end{compactitem}
    }%end \titletextfont
    \vfill
  \end{cover}
}
  
  

\newcommand{\frontrequiredpages}{
  \internaltitlewithcommittee{}%RUM: "Front page (standard format)"    
  \copyrightpage{}%%RUM: Not mentioned
  \signaturepage{}%%RUM: "Signature page (standard format)    
  \archivesigpage{}%%RUM: Not mentioned, optional, but should be required
  \abstractpage{}%%RUM: "Abstract (in English and Icelandic)
}



%% ----- COPYRIGHT PAGE -----------------------------------------------------------------------
\newcommand{\copyrightpage}{
  % actually in books, this is often on the left side
  \begin{coverleft}
    \begin{vplace}[1.0] % ratio of space above and below
      \centering
      \OnehalfSpacing%
      Copyright\\
      \author@ruthesis\\
      \whensigned@ruthesis\\
    \end{vplace}
  \end{coverleft}
}
%% ----- SIGNATURE PAGE, ONLY THESIS -----------------------------------------------------

\newlength{\signaturey}
\setlength{\signaturey}{8mm}
\newlength{\signaturex}
\setlength{\signaturex}{100mm}

\newcommand{\signaturepage}{
  \begin{cover}
    The undersigned hereby certify that they recommend to the
    \School@ruthesis at \Institution{} for acceptance this
    \documenttype@ruthesis{} entitled \textbf{\title@ruthesis}
    submitted by \textbf{\authorSignature@ruthesis{}} in partial fulfillment
    of the requirements for the degree of \DegreeAndDepartment@ruthesis%
    % \vspace*{25mm}
    \newcommand{\signline}[2]{\item \hdashrule{##2}{1pt}{1pt}\\##1}
    \renewcommand{\personinfo}[5]{\item\hdashrule{\signaturex}{1pt}{1pt}\\##1, ##2\\##3, ##4, ##5\\\vspace{\signaturey}\\}
    \setlength{\pltopsep}{2\baselineskip}  % first/top space
    \setlength{\plparsep}{2\baselineskip} % space between entries
    \setlength{\plitemsep}{0.5\baselineskip} % space between lines
    \begin{compactitem}[]
      \signline{\date}{50mm}
      \supervisors@ruthesis{}
      \examiners@ruthesis{}
    \end{compactitem}
    % \end{minipage} \\ \par% need \par for ending the paragraph
    % Space for the signatures
    {\sigtextfont% 
      % change \personinfo to make the entries needed
      % Because this is inside a command, we escape the #1 as ##1
      \renewcommand{\personinfo}[5]{&\hdashrule{\signaturex}{1pt}{1pt}\\&##1\\\vspace{\signaturey}\\}
      \begin{tabular}{lll}
        \MLStudent:\\
        \personinfo{\author@ruthesis}{}{}{}{}\\
        \ifbool{deptscs}{
        \examinerheading@ruthesis:\\
        \supervisors@ruthesis{}
        \examiners@ruthesis{}
        }{
        \supervisorheading@ruthesis:\\
        \supervisors@ruthesis{}\\
        \MLExaminer:\\
        \examiners@ruthesis{}
        }
      \end{tabular}
    }% end sigtextfont      
  \end{cover}
}


%% ----- ARCHIVAL SIGNATURE, ONLY THESIS ----------------------------------------------------
%% TODO:  Icelandic translation?
\newcommand{\archivesigpage}{
  \begin{cover}
    The undersigned hereby grants permission to
    the \Institution{} Library to reproduce single
    copies of this \documenttype@ruthesis{} entitled \textbf{\title@ruthesis{}}
    and to lend or sell such copies for private, scholarly or
    scientific research purposes only.
    
    The author reserves all other publication and
    other rights in association with the copyright in the
    \documenttype@ruthesis{}, and
    except as herein before provided, neither the
    \documenttype@ruthesis{} nor
    any substantial portion thereof may be printed or otherwise
    reproduced in any material form whatsoever without the
    author's prior written permission.
    
    \vspace*{25mm}
    \newcommand{\signline}[2]{\item \hdashrule{##2}{1pt}{1pt}\\##1}
    \setlength{\pltopsep}{2\baselineskip}  % first/top space
    \setlength{\plparsep}{2\baselineskip} % space between entries
    \setlength{\plitemsep}{0.5\baselineskip} % space between lines
    \begin{compactitem}[]
      \signline{\MLdate}{50mm}
      \signline{\author@ruthesis \\ \degreelong@ruthesis}{0.75\textwidth}
    \end{compactitem}        
  \end{cover}
}



%% ----- TITLE AND ABSTRACT ----------------------------------------------
%% Depending upon the selected language, one of the abstracts appears first
\newcommand{\abstractpage}{%
  \begin{cover}
    \abstractpagetext@ruthesis
  \end{cover}
}%

%% create an abstract template to minimize typing and increase
%% consistency
\newcommand{\abstractpagetext@ruthesis}[1]{
  %\quad\vspace*{20mm}%
  {\centering%
    {\titletitlefont\title@ruthesis\\}%%
    \vspace{\baselineskip}
    \author@ruthesis\\%
    \vspace{\baselineskip}
    \whensigned@ruthesis\\%
  }%
  \setlength{\parskip}{\baselineskip}%
  \par\vspace*{2\baselineskip}%
  \textbf{Abstract}\par\vspace{1ex}%
  \abstract@ruthesis\par%
  \newpage
}

%% ----- DEDICATIONS ---------- ---------------------------------------------------------------
\newenvironment{dedications}{\begin{cover}\begin{vplace}[0.33]% ratio of space above and below
      \begin{center}\em}
      {\end{center}\normalfont\end{vplace}\end{cover}}



%% ----- END OF FRONT MATERIALS ---------------------------------------------------------------
%\RequirePackage{stackengine}%% not sure why this is here
%% ---------------------------------------------------------------------------------------------
%% This command makes the back-cover materials
\newcommand{\backcover}{%
  \thispagestyle{empty}%
  \pagestyle{empty}%
  \cleartoevenpage{}% clear to chapter setting  
  \disableindents%
  \titletextfont\SingleSpacing%
  \vplace[0.8]{
    {\centering 
      \belowbaseline[-\normaltextsize]{
        \includegraphics[width=4cm]{\frontlogo@ruthesis} 
      }
      \quad
      \begin{minipage}[t]{10cm}%
        {\titletextfont\textcolor{rugray}{%
            \School\\            
            \Institution\\
            \InstitutionAddress\\
            \InstitutionPhone\\
            \InstitutionURL\\  %% NO \\, it is in the ID macro
            \Bookidnumber%
          }
        }            
      \end{minipage}\\% 
    }
  }
  \setlength{\TPMargin}{0mm}%% margins inside the textblock
  \enableindents{}%
}

%% ----- END OF BACK MATERIALS ---------------------------------------------------------------

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  HEADERS AND FOOTERS
%% with this we ensure that the chapter and section 
%% headings are in lowercase. 
%\renewcommand{\chaptermark}[1]{\markboth{\thechapter\ #1}{}} 
%\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}} 

\makepagestyle{cover}% The cover pages don't have numbers by default
\makeoddfoot{cover}{}{}{}
\makeevenfoot{cover}{}{}{}

\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{cover}}}%The TOC should use the cover format
\AtBeginDocument{\addtocontents{lof}{\protect\thispagestyle{cover}}}%The TOC should use the cover format
\AtBeginDocument{\addtocontents{lot}{\protect\thispagestyle{cover}}}%The TOC should use the cover format







%% from the old cs template, if so desired
\makepagestyle{oldstyle}
\makeoddhead{oldstyle}{\footnotesize{\authorHeader@ruthesis}}{}{\footnotesize{\thepage}}
\makeevenhead{oldstyle}{\footnotesize{\thepage}}{}{\footnotesize{\title@ruthesis}}

%% The official guidelines say to put the page in the middle bottom, but
%% that was clearly written for the MS Word users.  We follow proper book setup.

%% Comprehensive list of styles for memoir is in 7.2 (page 106)
%% If you need to adjust the style on the chapters, modify chapter
%% predefined styles:
%% empty: no header nor footer
%% plain: page num in bot center
%% simple:  pagenum and marks on top outer edges
%\makeoddhead{chapter}{}{}{} %to change only one side

%% If we are in draft or proof mode, make a mark saying so
\ifbool{proof}{
  \makeoddfoot{cover}{}{\thepage}{\draftmark}
  \makeevenfoot{cover}{\draftmark}{\thepage}{}
  \makeoddfoot{plain}{}{\thepage}{\draftmark}
  \makeevenfoot{plain}{\draftmark}{\thepage}{}
  \makeoddfoot{simple}{}{}{\draftmark}
  \makeevenfoot{simple}{\draftmark}{}{}
  \makeoddfoot{empty}{}{}{\draftmark}
  \makeevenfoot{empty}{\draftmark}{}{}
}{}
\ifdraft{
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
%% FORMAT OF THE NORMAL TEXT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\def\starttext{% this ends the front material and starts the document
  \mainmatter% which does a \cleartorecto
  \pagestyle{headings}%default
  \ifbool{centeredpagenum}{\pagestyle{plain}}{}
  \ifbool{oldstyle}{\pagestyle{oldstyle}}{}
  \ifdraft{\DoubleSpacing}{}%% if draft, need room to write comments
}

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
\newcommand{\draftnote}[1]{\ifdraft{{\color{gray}#1}}}

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
