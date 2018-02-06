---
layout: lab
num: lab04
ready: true
desc: "MIPS Memory Usage with Loops"
assigned: 2018-02-08 08:00:00.00-7
due: 2018-02-09 23:59:59.00-7
---
<h1>Lab 4: MIPS Memory Usage with Loops</h1>
<hr>
<p>Due Friday, February 9 at 11:59:59 PM</p>

<h2>Goals for This Week</h2>
<p>By the time you have completed this work, you should be able to:</p>
<ul>
  <li>Use basic memory operations in MIPS assembly</li>
  <li>Write simple loops in MIPS assembly</li>
</ul>

<b>Provided files:</b>
<ul>
  <li><a href="lab4funcs.asm"><code>lab4funcs.asm</code></a></li>
  <li><a href="swap_array.asm"><code>swap_array.asm</code></a></li>
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
  There are two tasks that you need to complete for this week, some with multiple steps.
  Strictly speaking, you may complete them in any order, though for this lab it is recommended to go in order.
  The tasks are listed below:
</p>

<ul>
  <li>Task 1: Basic Memory Operations</a></li>
  <li>Task 2: Swapping Array Contents</a></li>
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
<p>Then create a new directory for this lab: <code>lab4</code>:</p>
<pre>
mkdir lab4
</pre>
<p>Then go into that directory.</p>
<p>Now copy over all of the files necessary for this week's tasks:</p>
<pre>
cp ~zmatni/public_html/cs64w18/labs/4/lab4funcs.asm ~zmatni/public_html/cs64w18/labs/4/swap_array.asm ~zmatni/public_html/cs64w18/labs/4/partner.txt .
</pre>
<p>
  Note the use of the trailing <code>.</code> in the above command, which stipulates that the specified files should be copied into the current directory.
</p>

<h2><a id="memory">Task 1: Basic Memory Operations</a></h2>
<p>
  This tutorial is a sequence of memory operations, each slightly harder than the last one.
  In order to allow us to produce different test cases, the main code is separate from your code.
  We will supply a different main file depending on what we want the initial values to be.
</p>

<h3>Step 1: Familiarize Yourself With the Code</h3>
<p>
  Because it is assembly, it is a little hard to get a high-level sense of what you are being asked to do.
  Open the file <code>lab4funcs.asm</code>.
  The first thing to look at is the global variables, declared in the <code>.data</code> section.
  There are four global integers: <code>globalA</code>, <code>globalB</code>, <code>globalC</code>, and <code>globalD</code>.
  Then there is an array: <code>myArray</code>.
  These are the variables you will be working with this week.
</p>
<p>
  Now look at the code in <code>lab4funcs.asm</code>, particularly the functions (i.e., <code>storevalues</code>, <code>storeregvalues</code>, <code>copyvalues</code>, <code>operations</code>, <code>arrays</code>, and <code>arraycalcs</code>).
  There are a number of functions you need to fill in.
  We have not gone over how to properly call functions yet, so you might not know how to do all the steps necessary to write a function.
  As such, for this portion, you are restricted to use only certain registers (more on why this makes sense later in the class).
  Each function uses a different restricted set; for example, with <code>storevalues</code>, only registers <code>$v0 - $v1</code>, <code>$t0 - $t7</code>, and <code>$a0 - $a3</code> may be used.
  Some of the functions receive input; any input received will be in registers <code>$a0 - $a3</code>.
  Additionally, the last line of each function may not be removed (which is always <code>jr $ra</code>).
</p>
<p>
  Now look at the lines of code in comments.
  For each function, there are some lines of code written in high-level language.
  Translating those to assembly is your task.
  A description of function inputs, along with C-like code describing what the function does, is supplied in the table below.
  Like C, semicolon (<code>;</code>) should be viewed as a sequencing operator, meaning the statements should be performed in order, and previous statements can influence the results of later statements.
  For example, with <code>operations</code>, the second use of <code>globalA</code> refers to the value of <code>globalA</code> set in the previous line.
</p>
<p>
  Your code should <b>not</b> trigger a processor-level exception if overflow occurs.
  With MIPS, this means that you should use the <code>addu</code> instruction instead of the <code>add</code> instruction for adding numbers together.
</p>
<table border="1">
  <tr>
    <th>Function Name</th>
    <th>Function Number</th>
    <th>Input</th>
    <th>Description</th>
  </tr>
  <tr>
    <td><code>storevalues</code></td>
    <td><code>0</code></td>
    <td><b>None</b></td>
    <td>
<pre>
globalA = 6;
globalB = 6;
globalC = 30;
globalD = 30;
</pre>
    </td>
  </tr>
  <tr>
    <td><code>storeregvalues</code></td>
    <td><code>1</code></td>
    <td>
      <ul>
        <li><code>$a0</code>: New value for <code>globalA</code></li>
        <li><code>$a1</code>: New value for <code>globalB</code></li>
        <li><code>$a2</code>: New value for <code>globalC</code></li>
        <li><code>$a3</code>: New value for <code>globalD</code></li>
      </ul>
    </td>
    <td>
