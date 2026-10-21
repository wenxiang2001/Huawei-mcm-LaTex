# 湖州师范大学 张雄涛 组“华为杯”中国研究生数学建模竞赛 LaTeX 论文模版

![LaTeX](https://img.shields.io/badge/LaTeX-XeLaTeX-blue.svg)
![License](https://img.shields.io/badge/license-MIT-green.svg)
![Platform](<https://img.shields.io/badge/platform-Windows%20%7C%20macOS%20%7C%20Linux%20%7C%20Overleaf-lightgrey.svg>)
![Contest](<https://img.shields.io/badge/Contest-CPGMPC%202026-red.svg>)

啾咪！

本项目是针对 2026年第二十三届“华为杯”中国研究生数学建模竞赛专门定制的 LaTeX 论文排版模版。

模版严格（并非严格，只是看上去还行）基于官方 Word 模板文件《附件3：“华为杯”第二十三届中国研究生数学建模竞赛论文模板.doc》及其 PDF 导出件的技术规范与排版要求逆向制作，并在湖州师范大学论文模版（`Huzhou_University_LaTex`）工程化架构的基础上重构而成，具备**零配置跨平台字体渲染**、**官方高保真封面与摘要**、**大论文原生三线表环境（hznuthreelinetable）** 等核心特性。

<font color="red">一定不要忘记修改参赛对号和队员姓名，还有更重要的是“`figures/cover_logos.png`”里面的主办大学的校徽一定要按照当年的模版改！！！！！！！！！！</font>

---

## 🌟 核心特性

1. **官方格式复刻**：

   - **封面页（第 1 页）**：顶部 4 大官方徽标并排（中国研究生创新实践系列大赛、中国研究生数学建模竞赛会徽、华为官方标志、西安交通大学校徽）；居中呈现官方华文新魏书法标题；开敞式信息横线表（学校、参赛队号、队员姓名 1/2/3 行）；底部居中系列大赛名称与页码 0。
   - **摘要页（第 2 页，评阅起始页）**：包含两行书法体大赛标题、“题 目：……”统一样式、居中三号黑体“摘 要：”、五号宋体紧凑摘要正文与黑体引导“关键词：”。底部居中阿拉伯数字页码 **“1”**。
2. **继承大论文模版原生字体绑定体系**：

   - **100% 本地字体优先**：正文（`simsun.ttc`）、多级标题（`simhei.ttf`）、西文/数字（`times.ttf` 系列）、楷体（`simkai.ttf`）、仿宋（`simfang.ttf`）全部与大论文模版一致，优先从项目内置的 `fonts/` 目录加载，跨平台（macOS / Windows / Linux / Overleaf）开箱即用，无需操作系统安装任何字体。
   - **艺术字免字体依赖**：官方特有的华文新魏书法艺术字标题已提取为 600 DPI 高清矢量位图置于 `figures/`，在任何无华文新魏字体的系统上均能高保真完美渲染，绝无缺字或字体替换变形问题。
3. **大论文原生三线表环境（`hznuthreelinetable`）**：

   - 完整移植大论文模版的规范表格环境 `\begin{hznuthreelinetable}{...}`：顶线/底线 $1.5\,\text{pt}$、栏目线 $0.5\,\text{pt}$、自动设置五号宋体及优化行距；表头使用 `\hznutablehead{...}` 自动加粗居中；整表自动延展至页面版心宽度（`\textwidth`）。
   - 同时内置 `hznulongthreelinetable` 跨页长三线表环境，并提供 `mcmtable` 别名以保持高度兼容。
4. **数模竞赛必备生态集成**：

   - **符号说明表**：提供自适应宽度的专用环境 `notationtable`，支持自动居中与行高调整。
   - **数学环境**：预设 `assumption`（假设）、`definition`（定义）、`theorem`（定理）、`lemma`（引理）、`proof`（证明）等。
   - **流程图与绘图**：内置 TikZ 及常用库（arrows, positioning, shapes, fit 等），支持矢量级流程图绘制。
   - **代码清单**：基于 `listings` 预设 Python 与 MATLAB 语法高亮，解决中文字符注释乱码与等宽对齐问题。
   - **标准参考文献**：集成 BibTeX 国际标准引用环境，支持数字上标引用与作者年份引用。

---

## 📁 目录结构

```text
.
├── huawei-mcm.cls       # 核心文档类文件（华为杯专用样式）
├── main.tex             # 论文主文档（包含完整范例与各章节模板）
├── references.bib       # BibTeX 参考文献数据库
├── figures/             # 官方高清矢量及图元素材
│   ├── cover_logos.png   # 封面顶部 4 大徽标
│   ├── cover_title.png   # 封面 3 行书法全称标题
│   ├── cover_footer.png  # 封面底部书法大赛名称
│   ├── abstract_title.png# 摘要页顶部 2 行书法标题
│   ├── contest-badge.png# 竞赛会徽
│   └── huawei-logo.jpg  # 华为官方标志
├── fonts/               # 跨平台内置中英文字体文件
│   ├── simsun.ttc       # 宋体
│   ├── simhei.ttf       # 黑体
│   ├── simkai.ttf       # 楷体
│   ├── simfang.ttf      # 仿宋
│   └── times*.ttf       # Times New Roman 系列字体
└── README.md            # 本使用说明文档
```

---

## 🚀 快速上手与编译指南

本模版使用 **XeLaTeX** 引擎编译，支持中英文混排及现代 OpenType/TrueType 字体。

### 1. 推荐工作流：VS Code + LaTeX Workshop

1. 安装 VS Code 插件 **LaTeX Workshop**。
2. 打开 `.vscode/settings.json`（或在用户设置中）配置编译工具链为 `xelatex -> bibtex -> xelatex*2`：

```json
"latex-workshop.latex.recipes": [
  {
    "name": "XeLaTeX -> BibTeX -> XeLaTeX*2",
    "tools": ["xelatex", "bibtex", "xelatex", "xelatex"]
  }
],
"latex-workshop.latex.tools": [
  {
    "name": "xelatex",
    "command": "xelatex",
    "args": ["-synctex=1", "-interaction=nonstopmode", "-file-line-error", "%DOC%"]
  },
  {
    "name": "bibtex",
    "command": "bibtex",
    "args": ["%DOCFILE%"]
  }
]
```

3. 打开 `main.tex`，按 `Ctrl+Alt+B`（macOS: `Cmd+Option+B`）即可一键编译并双向同步预览。

### 2. TeXStudio / TeXworks

- 打开 TeXStudio 设置（Options -> Configure TeXstudio -> Build）：
  - 将 **Default Compiler**（默认编译器）修改为 `XeLaTeX`。
  - 将 **Default Bibliography Tool** 修改为 `BibTeX`。
- 按 `F5`（Build & View）即可完成编译。

### 3. 命令行编译

进入项目根目录，依次执行以下命令：

```bash
# 完整编译流水线（包含参考文献解析）
xelatex -interaction=nonstopmode main.tex
bibtex main
xelatex -interaction=nonstopmode main.tex
xelatex -interaction=nonstopmode main.tex
```

或者直接使用 `latexmk`：

```bash
latexmk -xelatex main.tex
```

## ✍️ 模版使用与配置说明

### 1. 基本信息填写

在 `main.tex` 头部指定文档选项与队伍信息：

```latex
% 默认常规版本（含第 1 页官方完整封面）：
\documentclass{huawei-mcm}

% 提交评审盲审版本（自动去除第 1 页封面，直接以摘要页作为第 1 页）：
% \documentclass[anonymous]{huawei-mcm}

% 队伍信息（仅在非匿名模式下显示于第 1 页开敞表格）：
\school{湖州师范大学}
\teamid{202610347001}
\memberA{张\quad 三}
\memberB{李\quad 四}
\memberC{王\quad 五}

% 赛题论文题目：
\title{面向新型智能电网动态负载均衡与碳减排优化的数学建模与求解}
```

### 2. 生成封面与摘要

```latex
\begin{document}

% 生成第一页封面（[anonymous] 模式下会自动忽略）
\makecover

% 关键词需在摘要前或摘要内声明
\keywords{智能电网；多目标规划；粒子群优化算法；鲁棒优化；碳配额约束}

% 摘要正文（严格建议控制在 800~1200 字，恰好占满第二页整页）
\begin{abstract}
随着能源绿色转型与“双碳”战略目标的推进……

\textbf{针对问题一}，……

\textbf{针对问题二}，……

\textbf{针对问题三}，……
\end{abstract}

% 摘要结束后，正文自动分页
```

### 3. 三线表使用（`hznuthreelinetable`）

完全采用湖州师范大学 LaTeX 大论文模版规范的三线表语法：

```latex
\begin{table}[htbp]
  \centering
  \caption{不同调度模式下全天运行性能量化对比}
  \label{tab:overall-perf}
  \begin{hznuthreelinetable}{ccccc}
    \toprule
    \hznutablehead{调度策略} & \hznutablehead{总成本 (万元)} & \hznutablehead{碳排放量 ($\mathrm{t}$)} & \hznutablehead{弃风弃光率 (\%)} & \hznutablehead{负荷峰谷差 (MW)} \\
    \midrule
    基准固定出力策略   & 284.6 & 1642.3 & 14.8 & 62.4 \\
    传统单一经济调度   & 251.2 & 1518.7 & 9.3  & 55.1 \\
    仅考虑储能调度     & 245.8 & 1482.0 & 6.1  & 43.8 \\
    \textbf{本文综合模型（膝点解）} & \textbf{242.5} & \textbf{1290.8} & \textbf{3.8}  & \textbf{34.2} \\
    \bottomrule
  \end{hznuthreelinetable}
\end{table}
```

### 4. 符号说明表 (`notationtable`)

数模论文中推荐在引言或模型假设后定义统一符号表：

```latex
\begin{notationtable}{主要符号物理定义与单位说明}
  $P_{i,t}^{G}$     & 节点 $i$ 的火电机组在 $t$ 时段的有功出力功率 & $\mathrm{MW}$ \\
  $E_{k,t}$         & 储能电站 $k$ 在 $t$ 时段末的荷电状态（SOC） & $\mathrm{MWh}$ \\
  $\lambda_{\mathrm{carbon}}$ & 碳排放权市场实时交易基准价格 & 元/$\mathrm{t}$ \\
\end{notationtable}
```

### 5. 代码与附录环境 (`\appendix`)

竞赛要求支撑材料或源码列于附录。使用 `\appendix` 之后，小节将自动变为“附录 A”、“附录 B”编号：

```latex
\appendix
\section{支撑材料与核心数据文件清单}
...
\section{主要优化求解算法 Python 源代码}
\begin{lstlisting}[language=Python, caption={自适应差分进化优化算法主程序}]
import numpy as np

def fitness_objective(x, load_demand, carbon_quota):
    cost = np.sum(0.5 * x**2 + 20 * x)
    return cost
\end{lstlisting}
```

---

## 📄 开源许可证

本项目遵循 [MIT License](LICENSE) 许可协议。祝愿参赛队伍在“华为杯”中国研究生数学建模竞赛中斩获全国一等奖及华为专项奖！
我想说点什么，你就当我说过了吧
