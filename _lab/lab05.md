---
layout: lab
num: lab05
ready: true
desc: "MIPS Calling Convention"
assigned: 2018-02-22 08:00:00.00-7
due: 2018-02-23 23:59:59.00-7
---
<h1>Lab 5: MIPS Calling Convention</h1>
<hr>
<p>Due Friday, February 23 at 11:59:59 PM</p>

<h2>Goals for This Week</h2>
<p>By the time you have completed this work, you should be able to:</p>
<ul>
  <li>Call a predefined function properly, using the MIPS calling convention</li>
  <li>Define your own functions, in accordance with the MIPS calling convention</li>
</ul>

<b>Provided files:</b>
<ul>
  <li><a href="functions.asm"><code>functions.asm</code></a></li>
  <li><a href="functions_testing_stub.asm"><code>functions_testing_stub.asm</code></a></li>
  <li><a href="functions_tester.pl"><code>functions_tester.pl</code></a></li>
  <li><a href="iterative_max.asm"><code>iterative_max.asm</code></a></li>
  <li><a href="iterative_max_testing_stub.asm"><code>iterative_max_testing_stub.asm</code></a></li>
  <li><a href="iterative_max_tester.pl"><code>iterative_max_tester.pl</code></a></li>
  <li><a href="partner.txt"><code>partner.txt</code></a></li>
</ul>

<b>Documentation:</b>
<ul>
  <li><a href="../documentation/MIPS_reference_card.pdf">MIPS Reference Card</a></li>
  <li><a href="../documentation/spim.pdf">SPIM Manual</a></li>
  <li><a href="../documentation/mips_instruction_policy.html">Grading Policies Regarding MIPS Assembly Instructions</a></li>
  <li><a href="../documentation/calling_convention/calling_convention.html">MIPS Calling Convention</a></li>
</ul>

<hr>
<h2>Step by Step Instructions</h2>
<p>
  You will perform two tasks for this week, some with multiple steps.
  You may complete them in any order, though it is recommended to start with Task 1, as Task 2 assumes you already understand Task 1.
  The tasks are listed below:
</p>

<ul>
  <li>Task 1: <a href="index.html#print_reverse">Implement the <code>PrintReverse</code> Function</a></li>
  <li>Task 2: <a href="index.html#iterative_max">Implement the <code>IterativeMax</code> Function</a></li>
</ul>

<p>
  You may use any MIPS instructions or psuedoinstructions you want in order to implement these tasks.
  However, you will be somewhat restricted on exams.
  You may want to read the <a href="../documentation/mips_instruction_policy.html">grading policies regarding MIPS assembly instructions</a> for more information.
</p>

<p>
  Both of these tasks require you to follow the <a href="../documentation/calling_convention/calling_convention.html">MIPS calling convention</a>.
  <b>Be sure to actually follow the calling convention; solutions which do not follow the MIPS calling convention will receive no credit!</b>
</p>
  
<p>
  The initial step below describes how to get the files you will need into the appropriate place.
</p>

<h3>Initial Step: Create a Directory for This Lab and Copy Over the Files</h3>
<p>After you log in, go into your <code>cs64</code> directory that you created last time:</p>
<pre>
cd cs64
</pre>
<p>Then create a new directory for this lab: <code>lab5</code>:</p>
<pre>
mkdir lab4
</pre>
<p>Then go into that directory.</p>
<p>Now copy over all of the files necessary for this week's tasks:</p>
<pre>
cp ~zmatni/public_html/cs64w18/labs/5/functions.asm ~zmatni/public_html/cs64w18/labs/5/functions_testing_stub.asm ~zmatni/public_html/cs64w18/labs/5/functions_tester.pl ~zmatni/public_html/cs64w18/labs/5/iterative_max.asm ~zmatni/public_html/cs64w18/labs/5/iterative_max_testing_stub.asm ~zmatni/public_html/cs64w18/labs/5/iterative_max_tester.pl ~zmatni/public_html/cs64w18/labs/5/partner.txt .
</pre>
<p>
  Note the use of the trailing <code>.</code> in the above command, which stipulates that the specified files should be copied into the current directory.
</p>

<h2><a id="print_reverse">Task 1: Implement the <code>PrintReverse</code> Function</a></h2>
<p>
  For this task, you will implement the <code>PrintReverse</code> function in <code>functions.asm</code> using the MIPS calling convention.
  <code>PrintReverse</code> takes two arguments:
</p>
<ol>
  <li>The address of an array of word-long (four byte) signed integers, held in <code>$a0</code>.</li>
  <li>The length of the array as an unsigned integer, held in <code>$a1</code>.</li>
</ol>
<p>
  The function should print the provided array in reverse order.
  For example, if given:
</p>
<pre>1 2 3</pre>
<p>...the function should print:</p>
<pre>3 2 1</pre>
<p>
  In addition to printing out the elements in reverse order, you must call another <b>provided</b> function named <code>ConventionCheck</code> each time you print out an element.
  <b>Do not implement <code>ConventionCheck</code> youself, or modify it in any way.</b>
  On our end, we are going to use our own version of <code>ConventionCheck</code> while grading, so the only assumptions you can make about <code>ConventionCheck</code> are that it will follow the MIPS calling convention.
</p>
<p>
  While we provide an array in the file, your code should work on any arbitrary array.
  On our end, for testing purposes we will use different arrays, so your code should work with any other valid (non-empty) array.
</p>
<p>The <code>main</code> function provided in <code>functions.asm</code> calls <code>PrintReverse</code> on your behalf, and it will display the contents of the array in non-reversed order <b>before and after</b> calling <code>PrintReverse</code>.</p>
<p>
  Your output should have the format shown below.
  Note that the specific numbers used in the output differ from the numbers in your file; the important part is not what the absolute numbers are, but that the resulting output displays the numbers properly with respect to the particular input.
  The first two lines and the last line are generated by the <code>main</code> function, so you do not have to implement anything to print those portions out.
  The lines containing the words &ldquo;<code>Convention Check</code>&rdquo; are produced by the <code>ConventionCheck</code> function you must call after printing each input.
  To help clarify which output you need to produce and which output is produced for you, output you <b>must</b> produce is marked in <b>bold</b>.
</p>
<pre>
Current Array:
0 1 -1 5 32 6 -66 33 12 58 -4 64 
<b>64</b>
Convention Check
<b>-4</b>
Convention Check
<b>58</b>
Convention Check
<b>12</b>
Convention Check
<b>33</b>
Convention Check
<b>-66</b>
Convention Check
<b>6</b>
Convention Check
<b>32</b>
Convention Check
<b>5</b>
Convention Check
<b>-1</b>
Convention Check
<b>1</b>
Convention Check
<b>0</b>
Convention Check
0 1 -1 5 32 6 -66 33 12 58 -4 64
</pre>

<p>
  Remember to follow the MIPS calling convention while implementing your <code>PrintReverse</code> function.
  Otherwise, the program may <b>crash hard</b>, and will receive <b>no credit</b>.
</p>

<p>
  <b>Hint:</b> Use &ldquo;<code>jal label</code>&rdquo; to call other functions, replacing <code>label</code> with the name of the function you want to call.
  For example, if you want to call the <code>ConventionCheck</code> function, then you ultimately need to use the following code snippet:
</p>
<pre>
jal ConventionCheck
</pre>
<p>
  In order to test your code, you may use the provided <code>functions_tester.pl</code> script on <code>csil</code>, like so:
</p>
<pre>
./functions_tester.pl
</pre>

<h2><a id="iterative_max">Task 2: Implement the <code>IterativeMax</code> Function</a></h2>
<p>
  In this task, you will implement the <code>IterativeMax</code> function in <code>iterative_max.asm</code> using the MIPS calling convention.
  <code>IterativeMax</code> take two arguments:
</p>
<ol>
  <li>The address of an array of word-long (four byte) signed integers, held in <code>$a0</code>.</li>
  <li>The length of the array as an unsigned integer, held in <code>$a1</code>.</li>
</ol>
<p>
  The main purpose of the function is to determine which element of the provided array is the largest (i.e., the maximum element in the array).
  This is achieved by going through the array one element at a time.
  On each element, the function should do the following, in order:
</p>
<ol>
  <li>Print out the current element of the array</li>
  <li>
    Determine what the new maximal element of the array is so far.
    For example, if the old maximum was <code>5</code> and <code>7</code> was just observed in the array, then the maximum should be set to <code>7</code>.
  </li>
  <li>Print out the new maximum element of the array so far (after setting the new maximum in the previous step)</li>
  <li>Call the <code>ConventionCheck</code> function, to help make sure the proper MIPS calling convention is being followed</li>
