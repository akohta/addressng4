\ProvidesClass{addressng4}
% sample of name and address printings for 'nagagata-4' (envelope of japanese standard)
% please use this as a reference to set the position of text.
% 			akihiro ohta 2021/07/25
 
\LoadClass[]{jarticle}

\usepackage{plext}
\usepackage{xstring}
\usepackage{bxpapersize}
\usepackage{type1cm}
\usepackage{xcolor}

\pagestyle{empty}

%define constant
\newcounter{chv} 
\newcounter{cvv}
\newlength{\lhv}
\newlength{\lvv}

%set const value
\setcounter{chv}{ 90}
\setcounter{cvv}{205}
\setlength{\lhv}{ 90truemm}
\setlength{\lvv}{205truemm}

%set paper size
\papersizesetup{size={\lhv,\lvv}}

%set page size
\setlength{\pdfpagewidth}{\lhv}
\setlength{\pdfpageheight}{\lvv}

%set default layout
\setlength{\unitlength}{1truemm}
\setlength{\parindent}{0pt}
\setlength{\topmargin}{-1truein}
\setlength{\evensidemargin}{-1truein}
\setlength{\oddsidemargin}{-1truein}
\setlength{\headheight}{0pt}
\setlength{\headsep}{0pt}
\setlength{\footskip}{0pt}
\setlength{\textwidth}{\lhv}
\setlength{\textheight}{\lvv}

%condition variable and default setting
\newif\ifpaperperimeter     % for paper size check
\paperperimeterfalse        % \paperperimetertrue : enable, \paperperimeterfalse : disable.
\newif\ifpostcode           % for postcode position check
\postcodefalse              % \postcodetrue : enable, \postcodefalse : disable.
\newif\ifaddress            % for address position check 
\addressfalse               % \addresstrue : enable, \addressfalse : disable.
\newif\ifname               % for name position check
\namefalse                  % \nametrue : enable, \namefalse : disable.
\newif\ifnotes              % for notes position check
\notesfalse                 % \notestrue : enable, \notesfalse : disable.
\newif\ifspostcode          % for sender's postcode position check
\spostcodefalse             % \spostcodetrue : enable, \spostcodefalse : disable. 
\newif\ifsaddress           % for sender's address position check
\saddressfalse              % \saddresstrue : enable, \saddressfalse : disable.
\newif\ifsname              % for sender's name position check
\snamefalse                 % \snametrue : enable, \snamefalse : disable.


