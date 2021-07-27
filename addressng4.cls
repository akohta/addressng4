\ProvidesClass{addressng4}
% sample of name and address printings for 'nagagata-4' (envelope of japanese standard)
% please use this as a reference to set the position of text.
% 			akihiro ohta 2021/07/25
 
\LoadClass[]{jarticle}

\usepackage{plext}
\usepackage{xstring}
\usepackage{bxpapersize}
\usepackage{type1cm}

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


% address data
\newcommand{\addreceiveraddress}[6]{
	% #1 receiver's family name
	% #2 receiver's given name
	% #3 receiver's name suffix
	% #4 receiver's postcode
	% #5 receiver's address A
	% #6 receiver's address B
	\clearpage
	\begin{picture}(\value{chv},\value{cvv})(0,0)
		% -- for paper size check --
		%\put(0,0){\line(1,0){\value{chv}}}
		%\put(\value{chv},0){\line(0,1){\value{cvv}}}
		%\put(0,\value{cvv}){\line(1,0){\value{chv}}}
		%\put(0,0){\line(0,1){\value{cvv}}}
		% -- end paper size check --

		% -- for postcode region check --
		%\put( 35.0,193.0){\line(1,0){47.7}}
		%\put( 35.0,185.0){\line(1,0){47.7}}
		%\put( 35.0,185.0){\line(0,1){ 8.0}}
		%\put( 82.7,185.0){\line(0,1){ 8.0}}
		%\put( 40.7,185.0){\line(0,1){ 8.0}}
		%\put( 77.0,185.0){\line(0,1){ 8.0}}
		% -- end postcode region check --
		% postcode 
		\put(34.0,193){ % 1.0mm shift for　half size number centering
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

		% -- for address A region check --
		%\put(70,175){\line(1,0){8}} % upper line
		%\put(70, 20){\line(1,0){8}} % lower line
		%\put(70, 20){\line(0,1){155}} % leftside line
		%\put(78, 20){\line(0,1){155}} % rightside line
		% -- end check --
		% address A
		\put(70,175){
			\vtop to 155truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox<t>{155truemm}{#5}
			\vfil}
		}

		% -- for address B region check --
		%\put( 61,175){\line(1,0){8}} % upper line
		%\put( 61, 20){\line(1,0){8}} % lower line 
		%\put( 61, 20){\line(0,1){155}} % leftside line
		%\put( 69, 20){\line(0,1){155}} % rightside line
		% -- end check --
		% address B
		\put( 61,175){
			\vtop to 155truemm{\fontsize{6mm}{0pt}\selectfont\vfil
				\parbox<t>{155truemm}{\hfill#6\hfil}
			\vfil}
		}

		% -- name region check --
		%\put(40,175){\line(1,0){10}} % upper line
		%\put(40, 20){\line(1,0){10}} % lower line
		%\put(40, 20){\line(0,1){155}} % leftside line
		%\put(50, 20){\line(0,1){155}} % righside line
		% -- end check --
		% name
		\put(40,175){
			\vtop to 155truemm{\fontsize{8mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{155truemm}{\hskip2zw#1\hskip1zw#2\hskip1zw#3\hfill}
			\vfil}
		}
	\end{picture}
}

\newcommand{\addsenderaddress}[5]{
	% #1 sender's family name
	% #2 sender's given name
	% #3 sender's postcode 
	% #4 sender's address A
	% #5 sender's address B
	\clearpage
	\begin{picture}(\value{chv},\value{cvv})(0,0)
		% -- for postcode region check --
		%\put( 4.0,30.0){\line(1,0){37.0}} % upper line
		%\put( 4.0,23.5){\line(1,0){37.0}} % lower line
		%\put( 4.0,23,5){\line(0,1){ 6.5}} % leftside line
		%\put(41.0,23.5){\line(0,1){ 6.5}} % rightside line
		%\put( 8.6,23.5){\line(0,1){ 6.5}}
		%\put(36.6,23.5){\line(0,1){ 6.5}}
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

		% -- for addressA region check --
		%\put(32,115){\line(1,0){ 6}} % upper line
		%\put(32, 35){\line(1,0){ 6}} % lower line
		%\put(32, 35){\line(0,1){80}} % leftside line
		%\put(38, 35){\line(0,1){80}} % rightside line
		% -- end check --
		% address A
		\put(32,115){
			\vtop to 80truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox<t>{80truemm}{\hfil#4\hfil}
			\vfil}
		}

		% -- for addressB region check --
		%\put(26,115){\line(1,0){ 6}} % upper line
		%\put(26, 35){\line(1,0){ 6}} % lower line
		%\put(26, 35){\line(0,1){80}} % leftside line
		%\put(32, 35){\line(0,1){80}} % rightside line
		% -- end check --
		% address B
		\put(26,115){
			\vtop to 80truemm{\fontsize{4mm}{0pt}\selectfont\vfil
				\parbox<t>{80truemm}{\hfill#5\hfil}
			\vfil}
		}
		% -- for name region check --
		%\put(15,115){\line(1,0){ 8}} % upper line
		%\put(15, 35){\line(1,0){ 8}} % lower line
		%\put(15, 35){\line(0,1){80}} % leftside line
		%\put(23, 35){\line(0,1){80}} % rightside line
		% -- end check --
		% name
		\put(15,115){
			\vtop to 80truemm{\fontsize{6mm}{0pt}\selectfont\kanjiskip0.3zw\vfil
				\parbox<t>{80truemm}{\hfill#1\hskip1zw#2\hfil}
			\vfil}
		}
	\end{picture}
}
