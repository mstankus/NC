(*
                           SYStems.m


This file loads the expressions and rules which are currently
available for studying H-infinity control for nonlinear systems
which are affine in the input. You can modify it to work on
other problems; at the moment primarily on Hinfinity
or game problems which are variations on this.

The SYStems files run under NCAlgebra so it must 
be loaded prior to loading this file.  
See NCDOCUMENT for an introduction to NCAlgebra and a description of these 
functions.   

----------------*)
<<NCAlgebra.m
<<NCAliasFunctions.m

(*--------------


The files loaded below contain definitions of 
functions and replacement rules which can be used in the study of 
various linear and nonlinear systems problems.  Not all files will
be needed in the study of a particular problem, and need not be 
loaded (saving
time).  One must be careful to load files which do not conflict, 
for example, two different definition files will give 
conflicting definitions. Also definitions introduced in 
the demo file SYSbrlemma.m conflict with many in other files.

The "Print[x**0];" commands are a diagnostics tool. You should get 0 on
the screen.

Now we load SYSDefIA.m  which contains the definition 
of the basic systems we use. Namely, the 
Input Affine 2-port system. 
------------*)

Get["SYSDefIA.m"]; 
Print["SYSDefIA.m loaded"];
Print[x**0];

(*------------
Other definitions which could replace SYSDefIA.m are
SYSDefWIA.m
SYSDef1PortLin.m
SYSDefWAccess.m
SYSDef2&2.m

Next we load basic utilities which apply to systems,
eg. specializing to the linear case.

  The following file contains formulas occuring in nonlinear 
H-infinity control for Input-Affine and W-Input-Affine systems
and rules for specializing these formulas to the linear case.
It gives formulas for the maximum entropy solutions.  It does not give
the fractional linear formulas.  
--------------*)

Get["SYSSpecialize.m"]; 
Print["SYSSpecialize.m loaded"];
Print[x**0];


(*-----------
  The following file contains formulas occuring in nonlinear 
H-infinity control for Input-Affine and W-Input-Affine systems.
It gives formulas for the maximum entropy solutions.  It does not give
the fractional linear formulas.  
------------*)

Get["SYSHinfFormulas.m"];
Print["SYSHinfFormulas.m loaded"];
Print[x**0];


