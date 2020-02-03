%% ---------------------------------------------------------------------------------------------
%% LaTeX Base Class Reykjavík University Theses/Dissertations/Books,
%% ---------------------------------------------------------------------------------------------
%% Original Author: Bjórn Þór Jónsson (bjorn AT ru.is)
%% Refactored/Simplified on 2020-02-03: Joseph Timothy Foley <foley AT ru.is>
%% Questions, comments, complaints: latex-help@LIST.RU.IS
%% Created on 2020-02-03
%% This code is distributed under the MIT license
%% Details at LICENSE.md

%%% WARNING:  This does not work without ruthesis.cls!!!

%% --------------- Identification ----------------------------
\newcommand{\fileversion@ruthesisen}{$Revision: 361 $}
\newcommand{\filedate@ruthesisen}{2020/02/03}% must be YYYY/MM/DD!
\newcommand{\fileauthor@ruthesisen}{Joseph Timothy Foley, foley at RU.IS}
\ProvidesClass{ruthesisen}[\filedate@ruthesisen by \fileauthor@ruthesisen]
\NeedsTeXFormat{LaTeX2e}
\typeout{English Thesis Class for Reykjavik University \fileversion@ruthesisen <\filedate@ruthesisen>, by \fileauthor@ruthesisen}

%% ---------------- Execution of Options -----------------------------
\ProcessOptions\relax% this stops searching for a * in \ProcessOtions*

%% Alternative way to subclass.  Disable the other option processing
%% if you enable it.  This will dump all options onto the parent class
%\ProcessOptions\LoadClassWithOptions{article}
%% Read page 20 of http://latex-project.org/guides/clsguide.pdf
%% carefully before modifying any of the execution and previous section.
%% ---------------- Package Loading -----------------------------
\LoadClass{rubook}% our parent class.


%%%%%%%%%%%%%%%%%%%% Addional Font Adjustments%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% rubook sets up some reasonable fonts, but we may need further adjustments
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


%% We need the paralist and dashrule package in order to format the BSc cover
\RequirePackage{paralist}
\RequirePackage{dashrule}

