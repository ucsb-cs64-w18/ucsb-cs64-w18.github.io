---
layout: lab
num: lab03
ready: true
desc: "MIPS Control Instructions"
assigned: 2018-02-01 08:00:00.00-7
due: 2018-02-02 23:59:59.00-7
---
<h1>Lab 3: MIPS Control Instructions</h1>
<hr>
<p>Due Friday, February 2 at 11:59:59 PM</p>

<h2>Goals for This Week</h2>
<p>By the time you have completed this work, you should be able to:</p>
<ul>
  <li>Use basic arithmetic and control instructions in MIPS assembly</li>
  <li>Write simple loops in MIPS assembly</li>
</ul>

<b>Provided files:</b>
<ul>
  <li><a href="MedianNumbers.asm"><code>MedianNumbers.asm</code></a></li>
  <li><a href="task1_tester.pl"><code>task1_tester.pl</code></a></li>
  <li><a href="factorial.asm"><code>factorial.asm</code></a></li>
  <li><a href="task2_tester.pl"><code>task2_tester.pl</code></a></li>
  <li><a href="partner.txt"><code>partner.txt</code></a></li>
</ul>

<b>Documentation:</b>
<ul>
  <li><a href="../documentation/MIPS_reference_card.pdf">MIPS Reference Card</a></li>
  <li><a href="../documentation/spim.pdf">SPIM Manual</a></li>
  <li><a href="../documentation/mips_instruction_policy.html">Grading Policies Regarding MIPS Assembly Instructions</a></li>
</ul>

<hr>
<h2>Step by Step Instructions</h2>
<p>
  There are three tasks that you need to complete for this week, some with multiple steps.
  Strictly speaking, you may complete them in any order, though for this lab it is recommended to go in order.
  The tasks are listed below:
</p>

<ul>
  <li>Task 1: <a href="index.html#control">Control Operations</a></li>
  <li>Task 2: <a href="index.html#loops">Basic Loops</a></li>
</ul>

<p>
  You may use any MIPS instructions or psuedoinstructions you want in order to implement these tasks.
  However, you will be somewhat restricted on exams.
  You may want to read the <a href="../../documentation/mips_instruction_policy.html">grading policies regarding MIPS assembly instructions</a> for more information.
</p>

<p>
  The initial step below describes how to get the files you will need into the appropriate place.
  These files are used for all the different tasks.
</p>

<h3>Initial Step: Create a Directory for This Lab and Copy Over the Files</h3>
<p>After you log in, go into your <code>cs64</code> directory that you created last time:</p>
<pre>
cd cs64
</pre>
<p>Then create a new directory for this lab: <code>lab3</code>:</p>
<pre>
mkdir lab3
</pre>
<p>Then go into that directory.</p>
<p>Now copy over all of the files necessary for this week's tasks:</p>
<pre>
cp ~zmatni/public_html/cs64w17/labs/3/MedianNumbers.asm ~zmatni/public_html/cs64w17/labs/3/task1_tester.pl ~zmatni/public_html/cs64w17/labs/3/factorial.asm ~zmatni/public_html/cs64w17/labs/3/task2_tester.pl ~zmatni/public_html/cs64w17/labs/3/partner.txt .
</pre>
<p>
  Note the use of the trailing <code>.</code> in the above command, which stipulates that the specified files should be copied into the current directory.
</p>

  
<h2><a id="control">Task 1: Control Operations</a></h2>
<p>
  This task requires you to use branches in MIPS assembly.
  To this end, you will write a MIPS program which will ask the user for three numbers and then print out the median.
  A sample run of this program will look like this, with user input in <b>bold</b>:
</p>
<pre>
Enter the next number:
<b>3</b>
Enter the next number:
<b>5</b>
Enter the next number:
<b>-13</b>
Median: 3
</pre>
<p>
  Your code should be written in the provided <code>MedianNumbers.asm</code> template file.
  Be sure that your output matches <i>exactly</i> with the output above.
</p>
<p>
  Note that you do not need to use a complex sorting algorithm because you are only comparing exactly 3 numbers, not some arbitrary number of numbers.
  A good development strategy here is to write a small program in C that will behave the same way as the program above, and to test it out.
  From there, it can be ported to assembly, which should be simpler than directly writing in assembly (considering that you are just starting to write in assembly).
  Try to write as simple of C code as possible, as ultimately any complexity in C will almost certainly translate to complexity in assembly.
</p>
<p>
  For your convenience, we have provided a handful of test cases for you.
  These can be run from the CSIL machines with the following command:
</p>
<pre>
./task1_tester.pl
</pre>
<p>
  The provided test cases are hardly complete; you are encouraged to add your own test cases and perform your own testing.
</p>

<h2><a id="loops">Task 2: Basic Loops</a></h2>
<p>
  This task requires you to write a basic loop in MIPS assembly.
  To this end, you will implement the <a href="https://en.wikipedia.org/wiki/Factorial">factorial function</a> iteratively (i.e., <b>without</b> using recursion), which will take as an input some number gathered from the user.
  The factorial function will print out <b>all</b> the partial products as they are encountered, along with the final result.
  Each of the printed out numbers should be followed by a newline.
  Pseudocode showing how to do this is shown below:
</p>
<pre>
n = &lt;&lt;user input&gt;&gt;
accum = 1
while (n != 0) {
  accum = accum * n
  print accum
  print &ldquo;\n&rdquo;
  n = n - 1
}
print accum
print &ldquo;\n&rdquo;
</pre>
<p>
  A sample run of the program on input <code>1</code> is shown below, with user input in <b>bold</b>:
</p>
<pre>
Enter the number:
<b>1</b>
1
1
</pre>
<p>
  A second run of this program on input <code>0</code> is shown below, with user input in <b>bold</b>:
</p>
<pre>
Enter the number:
<b>0</b>
1
</pre>
<p>
  A third run of this program on input <code>5</code> is shown below, with user input in <b>bold</b>:
</p>
<pre>
Enter the number:
<b>5</b>
5
20
60
120
120
120
</pre>
<p>
  You should write your program in the provided <code>factorial.asm</code> template file.
</p>
<p>
  For full credit, your solution's output <b>must</b> match the above output <i>exactly</i>.
  Additionally, while you may write your own algorithm to do this, it must be <b>iterative</b>; that is, you may <b>not</b> use recursion.
  You may assume that the user will only input non-negative numbers, and that no multiplication will lead to overflow.
  You will be working only with unsigned integers for this task.
</p>
<p>
  For your convenience, we have provided a handful of test cases for you.
  These can be run from the CSIL machines with the following command:
</p>
<pre>
./task2_tester.pl
</pre>
<p>
  The provided test cases are hardly complete; you are encouraged to add your own test cases and perform your own testing.
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

<p>Assuming you are in the <code>cs64/lab3</code> directory you created at the beginning, you can send in your answers via the following command:</p>
<pre>
turnin lab3@cs64 MedianNumbers.asm factorial.asm partner.txt
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