<pre>
globalA = $a0;
globalB = $a1;
globalC = $a2;
globalD = $a3;
</pre>
    </td>
  </tr>
  <tr>
    <td><code>copyvalues</code></td>
    <td><code>2</code></td>
    <td><b>None</b></td>
    <td>
<pre>
globalA = globalC;
globalD = globalB;
</pre>
    </td>
  </tr>
  <tr>
    <td><code>operations</code></td>
    <td><code>3</code></td>
    <td><b>None</b></td>
    <td>
<pre>
globalA = globalB + globalC;
globalD = globalA + globalB;
</pre>
    </td>
  </tr>
  <tr>
    <td><code>arrays</code></td>
    <td><code>4</code></td>
    <td>
      <ul>
        <li><code>$a0</code>: The new value of <code>myArray[0]</code></li>
        <li><code>$a1</code>: The new value of <code>myArray[1]</code></li>
      </ul>
    </td>
    <td>
<pre>
myArray[2] = globalA;
globalA = myArray[3];
myArray[0] = $a0;
myArray[1] = $a1;
</pre>
    </td>
  </tr>
  <tr>
    <td><code>arraycalcs</code></td>
    <td><code>5</code></td>
    <td><b>None</b></td>
    <td>
<pre>
globalA = myArray[0] + myArray[1];
</pre>
    </td>
  </tr>
</table>

<p>
  The code is also equipped with a <code>main</code> function, which calls the functions you will be writing.
  Each run of the program calls a single function.
  The name of the function to execute is specified with a number, supplied by the user.
  The table above specifies which number executes which function (e.g., a user-supplied <code>1</code> will call <code>storeregvalues</code>).
  The <code>main</code> function prints out the global variables and the first four array values before and after every function call, and, depending on the function selected, may also print out registers <code>$a0 - $a3</code>. 
</p>
<p>
  For example, below is a sample run testing <code>storevalues</code>, which is function number <code>0</code> from the preceding table.
  User input is shown in <b>bold</b>.
</p>
<pre>
This program loads, stores, and operates on variables
Looking at the comments in the code, perform the operations specified.  Make sure you make changes to this code in order to test it.
You can change the initial values of variables as well as the inputs you test.
Global variable values are: 35, 39, 54, 90
Array values are: 537067794, 537002737, 269156513, 7032874
Enter a value: <b>0</b>
0
Global variable values are: 6, 6, 30, 30
Array values are: 537067794, 537002737, 269156513, 7032874
</pre>

<p>
  As an aside, you may have noticed something a bit odd about the memory layout here: we have declared <code>globalA</code> and other global mutable variables in the <code>.data</code> section, whereas in class we discussed that global mutable variables should be in the <code>.bss</code> section.
  The reason why is specific to limitations of SPIM; on a real processor, these should be separated out.
</p>
<h3>Step 2: Implement the Functions</h3>
<p>
  Look for the words <code>&ldquo;TODO&rdquo;</code> in the file.
  (If you are using <code>vi</code>, you can search for those words by using <code>&ldquo;/TODO&rdquo;</code>.)
  Make sure you test often.
  After implementing each function, make sure you run it using the supplied <code>main</code> function.
</p>
<p>
  <b>Make sure your code does not depend on initial values.</b>
  Remember that the program we run it on will have different global declarations.
</p>

<h3><a id="overflow">A Note About <code>add</code>/<code>addi</code> versus <code>addu</code>/<code>addiu</code></a></h3>
<p>
  Recall that <code>add</code>/<code>addi</code> will raise a processor-level exception (for the purposes of this class, a fatal error) in the event that the addition sets the overflow bit.
  In contrast, <code>addu</code>/<code>addiu</code> (where &ldquo;<code>u</code>&rdquo; is short for &ldquo;unsigned&rdquo;) will still set the overflow bit, but they will ignore its value.
  The behavior of <code>add</code>/<code>addi</code> makes sense if we are dealing with signed numbers in two's complement, and the behavior of <code>addu</code>/<code>addiu</code> makes sense if we are dealing with unsigned numbers, which do not have a concept of overflow (that is, it's impossible to get a result of an incorrect sign in a context where everything is implicitly either zero or positive).
</p>
<p>
  The above distinction is important when dealing with memory.
  Memory addresses are inherently unsigned; there is no such thing as a negative address.
  As such, when you manipulate memory addresses (as you would need to do in order to translate <code>myArray[x]</code> to MIPS assembly), you should be using <code>addu</code>/<code>addiu</code>, <b>not</b> <code>add</code>/<code>addi</code>.
  The signed variants (<code>add</code>/<code>addi</code>) will often produce the same result, but if we start dealing with very large addresses, then suddenly the processor might experience an overflow error in a nonsensical context.
</p>
<p>
  It is quite possible, and even common, to need to have <i>both</i> the signed and unsigned variants of <code>add</code> in the same program.
  For example, consider the following snippet of C-like code, where semantically we should provide an error if signed integer overflow occurs:
