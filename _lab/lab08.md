---
layout: lab
num: lab08
ready: false
desc: "Combinatorial + Sequential Logic Design"
assigned: 2018-03-08 08:00:00.00-7
due: 2018-03-16 23:59:59.00-7
---
<h1>Lab 8: Combinatorial + Sequential Logic Design</h1>
<hr>
<p>Due Friday, March 16 at 11:59:59 PM</p>

<h2>Goals for This Week</h2>
<p>By the time you have completed this work, you should be able to:</p>
<ul>
  <li>Use multiplexers to switch between inputs</li>
  <li>Design a small arithmetic logic unit (ALU)</li>
  <li>Design a small register file</li>
  <li>Design a basic instruction decoder and executor</li>
</ul>

<b>Provided files:</b>
<ul>
  <li><a href="partner.txt"><code>partner.txt</code></a></li>
  Given the nature of this lab and that we are right in the last week of classes, working with a partner on this lab is highly recommended.
</ul>

<b>Documentation:</b>
<ul>
  <li>Section B.8 (pages B-50 through B-58) for D latch and register file information</li>
  <li>Pages B-58 and B-59 for memory information (only need to understand the interface for memory, shown in Figure B.9.1)</li>
  <li>Sections 4.3 and 4.4 for constructing an instruction executor (the figures are more important than anything else, and even then these are all <i>significantly</i> more complex than anything in this assignment)</li>
</ul>

<hr>
<h2>Step by Step Instructions</h2>
<p>
  For this week, you will sharpen your skills drawing circuits, and start to build bigger components from smaller ones.
  To this end, you will design some core components of a simple processor this week, broken up into three tasks.
  While each task can be completed independently of each other, they progressively build in difficulty, so it is recommended to complete them in order.
  The tasks are listed below:
</p>

<ul>
  <li>Task 1: Design a Small ALU</li>
  <li>Task 2: Design a Small Register File</li>
  <li>Task 3: Design a Small Instruction Decoder and Executor</li>
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
<p>Then create a new directory for this lab: <code>lab8</code>:</p>
<pre>
mkdir lab8
</pre>
<p>Then go into that directory.</p>
<p>Now copy over all of the files necessary for this week's tasks:</p>
<pre>
cp ~zmatni/public_html/cs64w18/labs/8/partner.txt .
</pre>
<p>
  Note the use of the trailing <code>.</code> in the above command, which stipulates that the specified files should be copied into the current directory.
</p>

<h2><a id="alu">Task 1: Design a Small ALU</a></h2>
<p>
  For this task, you will design a simple single-bit ALU, writing your design either on paper or in a file named <code>alu.jpg</code>.
  The ALU takes the following inputs:
</p>
<table border="1">
  <tr>
<th>Input Name</th>
<th>Input Description</th>
  </tr>
  <tr>
<td><code>Operation</code></td>
<td>
  Which operation is to be performed, specified with a single bit.
  There are two possible operations:
  <ol>
<li><code>XOR</code>, specified when <code>Operation = 0</code></li>
<li>
  <code>NOR</code>, specified when <code>Operation = 1</code>.
  Note that <code>nor</code> is equivalent to <code>~(A | B)</code>.
  That is, it is an <code>OR</code> operation whose result is negated.
</li>
  </ol>
</td>
  </tr>
  <tr>
<td><code>A</code></td>
<td>The first operand, specified with a single bit</td>
  </tr>
  <tr>
<td><code>B</code></td>
<td>The second operand, specified with a single bit</td>
  </tr>
</table>

<p>The ALU returns the following single output:</p>
<table border="1">
  <tr>
<th>Output Name</th>
<th>Output Description</th>
  </tr>
  <tr>
<td><code>ALUout</code></td>
<td>
  The result of whatever operator was chosen, applied to the given operands.
  For example, if <code>XOR</code> was chosen, then the result should be <code>A ^ B</code>.
</td>
  </tr>
</table>

<p>To complete this task, you may use <b>only</b> the following components, in unlimited supply:</p>
<ul>
  <li><code>AND</code>, <code>OR</code>, <code>XOR</code>, and <code>NOT</code> gates, using the notation shown in the <a href="../../lectures/week6/lecture_1.pdf">week 6 lecture notes</a>.</li>
  <li>
