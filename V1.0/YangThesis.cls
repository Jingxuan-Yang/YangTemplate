\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{YangThesis}
                       [2019/04/14 V1.0 Standard LaTeX Template for Daily Papers]
% 模板初始化代码
% 默认有封面，<prefacetrue>
\newif\if@xuan@preface\@xuan@prefacetrue

% 定义输入常量<tokens>
% 关键词，中文
\newcommand\xuan@tokens@keywords{}
% 关键词，英文
\newcommand\xuan@tokens@keywordsen{}
% 论文类别
\newcommand*\xuan@tokens@papercategory{}
% 学校名称
\newcommand*\xuan@tokens@schoolname{}
% 院系
\newcommand*\xuan@tokens@departname{}
% 班级
\newcommand*\xuan@tokens@classnumber{}
% 日期
\newcommand*\xuan@tokens@dateinput{}
% 姓名
\newcommand*\xuan@tokens@authorname{}
% 学号
\newcommand*\xuan@tokens@studentID{}
% 专业
\newcommand*\xuan@tokens@majorin{}

% 提供模板选项
% 如果不要封面，则使用<withoutpreface>
\DeclareOption{withoutpreface}{\@xuan@prefacefalse}
% 模板继承<article>类
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
%  执行选项？
\ProcessOptions\relax

% 加载类
\LoadClass[a4paper,12pt]{article}

% 加载宏包
\RequirePackage{ifxetex}
\RequireXeTeX
% 若未使用XeLaTeX编译，则报错
\ifxetex\else
\ClassError{xuanthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

% 支持中文的 ctex 宏包
\RequirePackage{ctex}
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
\RequirePackage{titletoc}
% 设置颜色
\RequirePackage{xcolor}
% 插入图片
\RequirePackage{graphicx}
% 表格
\RequirePackage{array}
% 长表格
\RequirePackage{longtable}
% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs}
% multirow 支持在表格中跨行
\RequirePackage{multirow}
% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut}
% 在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 保护脆落命令
\RequirePackage{cprotect}
% 设置代码环境
\RequirePackage{listings}
% 超链接格式设置
\RequirePackage[colorlinks, linkcolor=black,anchorcolor=black,citecolor=black]{hyperref}
% 首行缩进
\RequirePackage{indentfirst}
% 设置浮动体的标题
\RequirePackage{caption}
% 定制列表环境
\RequirePackage{enumitem}
% 下划线
\RequirePackage{ulem}
% 尺寸计算
\RequirePackage{calc}

% 定义颜色
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

% 代码格式设置
\lstset{
  frame=tb,
  aboveskip=3mm,
  belowskip=3mm,
  showstringspaces=false,
  columns=flexible,
  framerule=1pt,
  rulecolor=\color{gray!35},
  backgroundcolor=\color{gray!5},
  % 代码字体
  basicstyle={\small\fontspec{Consolas}},
%  basicstyle={\small\ttfamily},
  numbers=left,
  % 编号数字字体
  numberstyle=\tiny\fontspec{Consolas}\color{gray},
  keywordstyle=\color{blue},
  commentstyle=\color{dkgreen},
  stringstyle=\color{mauve},
  breaklines=true,
  breakatwhitespace=true,
  tabsize=3,
}

% 页面布局，页边距设置
\geometry{top=25mm,bottom=25mm,left=31mm,right=31mm}

% 行距
\renewcommand*{\baselinestretch}{1.38}

% 修改tabular 环境, 设置表格中的行间距为正文行间距.
\let\xuan@oldtabular\tabular
\let\xuan@endoldtabular\endtabular
\renewenvironment{tabular}%
	{\bgroup%
	\renewcommand{\arraystretch}{1.25}%
	\xuan@oldtabular}%
	{\xuan@endoldtabular\egroup}
	
% 每行缩进两个汉字
\setlength\parindent{2em}

