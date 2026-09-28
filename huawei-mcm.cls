%% huawei-mcm.cls
%% "华为杯"中国研究生数学建模竞赛 LaTeX 专用论文模版
%% 正文排版完全继承湖州师范大学硕士学位论文 hznu-thesis.cls（ctexbook 体系）
%% 封面与摘要替换为竞赛专用版本
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{huawei-mcm}[2026/09/23 v3.0 Huawei Cup Graduate MCM LaTeX Template]

% --------------------------------------------------
% 1. 选项处理 (Options)
% --------------------------------------------------
\newif\ifhuawei@anonymous
\huawei@anonymousfalse
\DeclareOption{anonymous}{\huawei@anonymoustrue}
\DeclareOption{blind}{\huawei@anonymoustrue}

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessOptions\relax

% 基于 ctexbook（与 hznu-thesis.cls 完全一致的底层架构）
% oneside: 竞赛电子版无需奇偶页区分
% openany: 章节不强制从奇数页开始
\LoadClass[UTF8,zihao=-4,oneside,openany,fontset=none]{ctexbook}

\RequirePackage{iftex}
\ifXeTeX\else
  \ClassError{huawei-mcm}{This class must be compiled with XeLaTeX}{Use: xelatex main.tex}
\fi

% --------------------------------------------------
% 2. 宏包加载 (完全对齐 hznu-thesis.cls 并扩展)
% --------------------------------------------------
\RequirePackage{makecell}
\RequirePackage{geometry}
\RequirePackage{fontspec}
\RequirePackage{xeCJK}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{array}
\RequirePackage{tabularx}
\RequirePackage{longtable}
\RequirePackage{booktabs}
\RequirePackage{multirow}
\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{amsfonts}
\RequirePackage{mathtools}
\RequirePackage{bm}
\RequirePackage{amsthm}
\RequirePackage{caption}
\RequirePackage{subcaption}
\RequirePackage{tocloft}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}
\RequirePackage{enumitem}
\RequirePackage{etoolbox}
\RequirePackage{environ}
\RequirePackage{colortbl}
\RequirePackage{rotating}
\RequirePackage{listings}
\RequirePackage{tikz}
\usetikzlibrary{shapes.geometric, arrows, positioning, fit, backgrounds}
\RequirePackage[numbers,sort&compress,super]{natbib}
\RequirePackage{xeCJKfntef}
\setlength{\ULdepth}{0.35em}
\renewcommand{\ULthickness}{0.8pt}
\RequirePackage[hidelinks]{hyperref}
\setcitestyle{super,open={[},close={]}}
\pdfstringdefDisableCommands{%
  \def\quad{ }%
  \def\qquad{ }%
}

% --------------------------------------------------
% 3. 页面边距（遵照 2026 官方规范：论文不能有页眉，页码位于页脚中部）
% --------------------------------------------------
\geometry{
  a4paper,
  top=2.54cm,
  bottom=2.54cm,
  left=2.54cm,
  right=2.54cm,
  headheight=0pt,
  headsep=0pt,
  footskip=1.0cm
}

% --------------------------------------------------
% 4. 字体设置（完全继承 hznu-thesis.cls，使用 fonts/ 目录）
% --------------------------------------------------
\defaultfontfeatures{Ligatures=TeX}
\setmainfont[
  Path=fonts/,
  UprightFont=times.ttf,
  BoldFont=timesbd.ttf,
  ItalicFont=timesi.ttf,
  BoldItalicFont=timesbi.ttf
]{Times New Roman}
\newfontfamily\hznutimes[
  Path=fonts/,
  UprightFont=times.ttf,
  BoldFont=timesbd.ttf,
  ItalicFont=timesi.ttf,
  BoldItalicFont=timesbi.ttf
]{Times New Roman}

\newcommand{\hznusongboldfactor}{5.0}
\newfontfamily\hznusonglatin[
  Path=fonts/,
  FontIndex=0,
  AutoFakeBold=\hznusongboldfactor
]{simsun.ttc}

