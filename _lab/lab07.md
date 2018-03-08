---
layout: lab
num: lab07
ready: true
desc: "Combinatorial Logic Design"
assigned: 2018-03-08 08:00:00.00-7
due: 2018-03-09 23:59:59.00-7
---
<h1>Lab 7: Combinatorial Logic Design</h1>
<hr>
<p>Due Friday, March 9 at 11:59:59 PM</p>

<h2>Goals for This Week</h2>
<p>By the time you have completed this work, you should be able to:</p>
<ul>
  <li>Optimize Boolean functions containing <i>don't-cares</i> using Karnaugh maps.</li>
  <li>Draw simple logic circuits on a simulator.</li>
  <li>Create multi-input multiplexers using only 2-input multiplexers.</li>
</ul>

<b>Provided files:</b>
<ul>
  <li><a href="lab7problems.txt"><code>lab7problems.txt</code></a></li>
  <li><a href="partner.txt"><code>partner.txt</code></a></li>
</ul>

<hr>
<h2>Step by Step Instructions</h2>
<p>
  For this week, you will answer more questions involving writing Karnaugh maps, including one which requires reasoning about <i>don't-cares</i>.
  You will also be answering some questions regarding how bigger multiplexers can be designed from smaller multiplexers.
</p>

<p>
  The initial step below describes how to get the files you will need into the appropriate place.
</p>

<h3>Initial Step: Create a Directory for This Lab and Copy Over the Files</h3>
<p>After you log in, go into your <code>cs64</code> directory that you created last time:</p>
<pre>
cd cs64
</pre>
<p>Then create a new directory for this lab: <code>lab7</code>:</p>
<pre>
mkdir lab7
</pre>
<p>Then go into that directory.</p>
<p>Now copy over all of the files necessary for this week's tasks:</p>
<pre>
cp ~zmatni/public_html/cs64/labs/7/lab7problems.txt ~zmatni/public_html/cs64/labs/7/partner.txt .
</pre>
<p>
  Note the use of the trailing <code>.</code> in the above command, which stipulates that the specified files should be copied into the current directory.
</p>

<h2>Answer Questions Regarding Karnaugh Maps and Multiplexers</h2>
<p>
  Answer the questions in the provided <a href="lab7problems.txt"><code>lab7problems.txt</code></a> file.
  Note that it is expected that these questions will take a significant amount of time to answer, so you are not expected to be able to finish by the end of the lab period.
</p>

<h2>Turn in Everything Using <code>turnin</code></h2>
<p>
  <b>If you partnered with someone, record the email address they are using for the class in <code>partner.txt</code>.</b>
  For example, if your partner had the email address <a href="foo@bar.com">foo@bar.com</a>, then the contents of <code>partner.txt</code> should be the following (and <b>only</b> the following):
</p>
<pre>
Partner: foo@bar.com
</pre>
<p>If you did not partner with anyone, you do not need to (and should not) edit <code>partner.txt</code>.</p>

<p>Assuming you are in the <code>cs64/lab7</code> directory you created at the beginning, you can send in your answers <b>with the circuit images</b> via the following command:</p>
<pre>
turnin lab7@cs64 lab7problems.txt lab7_1.jpg lab7_2.jpg lab7mux.jpg partner.txt
</pre>

<p>
  You may turn in the same assignment up to 100 times, which is useful if you are working on it incrementally.
  Note that only the last version you submitted will be graded.
</p>

<p>Even if you did not partner with anyone, you should still turn in <code>partner.txt</code>, which should not have been modified.</p>
    
<hr>
<blockquote>
  <p><font size="1">
  Copyright 2018, Ziad Matni, CS Dept, UC Santa Barbara. Adapted from work by Diana Franklin and Kyle Dewey. Permission to copy for non-commercial, non-profit, educational purposes granted, provided appropriate credit is given;  all other rights reserved.
  </font></p>
</blockquote>