% address data
\newcommand{\addreceiveraddress}[6]{
	% -- arguments --
	% #1 name A
	% #2 name B
	% #3 notes
	% #4 postcode
	% #5 address A
	% #6 address B
	% -- end arguments --
	\clearpage
	\begin{picture}(\value{chv},\value{cvv})(0,0)
		% -- for paper size check --
		\ifpaperperimeter
			\put(0,0){\line(1,0){\value{chv}}}
			\put(\value{chv},0){\line(0,1){\value{cvv}}}
			\put(0,\value{cvv}){\line(1,0){\value{chv}}}
			\put(0,0){\line(0,1){\value{cvv}}}
		\fi
		% -- end paper size check --

		% -- for postcode position check --
		\ifpostcode
			\put( 34.0,192.0){\line(1,0){47.7}}
			\put( 34.0,184.0){\line(1,0){47.7}}
			\put( 34.0,184.0){\line(0,1){ 8.0}}
			\put( 81.7,184.0){\line(0,1){ 8.0}}
			\put( 39.7,184.0){\line(0,1){ 8.0}}
			\put( 76.0,184.0){\line(0,1){ 8.0}}
		\fi
		% -- end postcode position check --
		% postcode 
		\put(33.0,192){ % 1.0mm shift for half size number centering
			\vtop to 8.0truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox{5.7truemm}{\hfil\StrChar{#4}{1}\hfil}\hskip1.3truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{2}\hfil}\hskip1.3truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{3}\hfil}\hskip1.9truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{4}\hfil}\hskip1.1truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{5}\hfil}\hskip1.1truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{6}\hfil}\hskip1.1truemm
				\parbox{5.7truemm}{\hfil\StrChar{#4}{7}\hfil}
			\vfil}
		}

		% -- for address A position check --
		\ifaddress
			\put(72,175){\line(1,0){8}} % upper line
			\put(72, 20){\line(1,0){8}} % lower line
			\put(72, 20){\line(0,1){155}} % leftside line
			\put(80, 20){\line(0,1){155}} % rightside line
		\fi
		% -- end check --
		% address A
		\put(72,175){
			\vtop to 155truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox<t>{155truemm}{#5}
			\vfil}
		}

		% -- for address B position check --
		\ifaddress
			\put( 64,175){\line(1,0){8}} % upper line
			\put( 64, 20){\line(1,0){8}} % lower line 
			\put( 64, 20){\line(0,1){155}} % leftside line
			\put( 72, 20){\line(0,1){155}} % rightside line
		\fi
		% -- end check --
		% address B
		\put( 64,175){
			\vtop to 155truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox<t>{155truemm}{\hfill#6}
			\vfil}
		}

		% -- name A position check --
		\ifname
			\put(46,175){\line(1,0){9}} % upper line
			\put(46, 20){\line(1,0){9}} % lower line
			\put(46, 20){\line(0,1){155}} % leftside line
			\put(55, 20){\line(0,1){155}} % rightside line
		\fi
		% -- end check --
		% name A
		\put(46,175){
			\vtop to 155truemm{\fontsize{7mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{155truemm}{\hskip2zw#1\hfill}
			\vfil}
		}

		% -- name B position check --
		\ifname
			\put(37,175){\line(1,0){9}} % upper line
			\put(37, 20){\line(1,0){9}} % lower line
			\put(37, 20){\line(0,1){155}} % leftside line
			\put(46, 20){\line(0,1){155}} % rightside line
		\fi
		% -- end check --
		% name B
		\put(37,175){
			\vtop to 155truemm{\fontsize{7mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{155truemm}{\hskip2zw#2\hfill}
			\vfil}
		}

		% -- notes position check --
		\ifnotes
			\put(10,175){\line(1,0){9}} % upper line
			\put(10, 20){\line(1,0){9}} % lower line
			\put(10, 20){\line(0,1){155}} % leftside line
			\put(19, 20){\line(0,1){155}} % rightside line
		\fi
		% -- end check --
		% notes
		\put(10,175){
			\vtop to 155truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox<t>{155truemm}{\hfill\textcolor{red}{#3}}
			\vfil}
		}


	\end{picture}
}

\newcommand{\addsenderaddress}[5]{
	% -- arguments --
	% #1 sender's family name
	% #2 sender's given name
	% #3 sender's postcode 
	% #4 sender's address A
	% #5 sender's address B
	% -- end arguments --
	\clearpage
	\begin{picture}(\value{chv},\value{cvv})(0,0)
		% -- for paper size check --
		\ifpaperperimeter
			\put(0,0){\line(1,0){\value{chv}}}
			\put(\value{chv},0){\line(0,1){\value{cvv}}}
			\put(0,\value{cvv}){\line(1,0){\value{chv}}}
			\put(0,0){\line(0,1){\value{cvv}}}
		\fi
		% -- end paper size check --

		% -- for postcode position check --
		\ifspostcode
			\put( 4.0,105.0){\line(1,0){37.0}} % upper line
			\put( 4.0, 98.5){\line(1,0){37.0}} % lower line
			\put( 4.0, 98,5){\line(0,1){ 6.5}} % leftside line
			\put(41.0, 98.5){\line(0,1){ 6.5}} % rightside line
			\put( 8.6, 98.5){\line(0,1){ 6.5}}
			\put(36.6, 98.5){\line(0,1){ 6.5}}
		\fi
		% -- end check --
		% postcoe 
		\put( 3.0,105){ % 1.0mm shift for half size number centering
			\vtop to 6.5truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox{4.6truemm}{\hfil\StrChar{#3}{1}\hfil}\hskip0.4truemm
				\parbox{4.6truemm}{\hfil\StrChar{#3}{2}\hfil}\hskip0.4truemm
				\parbox{4.6truemm}{\hfil\StrChar{#3}{3}\hfil}\hskip0.8truemm-
				\parbox{4.4truemm}{\hfil\StrChar{#3}{4}\hfil}\hskip0.4truemm
				\parbox{4.4truemm}{\hfil\StrChar{#3}{5}\hfil}\hskip0.4truemm
				\parbox{4.4truemm}{\hfil\StrChar{#3}{6}\hfil}\hskip0.4truemm
				\parbox{4.4truemm}{\hfil\StrChar{#3}{7}\hfil}\hskip0.4truemm
			\vfil}
		}

		% -- for addressA position check --
		\ifsaddress
			\put(32, 95){\line(1,0){ 6}} % upper line
			\put(32, 15){\line(1,0){ 6}} % lower line
			\put(32, 15){\line(0,1){80}} % leftside line
			\put(38, 15){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% address A
		\put(32, 95){
			\vtop to 80truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox<t>{80truemm}{#4\hfil}
			\vfil}
		}

		% -- for addressB position check --
		\ifsaddress
			\put(26, 95){\line(1,0){ 6}} % upper line
			\put(26, 15){\line(1,0){ 6}} % lower line
			\put(26, 15){\line(0,1){80}} % leftside line
			\put(32, 15){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% address B
		\put(26, 95){
			\vtop to 80truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox<t>{80truemm}{\hfill#5}
			\vfil}
		}
		% -- for name position check --
		\ifsname
			\put(16, 95){\line(1,0){ 7}} % upper line
			\put(16, 15){\line(1,0){ 7}} % lower line
			\put(16, 15){\line(0,1){80}} % leftside line
			\put(23, 15){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% name
		\put(16, 95){
			\vtop to 80truemm{\fontsize{5mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{80truemm}{\hfil#1\hskip1zw#2\hfil}
			\vfil}
		}
	\end{picture}
}

\newcommand{\addsenderaddresslp}[5]{
	% -- arguments --
	% #1 sender's family name
	% #2 sender's given name
	% #3 sender's postcode 
	% #4 sender's address A
	% #5 sender's address B
	% -- end arguments --
	\clearpage
	\begin{picture}(\value{chv},\value{cvv})(0,0)
		% -- for paper size check --
		\ifpaperperimeter
			\put(0,0){\line(1,0){\value{chv}}}
			\put(\value{chv},0){\line(0,1){\value{cvv}}}
			\put(0,\value{cvv}){\line(1,0){\value{chv}}}
			\put(0,0){\line(0,1){\value{cvv}}}
		\fi
		% -- end paper size check --

		% -- for postcode position check --
		\ifspostcode
			\put( 4.0,30.0){\line(1,0){37.0}} % upper line
			\put( 4.0,23.5){\line(1,0){37.0}} % lower line
			\put( 4.0,23,5){\line(0,1){ 6.5}} % leftside line
			\put(41.0,23.5){\line(0,1){ 6.5}} % rightside line
			\put( 8.6,23.5){\line(0,1){ 6.5}}
			\put(36.6,23.5){\line(0,1){ 6.5}}
		\fi
		% -- end check --
		% postcoe 
		\put( 3.0,30){ % 1.0mm shift for half size number centering
			\vtop to 6.5truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox{4.6truemm}{\hfil\StrChar{#3}{1}\hfil}\hskip0.8truemm
				\parbox{4.6truemm}{\hfil\StrChar{#3}{2}\hfil}\hskip0.8truemm
				\parbox{4.6truemm}{\hfil\StrChar{#3}{3}\hfil}\hskip1.6truemm
				\parbox{4.4truemm}{\hfil\StrChar{#3}{4}\hfil}\hskip0.8truemm
				\parbox{4.4truemm}{\hfil\StrChar{#3}{5}\hfil}\hskip0.8truemm
				\parbox{4.4truemm}{\hfil\StrChar{#3}{6}\hfil}\hskip0.8truemm
				\parbox{4.4truemm}{\hfil\StrChar{#3}{7}\hfil}\hskip0.8truemm
			\vfil}
		}

		% -- for addressA position check --
		\ifsaddress
			\put(32,115){\line(1,0){ 6}} % upper line
			\put(32, 35){\line(1,0){ 6}} % lower line
			\put(32, 35){\line(0,1){80}} % leftside line
			\put(38, 35){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% address A
		\put(32,115){
			\vtop to 80truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox<t>{80truemm}{\hfil#4\hfil}
			\vfil}
		}

		% -- for addressB position check --
		\ifsaddress
			\put(26,115){\line(1,0){ 6}} % upper line
			\put(26, 35){\line(1,0){ 6}} % lower line
			\put(26, 35){\line(0,1){80}} % leftside line
			\put(32, 35){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% address B
		\put(26,115){
			\vtop to 80truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox<t>{80truemm}{\hfill#5\hfil}
			\vfil}
		}
		% -- for name position check --
		\ifsname
			\put(15,115){\line(1,0){ 8}} % upper line
			\put(15, 35){\line(1,0){ 8}} % lower line
			\put(15, 35){\line(0,1){80}} % leftside line
			\put(23, 35){\line(0,1){80}} % rightside line
		\fi
		% -- end check --
		% name
		\put(15,115){
			\vtop to 80truemm{\fontsize{6mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{80truemm}{\hfill#1\hskip1zw#2\hfil}
			\vfil}
		}
	\end{picture}
}