2-input multiplexers, which take a selector bit <code>S0</code> and two single-bit input operands <code>A</code> and <code>B</code>, and return a single-bit output <code>Z</code>.
They should be drawn using the symbol below, provided by <a href="https://en.wikipedia.org/wiki/Multiplexer">Wikipedia</a>:<br><img src="multiplexer.png" style="width:10%;">
  </li>
</ul>

<h2><a id="registers">Task 2: Design a Small Register File</a></h2>
<p>
  For this task, you will design a small register file, writing your design either on paper or in a file named <code>registers.jpg</code>.
  The register file contains two registers, each one bit long, which are named <code>reg0</code> and <code>reg1</code>, respectively.
  The register file allows two registers to be read simultaneously, and also allows a register to be written to.
  The register file takes the following inputs:
</p>

<table border="1">
  <tr>
<th>Input Name</th>
<th>Input Description</th>
  </tr>
  <tr>
<td><code>R0</code></td>
<td>
  The first register to read, as a single bit.
  If <code>0</code>, then <code>reg0</code> should be read.
  If <code>1</code>, then <code>reg1</code> should be read.
</td>
  </tr>
  <tr>
<td><code>R1</code></td>
<td>
  The second register to read, as a single bit.
  If <code>0</code>, then <code>reg0</code> should be read.
  If <code>1</code>, then <code>reg1</code> should be read.
</td>
  </tr>
  <tr>
<td><code>WR</code></td>
<td>
  Short for &ldquo;Write Register&rdquo;.
  Specifies which register to write to.
  If <code>0</code>, then <code>reg0</code> should be written to.
  If <code>1</code>, then <code>reg1</code> should be written to.
</td>
  </tr>
  <tr>
<td><code>W</code></td>
<td>
  The data that should be written to the register specified by <code>WR</code>.
  This correpsonds to a single bit.
</td>
  </tr>
  <tr>
<td><code>WE</code></td>
<td>
  Short for &ldquo;Write Enable&rdquo;.
  If <code>1</code>, then we will write to a register.
  If <code>0</code>, then we will <b>not</b> write to a register.
  Note that if <code>WE = 0</code>, then the inputs to <code>WR</code> and <code>W</code> are effectively ignored.
</td>
  </tr>
</table>

<p>The register file returns the following two outputs:</p>
<table border="1">
  <tr>
<th>Output Name</th>
<th>Output Description</th>
  </tr>
  <tr>
<td><code>O1</code></td>
<td>
  Value of the first register read.
  As described previously, this depends on which register was selected to be read, via <code>R0</code>.
</td>
  </tr>
  <tr>
<td><code>O2</code></td>
<td>
  Value of the second register read.
  As described previously, this depends on which register was selected to be read, via <code>R1</code>.
</td>
  </tr>
</table>

<p>To complete this task, you may use <b>only</b> the following components, in unlimited supply:</p>
<ul>
  <li><code>AND</code>, <code>OR</code>, <code>XOR</code>, and <code>NOT</code> gates, using the notation shown in the lecture notes</a>.</li>
  <li>
2-input multiplexers, which take a selector bit <code>S0</code> and two single-bit input operands <code>A</code> and <code>B</code>, and return a single-bit output <code>Z</code>.
They should be drawn using the symbol below, provided by <a href="https://en.wikipedia.org/wiki/Multiplexer">Wikipedia</a>:<br><img src="multiplexer.png" style="width:10%;">
  </li>
  <li>
D latches, which take a single-bit input <code>D</code> and a block bit <code>E</code>, which is used to indicate that the value of <code>D</code> should be saved within.
They produce single-bit outputs <code>Q</code> and <code>!Q</code>, which represent the value stored in the latch along with its negation, respectively.
They should be drawn using the symbol below, provided by <a href="https://en.wikipedia.org/wiki/Flip-flop_%28electronics%29#Gated_D_latch">Wikipedia</a>:<br><img src="d_latch.png" style="width:10%;">
  </li>
</ul>

<h2><a id="executor">Task 3: Design a Small Instruction Decoder and Executor</a></h2>
<p>
  This is the largest task of the three.
  For this task, you will design a small instruction decoder and executor, which is at the heart of a processor.
  This should be done either on paper or in a file named <code>executor.jpg</code>.
  This component will use the components you designed in tasks 1 and 2, in an abstract manner.
  That is, instead of needing to rewrite your definitions from tasks 1 and 2 for this, we'll provide you boxes that perform these operations.
  The processor instuctions you will be working with are described thusly.