\setCJKmainfont[
  Path=fonts/,
  UprightFont=simsun.ttc,
  UprightFeatures={FontIndex=0},
  AutoFakeBold=\hznusongboldfactor,
  ItalicFont=simkai.ttf
]{SimSun}
\setCJKfamilyfont{hznusong}[Path=fonts/,FontIndex=0,AutoFakeBold=\hznusongboldfactor,ItalicFont=simkai.ttf]{simsun.ttc}
\setCJKfamilyfont{hznuhei}[Path=fonts/,AutoFakeBold=2.5]{simhei.ttf}
\setCJKfamilyfont{hznukai}[Path=fonts/,AutoFakeBold=4.0]{simkai.ttf}
\setCJKfamilyfont{hznufang}[Path=fonts/,AutoFakeBold=2.5]{simfang.ttf}
\setCJKmonofont[Path=fonts/,FontIndex=0]{simsun.ttc}

\providecommand{\songti}{}
\providecommand{\heiti}{}
\providecommand{\kaishu}{}
\providecommand{\fangsong}{}
\renewcommand{\songti}{\CJKfamily{hznusong}}
\renewcommand{\heiti}{\CJKfamily{hznuhei}}
\renewcommand{\kaishu}{\CJKfamily{hznukai}}
\renewcommand{\fangsong}{\CJKfamily{hznufang}}
\newcommand{\songticu}{\songti\bfseries}

