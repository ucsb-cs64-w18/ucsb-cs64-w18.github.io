---
layout: lab
num: lab01
ready: false
desc: "CSIL Logistics and Binary Representation"
assigned: 2018-01-16 08:00:00.00-7
due: 2018-01-19 23:59:59.00-7
---
<h1>Lab 1: Logistics and Binary Representation</h1>
<hr>
<p><b>Due Friday, January 19th at 11:59:59 PM</b></p>

<h2>Goals for This Week</h2>
<p>By the time you have completed this work, you should be able to:</p>
<ul>
  <li>Have your CSIL account requested or received</li>
  <li>Monitor class announcements with <a href="http://www.piazza.com/ucsb/winter2018/cs64" target="_blank">Piazza</a></li>
  <li>Review Unix commands necessary for this course</li>
  <li>Learn how to get and edit files related to your assignments</li>
  <li>Practice bitwise operations on binary numbers</li>
  <li>Use the <code>turnin</code> command for submitting assignments</li>
</ul>
<b>Provided files:</b>
<ul>
  <li><a href="lab1problems.txt"><code>lab1problems.txt</code></a></li>
  <li><a href="partner.txt"><code>partner.txt</code></a></li>
</ul>
<hr>
<h1>Step by Step Instructions</h1>

<h2>Step 1: Log Into a Computer</h2>
If you are unable to log in, make sure you join someone whose works.
<p>
  If you need to request an account, <a href="https://accounts.engr.ucsb.edu/invites/login">click here.</a>
</p>

<h2>Step 2: Sign up for Piazza (If You Have Not Already)</h2>
<p>
  Click <a href="http://www.piazza.com/ucsb/winter2018/cs64">this link</a> to sign up.
  All course announcements will be through Piazza, so it is very important that you sign up!
</p>
    
<h2>Step 3: Create a Directory for This Work</h2>
<p>Back in your <code>CSIL</code> account, first create a directory for this course, if you have not already:</p>
<pre>
mkdir cs64
</pre>
<p>Then, if you want to confirm that it worked, list the contents of this directory</p>
<pre>
ls
</pre>
<p>That should show <code>cs64</code> as one of the contents of the current directory.</p>
<p>Now go into the <code>cs64</code> directory, create a <code>lab1</code> directory inside it, and enter the <code>lab1</code> directory:</p>
<pre>
cd cs64
mkdir lab1
cd lab1
</pre>
<p>Confirm that you are in the proper directory by checking the current path:</p>
<pre>
pwd
</pre>
<p>It should say your home directory's path, followed by <code>cs64/lab1</code>.</p>

<b>
  Note: You are expected to learn the unix commands presented in assignments.
  After today, I will expect that you know what <code>mkdir</code>, <code>cd</code>, and <code>pwd</code> do.
  If you forget them, you may refer back to these instructions.
</b>

<h2>Step 4: Get the Provided Files Into Your Work Directory</h2>
<p>
  The provided <a href="lab1problems.txt"><code>lab1problems.txt</code></a> and <a href="partner.txt"><code>partner.txt</code></a> files need to make their way into the directory you just created.
  There are a number of ways to do this.
  Perhaps the simplest thing to do is to copy the file directly from the website, like so:
</p>
<pre>
cp ~zmatni/public_html/cs64w18/labs/1/lab1problems.txt ~zmatni/public_html/cs64w18/labs/1/partner.txt .
</pre>
<p>Note the use of the trailing <code>.</code> in the above command, which stipulates that the specified files (<code>~zmatni/public_html/cs64w18/labs/1/lab1problems.txt</code> and <code>~zmatni/public_html/cs64w18/labs/1/partner.txt</code>) should be copied into the current directory.</p>

<h2>Step 5: Change the File Permissions Appropriately</h2>
<p>
  Depending on some factors, it may still be possible for others to read the contents of the files you just copied.
  This can lead to problems if you then put your answers in the files (as the rest of this assignment asks you to do), as someone else could potential read your answers.
  We can fix this problem by tightening up the permissions on the files so that only you can read them, like so:
</p>
<pre>
chmod 600 lab1problems.txt partner.txt
</pre>
<p>
  The <code>chmod</code> command is used to change the permissions on files.
  The <code>600</code> in the command stipulates that you are giving yourself read and write access, while taking away any access to anyone else.
</p>
    
<h2>Step 5: Edit the Files In <code>emacs</code>, <code>vi</code>, or Another Text Editor of Your Choice</h2>
<p>
  If you are already familiar with a particular text editor, go ahead and use it.
  If not, you may refer to one of the following links for a very basic tutorial of the corresponding text editor:
</p>
<ul>
  <li><a href="emacs_tutorial.html"><code>emacs</code> tutorial</a></li>
  <li><a href="vi_tutorial.html"><code>vi</code> tutorial</a></li>
</ul>
<p> There are MANY more tutorials online - go ahead and Google them, if you like. </p>
 <p>
  Using the editor of your choice, open the <code>lab1problems.txt</code> file.
  The file contains a series of questions for you to answer.
  The answers should be placed directly in the file itself.
  All questions must be answered correctly for full credit.
</p>
<p>Make sure you save your answers before you exit.

<p>
  <b>If you partnered with someone, record the email address they are using for the class in <code>partner.txt</code>.</b>
  For example, if your partner had the email address <b>foo@bar.com</b>, then the contents of <code>partner.txt</code> should be the following (and <b>only</b> the following):
</p>
<pre>
Partner: foo@bar.com
</pre>
<p>If you did not partner with anyone, you do not need to (and should not) edit <code>partner.txt</code>.</p>

<h2>Step 6: Turn in Your Code Using <code>turnin</code></h2>
<p>Assuming you are in the <code>cs64/lab1</code> directory you created at the beginning, you can send in your answers via the following command:</p>
<pre>
turnin lab1@cs64 lab1problems.txt partner.txt
</pre>
<p>
  You may turn in the same assignment up to 100 times, which is useful if you are working on it incrementally.
  Note that only the last version you submitted will be graded.
</p>

<p>Even if you did not partner with anyone, you should still turn in <code>partner.txt</code>, which should not have been modified.</p>

<h2>(Optional) Step 7: Sign Up for CS Department Announcements</h2>
<p>
  The CS department has a mailing list to tell you about department events specifically targeted towards undergrads.
  Many students are unaware of this, so I want to let you know about it.
  You should (but are not required to) subscribe to this so that you can find out about all of these opportunities.
  To do so, go to <a href="http://lists.cs.ucsb.edu/mailman/listinfo/ugrads/">http://lists.cs.ucsb.edu/mailman/listinfo/ugrads/</a>.
</p>
<p>
  There is also a jobs list where you can find out about internship opportunities: <a href="http://lists.cs.ucsb.edu/mailman/listinfo/jobs/">http://lists.cs.ucsb.edu/mailman/listinfo/jobs/</a>.
</p>

<hr>
 <p>Copyright 2018, Ziad Matni, CS Dept, UC Santa Barbara. Parts of this lab were created by Kyle Dewey at UCSB.
 Permission to copy for non-commercial, non-profit, educational purposes granted, provided appropriate
  credit is given; all other rights reserved.</p>