</p>
<p>
  Instructions are uniformly encoded with 5 bits, and there are four instructions in total.
  The first two bits of the instructions encode the opcode, which is used to differentiate between instruction types.
  The next three bits encode which registers the instruction operates on, or a memory address, depending on the particular instruction.
  Registers are specified using a single bit, and memory addresses are specified with two bits.
  A table of all the possible instructions is below.
</p>
<table border="1">
  <tr>
<th>Instruction Name</th>
<th>Opcode</th>
<th>First Operand</th>
<th>Second Operand</th>
<th>Third Operand</th>
<th>Description</th>
  </tr>
  <tr>
<td><code>xor</code></td>
<td><code>00</code></td>
<td><code>REG0</code>: Register where the result should be placed, specified with a single bit</td>
<td><code>REG1</code>: Register specifying where the first operand is, specified with a single bit</td>
<td><code>REG2</code>: Register specifying where the second operand is, specified with a single bit</td>
<td>
  <code>XOR</code>s the contents of <code>REG1</code> and <code>REG2</code> together, putting the results in <code>REG0</code>.
  This should involve the ALU.
  In more terse notation, this calculates:<br>
  <code>REG0 = REG1 ^ REG2</code>
</td>
  </tr>
  <tr>
<td><code>nor</code></td>
<td><code>01</code></td>
<td><code>REG0</code>: Register where the result should be placed, specified with a single bit</td>
<td><code>REG1</code>: Register specifying where the first operand is, specified with a single bit</td>
<td><code>REG2</code>: Register specifying where the second operand is, specified with a single bit</td>
<td>
  <code>NOR</code>s the contents of <code>REG1</code> and <code>REG2</code> together, putting the results in <code>REG0</code>.
  This should involve the ALU.
  In more terse notation, this calculates:<br>
  <code>REG0 = ~(REG1 | REG2)</code>
</td>
  </tr>
  <tr>
<td><code>load</code></td>
<td><code>10</code></td>
<td><code>REG</code>: Register where the result should be placed, specified with a single bit</td>
<td><code>A</code>: A memory address, specified with two bits</td>
<td>N/A</td>
<td>
  This loads in a single bit of memory located in address <code>A</code>, and loads its value into register <code>REG</code>.
  In our setup, each cell in memory only holds a single bit (as opposed to a byte), and we can address individual bits.
  For example, memory address <code>00</code> would refer to the first bit in memory, <code>01</code> would refer to the second bit in memory, and so on.
</td>
  </tr>
  <tr>
<td><code>store</code></td>
<td><code>11</code></td>
<td><code>REG</code>: Register containing the value to store into memory, specified with a single bit</td>
<td><code>A</code>: A memory address, specified with two bits</td>
<td>N/A</td>
<td>
  This copies the value stored in <code>REG</code> to the memory slot located at address <code>A</code>.
  In our setup, each cell in memory only holds a single bit (as opposed to a byte), and we can address individual bits.
  For example, memory address <code>00</code> would refer to the first bit in memory, <code>01</code> would refer to the second bit in memory, and so on.
</td>
  </tr>
</table>

<p>
  Instructions are encoded with the two opcode bits on the far left, with the remaining three bits following.
  For example, consider the following instruction:
</p>
<pre>
01110
</pre>
<p>
  The leftmost two bits are <code>01</code> which refers to the opcode for <code>nor</code>.
  As such, this is a <code>nor</code> instruction.
  <br>
  The next three bits are <code>110</code>.
  Going from left to right, along with the definition of our <code>nor</code> instruction, this means that:
</p>
<ul>
  <li><code>REG0 = 1</code></li>
  <li><code>REG1 = 1</code></li>
  <li><code>REG2 = 0</code></li>
</ul>
<p>
  Taking all this information together, this means to first get the values stored in registers <code>reg1</code> and <code>reg0</code> (because <code>REG1 = 1</code> and <code>REG2 = 0</code>).
  These values are then <code>NOR</code>ed together, and then the result is stored in register <code>reg1</code> (because <code>REG0 = 1</code>).
</p>

<p>As another example, consider the following instruction:</p>
<pre>
11011
</pre>
<p>
  The leftmost two bits are <code>11</code>, which refers to the opcode for <code>store</code>.
  As such, this is a <code>store</code> instruction.
  <br>
  The next three bits are <code>011</code>.
  Going from left to right, along with the definition of our <code>store</code> instruction, this means that:
</p>
<ul>
  <li><code>REG = 0</code></li>
  <li><code>A = 11</code></li>
</ul>
<p>
  Taking all this information together, this means to first get the value stored in register <code>reg0</code> (because <code>REG = 0</code>).
  This value should then be put into the single-bit memory slot stored at address <code>11</code> (because <code>A = 11</code>).
</p>

<p>
  The instruction decoder / executor takes in a single instruction to work with, specified with five bits, as our instructions are five bits long.
  Each of these bits corresponds to a distinct input, each of which is described below:
</p>
<table border="1">
  <tr>
<th>Input Name</th>
<th>Input Description</th>
  </tr>
  <tr>
<td><code>OP0</code></td>
<td>
  Bit 0 of the opcode.
  Recall that bit 0 refers to the rightmost bit, so for opcode <code>01</code>, this refers to the bit with value <code>1</code>.
</td>
  </tr>
  <tr>
<td><code>OP1</code></td>
<td>
  Bit 1 of the opcode.
  For example, for opcode <code>01</code>, this refers to the bit with value <code>0</code>.
</td>
  </tr>
  <tr>
<td><code>B0</code></td>
<td>
  The first non-opcode bit of the instruction.
  For example, with instruction <code>00100</code>, this refers to the bit with value <code>1</code>.
</td>
  </tr>
  <tr>
<td><code>B1</code></td>
<td>
  The second non-opcode bit of the instruction.
  For example, with instruction <code>00010</code>, this refers to the bit with value <code>1</code>.
</td>
  </tr>
  <tr>
<td><code>B2</code></td>
<td>
  The third non-opcode bit of the instruction, which is the last bit of the instruction.
  For example, with instruction <code>00001</code>, this refers to the bit with value <code>1</code>.
</td>
  </tr>
</table>

<p>
  Another view of the above information is provided in the table below, which shows where the different inputs bits in an instruction are located:
</p>
<table border="1">
  <tr>
<td><code>OP1</code></td>
<td><code>OP0</code></td>
<td><code>B0</code></td>
<td><code>B1</code></td>
<td><code>B2</code></td>
  </tr>
</table>

<p>
  Some more examples are shown below:
</p>
<table border="1">
  <tr>
<th><code>OP1</code></th>
<th><code>OP0</code></th>
<th><code>B0</code></th>
<th><code>B1</code></th>
<th><code>B2</code></th>
<th>Human-readable Encoding</th>
<th>Description</th>
  </tr>
  <tr>
<td><code>0</code></td>
<td><code>0</code></td>
<td><code>0</code></td>
<td><code>0</code></td>
<td><code>0</code></td>
<td><code>xor reg0, reg0, reg0</code></td>
<td>Compute the <code>XOR</code> of the contents of <code>reg0</code> with the contents of <code>reg0</code>, storing the result in <code>reg0</code></td>
  </tr>
  <tr>
<td><code>0</code></td>
<td><code>1</code></td>
<td><code>1</code></td>
<td><code>0</code></td>
<td><code>1</code></td>
<td><code>nor reg1, reg0, reg1</code></td>
<td>Compute the <code>NOR</code> of the contents of <code>reg0</code> with the contents of <code>reg1</code>, storing the result in <code>reg1</code></td>
  </tr>
  <tr>
<td><code>1</code></td>
<td><code>0</code></td>
<td><code>1</code></td>
<td><code>0</code></td>
<td><code>1</code></td>
<td><code>load reg1, 01</code></td>
<td>Copy the bit stored at address <code>01</code> (decimal 1) into register <code>reg1</code></td>
  </tr>
  <tr>
<td><code>1</code></td>
<td><code>1</code></td>
<td><code>0</code></td>
<td><code>1</code></td>
<td><code>0</code></td>
<td><code>store reg0, 10</code></td>
<td>Store the contents of <code>reg0</code> at address <code>10</code> (decimal 2)</td>
  </tr>
  <tr>
<td><code>1</code></td>
<td><code>1</code></td>
<td><code>1</code></td>
<td><code>1</code></td>
<td><code>1</code></td>
<td><code>store reg1, 11</code></td>
<td>Store the contents of <code>reg1</code> at address <code>11</code> (decimal 3)</td>
  </tr>
</table>

<p>
  The instruction decoder / executor does not produce any outputs.
  This makes sense, as the effect of running a single instruction is reflected in changes made to the register file and to memory.
</p>

