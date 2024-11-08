%% ---------------------------------------------------------------------------------------------
%% LaTeX Base Class Reykjavík University Books
%% ---------------------------------------------------------------------------------------------
%% Page size options original Author: Lars Engebretsen (KTH)
%% Source not found on Google, an archived copy [2004/12/14 v2.1 Document Class for KTH Theses]
%% was used in the original version
%% New version in 2017 by Gabriel Hjort Blindell <ghb AT kth.se>
%% Source at https://github.com/gablin/ghb-thesis/blob/master/kthesis.cls
%% This has a Creative Commons Attribution-NoDerivatives 4.0
%% <http://creativecommons.org/licenses/by-nc-nd/4.0/> for details).
%% Which means we sadly can't modify it for our use.
%% Page size options from Lars' version on 2022-05-22: Joseph Timothy Foley <foley AT ru.is>
%% Created on 2022-05-22
%% This code is distributed under the MIT license
%% Details at LICENSE.md
%% --------------- Identification ----------------------------
\NeedsTeXFormat{LaTeX2e}
\newcommand{\fileversion@rubook}{V1.1}
\ProvidesClass{rubook}[2024/11/07 Reykjavik University Book class\fileversion@rubook]
\typeout{Book Class for Reykjavik University \fileversion@rubook}

\newcommand{\@rubook@setpapersize@afour}{\stockaiv{}}
\newcommand{\@rubook@setpapersize@bfive}{\stockbv{}}
\DeclareOption{g5paper}{\OptionNotUsed}
\DeclareOption{a3paper}{\OptionNotUsed}
\DeclareOption{a4paper}{\def\rubook@papersize{afour}}% paper stock a4
\DeclareOption{a6paper}{\OptionNotUsed}
\DeclareOption{a5paper}{\OptionNotUsed}
\DeclareOption{b3paper}{\OptionNotUsed}
\DeclareOption{b4paper}{\OptionNotUsed}
\DeclareOption{b5paper}{\def\rubook@papersize{bfive}}% paper stock b5
\DeclareOption{b6paper}{\OptionNotUsed}
\DeclareOption{letterpaper}{\OptionNotUsed}
\DeclareOption{legalpaper}{\OptionNotUsed}
\DeclareOption{executivepaper}{\OptionNotUsed}
\DeclareOption{ebook}{\OptionNotUsed}
\DeclareOption{landscape}{\OptionNotUsed}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ExecuteOptions{b5paper}
\ProcessOptions\relax
\LoadClass[a4paper]{memoir}
\@nameuse{@rubook@setpapersize@\rubook@papersize}

%%%%%%%%%%%%%%%% MARGINS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setxlvchars{}\setlxvchars{}
%% calculate textblock based upon character size
\trimLmarks{}% trim marks get cut off
\pagebv{}% cut to b5
\setpageml{\paperheight}{\paperwidth}{*}%page area on middle left for cutting
%\checkandfixthelayout% implement the margins if we weren't using canonic

\RequirePackage{canoniclayout}
%% Canonic layout calculates margins that look nice
%% Based upon a rectangle formed with a circle on the width


%% Some debugging code to check length calculation.
\newcommand{\showlengths@rubook}{
  \uselengthunit{mm} % showlen package
  Lengths: (with round off error from floats)\\
  pagecenterx:\printlength{\pagecenterx}\\
  pagecentery:\printlength{\pagecentery}\\
}

%%% Local Variables:
%%% mode: latex
%%% TeX-master: "main"
%%% TeX-engine: luatex
%%% End:
