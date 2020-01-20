---
layout: lab
num: lab02
ready: true
desc: "Binary Arithmetic, Bitwise Operators, and MIPS"
assigned: 2018-01-24 08:00:00.00-7
due: 2018-01-29 23:59:59.00-7
---
<h1>Lab 2: Binary Arithmetic, Bitwise Operators, and MIPS</h1>
<hr>
<p>Due Monday, January 29 at 11:59:59 PM</p>
<p>Note that this due date is a little longer than usual (it is a long lab!)</p>

<h2>Goals for This Week</h2>
<p>By the time you have completed this work, you should be able to:</p>
<ul>
 <li>Add and subtract binary numbers with ease</li>
 <li>Identify when overflow and/or carry bits are produced</li>
 <li>Perform bitwise operations</li>
 <li>Know <i>when</i> and <i>how</i> you use bitwise operators in high-level code</li>
 <li>Get an introduction to MIPS and the <a href="http://spimsimulator.sourceforge.net/">QtSpim simulator</a></li>
</ul>

<b>Provided files:</b>
<ul>
 <li><a href="lab2problems.txt"><code>lab2problems.txt</code></a></li>
 <li><a href="RandomCode.h"><code>RandomCode.h</code></a></li>
 <li><a href="RandomCode.c"><code>RandomCode.c</code></a></li>
 <li><a href="RandomMain.c"><code>RandomMain.c</code></a></li>
 <li><a href="RandomCodeTester.c"><code>RandomCodeTester.c</code></a></li>
 <li><a href="DecodeCode.h"><code>DecodeCode.h</code></a></li>
 <li><a href="DecodeCode.c"><code>DecodeCode.c</code></a></li>
 <li><a href="DecodeMain.c"><code>DecodeMain.c</code></a></li>
 <li><a href="DecodeCodeTester.c"><code>DecodeCodeTester.c</code></a></li>
 <li><a href="spimtutorial.txt"><code>spimtutorial.txt</code></a></li>
 <li><a href="mipsdemo.asm"><code>mipsdemo.asm</code></a></li>
 <li><a href="partner.txt"><code>partner.txt</code></a></li>
</ul>

<b>Documentation:</b>
<ul>
 <li><a href="./documentation/MIPS_reference_card.pdf">MIPS Reference Card</a></li>
 <li><a href="./documentation/spim.pdf">SPIM Manual</a></li>
 <li><a href="./documentation/mips_instruction_policy.html">Grading Policies Regarding MIPS Assembly Instructions</a></li>
</ul>

<hr>
<h2>Step by Step Instructions</h2>
<p>
 There are four tasks that you need to complete for this week, each with multiple steps.
 You may complete them in any order, though you should start with the task you feel you will have the most questions on.
 The tasks are listed below:
</p>

<ul>
 <li>Task 1: Binary Addition and Bit-Level Operations</li>
 <li>Task 2: Bitwise Operations in C</li>
 <li>Task 3: QtSpim Tutorial</li>
</ul>

<p>
 The initial step below describes how to get the files you will need into the appropriate place.
 These files are used for all the different tasks.
</p>