</p>
<pre>
int* arr = ...; // initialize arr to some valid value      
int temp = arr[x] + arr[y];
</pre>
<p>
  In the above snippet of code, we would need the unsigned variants of <code>add</code> (that is, <code>addu</code>/<code>addiu</code>) in order to grab both <code>arr[x]</code> and <code>arr[y]</code>.
  However, in order to perform the addition itself (that is, <code>+</code>), we need to use the signed variant of <code>add</code> (that is, <code>add</code>/<code>addi</code>).
  To help clarify this, keep in mind that <code>arr[x]</code> is shorthand for <code>*(arr + x)</code>, where <code>arr</code> is a pointer (it holds a memory address).
  As such, <code>arr + x</code> is adding together items of types <code>int*</code> (a pointer) and <code>x</code> (an unsigned integer), which denotes the calculation of a new memory address.
  As this is a calculation for a memory address, and memory addresses are unsigned, we use <code>addu</code>/<code>addiu</code>.
  However, for the addition that takes place in the original code (that is, <code>arr[x] <b>+</b> arr[y]</code>), this is adding together two values of type <code>int</code>, a signed integer.
  As such, in this case, we are dealing with signed integer arithmetic, hence we use <code>add</code>/<code>addi</code> for this addition.
</p>

<h2><a id="swap">Task 2: Swapping Array Contents</a></h2>
<p>
  In this task, you will swap values around from within an array.
  In order to allow us to produce different test cases, the main code is separate from your code.
  We will supply a different main file depending on what we want the initial values to be.
</p>

<h3>Step 1: Familiarize Yourself With the Code</h3>
<p>
  Open the file <code>swap_array.asm</code>.
  In the <code>.data</code> section, a number of prompts have been defined, along with an array named <code>myArray</code> which you will modify the contents of.
  In the <code>.text</code> section, some code for running tests is in place, along with a function stub named <code>doSwap</code>, which you will define.
  As with the previous task, we have not discussed functions yet, and so this might be a little confusing.
  The restrictions are that you may only use registers <code>$v0 - $v1</code>, <code>$t0 - $t7</code>, and <code>$a0 - $a3</code>.
  Additionally, the last line of each function may not be removed (which is always <code>jr $ra</code>).
</p>

<h3>Step 2: Implement <code>doSwap</code></h3>
<p>
  Now look at the stub for <code>doSwap</code>, which contains a snippet of C code in the comments which you must implement.
  This snippet is duplicated below for convenience:
</p>
<pre>
unsigned int x = 0;
unsigned int y = 8;

while (x != 4) {
  int temp = myArray[x];
  myArray[x] = myArray[y];
  myArray[y] = temp;
  x++;
  y--;
}
</pre>
<p>
  Your assembly code must do the same thing as the above C code.
  <b>Make sure your code does not depend on initial values.</b>
  While you may assume that <code>myArray</code> will always contain exactly 9 elements, you can make no assumptions regarding what values these are.
  Remember that the program we run it on will have different global declarations.
</p>
<p>
  In addition, <a href="index.html#overflow">the point made regarding the practical distinction between <code>add</code>/<code>addi</code> and <code>addu</code>/<code>addiu</code></a> in the previous task is still relevant for this task.
  Correct implementations <b>must</b> utilize <b>both</b> forms, and in the proper manner (that is, <code>addu</code>/<code>addiu</code> for memory addresses and other unsigned things, and <code>add</code>/<code>addi</code> for signed values).
</p>
<p>
  For testing, the code in <code>main</code> will ultimately use your <code>doSwap</code> implementation, and it features a built-in correctness check.
  If you would like to test on other array contents, feel free to change the values of <code>myArray</code> (keeping sure to keep it exactly 9 elements long).
  If you do change the values in <code>myArray</code>, be sure to also change the corresponding values in <code>expectedMyArray</code>, which holds what the result should be.
  When it comes to your implementation, do <b>not</b> simply programmatically copy the values in <code>expectedMyArray</code> into <code>myArray</code>; while this will appear to work on your end, on our end the values in <code>expectedMyArray</code> will not sync up with <code>myArray</code> as it does in your code, so this would end up always giving the wrong result on our end.
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

<p>Assuming you are in the <code>cs64/lab4</code> directory you created at the beginning, you can send in your answers via the following command:</p>
<pre>
turnin lab4@cs64 lab4funcs.asm swap_array.asm partner.txt
</pre>
<p>
  You may turn in the same assignment up to 100 times, which is useful if you are working on it incrementally.
  Note that only the last version you submitted will be graded.
</p>

<p>Even if you did not partner with anyone, you should still turn in <code>partner.txt</code>, which should not have been modified.</p>

<blockquote>
  <p><font size="1">
  Copyright 2018, Ziad Matni, CS Dept, UC Santa Barbara. Adapted from work by Diana Franklin and Kyle Dewey. Permission to copy for non-commercial, non-profit, educational purposes granted, provided appropriate credit is given;  all other rights reserved.
  </font></p>
</blockquote>