%% Default is at RU
\newcommand{\Institution@ruthesisen}{Reykjav\'{\i}k University}%
\newcommand{\InstitutionAddress@ruthesisen}{Menntavegur 1\\101 Reykjavík, Iceland}
\newcommand{\InstitutionPhone}{+354 599 6200}
\newcommand{\InstitutionURL}{www.ru.is}%

%% Some may need a different front logo
\newcommand{\frontlogo@ruthesisen}{ru-logo}
\newcommand{\setFrontLogo}[1]{\renewcommand{\frontlogo@ruthesisen}{#1}}

\newcommand{\setTitle}[2]{%
  \setMainTitle{#1}
  \setTitleCover{#2}
  \setTitleInternal{#1}
}
\newcommand{\setMainTitle}[1]{\renewcommand{\title@ruthesisen}{#1}}
\newcommand{\setTitleCover}[1]{\renewcommand{\titleCover@ruthesisen}{#1}}
\newcommand{\setTitleInternal}[1]{\renewcommand{\titleInternal@ruthesisen}{#1}}

\newcommand{\setAbstract}[1]{\renewcommand{\abstract@ruthesisen}{#1}}


\def\author#1{\def\and{, }
  \gdef\author@ruthesisen{#1}
  \gdef\authorSignature@ruthesisen{#1}
  \gdef\authorHeader@ruthesisen{#1}
}
\def\setAuthorSignature#1{\gdef\authorSignature@ruthesisen{#1}}
\def\setAuthorHeader#1{\gdef\authorHeader@ruthesisen{#1}}
\def\author@ruthesisen{??\@warning{***No author name.***}}


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
\newcommand{\showlengths@ruthesisen}{
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
      {\centering\includegraphics[width=55mm]{\frontlogo@ruthesisen}\\}%
    %
    \setSingleSpace{1.8}\SingleSpacing%
    \begin{textblock*}{\textwidth}[0,0](\covernowinmarginl,120mm)%
      \textcolor{rugray}{\frontcovertitlefont\titleCover@ruthesisen}\par%
      %% Originally title was forced uppercase, but no-one seems to have
      %%   noticed, so I'm removing it.
    \end{textblock*}%
    %
    \setSingleSpace{1.5}\SingleSpacing%    
    \begin{textblock*}{\textwidth}[0,0](\covernowinmarginl,222mm)%
      \begin{minipage}{\textwidth}
        \textcolor{rugray}{ 
          \frontcovertitletext{}
          \textbf{\author@ruthesisen}\\% 
          \degreelong@ruthesisen\\% 
          \whensigned@ruthesisen\\%
          \School@ruthesisen\\%
          \Institution%        
        }\par
        \vspace*{5mm}
        \textcolor{rured}{
          \frontcovertitlefont{}
          \ifbool{projectreport}{}{\degreeabbrv@ruthesisen{}} \documenttype@ruthesisen
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
  
\newcommand{\DegreeAndDepartment@ruthesisen}{\textbf{\degreelong@ruthesisen{} (\degreeabbrv@ruthesisen)  in \program@ruthesisen{} 
    \adddegree@ruthesisen}}

\newcommand{\placelogo@ruthesisen}[2]{%
  \begin{textblock*}{\textwidth}[0.5,0.5](\windowcenterx,#1)%
    {\centering\includegraphics[width=#2]{\frontlogo@ruthesisen}\\}%
  \end{textblock*}
}

%% ----- INTERNAL TITLE PAGE WITH COMMITTEE ---------------------------------------------------
%% TODO: make counter for supervisors in the very rare case that there
%%    is only one supervisor
\newcommand{\supervisors@ruthesisen}{\item No Advisor}
\newcommand{\supervisors}[1]{\renewcommand{\supervisors@ruthesisen}[1]{#1}}
\newcommand{\supervisorheading@ruthesisen}{Supervisor}
\newcommand{\setSupervisorHeading}[1]{\renewcommand{\supervisorheading@ruthesisen}{#1}}

\newcommand{\examiners@ruthesisen}{\item No Examiner}
\newcommand{\examiners}[1]{\renewcommand{\examiners@ruthesisen}[1]{#1}}
\newcommand{\examinerheading@ruthesisen}{%
  \ifbool{deptscs}{Examining Committee}{\MLExaminer}}
\newcommand{\setExaminerHeading}[1]{\renewcommand{\examinerheading@ruthesisen}{#1}}

\newcommand{\personinfo}[5]{
  \item[]  #1, #2\\#3, #4, #5 %Stub to be customized later
}
% base definition, we redefine it when format changes

\newcommand{\internaltitlewithcommittee}{
  \begin{cover}
    \quad\vfill% we center vertically so it looks nice
    \SingleSpacing%
    \begin{centering}
      \includegraphics[width=4cm]{\frontlogo@ruthesisen}\\
      \vspace{2\baselineskip}
      {\titletitlefont\titleInternal@ruthesisen\\}%
      \vspace{\baselineskip}
      {\titletextfont% 
        by\\
        \vspace{\baselineskip}
        \author@ruthesisen{}\\
        \vspace{2\baselineskip}        
        \documenttype@ruthesisen{} %
        of \ects@ruthesisen{} ECTS credits%
        submitted to the \School@ruthesisen\ \\%
        at \Institution{} in partial fulfillment\\% 
        of the requirements for the degree of \\%
        \textbf{\degreelong@ruthesisen}}\\
      
      \vspace{\baselineskip}
      \whensigned@ruthesisen{}\\      
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
        \supervisors@ruthesisen{}
        \examiners@ruthesisen{}
      \end{compactitem}
      \vspace{\baselineskip}
      \examinerheading@ruthesisen:
      \begin{compactitem}[\hspace{10mm}]
        \supervisors@ruthesisen{}
        \examiners@ruthesisen{}
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
      \author@ruthesisen\\
      \whensigned@ruthesisen\\
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
    \School@ruthesisen at \Institution{} for acceptance this
    \documenttype@ruthesisen{} entitled \textbf{\title@ruthesisen}
    submitted by \textbf{\authorSignature@ruthesisen{}} in partial fulfillment
    of the requirements for the degree of \DegreeAndDepartment@ruthesisen%
    % \vspace*{25mm}
    \newcommand{\signline}[2]{\item \hdashrule{##2}{1pt}{1pt}\\##1}
    \renewcommand{\personinfo}[5]{\item\hdashrule{\signaturex}{1pt}{1pt}\\##1, ##2\\##3, ##4, ##5\\\vspace{\signaturey}\\}
    \setlength{\pltopsep}{2\baselineskip}  % first/top space
    \setlength{\plparsep}{2\baselineskip} % space between entries
    \setlength{\plitemsep}{0.5\baselineskip} % space between lines
    \begin{compactitem}[]
      \signline{\date}{50mm}
      \supervisors@ruthesisen{}
      \examiners@ruthesisen{}
    \end{compactitem}
    % \end{minipage} \\ \par% need \par for ending the paragraph
    % Space for the signatures
    {\sigtextfont% 
      % change \personinfo to make the entries needed
      % Because this is inside a command, we escape the #1 as ##1
      \renewcommand{\personinfo}[5]{&\hdashrule{\signaturex}{1pt}{1pt}\\&##1\\\vspace{\signaturey}\\}
      \begin{tabular}{lll}
        \MLStudent:\\
        \personinfo{\author@ruthesisen}{}{}{}{}\\
        \ifbool{deptscs}{
        \examinerheading@ruthesisen:\\
        \supervisors@ruthesisen{}
        \examiners@ruthesisen{}
        }{
        \supervisorheading@ruthesisen:\\
        \supervisors@ruthesisen{}\\
        \MLExaminer:\\
        \examiners@ruthesisen{}
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
    copies of this \documenttype@ruthesisen{} entitled \textbf{\title@ruthesisen{}}
    and to lend or sell such copies for private, scholarly or
    scientific research purposes only.
    
    The author reserves all other publication and
    other rights in association with the copyright in the
    \documenttype@ruthesisen{}, and
    except as herein before provided, neither the
    \documenttype@ruthesisen{} nor
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
      \signline{\author@ruthesisen \\ \degreelong@ruthesisen}{0.75\textwidth}
    \end{compactitem}        
  \end{cover}
}



%% ----- TITLE AND ABSTRACT ----------------------------------------------
%% Depending upon the selected language, one of the abstracts appears first
\newcommand{\abstractpage}{%
  \begin{cover}
    \abstractpagetext@ruthesisen
  \end{cover}
}%

%% create an abstract template to minimize typing and increase
%% consistency
\newcommand{\abstractpagetext@ruthesisen}[1]{
  %\quad\vspace*{20mm}%
  {\centering%
    {\titletitlefont\title@ruthesisen\\}%%
    \vspace{\baselineskip}
    \author@ruthesisen\\%
    \vspace{\baselineskip}
    \whensigned@ruthesisen\\%
  }%
  \setlength{\parskip}{\baselineskip}%
  \par\vspace*{2\baselineskip}%
  \textbf{Abstract}\par\vspace{1ex}%
  \abstract@ruthesisen\par%
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
        \includegraphics[width=4cm]{\frontlogo@ruthesisen} 
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
\makeoddhead{oldstyle}{\footnotesize{\authorHeader@ruthesisen}}{}{\footnotesize{\thepage}}
\makeevenhead{oldstyle}{\footnotesize{\thepage}}{}{\footnotesize{\title@ruthesisen}}