% --------------------------------------------------
% 5. 正文字体与行距规范（严格遵照 2026 官方格式规范）
% 规范要求：
% 1. 论文题目用三号黑体字
% 2. 一级标题用四号黑体字，并居中
% 3. 论文中其他汉字一律采用小四号宋体字
% 4. 行距用单倍行距
% --------------------------------------------------
\newcommand{\hznulinefactor}{1.0}
\newcommand{\hznubodyfont}{\songti\zihao{-4}\setstretch{\hznulinefactor}}
\newcommand{\setlinespacing}[1]{%
  % 正文与摘要统一行距调控接口（默认单倍行距 1.0）
  \renewcommand{\hznulinefactor}{#1}%
  \renewcommand{\hznubodyfont}{\songti\zihao{-4}\setstretch{#1}}%
  \setstretch{#1}%
}
\newcommand{\hznuchapterfont}{\heiti\bfseries\zihao{4}} % 一级标题用四号黑体字，并居中
\newcommand{\hznusectionfont}{\hznutimes\bfseries\songticu\zihao{-4}}       % 二级标题四号加粗宋体（与三级标题同字体，字号更大）
\newcommand{\hznusubsectionfont}{\hznutimes\bfseries\songticu\zihao{-4}} % 三级标题小四加粗宋体
\newcommand{\hznucaptionfont}{\songti\zihao{-4}}          % 图表题注小四宋体
\newcommand{\hznutablefont}{\songti\zihao{-4}\setstretch{1.0}}
\newcommand{\hznutableheadfont}{\songticu\zihao{-4}\setstretch{1.0}}
\newcommand{\hznutablehead}[1]{{\hznutableheadfont #1}}
\newcommand{\hznutocchapterfont}{\hznutimes\bfseries\songticu\zihao{-4}}

% --------------------------------------------------
% 6. 论文元数据定义 (Metadata)
% --------------------------------------------------
\newcommand{\huawei@title}{论文题目}
\newcommand{\huawei@school}{某某大学}
\newcommand{\huawei@teamid}{1000000000}
\newcommand{\huawei@memberA}{队员甲}
\newcommand{\huawei@memberB}{队员乙}
\newcommand{\huawei@memberC}{队员丙}
\newcommand{\huawei@contestyear}{2026}
\newcommand{\huawei@contestsession}{二十三}

\renewcommand{\title}[1]{\gdef\huawei@title{#1}\hypersetup{pdftitle={#1}}}
\newcommand{\school}[1]{\gdef\huawei@school{#1}}
\newcommand{\teamid}[1]{\gdef\huawei@teamid{#1}}
\newcommand{\memberA}[1]{\gdef\huawei@memberA{#1}}
\newcommand{\memberB}[1]{\gdef\huawei@memberB{#1}}
\newcommand{\memberC}[1]{\gdef\huawei@memberC{#1}}
\newcommand{\contestyear}[1]{\gdef\huawei@contestyear{#1}}
\newcommand{\contestsession}[1]{\gdef\huawei@contestsession{#1}}

% --------------------------------------------------
% 7. 多级标题样式（完全继承 hznu-thesis.cls ctexbook 规范）
% 一级标题 \chapter: 小三号粗黑体，居中，位于页面顶部
% 二级标题 \section: 四号粗宋体，居左
% 三级标题 \subsection: 小四号粗宋体，居左
% --------------------------------------------------
\setlength{\parindent}{2em}
\setlength{\parskip}{0pt}
\raggedbottom
\tolerance=2500
\emergencystretch=2.5em
\hbadness=2500

\ctexset{
  chapter={
    name={,},
    number=\arabic{chapter},
    format=\centering\hznuchapterfont, % 2026官方规范：一级标题用四号黑体字，并居中
    aftername=\hspace{1em},
    beforeskip=1.0\baselineskip,
    afterskip=1.0\baselineskip,
    fixskip=true
  },
  section={
    format=\raggedright\hznusectionfont, % 2026官方规范：小四号
    aftername=\hspace{1em},
    beforeskip=0.5\baselineskip,
    afterskip=0.5\baselineskip
  },
  subsection={
    format=\raggedright\hznusubsectionfont, % 2026官方规范：小四号
    aftername=\hspace{1em},
    beforeskip=0.5\baselineskip,
    afterskip=0.5\baselineskip
  }
}

\renewcommand{\contentsname}{目\quad 录}
\renewcommand{\bibname}{参考文献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}

\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{3}

% 目录样式（完全继承 hznu-thesis.cls tocloft 规范）
\renewcommand{\cftchapfont}{\hznutocchapterfont}
\renewcommand{\cftchappagefont}{\hznutimes\bfseries\zihao{-4}}
\renewcommand{\cftsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsecpagefont}{\hznutimes\zihao{-4}}
\renewcommand{\cftsubsecfont}{\songti\zihao{-4}}
\renewcommand{\cftsubsecpagefont}{\hznutimes\zihao{-4}}
\renewcommand{\cftdotsep}{0.6}
\newcommand{\hznulightdotfill}{%
  \leaders\hbox{\hskip 0.005em{\textcolor{black!82}{\normalfont\scalebox{1.18}{.}}}\hskip 0.06em}\hfill
}
\newcommand{\hznutocdarkdotfill}{%
  \leaders\hbox{\hskip 0.005em{\textcolor{black!90}{\normalfont\bfseries\scalebox{1.13}{.}}}\hskip 0.06em}\hfill
}
\newcommand{\hznu@tocpagenum}[2]{%
  \begingroup
  \setlength{\fboxsep}{0pt}%
  \makebox[0pt][r]{\colorbox{white}{\hspace{0.05em}#1 #2}}%
  \endgroup
}
\renewcommand{\cftchapleader}{\hznutocdarkdotfill}
\renewcommand{\cftsecleader}{\hznulightdotfill}
\renewcommand{\cftsubsecleader}{\hznulightdotfill}
\renewcommand{\cftchapfillnum}[1]{%
  {\cftchapleader}\nobreak
  \hznu@tocpagenum{\cftchappagefont}{#1}\cftchapafterpnum\par
}
\renewcommand{\cftsecfillnum}[1]{%
  {\cftsecleader}\nobreak
  \hznu@tocpagenum{\cftsecpagefont}{#1}\cftsecafterpnum\par
}
\renewcommand{\cftsubsecfillnum}[1]{%
  {\cftsubsecleader}\nobreak
  \hznu@tocpagenum{\cftsubsecpagefont}{#1}\cftsubsecafterpnum\par
}
\renewcommand{\cfttoctitlefont}{\hfill\heiti\bfseries\zihao{-3}}
\renewcommand{\cftaftertoctitle}{\hfill}
\setlength{\cftbeforetoctitleskip}{0pt}
\setlength{\cftaftertoctitleskip}{1.0\baselineskip}
\setlength{\cftbeforechapskip}{0pt}
\setlength{\cftbeforesecskip}{0pt}
\setlength{\cftbeforesubsecskip}{0pt}

% --------------------------------------------------
% 8. 页眉页脚（严格遵照 2026 官方格式规范）
% 规范要求：
% 1. “论文不能有页眉”
% 2. “论文从摘要页开始编写页码，页码必须位于每页页脚中部，用阿拉伯数字从‘1’开始连续编号”
% --------------------------------------------------
\fancypagestyle{huawei@front}{
  \fancyhf{}
  \fancyfoot[C]{\hznutimes\zihao{-4}\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{huawei@main}{
  \fancyhf{}
  \fancyfoot[C]{\hznutimes\zihao{-4}\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\fancypagestyle{plain}{
  \fancyhf{}
  \fancyfoot[C]{\hznutimes\zihao{-4}\thepage}
  \renewcommand{\headrulewidth}{0pt}
  \renewcommand{\footrulewidth}{0pt}
}

\pagestyle{huawei@main}

% --------------------------------------------------
% 9. frontmatter / mainmatter / backmatter
% 保持全篇页码从摘要页开始用阿拉伯数字连续编号
% --------------------------------------------------
\renewcommand{\frontmatter}{%
  \clearpage
  \@mainmatterfalse
  \pagenumbering{Roman}%
  \pagestyle{huawei@front}%
  \let\ps@plain\ps@huawei@front
}
\renewcommand{\mainmatter}{%
  \clearpage
  \@mainmattertrue
  \pagenumbering{arabic}%
  \pagestyle{huawei@main}%
  \let\ps@plain\ps@huawei@main
  \hznubodyfont
}
\renewcommand{\backmatter}{%
  \clearpage
  \@mainmatterfalse
  \pagestyle{huawei@main}%
  \let\ps@plain\ps@huawei@main
}

% --------------------------------------------------
% 10. 封面排版命令 (\makecover)
% 严格对齐官方 Word 模版第 1 页
% --------------------------------------------------
\newcommand{\huaweicoverlogowidth}{0.88\textwidth}

\newcommand{\makecover}{%
  \ifhuawei@anonymous
    \typeout{Huawei MCM: Anonymous mode enabled, skipping cover page.}%
  \else
    \begin{titlepage}
      \thispagestyle{empty}
      \begin{center}
        \vspace*{0.5cm}
        % 顶部四大徽标横排
        \IfFileExists{figures/cover_logos.png}{%
          \includegraphics[width=\huaweicoverlogowidth]{figures/cover_logos.png}\par
        }{%
          \vspace*{2.5cm}\par
        }
        \vspace{1.7cm}

        % 竞赛全称书法标题
        \IfFileExists{figures/cover_title.png}{%
          \includegraphics[width=0.78\textwidth]{figures/cover_title.png}\par
        }{%
          {\zihao{-2}\heiti 中国研究生创新实践系列大赛\par}
          \vspace{0.4em}
          {\zihao{2}\heiti\bfseries “华为杯”第\huawei@contestsession 届中国研究生\par}
          \vspace{0.3em}
          {\zihao{2}\heiti\bfseries 数学建模竞赛\par}
        }
        \vspace{1.5cm}

        % 参赛队伍信息表（加粗，紧凑排版，与官方Word一致）
        \bgroup
        \setlength{\tabcolsep}{0pt}
        \setlength{\arrayrulewidth}{0.8pt}
        \renewcommand{\arraystretch}{1.0}
        \begin{tabular}{@{}p{3.2cm}p{11.46cm}@{}}
          \rule{0pt}{6.2ex}{\zihao{3}\songti 学\qquad 校} & \rule{0pt}{8ex}{\zihao{3}\songti \huawei@school} \\[0.5ex]
          \Xhline{1.3pt}
          \rule{0pt}{6.2ex}{\zihao{3}\songti 参赛队号} & \rule{0pt}{9ex}{\zihao{3}\hznutimes \huawei@teamid} \\[0.5ex]
          \Xhline{1.3pt}
          \multirow{3}{*}{\rule{0pt}{4.0ex}{\zihao{3}\songti 队员姓名}}
          & \rule{0pt}{4.5ex}{\zihao{3}\hznutimes\bfseries 1.\hspace{0.8cm}\songti \huawei@memberA} \\[0.3ex] \cline{2-2}
          & \rule{0pt}{4.5ex}{\zihao{3}\hznutimes\bfseries 2.\hspace{0.8cm}\songti \huawei@memberB} \\[0.3ex] \cline{2-2}
          & \rule{0pt}{4.5ex}{\zihao{3}\hznutimes\bfseries 3.\hspace{0.8cm}\songti \huawei@memberC} \\[0.3ex]
          \Xhline{1.3pt}
        \end{tabular}
        \egroup\par

        \vfill
        % 封面页脚
        \IfFileExists{figures/cover_footer.png}{%
          \includegraphics[width=0.55\textwidth]{figures/cover_footer.png}\par
        }{%
          {\zihao{4}\heiti 中国研究生创新实践系列大赛\par}
        }
        \vspace*{-0.6cm}
      \end{center}
    \end{titlepage}
    \clearpage
    \frontmatter
  \fi
}

% --------------------------------------------------
% 11. 摘要页环境 (abstract)
% 属于前置页：无页眉，页脚为罗马数字
% --------------------------------------------------
\newcommand{\huawei@keywords}{}
\newcommand{\keywords}[1]{\gdef\huawei@keywords{#1}}
\newlength{\huawei@titlelabelwidth}

\newenvironment{abstract}{%
  \clearpage
  \begin{center}
    \vspace*{-0.4cm}
    % 摘要页顶部竞赛全称书法标题
    \IfFileExists{figures/abstract_title.png}{%
      \includegraphics[width=0.78\textwidth]{figures/abstract_title.png}\par
    }{%
      {\zihao{2}\heiti\bfseries “华为杯”第\huawei@contestsession 届中国研究生\par}
      \vspace{0.3em}
      {\zihao{2}\heiti\bfseries 数学建模竞赛\par}
    }
  \end{center}
  \vspace{0.8cm}
  % 论文题目（悬挂缩进：第二行起自动与“题  目：”冒号后的题目文字左对齐；题目文字有下划线，“题  目：”无下划线）
  \begingroup
  \setstretch{\hznulinefactor}%
  \settowidth{\huawei@titlelabelwidth}{\zihao{3}\heiti 题\quad 目：}%
  \noindent
  \hangafter=1
  \hangindent=\huawei@titlelabelwidth
  {\zihao{3}\heiti 题\quad 目：}{\zihao{3}\songti\bfseries\CJKunderline{\huawei@title}}\par
  \endgroup
  \vspace{0.8cm}
  % "摘 要："居中
  \begin{center}
    {\zihao{3}\heiti 摘\quad 要：}\par
  \end{center}
  \vspace{0.5em}
  % 摘要正文（与正文共用 \hznulinefactor 参数统一确定行距）
  \songti\zihao{-4}\setstretch{\hznulinefactor}%
}{%
  \par\vspace{0.8cm}
  % 关键词（四号黑体引导，小四宋体内容）
  \noindent{\zihao{4}\heiti 关键词：}{\songti\zihao{-4} \huawei@keywords}\par
  \clearpage
  \hznubodyfont
}

% --------------------------------------------------
% 12. 图表题注格式（与 hznu-thesis.cls 完全一致）
% --------------------------------------------------
\DeclareCaptionFont{hznucaption}{\hznucaptionfont}
\DeclareCaptionFont{hznusubcaption}{\songti\zihao{5}}
\captionsetup{
  font=hznucaption,
  labelfont=hznucaption,
  labelsep=quad,
  justification=centering,
  singlelinecheck=false
}
\captionsetup[figure]{position=bottom,skip=6pt,belowskip=4pt}
\captionsetup[subfigure]{font=hznusubcaption,position=bottom,skip=4pt,belowskip=2pt}
\captionsetup[table]{position=top,skip=6pt,belowskip=4pt}

% --------------------------------------------------
% 13. 三线表（完全继承 hznu-thesis.cls）
% --------------------------------------------------
\setlength{\heavyrulewidth}{1.5pt}
\setlength{\lightrulewidth}{0.5pt}
\setlength{\cmidrulewidth}{0.5pt}
\setlength{\extrarowheight}{0pt}

\newcommand{\hznutablearraystretch}{1.35}
\newcommand{\hznu@threelinetable@setup}{%
  \renewcommand{\arraystretch}{\hznutablearraystretch}%
  \setlength{\aboverulesep}{0.35ex}%
  \setlength{\belowrulesep}{0.55ex}%
}

\AtBeginEnvironment{table}{%
  \hznutablefont
  \hznu@threelinetable@setup
}

\newsavebox{\hznu@threelinebox}
\newenvironment{hznuthreelinetable}[1]{%
  \begin{lrbox}{\hznu@threelinebox}%
  \hznu@threelinetable@setup
  \begin{tabular*}{1.00\textwidth}{@{\hspace{0.8em}\extracolsep{\fill}}#1@{\hspace{0.8em}}}
}{%
  \end{tabular*}%
  \end{lrbox}%
  \noindent\makebox[\textwidth][c]{\usebox{\hznu@threelinebox}}%
}

% 跨页长三线表
\newenvironment{hznulongthreelinetable}[4]{%
  \begingroup
  \hznutablefont
  \hznu@threelinetable@setup
  \setlength{\LTleft}{0pt plus 1fill}%
  \setlength{\LTright}{0pt plus 1fill}%
  \setlength{\LTpre}{0pt}%
  \setlength{\LTpost}{0pt}%
  \begin{longtable}{@{\hspace{0.8em}}#3@{\hspace{0.8em}}}
  \caption{#1}\label{#2}\\
  \toprule
  #4\\
  \midrule
  \endfirsthead
  \caption[]{（续）}\\
  \toprule
  #4\\
  \midrule
  \endhead
  \bottomrule
  \endfoot
  \bottomrule
  \endlastfoot
}{%
  \end{longtable}%
  \endgroup
}

% 兼容别名
\newenvironment{mcmtable}[1]{\begin{hznuthreelinetable}{#1}}{\end{hznuthreelinetable}}

% 符号说明专用表环境
\newenvironment{notationtable}[2][\textwidth]{%
  \begin{table}[htbp]
    \centering
    \hznutablefont
    \caption{#2}
    \label{tab:notations}
    \begin{hznuthreelinetable}{m{2.8cm}<{\centering} m{7.6cm}<{\raggedright} m{2.0cm}<{\centering}}
      \toprule
      \hznutablehead{符号} & \hznutablehead{含义说明} & \hznutablehead{单位} \\
      \midrule
}{%
      \bottomrule
    \end{hznuthreelinetable}
  \end{table}
}

% --------------------------------------------------
% 14. 公式编号按章节（与 hznu-thesis.cls 一致）
% --------------------------------------------------
\numberwithin{equation}{chapter}

% --------------------------------------------------
% 15. 列表格式
% --------------------------------------------------
\setlist{nosep}
\setlist[enumerate,1]{label=\arabic*.,leftmargin=2em,itemindent=0pt}
\setlist[itemize,1]{leftmargin=2em}

% --------------------------------------------------
% 16. 数学定理环境
% --------------------------------------------------
\theoremstyle{definition}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{example}{算例}[chapter]
\newtheorem{algorithm_item}{算法}[chapter]

% --------------------------------------------------
% 17. 插图清单、附表清单、缩略词表（继承 hznu-thesis.cls 规范）
% --------------------------------------------------

% 图标和表标前缀（用于插图/附表清单）
\renewcommand{\cftfigpresnum}{图\ }
\renewcommand{\cfttabpresnum}{表\ }
\renewcommand{\cftfigleader}{\hznulightdotfill}
\renewcommand{\cfttableader}{\hznulightdotfill}
\setlength{\cftfignumwidth}{3.5em}
\setlength{\cfttabnumwidth}{3.5em}

% 行距、缩进与字体样式（与目录 TOC 保持严格一致）
\setlength{\cftfigindent}{0pt}
\setlength{\cfttabindent}{0pt}
\setlength{\cftbeforefigskip}{0pt}
\setlength{\cftbeforetabskip}{0pt}
\renewcommand{\cftfigfont}{\songti\zihao{-4}}
\renewcommand{\cfttabfont}{\songti\zihao{-4}}
\renewcommand{\cftfigpagefont}{\hznutimes\zihao{-4}}
\renewcommand{\cfttabpagefont}{\hznutimes\zihao{-4}}

\renewcommand{\cftfigfillnum}[1]{%
  {\cftfigleader}\nobreak
  \hznu@tocpagenum{\cftfigpagefont}{#1}\cftfigafterpnum\par
}
\renewcommand{\cfttabfillnum}[1]{%
  {\cfttableader}\nobreak
  \hznu@tocpagenum{\cfttabpagefont}{#1}\cfttabafterpnum\par
}

\newcommand{\makefigureslist}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{插图清单}%
  \renewcommand{\listfigurename}{插图清单}%
  \begingroup
    \renewcommand*{\addvspace}[1]{}%
    \listoffigures
  \endgroup
  \clearpage
}
\newcommand{\maketableslist}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{附表清单}%
  \renewcommand{\listtablename}{附表清单}%
  \begingroup
    \renewcommand*{\addvspace}[1]{}%
    \listoftables
  \endgroup
  \clearpage
}

% 插图/附表清单标题样式
\renewcommand{\cftloftitlefont}{\hfill\heiti\bfseries\zihao{-3}}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftlottitlefont}{\hfill\heiti\bfseries\zihao{-3}}
\renewcommand{\cftafterlottitle}{\hfill}
\setlength{\cftbeforeloftitleskip}{0pt}
\setlength{\cftafterloftitleskip}{1.0\baselineskip}
\setlength{\cftbeforelottitleskip}{0pt}
\setlength{\cftafterlottitleskip}{1.0\baselineskip}

% 缩略词表（继承 hznu-thesis.cls abbreviations 环境）
\newcommand{\hznutableabbrevarraystretch}{2.0}
\newenvironment{abbreviations}{%
  \clearpage
  \phantomsection
  \addcontentsline{toc}{chapter}{缩略词表}%
  \chapter*{缩略词表}%
  \songti\zihao{-4}\setstretch{\hznulinefactor}%
  \renewcommand{\hznutablearraystretch}{\hznutableabbrevarraystretch}%
  \begin{hznuthreelinetable}{%
    >{\centering\arraybackslash\hznutimes}p{0.16\textwidth}%
    >{\centering\arraybackslash\hznutimes}p{0.46\textwidth}%
    >{\centering\arraybackslash\songti}p{0.24\textwidth}%
  }
  \toprule
  \hznutablehead{缩略词} & \hznutablehead{英文全称} & \hznutablehead{中文全称}\\
  \midrule
}{%
  \bottomrule
  \end{hznuthreelinetable}
  \clearpage
}

% --------------------------------------------------
% 18. 附录（使用 \beginappendices 命令触发）
% --------------------------------------------------
\newcommand{\beginappendices}{%
  \appendix
  \ctexset{
    chapter={
      name={附录,},
      number=\Alph{chapter},
      aftername=\quad
    }
  }
}

% --------------------------------------------------
% 18. 参考文献样式（严格遵照 2026 官方规范：小四宋体，单倍行距）
% --------------------------------------------------
\renewcommand{\bibfont}{\songti\zihao{-4}\setstretch{1.0}}
\setlength{\bibsep}{0pt}
\renewcommand{\bibsection}{%
  \chapter*{\bibname}%
  \addcontentsline{toc}{chapter}{\bibname}%
  \markboth{\bibname}{\bibname}%
}
\bibliographystyle{gbt7714-numerical}

% --------------------------------------------------
% 19. 代码高亮（mcmstyle）
% --------------------------------------------------
\definecolor{codegreen}{rgb}{0.13,0.55,0.13}
\definecolor{codegray}{rgb}{0.45,0.45,0.45}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{codeblue}{rgb}{0.05,0.25,0.75}
\definecolor{backcolour}{rgb}{0.97,0.97,0.98}

\lstdefinestyle{mcmstyle}{
  backgroundcolor=\color{backcolour},
  commentstyle=\color{codegreen}\kaishu,
  keywordstyle=\color{codeblue}\bfseries,
  numberstyle=\tiny\color{codegray}\hznutimes,
  stringstyle=\color{codepurple},
  basicstyle=\ttfamily\zihao{-5}\setstretch{1.05},
  breakatwhitespace=false,
  breaklines=true,
  captionpos=b,
  keepspaces=true,
  numbers=left,
  numbersep=8pt,
  showspaces=false,
  showstringspaces=false,
  showtabs=false,
  tabsize=2,
  frame=lines,
  rulecolor=\color{black!20}
}
\lstset{style=mcmstyle}

% --------------------------------------------------
% 20. AtBeginDocument 初始化（与 hznu-thesis.cls 一致）
% --------------------------------------------------
\AtBeginDocument{%
  \hznubodyfont
  \hypersetup{
    pdfcreator={XeLaTeX with huawei-mcm class},
    pdfsubject={“华为杯”中国研究生数学建模竞赛}%
  }%
  % 防止 ctex+tocloft 交互导致目录标题("目 录")出现在目录条目里
  % 将 \tableofcontents 包装，使其执行期间的 \addcontentsline 无效
  \let\huawei@orig@tableofcontents\tableofcontents
  \renewcommand{\tableofcontents}{%
    \begingroup
      \let\addcontentsline\@gobblethree
      \huawei@orig@tableofcontents
    \endgroup
  }%
}

\endinput
