<h1 style="font-weight:normal"> 
  R ggplot2 Templates
</h1>

[![Status](https://img.shields.io/badge/status-active-success.svg)]() [![GitHub Issues](https://img.shields.io/github/issues/wjsutton/ggplot2_snippets.svg)](https://github.com/wjsutton/ggplot2_snippets/issues) [![GitHub Pull Requests](https://img.shields.io/github/issues-pr/wjsutton/ggplot2_snippets.svg)](https://github.com/wjsutton/ggplot2_snippets/pulls) [![License](https://img.shields.io/badge/license-MIT-blue.svg)](/LICENSE)

A collection of R ggplot2 templates including a clean and easy to update theme and data labels, inspired by https://www.r-graph-gallery.com/

[Twitter][Twitter] :speech_balloon:&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[LinkedIn][LinkedIn] :necktie:&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[GitHub :octocat:][GitHub]&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;[Website][Website] :link:

<!--/div-->

<!--
Quick Link 
-->

[Twitter]:https://twitter.com/WJSutton12
[LinkedIn]:https://www.linkedin.com/in/will-sutton-14711627/
[GitHub]:https://github.com/wjsutton
[Website]:https://wjsutton.github.io/


<details>
  <summary><strong>Table of Contents</strong> (click to expand)</summary>

<!-- toc -->
- [Bar Charts](https://github.com/wjsutton/ggplot2_snippets#bar-charts)
- [Line Charts](https://github.com/wjsutton/ggplot2_snippets#line-charts)
- [Gantt Charts](https://github.com/wjsutton/ggplot2_snippets#gantt-charts)
- [Voronoi Charts](https://github.com/wjsutton/ggplot2_snippets#voronoi-charts)
- [Tips & Tricks](https://github.com/wjsutton/ggplot2_snippets#tips-&-tricks)
- [To Do](https://github.com/wjsutton/ggplot2_snippets#to-do)
<!-- tocstop -->

</details>

## Bar Charts 

Vertical Bar Chart             |  Vertical Bar Chart with Legend			|  Stacked Vertical Bar Chart 	|
:-------------------------:|:-------------------------:|:-------------------------:|
[Code](bar_charts/vertical_bar_chart_plot.R)             |  [Code](bar_charts/vertical_bar_chart_plot_with_legend.R)  			|  [Code](bar_charts/vertical_stacked_bar_chart_plot_with_legend.R) 	|
![](images/vertical_bar_chart.png)  |  ![](images/vertical_bar_chart_with_legend.png)	|	![](images/stacked_vertical_bar_chart.png)	|

Horizontal Bar Chart             |  Horizontal Bar Chart with Legend			|  Stacked Horizontal Bar Chart 	|
:-------------------------:|:-------------------------:|:-------------------------:|
[Code](bar_charts/horizontal_bar_chart_plot.R)             |  [Code](bar_charts/horizontal_bar_chart_plot_with_legend.R)  			|  [Code](bar_charts/horizontal_stacked_bar_chart_plot_with_legend.R) 	|
![](images/horizontal_bar_chart.png)  |  ![](images/horizontal_bar_chart_with_legend.png)	|	![](images/stacked_horizontal_bar_chart.png)	|

Ridge Bar Chart             |  Another Chart			|  Another Chart 	|
:-------------------------:|:-------------------------:|:-------------------------:|
[Code](bar_charts/ridge_bar_chart_plot.R)           |  [Coming Soon]  			|  [Coming Soon] 	|
![](images/ridge_bar_chart.png)  |  ![](images/coming_soon.png)	|	![](images/coming_soon.png)	|



## Line Charts 

Single Line Chart             |  Multiple Line Chart			|  Animated Line Chart 	|
:-------------------------:|:-------------------------:|:-------------------------:|
[Code](line_charts/line_chart_single_plot.R)             |  [Code](line_charts/line_chart_multiple_plot.R)  			|  [Code](line_charts/animated_line_chart_plot.R)  	|
![](images/line_chart_single.png)  |  ![](images/line_chart_multiple.png)	|	![](images/percentage_of_your_life_america_has_been_at_war.gif)	|

Ridge Line Chart             |  Stacked Area Chart		|  Small Multiples (Line) 	|
:-------------------------:|:-------------------------:|:-------------------------:|
[Code](line_charts/ridge_line_chart_plot.R)           |  [Code](line_charts/stacked_area_chart_plot.R)  			|  [Code](line_charts/line_chart_small_multiples.R) 	|
![](images/ridge_line_chart.png)  |   ![](images/stacked_area_chart.png)	|	![](images/line_chart_small_multiples.png)	|

## Gantt Charts

<p align="center">
  <img src="images/simple_gantt.png">
</p>

**Code**: click [here](bar_charts/simple_gantt_chart_plot.R)


## Voronoi Charts 

<p align="center">
  <img src="images/football_voronoi_20_speed_compressed.gif">
</p>

**Code**: click [here](voronoi_charts/README_FOOTBALL_VORONOI.md)

## Tips & Tricks

Custom Categorical Legend             |  Glow Effect			|  Another Tip 	|
:-------------------------:|:-------------------------:|:-------------------------:|
[Code](tips_and_tricks/custom_cat_legend.R)           |  [Code](tips_and_tricks/glow_effect.R) 			|  [Coming Soon] 	|
![](images/custom_cat_legend.png)  |  ![](images/glow_effect.png)	|	![](images/coming_soon.png)	|


## To Do

- [ ] Map as a ridgeline plot: [https://www.reddit.com/r/dataisbeautiful/comments/gmuzxz/oc_ridgeline_world_map/](https://www.reddit.com/r/dataisbeautiful/comments/gmuzxz/oc_ridgeline_world_map/)
