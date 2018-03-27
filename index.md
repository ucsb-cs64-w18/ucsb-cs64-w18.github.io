---
title: CS64, Winter 2018, zmatni
---

# {{site.course}}, {{site.quarter}}

<!-- comment -->

<div id="info" data-role="collapsible" data-collapsed="false">
<h2>Course Information</h2>
<ul>
{% for item in site.info %}
<li><a href="{{item.url}}"  data-ajax="false">{{item.title }}</a></li>
{% endfor %}
</ul>
<p><font color="red" size="28"><b>THIS CLASS IS NOW CLOSED.<br/>MATERIAL HERE DOES NOT APPLY TO FUTURE QUARTERS.</b></font></p>
<p>FINAL EXAM IS SET FOR: THURSDAY, MARCH 22nd from 4:00 PM thru 7:00 PM.</p>
</div>

<div data-role="collapsible" data-collapsed="false">
<h2 id="lecture_notes">Lecture Notes and Slides:</h2>
{% include lecnot_table.html %}
</div>

<!--
<div data-role="collapsible" data-collapsed="false">
<h2 id="simplifiedhw">Homework:</h2>
{% include simplifiedhw_table.html %}
</div>
-->

<div data-role="collapsible" data-collapsed="false">
<h2 id="labs">Labs:</h2>
{% include lab_table.html %}
</div>

<!--
<div data-role="collapsible" data-collapsed="false">
<h2 id="exams">Exams</h2>
-->

[comment]: # %include exam_table.html %

<!-- 
</div>
-->
