%%
%% dlmubachelor.cls：一个适用于大连海事大学理工类本科生毕业论文的文类
%% 根据大连海事大学毕业设计（论文）工作手册（2011年11月版）的要求制作而成
%% 作者为大连海事大学船舶与海洋工程学院能源与动力工程系任铭昊
%%
%% 已经加载的宏包：
%%     ctex, geometry, fontenc, mathptmx, xkeyval, titlesec, titletoc
%%     amsmath, amsfonts, amssymb, bm, array, longtable, booktabs
%%     multirow, graphicx, subfig, flafter, caption, hyperref
%%     cleverref, ulem, xcolor, fancyhdr, listings, paralist,cite
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dlmubachelor}[2021/02/04 v1.2 Dalian Maritime University Thesis Template for Bachelor Degree]
\LoadClass[12pt]{article}

\RequirePackage[zihao=-4]{ctex}

%% 页面布局
\RequirePackage[a4paper,margin=2.5cm]{geometry}

%% 行距设置
\RequirePackage{setspace}
\setstretch{1.25}

%% 段落间距设置
\setlength{\parskip}{0pt}

%% 首行缩进
\setlength{\parindent}{2em}

%% 新罗马字体相关
\RequirePackage[T1]{fontenc}
\RequirePackage{mathptmx}

% 宋体可加粗
\let\songti\relax
\newCJKfontfamily\songti{SimSun}[AutoFakeBold]
\setCJKmainfont{SimSun}[AutoFakeBold]

