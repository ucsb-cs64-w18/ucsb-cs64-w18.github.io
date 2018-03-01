---
layout: lab
num: lab06
ready: true
desc: "Intro to Digital Logic"
assigned: 2018-03-01 08:00:00.00-7
due: 2018-03-02 23:59:59.00-7
---
<h1>Lab 6: Digital Design 1</h1>
<hr>
<p>Due Friday, March 2 at 11:59:59 PM</p>

<h2>Goals for This Week</h2>
<p>By the time you have completed this work, you should be able to:</p>
<ul>
  <li>Write out the truth table corresponding to a Boolean function</li>
  <li>Write the truth table in an equivalent sum-of-products form</li>
  <li>Optimize Boolean functions using both Karnaugh maps and Boolean algebra</li>
</ul>

<b>Provided files:</b>
<ul>
  <li><a href="lab6problems.txt"><code>lab6problems.txt</code></a></li>
  <li><a href="partner.txt"><code>partner.txt</code></a></li>
</ul>

<b>Documentation:</b>
<ul>
  <li>Lecture slides for lectures 12 and 13.</li>
</ul>

<hr>
<h2>Step by Step Instructions</h2>
<p>
  For this week, you will answer a series of questions regarding Boolean functions.
  The initial step below describes how to get the files you will need into the appropriate place.
</p>

<h3>Initial Step: Create a Directory for This Lab and Copy Over the Files</h3>
<p>After you log in, go into your <code>cs64</code> directory that you created last time:</p>
<pre>
cd cs64
</pre>
<p>Then create a new directory for this lab: <code>lab6</code>:</p>
<pre>
mkdir lab6
</pre>
<p>Then go into that directory.</p>
<p>Now copy over all of the files necessary for this week's tasks:</p>
<pre>
cp ~zmatni/public_html/cs64w18/labs/6/lab6problems.txt ~zmatni/public_html/cs64w18/labs/6/partner.txt .
</pre>
<p>
  Note the use of the trailing <code>.</code> in the above command, which stipulates that the specified files should be copied into the current directory.
</p>

<h2>Answer Questions Regarding Boolean Functions</h2>
<p>
  Answer the questions in the provided <a href="lab6problems.txt"><code>lab6problems.txt</code></a> file, which all deal with boolean functions.
  With the proper background, it is trivial to turn these functions into actual circuits and hardware.
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

<p>Assuming you are in the <code>cs64/lab6</code> directory you created at the beginning, you can send in your answers via the following command:</p>
<pre>
turnin lab6@cs64 lab6problems.txt partner.txt
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