<h3>Initial Step: Create a Directory for This Lab and Copy Over the Files</h3>
<p>After you log in, go into your <code>cs64</code> directory that you created last time:</p>
<pre>
cd cs64
</pre>
<p>Then create a new directory for this lab: <code>lab2</code>:</p>
<pre>
mkdir lab2
</pre>
<p>Then go into that directory.</p>
<p>Now copy over all of the files necessary for this week's tasks: '</p>
<pre>
cp ~zmatni/public_html/cs64w18/labs/2/*.txt ~zmatni/public_html/cs64w18/labs/2/*.h ~zmatni/public_html/cs64w18/labs/2/*.c ~zmatni/public_html/cs64w18/labs/2/mipsdemo.asm ~zmatni/public_html/cs64w18/labs/2/partner.txt ~zmatni/public_html/cs64w18/resources/QtSpim .
</pre>      
<p>
 Note the use of the trailing <code>.</code> in the above command, which stipulates that the specified files should be copied into the current directory.
 Also note the use of a glob (<code>*</code>), which specifies that all files of a given form should be chosen (e.g., <code>*.txt</code> stipulates all files that end in <code>.txt</code>).
</p>

<p>
 Now you need to decide what task to begin in lab.
 If you understand binary addition and bitwise operators, it is recommended to begin with task 2 or 3.
 If you want extra practice with those concepts, you should start with task 1.
</p>

<h2><a id="addition">Task 1: Binary Addition and Bit-Level Operations</a></h2>
<p>This task entails answering a series of questions focused on bit-level operations.</p>
<p>Open the file <a href="lab2problems.txt">lab2problems.txt</a> using an editor and answer the questions, just as with Lab 1.</p>

<h2><a id="random">Task 2: Bitwise Operations in C/C++</a></h2>
<p>
 In this task, you will write some random code as well as useful code that appears in a common MIPS processor simulator.</p>

<h3>Step 1: Familiarizing Yourself With the Files and Compilation Process</h3>
<p>
 There should be three files in your directory starting with the word <code>Random</code>.
 List just those files:
</p>
<pre>
ls Random*
</pre>
<p>
 Those three files contain a single program.
 If you have not taken CS24 before, you might not know how this works.
 <code>RandomCode.h</code> contains the <i>prototypes</i> for the functions you are going to implement.
 <code>RandomCode.c</code> contains the <i>definitions</i> or implementations of those functions.
 That is where you are going to add your code.
 I have also provided a handy test file with which you can test your code.
 This is <code>RandomMain.c</code>.
</p>
<p>
 The way this works is that after the usual #include files, there is a line:
</p>
<pre>
#include "RandomCode.h"
</pre>
<p>
 This tells <code>RandomMain.c</code> to read in <code>RandomCode.h</code> for the function prototypes.
 This allows us to compile them separately.
 To compile them, do the following:
</p>
<pre>
gcc RandomCode.c RandomMain.c
</pre>
<p>Another way you could do this, utilizing the <code>*</code> to avoid typing as much, is:</p>
<pre>
gcc Random*.c
</pre>

<h3>Step 2: Implementing Bit-Level Manipulation Routines</h3>
<p>
 <b>You will only be turning in <code>RandomCode.c</code></b> - we are going to provide the <code>.h</code> file and any test files for our test cases.
 I have provided the main so that you can test your files individually.
 Make sure you <b>do not edit <code>RandomCode.h</code></b>.
 If you edit that file, then your solution will not work with our test cases.
</p>

<p>
 Your assignment is to look at the functions in <code>RandomCode.c</code> and fill in the several lines necessary for each one.
 Each one should perform a series of bitwise operations (usually just one) on an integer, and return the resulting integer.
 The functions are roughly ordered easiest to hardest.
 The idea is to take  what you understand about bitwise operations and apply it to high-level code.
</p>
<p>
 You should use <b>only</b> bitwise operations, <b>except</b> for the following functions where you may also use <code>if</code>:
</p>
<ul>
 <li><code>ifBit7is0</code></li>
 <li><code>ifBit3is1</code></li>
 <li><code>signedBits0through5</code></li>
 <li><code>signedBits6through9</code></li>
</ul>
<p>
 For the <code>if</code> functions, you may need to utilize the fact that in C, &ldquo;true&rdquo; is non-zero and &ldquo;false&rdquo; is zero.
 So this means that if you want to return true, you can return any number other than 0.
 For the functions that return signed results, be sure that sign extension is performed!
</p>
<p>
 Here is a little sample to see how it might look.
 This does not match the main code provided for you - this is for illustrative purposes in the description only.
</p>
<table border="1">
 <tr><th>Function</th><th>Input</th><th>Output</th></tr>
 <tr><td><code>multiplyBy8</code></td><td><code>7</code></td><td><code>56</code></td></tr>
 <tr><td><code>setBit6to1</code></td><td><code>0x01</code></td><td><code>0x41</code></td></tr>
 <tr><td><code>setBit3to0</code></td><td><code>0xffff</code></td><td><code>0xfff7</code></td></tr>
 <tr><td><code>flipBit5</code></td><td><code>0x01</code></td><td><code>0x21</code></td></tr>
 <tr><td><code>ifBit7is0</code></td><td><code>0x77</code></td><td><code>nonzero</code></td></tr>
 <tr><td><code>ifBit3is1</code></td><td><code>0x77</code></td><td><code>0</code></td></tr>
 <tr><td><code>unsignedBits0through5</code></td><td><code>0x335</code></td><td><code>0x35</code></td></tr>
 <tr><td><code>unsignedBits6through9</code></td><td><code>0x3b4</code></td><td><code>0xe</code></td></tr>
 <tr><td><code>signedBits0through5</code></td><td><code>0x3fa</code></td><td><code>0xfffffffa</code></td></tr>
 <tr><td><code>signedBits6through9</code></td><td><code>0xcf7</code></td><td><code>0x03</code></td></tr>
 <tr><td><code>signedBits0through5</code></td><td><code>0x38f</code></td><td><code>0xf</code></td></tr>
 <tr><td><code>signedBits6through9</code></td><td><code>0x38f</code></td><td><code>0xfffffffe</code></td></tr>
 <tr><td><code>setBits4through9</code></td><td>(<code>0xffffffff</code>, <code>0x23</code>)</td><td><code>0xfffffe3f</code></td></tr>
</table>
<p>
 The function that needs the most explanation is <code>setBits4through9</code>.
 You can think of this as replacing bits 4-9 (inclusive) with the second input's lowest bits.
 Leave the rest of the input's bits unchanged.
</p>
<p>
 Any extracted bits should be returned in the lowest bits of the return value.
 For example, in <code>unsignedBits6through9</code>, if bits <code>0110</code> were extracted from the value, then <code>0110</code> with 28 leading zeros should be returned (we are working with 32-bit integers).
</p>
<p>
 Specifically for this portion, we have also provided <code>RandomCodeTester.c</code>, which contains a small test suite which may be of interest to you.
 Instructions for compiling with the test suite, along with running it, are directly in <code>RandomCodeTester.c</code>.
 Note that this is <b>not</b> intended as a comprehensive test suite, but is instead there to make sure you are on the right track.
 You are encouraged to add your own tests to this suite.
</p>

<h3>Step 3: Instruction Decoding</h3>
<p>
 Now you are ready to use bitwise operators to do something useful as a programmer.
 Processor simulators are used to evaluate implementation ideas long before processors are fabricated.
 These simulators read in  compiled programs and execute them, performing the functions and reporting performance statistics for the theoretical processor.
 They are written in high-level languages such as C and C++.
</p>
<p>
 You are going to write one function in <code>DecodeCode.c</code> - a function that divides an instruction into its parts.
 An instruction is a single 32-bit value in which many smaller values have been packed together.
 The instruction format is in your textbook.
 You do not need to read any of the text around it - all we care about is extracting fields <code>opcode</code>, <code>rs</code>, <code>rt</code>, <code>rd</code>, <code>immediate</code>, and <code>funct</code> (function code).
 Bit positions are expressed in an inclusive manner (e.g., bits 0 - 5 mean that all 6 bits are in the field).
</p>
<p>
 You can look at your code that you wrote in <code>RandomCode.c</code> - this will be very useful to you.
 Fill in the lines of code in <code>DecodeCode.c</code> that extract each set of bits.
 Be mindful of whether it wants the answer expressed as a signed integer or  an unsigned integer.
</p>
<ul>
 <li><code>funct</code>: bits 0-5 (unsigned)</li>
 <li><code>immediate</code>: bits 0-15 (signed)</li>
 <li><code>rd</code>: bits 11-15 (unsigned)</li>
 <li><code>rt</code>: bits 16-20 (unsigned)</li>
 <li><code>rs</code>: bits 21-25 (unsigned)</li>
 <li><code>opcode</code>: bits 26-31 (unsigned)</li>
</ul>

<p>
 The setup for this task is similar to the last one.
 I have provided three files, only one of which you will turn in.
 You are free to edit either <code>.c</code> file, but you may not change the <code>.h</code> file (for if you do, it will not compile when it gets turned in).
</p>
<p>Once again, list the files you will be using.</p>
<pre>ls Decode*</pre>
<p>You should see three files: <code>DecodeCode.c</code>, <code>DecodeCode.h</code>, and <code>DecodeMain.c</code>.</p>
<p>To compile this code, you do the following:</p>
<pre>
gcc DecodeCode.c DecodeMain.c
</pre>
<p>Another way you could do this, utilizing the <code>*</code> to avoid typing as much, is:
<pre>
gcc Decode*.c
</pre>
<p>Now you are ready to fill in the code!  Edit <code>DecodeCode.c</code>.</p>
<p>
 Remember that you are only allowed to use bitwise operations to extract bits.
 You may not use multiplication or division.
 You may use an <code>if</code> statement for signed operations.
</p>
<p>
 Specifically for this portion, we have also provided <code>DecodeCodeTester.c</code>, which contains a small test suite which may be of interest to you.
 Instructions for compiling with the test suite, along with running it, are directly in <code>DecodeCodeTester.c</code>.
 In addition, <code>DecodeMain.c</code> contains code for testing with more tests; see <code>DecodeMain.c</code> for details.
 Note that this is <b>not</b> intended as a comprehensive test suite, but is instead there to make sure you are on the right track.
 You are encouraged to add your own tests to this suite.
</p>

<h2><a id="spimtutorial">Task 3: QtSpim Tutorial</a></h2> 
<p>
 You are now ready for MIPS!
 We will use a simulator <a href="http://spimsimulator.sourceforge.net/"><code>QtSpim</code></a> to run our MIPS programs in this class.

 For this task, you will need to fill out the <a href="spimtutorial.txt"><code>spimtutorial.txt</code></a> questions.
 You may want to take a look at these questions before you start running the simulator, just to get a handle on exactly what it is you will need to learn.
</p>

<h3>Step 1: Get QtSpim</h3>
<p>
 Assuming you are on one of the lab machines, then you might need to copy over QtSpim from <code>csil</code>. Check this out first and see if you can run QtSpim from the lab machine. Otherwise, to copy it over, do what is shown below, but substitute <code>username</code> with your username:
</p>
<pre>
scp username@csil-01.cs.ucsb.edu:/usr/bin/QtSpim .
&lt;&lt;enter password at the prompt&gt;&gt;
</pre>

<p>
 In case you have an issue with the above command, a version of <code>QtSpim</code> can also be copied directly from the course webpage, like so:
</p>
<pre>
cp ~zmatni/public_html/cs64w18/resources/QtSpim .
</pre>

<p>If it still does not work, then download the source file from the program developer at: http://pages.cs.wisc.edu/~larus/spim.html</p>

<h3>Step 2: Load the Demonstration Program</h3>
<p>
 Type:
</p>
<pre>
./QtSpim
</pre>

<p>
 ...to begin the simulator.
 Once that is loaded, go to <code>File-&gt;Load File</code> to load the demo program <code>mipsdemo.asm</code>.
</p>

<h4>Understanding the Screens</h4>
<p>
 The left box shows the values in the registers at any given time.
 So, when you are asked what value was in a certain register at a certain time, you can advance to that instruction using breakpoints and stepping, and when it gets to the right instruction, look at the register in question.
</p>
<p>
 The right box shows the text segment, which contains all of the program instructions.
 As you are stepping along, you can see what instruction is executing.
 This is also how you can see where the program starts.
 The left column of that screen tells the address of the instruction.
 The next column shows the hexadecimal representation of the actual instruction.
 The 3rd column shows what the machine receives as the instruction, and the fourth column shows what the original MIPS instruction was.
 We will learn more about these parts in class later.
</p>
<p>
 The right box also shows the data segments if you choose the <code>Data</code> tab.
 Here you can see the global variables that were declared in the data segment.
 The left-hand column shows the address of the beginning of that set of data.
 If you click on <code>Data</code> now, you will recognize all of the strings that are being used to print out data.
</p>

<h3>Step 3: Set a Breakpoint</h3>
<p>
 First, make sure the <code>Text</code> tab is highlighted.
 Look at the instruction that says:
</p>
<pre>
jal 0x00400024 [main]
</pre>
<p>
 This means that the first instruction of <code>main</code> is located at address <code>0x00400024</code>.
 The left-hand column shows the address of each instruction.
 Locate the one with that address (<code>ori $2, $0, 4</code>).
 Right click on it and choose <code>Set Breakpoint</code>.
 If it works, a red indicator will show up to the left of the address.
</p>

<h3>Step 4: Step Through Code</h3>
<p>Click on the green arrow (the &ldquo;play&rdquo; button) to start running the code.</p>
<p>When it gets to the breakpoint you set in the previous step and asks if you want to continue, cluck <code>Single Step</code>.</p>
<p>
 To advance a single single instruction, click the 1-2-3 numbered list, or press <code>F10</code> on your keyboard.
 Do this to confirm the answers you get from inspecting the code.
</p>

<h3>Step 5: Answer Questions About the Code</h3>
<p>
 Answer the questions in <a href="spimtutorial.txt"><code>spimtutorial.txt</code></a>.
 You may find it helpful during this process to use breakpoints and to step through individual instructions, and watching what happens to both the registers and to the <code>Console</code> screen.
 The <code>Console</code> screen acts as an input/output terminal to your program.
 Just as with a normal terminal, if it is waiting for input, it will not continue until you type something into that screen and press return.
</p>
<p>
 You are being exposed to a <b>lot</b> of new material in a very short amount of time here, and it can be quite overwhelming at first.
 Keep in mind that you are learning not only a new language, but a new way of thinking, along with a new tool (QtSpim).
 Most of all, you have been doing this for only around a week - if this feels difficult, it is because it <i>is</i> difficult.
 If you want to read more, or just have more potentially helpful information in your grasp, the links below may be of some assistance:
</p>
<ul>
 <li>
   For understanding the MIPS instructions themselves, it may be helpful to consult the MIPS reference card in the front of the textbook.
   A digital copy is also available <a href="./documentation/MIPS_reference_card.pdf">here</a>.
 </li>
 <li>For a basic understanding of how the <code>syscall</code> instruction works in SPIM (which is used by QtSpim), see <a href="https://www.doc.ic.ac.uk/lab/secondyear/spim/node8.html">this page</a>.</li>
 <li>For a detailed amount of information regarding SPIM (which is used by QtSpim), particularly the terminal interface, you may want to consult <a href="./documentation/spim.pdf">this manual</a>.</li>
 <li>
   For general background specific to QtSpim, a nice tutorial can be found <a href="https://www.lri.fr/~de/QtSpim-Tutorial.pdf">here</a>.
   Overall, there are a <i>lot</i> of QtSpim tutorials out there if you are interested; a quick Google search of &ldquo;qtspim tutorial&rdquo; reveals quite a bunch.
 </li>
</ul>

<h2>Turn in Everything Using <code>turnin</code></h2>
<p>
 <b>If you partnered with someone, record the email address they are using for the class in <code>partner.txt</code>.</b>
 For example, if your partner had the email address <a href="foo@bar.com">foo@bar.com</a>, then the contents of <code>partner.txt</code> should be the following (and <b>only</b> the following):
</p>
<pre>
Partner: foo@bar.com
</pre>
<p>If you did not partner with anyone, you do not need to (and should not) edit <code>partner.txt</code>.</p>

<p>Assuming you are in the <code>cs64/lab2</code> directory you created at the beginning, you can send in your answers via the following command:</p>
<pre>
turnin lab2@cs64 lab2problems.txt RandomCode.c DecodeCode.c spimtutorial.txt partner.txt
</pre>
<p>
 You may turn in the same assignment up to 100 times, which is useful if you are working on it incrementally.
 Note that only the last version you submitted will be graded.
</p>

<p>Even if you did not partner with anyone, should should still turn in <code>partner.txt</code>, which should not have been modified.</p>

<p>
 Note that the above <code>turnin</code> command does not ask for all files to be submitted.
 This is intentional.
 The rest of the files (e.g., <code>RandomCode.h</code>) should <b>not</b> have been modified, and so they do not differ from what was distributed.
 That said, if you did modify these files, <b>please make sure</b> that they work correctly with the original unmodified files.
 We will test with the original files on our end, so if they do not work with the original files, then they might as well not work at all.
</p>

<hr>
<blockquote>
<p><font size="1">
Copyright 2018, Ziad Matni, CS Dept, UC Santa Barbara. Adapted from work by Diana Franklin and Kyle Dewey. Permission to copy for non-commercial, non-profit, educational purposes granted, provided appropriate credit is given;  all other rights reserved
</font></p>

</blockquote>