% 设置字体
\setmainfont{Times New Roman}
%\setmonofont{Courier New}
\setsansfont{Arial}
\setCJKfamilyfont{kai}[AutoFakeBold]{simkai.ttf}
\newcommand*{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
\newcommand*{\song}{\CJKfamily{song}}

% 标准字号设置
\renewcommand\normalsize{%
	\@setfontsize\normalsize{12.05}{14.45}%
	\abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@}
	
% 数学环境, 定理等设置
\newtheorem{definition}{\xuan@cap@definition}
\newtheorem{theorem}{\xuan@cap@theorem}
\newtheorem{lemma}{\xuan@cap@lemma}
\newtheorem{corollary}{\xuan@cap@corollary}
\newtheorem{assumption}{\xuan@cap@assumption}
\newtheorem{conjecture}{\xuan@cap@conjecture}
\newtheorem{axiom}{\xuan@cap@axiom}
\newtheorem{principle}{\xuan@cap@principle}
\newtheorem{problem}{\xuan@cap@problem}
\newtheorem{example}{\xuan@cap@example}
\newtheorem{proof}{\xuan@cap@proof}
\newtheorem{solution}{\xuan@cap@solution}

% 浮动环境设置
% 默认情况下, \LaTeX{} 要求每页的文字至少占据 20%,
% 否则该页就只单独放置一个浮动环境,
% 而这通常不是我们想要的, 我们将这个要求降低到 5%.
 \renewcommand*{\textfraction}{0.05}
 
% 有时如果多个浮动环境连续放在一起, \LaTeX{}
% 会将它们分在几个不同页，即使它们可在同一页放得下. 
% 我们可以通过修改 |\topfraction| 和 |\bottomfraction| 
% 分别设置顶端和底端的浮动环境的最大比例.
 \renewcommand*{\topfraction}{0.9}
 \renewcommand*{\bottomfraction}{0.8}
 
% 有时\LaTeX{}会把一个浮动环境单独放在一页,
% 我们要求这个环境至少要占据 85% 才能单独放在一页.
% 注意:  |\floatpagefraction| 的数值必须小于 |\topfraction|.
 \renewcommand*{\floatpagefraction}{0.85}
 
% 关于图片 graphicx
 % 如果图片没有指定后缀, 依次按下列顺序搜索
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}

 % 设置图表搜索路径, 可以给图表文件夹取如下名字
\graphicspath{{figures/}{figure/}{pictures/}%
  {picture/}{pic/}{pics/}{image/}{images/}}
  
% 图表标题
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}}
% 图表题
\captionsetup[figure]{%
	format=hang,   % 标题从第二行开始都有缩进,
	                         % 应该和 justification=raggedright 的效果一样.
	labelsep=quad, % 分隔符是一个空格
	font={song,minusfour,bf}, % 图的字体, 宋体小四
	position=bottom,              % position=bottom, 不代表标题放在下面, 
	                                           %标题仍放在放\caption的位置.
	belowskip=0pt,
	aboveskip=0pt
}
% 表标题
\captionsetup[table]{%
	format=hang,   
	labelsep=quad, 
	font={song,minusfour,bf}, 
	position=top, 
	belowskip=0pt,
	aboveskip=0pt
}

% 列表环境设置
\setlist{%
	topsep=0.3em,  % 列表顶端的垂直空白
	partopsep=0pt, % 列表环境前面紧接着一个空白行时其顶端的额外垂直空白
	itemsep=0ex plus 0.1ex, % 列表项之间的额外垂直空白
	parsep=0pt,           % 列表项内的段落之间的垂直空白
	leftmargin=1.5em, % 环境的左边界和列表之间的水平距离
	rightmargin=0em, % 环境的右边界和列表之间的水平距离
	labelsep=0.5em,    % 包含标签的盒子与列表项的第一行文本之间的间隔
	labelwidth=2em    % 包含标签的盒子的正常宽度；
	                              %若实际宽度更宽，则使用实际宽度。
}

% 公式，图表编号带有章节
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}

% 排版<LaTeX>代码
\lstnewenvironment{tcode}
  {
    \lstset{basicstyle = \small\ttfamily,
        language=TeX,
        tabsize = 4,
        frame = single,
        escapechar = `,
        breaklines = true,
        breakatwhitespace = true,
        frameround = tttt,
    }
  }
 {}

%%%===========================================%%%

% 生成封面, 使用\maketitle
\renewcommand{\maketitle}{\par
	\begingroup
      \newpage
      % Prevents figures from going at top of page.
      \global\@topnum\z@   
      \@maketitle
    \endgroup
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
  \if@xuan@preface
  \null
 % 开始写封面
 \vskip2ex
  \thispagestyle{empty}
  \vspace{1cm}
  % 论文类别
  {\centering\zihao{3}\xuan@tokens@papercategory\par}
  % 论文题目
  {\centering \zihao{2}\bfseries \@title\par}
  \vspace{5cm} 
  % 信息表格
  \begin{center}
  \begin{tabular}{rl}
  {\normalfont\large\bfseries 学\quad 校：}
  &{\large\xuan@tokens@schoolname}\\
  
  {\normalfont\large\bfseries 院\quad 系：}
  &{\large\xuan@tokens@departname}\\
  
  {\normalfont\large\bfseries 专\quad 业：}
  &{\large\xuan@tokens@majorin}\\
  
  {\normalfont\large\bfseries 班\quad 级：}
  &{\large\xuan@tokens@classnumber}\\
  
  {\normalfont\large\bfseries 姓\quad 名：}
  &{\large\xuan@tokens@authorname}\\
  
  {\normalfont\large\bfseries 学\quad 号：}
  &{\large\xuan@tokens@studentID}\\
  
  {\normalfont\large\bfseries 日\quad 期：}
  &{\large\xuan@tokens@dateinput}\\
  
  \end{tabular}
  \end{center}
  \vfill
  % 封面底边图
  \begin{figure}[h] % 图
	\centering        % 插入的图片居中表示
	\includegraphics[width=0.3\linewidth]{figures/schoollogo}  \\
	\includegraphics[width=0.5\linewidth]{figures/schoolname}  
\end{figure}
  \clearpage
	\else
	
	% 若无封面，则摘要页有标题
 	 \vspace{1cm}
 	 {\centering \huge\bfseries \@title\par}
  	 \vspace{0.5cm}
	 \hfill{——\xuan@tokens@authorname
	 				\footnote{\small \xuan@tokens@schoolname，
 	\xuan@tokens@departname，\xuan@tokens@majorin 专业}}\par
 	\hfill{——\xuan@tokens@studentID}\par
 	
	\fi
	}

% 中文标题名称设置
\renewcommand\contentsname{\xuan@cap@contentsname}
\renewcommand\listfigurename{\xuan@cap@listfigurename}
\renewcommand\listtablename{\xuan@cap@listtablename}
\renewcommand\refname{\xuan@cap@refname}
\renewcommand\indexname{\xuan@cap@indexname}
\renewcommand\figurename{\xuan@cap@figurename}
\renewcommand\tablename{\xuan@cap@tablename}
\renewcommand\appendixname{\xuan@cap@appendixname}
\renewcommand\abstractname{\xuan@cap@abstractname}

% 中文标题格式设置
% 目录深度
\setcounter{secnumdepth}{3}
\def\@seccntformat#1{\csname the#1\endcsname\ }

% 节标题格式, 居中, 使用\chinese命令修改计数器
%\renewcommand\thesection{\chinese{section}、}

% 章标题格式
\renewcommand\thesection{第 \arabic{section} 章\,\,\,}
% 节标题
\renewcommand\thesubsection{\arabic{section}\thinspace.\thinspace\arabic{subsection}\,}
% 条标题
\renewcommand\thesubsubsection{\arabic{section}\thinspace.\thinspace\arabic{subsection}\thinspace.\thinspace\arabic{subsubsection}\,}

%章标题生成，1级
\renewcommand\section{\@startsection{section}{1}{\z@}%
 	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.5ex \@plus.2ex}%
	{\centering\vbox{}\vspace{-0.5cm}\normalfont\LARGE\bfseries}}
%节标题生成，2级
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-2.5ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\Large\bfseries}}
%条标题生成，3级
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
%段标题生成，4级
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
%次级段标题生成，5级
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}
	 {3.25ex \@plus1ex \@minus .2ex}%
	 {-1em}%
	 {\normalfont\normalsize\bfseries}}

%%%============================================%%%

%% 中文摘要环境
\renewenvironment{abstract}{%
\if@twocolumn
		\section*{\abstractname}%
	\else
	\vbox{}
	\vspace{-0.7cm}
	 \begin{center}%
	{\LARGE\bfseries \abstractname\vspace{0em}\vspace{\z@}}%
	 \end{center}%
 	 \quotation
	\fi}
	{\if@twocolumn\else\endquotation\newpage\null\fi}

\renewenvironment{quotation}
	{\list{}{\listparindent 2em%
	 \itemindent \listparindent
	 \rightmargin\z@
	 \leftmargin\z@
	 \parsep \z@ \@plus\p@}%
	\item\relax}
	{\endlist}

% 中文关键词环境
\newcommand\keywords[1]{%
	\renewcommand{\xuan@tokens@keywords}{#1}
	\par
	\vskip1ex
	{\noindent\zihao{-4}\heiti\xuan@cap@keywordsname：}~{\xuan@tokens@keywords}
	}

% 英文摘要环境
\newenvironment{abstracten}{%
\if@twocolumn
		\section*{Abstract}%
	\else
	\vbox{}
	\vspace{-1.4cm}
	 \begin{center}%
	{\LARGE\bfseries Abstract\vspace{0em}\vspace{\z@}}%
	 \end{center}%
 	 \quotation
	\fi}
	{\if@twocolumn\else\endquotation\newpage\null\fi}

% 英文关键词环境
\newcommand\keywordsen[1]{%
	\renewcommand{\xuan@tokens@keywordsen}{#1}
	\par
	\vskip1ex
	{\noindent\zihao{-4}\bf\xuan@cap@keywordsenname：}~{\xuan@tokens@keywordsen}
	}

% 定义附录，编号格式为大写字母
\renewcommand\appendix{\par
	\setcounter{section}{0}%
	 \setcounter{subsection}{0}%
	\gdef\thesection{\appendixname\@Alph\c@section}}		
% 重定义参考文献环境
% #11使文字缩进两个数字编号的距离
\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#11}}%
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

%定义与常量有关的新命令
%输入论文类别
\newcommand*\papercategory[1]{%
	\renewcommand{\xuan@tokens@papercategory}{#1}}	
%输入校名
\newcommand*\schoolname[1]{%
	\renewcommand{\xuan@tokens@schoolname}{#1}}
%输入院系名称
\newcommand*\departname[1]{%
	\renewcommand{\xuan@tokens@departname}{#1}}
%输入班级
\newcommand*\classnumber[1]{%
	\renewcommand{\xuan@tokens@classnumber}{#1}}
%输入日期
\newcommand*\dateinput[1]{%
	\renewcommand{\xuan@tokens@dateinput}{#1}}
%输入姓名
\newcommand*\authorname[1]{%
	\renewcommand{\xuan@tokens@authorname}{#1}}
%输入学号
\newcommand*\studentID[1]{%
	\renewcommand{\xuan@tokens@studentID}{#1}}
%输入专业
\newcommand*\majorin[1]{%
	\renewcommand{\xuan@tokens@majorin}{#1}}

% 定义常量的值
% 数学定理相关的常量
\newcommand*{\xuan@cap@definition}{定义}
\newcommand*{\xuan@cap@theorem}{定理}
\newcommand*{\xuan@cap@lemma}{引理}
\newcommand*{\xuan@cap@corollary}{推论}
\newcommand*{\xuan@cap@assumption}{假设}
\newcommand*{\xuan@cap@conjecture}{猜想}
\newcommand*{\xuan@cap@axiom}{公理}
\newcommand*{\xuan@cap@principle}{原则}
\newcommand*{\xuan@cap@problem}{问题}
\newcommand*{\xuan@cap@example}{例}
\newcommand*{\xuan@cap@proof}{证明}
\newcommand*{\xuan@cap@solution}{解}

% 中文标题名称
\newcommand*{\xuan@cap@contentsname}{目录}
\newcommand*{\xuan@cap@listfigurename}{插图清单}
\newcommand*{\xuan@cap@listtablename}{附表清单}
\newcommand*{\xuan@cap@refname}{参考文献}
\newcommand*{\xuan@cap@indexname}{索引}
\newcommand*{\xuan@cap@figurename}{图}
\newcommand*{\xuan@cap@tablename}{表}
\newcommand*{\xuan@cap@appendixname}{附录}
\newcommand*{\xuan@cap@abstractname}{摘要}
% 中文关键词
\newcommand*{\xuan@cap@keywordsname}{关键词}
% 英文关键词
\newcommand*{\xuan@cap@keywordsenname}{Keywords}

% 设置目录格式，目录只有三级
% 1级目录格式
\titlecontents{section}[0pt]{\vspace{2mm}\bfseries}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
% 2级目录格式
\titlecontents{subsection}[30pt]{\songti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}
% 3级目录格式
\titlecontents{subsubsection}[55pt]{\songti}
{\thecontentslabel\hskip.5em}{}{\titlerule*[0.5pc]{.}\contentspage}

%结束类文件
\endinput