</ol>
<p>
  <b>Do not implement <code>ConventionCheck</code> youself, or modify it in any way.</b>
  On our end, we are going to use our own version of <code>ConventionCheck</code> while grading, so the only assumptions you can make about <code>ConventionCheck</code> are that it will follow the MIPS calling convention.
</p>
<p>
  While we provide an array in the file, your code should work on any arbitrary array.
  On our end, for testing purposes we will use different arrays, so your code should work with any other valid (non-empty) array.
</p>
<p>The <code>main</code> function provided in <code>iterative_max.asm</code> calls <code>IterativeMax</code> on your behalf, and it will display the contents of the array in non-reversed order <b>before and after</b> calling <code>IterativeMax</code>.</p>
<p>
  Your output should have the format shown below.
  Note that the specific numbers used in the output differ from the numbers in your file; the important part is not what the absolute numbers are, but that the resulting output displays the numbers properly with respect to the particular input.
  The first two lines and the last line are generated by the <code>main</code> function, so you do not have to implement anything to print those portions out.
  The lines containing the words &ldquo;<code>Convention Check</code>&rdquo; are produced by the <code>ConventionCheck</code> function you must call after printing each input.
  To help clarify which output you need to produce and which output is produced for you, output you <b>must</b> produce is marked in <b>bold</b>.
</p>
<pre>
Current Array:
0 1 -1 5 32 6 -66 33 12 58 -4 64 
<b>0</b>
<b>0</b>
Convention Check
<b>1</b>
<b>1</b>
Convention Check
<b>-1</b>
<b>1</b>
Convention Check
<b>5</b>
<b>5</b>
Convention Check
<b>32</b>
<b>32</b>
Convention Check
<b>6</b>
<b>32</b>
Convention Check
<b>-66</b>
<b>32</b>
Convention Check
<b>33</b>
<b>33</b>
Convention Check
<b>12</b>
<b>33</b>
Convention Check
<b>58</b>
<b>58</b>
Convention Check
<b>-4</b>
<b>58</b>
Convention Check
<b>64</b>
<b>64</b>
Convention Check
0 1 -1 5 32 6 -66 33 12 58 -4 64
</pre>

<p>
  Remember to follow the MIPS calling convention while implementing your <code>IterativeMax</code> function.
  Otherwise, the program may <b>crash hard</b>, and will receive <b>no credit</b>.
</p>

<p>
  You may assume that the provided array will always be non-empty.
  That is, it is guaranteed that the provided array will always contain at least one element.
</p>

<p>
  Some <b>hints</b> follow, which you may or may not find useful:
</p>
<ul>
  <li>
    One way of initializing things is to set the initial maximum to the first element of the array, and then iterate over the array starting from the second element.
    However, this would require some extra steps in order to get the same output as above.
    As such, a simpler strategy may be to set the initial value to the most negative possible signed integer, and start iterating from the first element.
    As the array is guaranteed to contain at least one element, this is safe; the only way this most negative possible signed integer could be returned is if the array contains only this element.
  </li>
  <li>
    <p>
      Use &ldquo;<code>jal label</code>&rdquo; to call other functions, replacing <code>label</code> with the name of the function you want to call.
      For example, if you want to call the <code>ConventionCheck</code> function, then you ultimately need to use the following code snippet:
    </p>
<pre>
jal ConventionCheck
</pre>
  </li>
</ul>
  
<p>
  In order to test your code, you may use the provided <code>iterative_max_tester.pl</code> script on <code>csil</code>, like so:
</p>
<pre>
./iterative_max_tester.pl
</pre>

<h2>Turn in Everything Using <code>turnin</code></h2>
<p>
  <b>If you partnered with someone, record the email address they are using for the class in <code>partner.txt</code>.</b>
  For example, if your partner had the email address <a href="foo@bar.com">foo@bar.com</a>, then the contents of <code>partner.txt</code> should be the following (and <b>only</b> the following):
</p>
<pre>
Partner: foo@bar.com
</pre>
<p>If you did not partner with anyone, you do not need to (and should not) edit <code>partner.txt</code>.</p>

<p>Assuming you are in the <code>cs64/lab5</code> directory you created at the beginning, you can send in your answers via the following command:</p>
<pre>
turnin lab5@cs64 functions.asm iterative_max.asm partner.txt
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