% 键值对设置（使用 \setkeys{} 设置文档内容）
\RequirePackage{xkeyval}
\define@cmdkeys{dlmubachelor}[dlmubachelor@]{title,institute,majorclass,name,mentor,date}[none]
\setkeys{dlmubachelor}{
	title=大连海事大学本科毕业论文\LaTeX 文档类,   % 论文题目
	institute=船舶与海洋工程学院, % 学院名称
	majorclass=专业班级,   % 专业班级
	name=你的名字,  % 姓名
	mentor=你的导师,    % 指导教师
	date=二〇二一年六月   % 完成日期
}
\providecommand{\dlmubachelorset}[1]{\setkeys{dlmubachelor}{#1}}

\newcommand{\onelinetitle}{您的论文题目}

% 编号的深度, 4 表示到 paragraph
\setcounter{secnumdepth}{4}
% 目录的深度，2 表示到 subsubsection
\setcounter{tocdepth}{3}

%% 标题设置
\RequirePackage{titlesec}
\titleformat{\section}{\bf\songti\zihao{3}}{第\,\thesection\,章}{1ex}{\bf\songti\zihao{3}}[]
\titleformat{\subsection}{\bf\songti\zihao{4}}{\thesubsection}{1ex}{\bf\songti\zihao{4}}[]
\titleformat{\subsubsection}{\bf\songti\zihao{-4}}{\thesubsubsection}{1ex}{\bf\songti\zihao{-4}}[]
\titleformat{\paragraph}{\bf\songti\zihao{-4}}{\theparagraph}{1ex}{\bf\songti\zihao{-4}}[]

\titlespacing{\section}{0pt}{20pt}{10pt}
\titlespacing{\subsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing{\subsubsection}{0pt}{0.5\baselineskip}{0.5\baselineskip}
\titlespacing{\paragraph}{0pt}{0mm}{0mm}

%% 目录设置
\RequirePackage{titletoc}

\titlecontents{section}[2em]{}{第\thecontentslabel 章\hspace{1ex}}{}{\titlerule*[1ex]{$\cdot$}\contentspage}[]
\titlecontents{subsection}[4em]{}{\thecontentslabel\hspace{1ex}}{}{\titlerule*[1ex]{$\cdot$}\contentspage}[]
\titlecontents{subsubsection}[6em]{}{\thecontentslabel\hspace{1ex}}{}{\titlerule*[1ex]{$\cdot$}\contentspage}[]

\renewcommand\contentsname{{\zihao{3}\centerline{目\hspace{2em}录}}\vspace{-20pt}}

%% 压缩列表环境等
\RequirePackage{paralist}

%% 数学相关
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
\numberwithin{equation}{section}
% 下面修改的是公式与上下文间距
\renewcommand\normalsize{%
	\@setfontsize\normalsize\@xpt\@xiipt
	\abovedisplayskip 3\p@ \@plus0\p@ \@minus0\p@
	\abovedisplayshortskip 3\p@
	\belowdisplayshortskip 3\p@
	\belowdisplayskip 3\p@ \@plus0\p@ \@minus0\p@
	\let\@listi\@listI}

%% 表格相关
\RequirePackage{array,tabularx} % 表格
\RequirePackage{longtable} % 长表格
\RequirePackage{booktabs} % 三线表，booktabs 提供了\toprule 等命令
\RequirePackage{multirow} % multirow 支持在表格中跨行
% 修改tabular 环境, 设置表格中的行间距为正文行间距，表格内容5号字
\let\dlmubachelor@oldtabular\tabular
\let\dlmubachelor@endoldtabular\endtabular
\renewenvironment{tabular}%
{\bgroup%
	\zihao{5}\renewcommand{\arraystretch}{1.25}%
	\dlmubachelor@oldtabular}%
{\dlmubachelor@endoldtabular\egroup}

%% 排版图片
\RequirePackage{graphicx,subfig,flafter}
% 以下设置使得一页上最多有六个浮动对象（图、表）
% 且顶部最多三个，底部最多三个
% 可自行修改参数
\setcounter{totalnumber}{6}
\setcounter{topnumber}{3}
\setcounter{bottomnumber}{3}
% 以下定义了自动识别的图表文件夹
% 若使用这些名字命名文件夹
% 则引用图片路径时只需填文件名即可
\graphicspath{{./}{./chapters/img/}{./chapters/fig/}{./chapters/image/}{./chapters/figure/}{./chapters/picture/}}

%% 图表标题设置
\numberwithin{figure}{section}
\numberwithin{table}{section}

\RequirePackage[font=footnotesize,labelsep=space,labelfont=bf,textfont=bf]{caption} % 序号之后空一格写标题

%% 超链接，交叉引用相关
\RequirePackage[hidelinks]{hyperref} % 设置超链接黑白打印（不带其他颜色的框）
\RequirePackage{cleveref} % 智能自动化交叉引用
%% crefformat settings
\crefformat{figure}{#2图~#1#3}
\crefrangeformat{figure}{图~(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{figure}{图~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{table}{#2表#1#3}
\crefrangeformat{table}{表(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{table}{表~(#2#1#3)}{和~(#2#1#3)}{，(#2#1#3)}{和~(#2#1#3)}

\crefformat{equation}{#2式~(#1#3)}
\crefrangeformat{equation}{式(#3#1#4)\;\~{}\;(#5#2#6)}
\crefmultiformat{equation}{式~(#2#1#3)}{ 和~(#2#1#3)}{，(#2#1#3)}{ 和~(#2#1#3)}

%%下划线
\RequirePackage{ulem}

% 设置颜色宏包
\RequirePackage{xcolor}

%% 封面
\def\maketitle{%
	\thispagestyle{empty}\null
	\begin{center}
		\vspace{30mm}
		{\zihao{1}\bf 大连海事大学\par}
		\vspace{30mm}
		{\fontsize{48pt}{\baselineskip}\bf 毕\hspace{1ex}业\hspace{1ex}论\hspace{1ex}文}
		\par
		\vspace{100mm}
		{\zihao{3}\bf\dlmubachelor@date}
	\end{center}

	\newpage
	\begin{center}
		\thispagestyle{empty}\null\zihao{2}
		\vspace{30mm}
		\parbox[t][66mm]{140mm}{\centering\dlmubachelor@title}
		\par
		\begin{tabular}{cc}
			\zihao{2}专业班级：         & \zihao{2}\dlmubachelor@majorclass \\ \cline{2-2}
			                            & \vspace{2mm}                      \\
			\zihao{2}姓\hspace{2em}名： & \zihao{2}\dlmubachelor@name       \\ \cline{2-2}
			                            & \vspace{2mm}                      \\
			\zihao{2}指导教师：         & \zihao{2}\dlmubachelor@mentor     \\ \cline{2-2}
		\end{tabular}

		\vspace{50mm}
		\dlmubachelor@institute
	\end{center}
	\newpage
}

%% 定义中文摘要环境
\newcommand{\cnabstractname}{\centering\bf\zihao{3}摘\hspace{2em}要\par}
\providecommand{\keywordscn}{\par\vspace{\baselineskip}\noindent{\bf 关键词：}}
\newenvironment{cnabstract}{
	\setcounter{page}{1}
	\phantomsection\addcontentsline{toc}{section}{摘\hspace{2em}要}\vspace{20pt}{\cnabstractname}
	\vspace{10pt}}{\newpage}

%% 定义英文摘要环境
\newcommand{\enabstractname}{\centering\bf\zihao{3}ABSTRACT\par}
\providecommand{\keywordsen}{\par\vspace{\baselineskip}\noindent{\bf Keywords：}}
\newenvironment{enabstract}{
	\phantomsection\addcontentsline{toc}{section}{ABSTRACT}\vspace{20pt}{\enabstractname}
	\vspace{10pt}}{\newpage}

%% 定义致谢环境
\newcommand{\thinkingname}{\centering\bf\zihao{3}致\hspace{2em}谢\par}
\newenvironment{thinking}{
	\vspace{20pt}{\thinkingname}
	\vspace{10pt}\phantomsection\addcontentsline{toc}{section}{致\hspace{2em}谢}}{\newpage}

%% 参考文献相关
\RequirePackage[compress]{cite}
\renewcommand{\refname}{\centerline{参\hspace{1ex}考\hspace{1ex}文\hspace{1ex}献\vspace{-20pt}}}
\newcommand{\upcite}[1]{\textsuperscript{\cite{#1}}} % 自定义新命令\upcite, 使参考文献引用以上标出现



%% 页眉页脚设置
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{
	\fancyhf{} % 清空页眉页脚
	\cfoot{\zihao{5}\thepage}
	\renewcommand{\headrulewidth}{0pt}
}

%% 代码环境设置
\RequirePackage{listings}
\lstset{
	backgroundcolor = \color[rgb]{0.902,0.902,0.902},
	breaklines
}