<p>To complete this task, you may use <b>only</b> the following components, in unlimited supply:</p>
<ul>
  <li><code>AND</code>, <code>OR</code>, <code>XOR</code>, and <code>NOT</code> gates, using the notation shown in the lecture notes</a>.</li>
  <li>
2-input multiplexers, which take a selector bit <code>S0</code> and two single-bit input operands <code>A</code> and <code>B</code>, and return a single-bit output <code>Z</code>.
They should be drawn using the symbol below, provided by <a href="https://en.wikipedia.org/wiki/Multiplexer">Wikipedia</a>:<br><img src="multiplexer.png" style="width:10%;">
  </li>
  <li>
An abstract component, representing the ALU you designed in task 1.
In should be drawn using the symbol below:<br><img src="alu.jpg" style="width:25%">
  </li>
  <li>
An abstract component, representing the register file you design in task 2.
It should be drawn using the symbol below:<br><img src="register_file.jpg" style="width:15%">
  </li>
  <li>
An abstract component, representing the interface for the memory chip.
The memory chip contains four bits of memory, which are individually addressed.
<br>This component has the following inputs:
<ul>
  <li>
<code>A0</code>: Bit 0 of the address.
Recall that bit 0 refers to the rightmost bit, so for address <code>01</code>, this refers to the bit with value <code>1</code>.
  </li>
  <li>
<code>A1</code>: Bit 1 of the address.
For example, with address <code>01</code>, this refers to the bit with value <code>0</code>.
  </li>
  <li>
<code>OE</code>: Short for &ldquo;Output Enable&rdquo;.
If <code>1</code>, then the value at the address specified by <code>A0</code> and <code>A1</code> will be read, and sent to the output line <code>O</code>.
If <code>0</code>, then the memory will not be accessed, and the value sent to the output line is unspecified (could be either 0 or 1, in an unpredictable fashion).
  </li>
  <li><code>W</code>: The value to write to memory</li>
  <li>
<code>WE</code>: Short for &ldquo;Write Enable&rdquo;.
If <code>1</code>, then the value sent into <code>W</code> will be written to memory at the address specified by <code>A0</code> and <code>A1</code>.
If <code>0</code>, then no memory write occurs (the value sent to <code>W</code> will be ignored).
  </li>
</ul>
The output of the component is <code>O</code>, which refers to the value read from memory (or unspecified if <code>OE = 0</code>).
<br>The memory component should be drawn using the symbol below:<br>
<img src="memory.jpg" style="width:15%">
  </li>
</ul>

<p>
  Note that D latches are <b>not</b> a component you may introduce for this task.
  While these are needed to implement the memory file and the memory interface, these aren't needed at the higher level of abstraction we are working with in task 3.
  You are forbidden to use them only to prevent confusing situations where D latches are added needlessly.
</p>

<h3>Implementation Hints</h3>
<p>Rather than implementing task 3 all at once, it is <b>strongly recommended</b> to take the following incremental approach:</p>
<ol>
  <li>
Design a version that assumes the instruction is either <code>xor</code> or <code>nor</code>.
This version would do something broken on <code>load</code> or <code>store</code> instructions.
  </li>
  <li>
Design a version that assumes the instruction is <code>load</code>.
This version would do something broken on any other instruction.
  </li>
  <li>
Design a version that assumes the instruction is <code>store</code>.
This version would do something broken on any other instruction.
  </li>
  <li>
Finally, stitch the above three solutions together, introducing additional gates and multiplexers to only trigger the correct portions of the circuit depending on whatever the whole opcode is.
This should be fairly mechanical in nature.
  </li>
</ol>

<h2>Turn in Everything Using <code>turnin</code>, or the CS64 Homework Box</h2>
<p>
  <b>If you partnered with someone, record the email address they are using for the class in <code>partner.txt</code>.</b>
  For example, if your partner had the email address <a href="foo@bar.com">foo@bar.com</a>, then the contents of <code>partner.txt</code> should be the following (and <b>only</b> the following):
</p>
<pre>
Partner: foo@bar.com
</pre>
<p>If you did not partner with anyone, you do not need to (and should not) edit <code>partner.txt</code>.</p>

<p>Assuming you are in the <code>cs64/lab8</code> directory you created at the beginning, you can send in your answers <b>with the circuit images</b> via the following command:</p>
<pre>
turnin lab8@cs64 alu.jpg registers.jpg executor.jpg partner.txt
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
