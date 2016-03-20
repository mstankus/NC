# NCPolynomial

This package contains functionality to convert an nc polynomial expression into an expanded efficient representation for an nc polynomial which can have commutative or noncommutative coefficients.

For example the polynomial

    exp = a**x**b - 2 x**y**c**x + a**c

in variables `x` and `y` can be converted into an NCPolynomial using

    p = NCToNCPolynomial[exp, {x,y}]

which returns

    p = NCPolynomial[a**c, <|{x}->{{1,a,b}},{x**y,x}->{{2,1,c,1}}|>, {x,y}]

Members are: 

* [NCPolynomial](#NCPolynomial)
* [NCToNCPolynomial](#NCToNCPolynomial)
* [NCPolynomialToNC](#NCPolynomialToNC)
* [NCPCoefficients](#NCPCoefficients)
* [NCPTermsOfDegree](#NCPTermsOfDegree)
* [NCPTermsOfTotalDegree](#NCPTermsOfTotalDegree)
* [NCPTermsToNC](#NCPTermsToNC)
* [NCPDecompose](#NCPDecompose)
* [NCPDegree](#NCPDegree)
* [NCPMonomialDegree](#NCPMonomialDegree)
* [NCPLinearQ](#NCPLinearQ)
* [NCPQuadraticQ](#NCPQuadraticQ)
* [NCPNormalize](#NCPNormalize)
      
<a name="NCPolynomial">
## NCPolynomial 
</a>

`NCPolynomial[indep,rules,vars]` is an expanded efficient representation for an nc polynomial in `vars` which can have commutative or noncommutative coefficients.

The nc expression `indep` collects all terms that are independent of the letters in `vars`.
    
The *Association* `rules` stores terms in the following format:

    {mon1, ..., monN} -> {scalar, term1, ..., termN+1}

where:

* `mon1, ..., monN`: are nc monomials in vars;
* `scalar`: contains all commutative coefficients; and 
* `term1, ..., termN+1`: are nc expressions on letters other than
the ones in vars which are typically the noncommutative
coefficients of the polynomial.
 
`vars` is a list of *Symbols*.
 
For example the polynomial

    a**x**b - 2 x**y**c**x + a**c

in variables `x` and `y` is stored as:

    NCPolynomial[a**c, <|{x}->{{1,a,b}},{x**y,x}->{{2,1,c,1}}|>, {x,y}]
    
NCPolynomial specific functions are prefixed with NCP, e.g. NCPDegree.

See also:
[`NCToNCPolynomial`](#NCToNCPolynomial), [`NCPolynomialToNC`](#NCPolynomialToNC), [`NCTermsToNC`](#NCTermsToNC).

<a name="NCToNCPolynomial">
## NCToNCPolynomial
</a>

`NCToNCPolynomial[p, vars]` generates a representation of the noncommutative polynomial `p` in `vars` which can have commutative or noncommutative coefficients.

Example:

    exp = a**x**b - 2 x**y**c**x + a**c
    p = NCToNCPolynomial[exp, {x,y}]
    
returns

    NCPolynomial[a**c, <|{x}->{{1,a,b}},{x**y,x}->{{2,1,c,1}}|>, {x,y}]

See also:
[`NCPolynomial`](#NCPolynomial), [`NCPolynomialToNC`](#NCPolynomialToNC).

<a name="NCPolynomialToNC">
## NCPolynomialToNC
</a>

`NCPolynomialToNC[p]` converts the NCPolynomial `p` back into a regular nc polynomial.

See also:
[`NCPolynomial`](#NCPolynomial), [`NCToNCPolynomial`](#NCToNCPolynomial).

<a name="NCPCoefficients">
## NCPCoefficients
</a>

`NCPCoefficients[p, m]` gives all coefficients of the NCPolynomial `p` in the monomial `m`.

For example:

    exp = a ** x ** b - 2 x ** y ** c ** x + a ** c + d ** x
    p = NCToNCPolynomial[exp, {x, y}]
    NCPCoefficients[p, {x}]

returns

    {{1, d, 1}, {1, a, b}}
    
and

    NCPCoefficients[p, {x ** y, x}]

returns

    {{-2, 1, c, 1}}

See also:
[`NCPTermsToNC`](#NCPTermsToNC).
   
<a name="NCPTermsOfDegree">
## NCPTermsOfDegree
</a>

`NCPTermsOfDegree[p,deg]` gives all terms of the NCPolynomial `p` of degree `deg`.

The degree `deg` is a list with the degree of each symbol.

For example:

    p = NCPolynomial[0, <|{x,y}->{{2,a,b,c}},
	                       {x,x}->{{1,a,b,c}},
	                       {x**x}->{{-1,a,b}}|>, {x,y}]
    NCPTermsOfDegree[p, {1,1}]
    
returns

    <|{x,y}->{{2,a,b,c}}|>

and
    
    NCPTermsOfDegree[p, {2,0}]

returns

    <|{x,x}->{{1,a,b,c}}, {x**x}->{{-1,a,b}}|>

See also:
[`NCPTermsOfTotalDegree`](#NCPTermsOfTotalDegree),[`NCPTermsToNC`](#NCPTermsToNC).

<a name="NCPTermsOfTotalDegree">
## NCPTermsOfTotalDegree
</a>

`NCPTermsOfDegree[p,deg]` gives all terms of the NCPolynomial `p` of total degree `deg`.

The degree `deg` is the total degree.

For example:

    p = NCPolynomial[0, <|{x,y}->{{2,a,b,c}},
	                       {x,x}->{{1,a,b,c}},
	                       {x**x}->{{-1,a,b}}|>, {x,y}]
    NCPTermsOfDegree[p, 2]
    
returns

    <|{x,y}->{{2,a,b,c}},{x,x}->{{1,a,b,c}},{x**x}->{{-1,a,b}}|>

See also:
[`NCPTermsOfDegree`](#NCPTermsOfDegree),[`NCPTermsToNC`](#NCPTermsToNC).

<a name="NCPTermsToNC">
## NCPTermsToNC
</a>

`NCPTermsToNC` gives a nc expression corresponding to terms produced by `NCPTermsOfDegree` or `NCTermsOfTotalDegree`.

For example:

    terms = <|{x,x}->{{1,a,b,c}}, {x**x}->{{-1,a,b}}|>
    NCPTermsToNC[terms]
    
returns

    a**x**b**c-a**x**b

See also:
[`NCPTermsOfDegree`](#NCPTermsOfDegree),[`NCPTermsOfTotalDegree`](#NCPTermsOfTotalDegree).

<a name="NCPDecompose">
## NCPDecompose
</a>

`NCPDecompose[p]` gives an association of elements of the
NCPolynomial `p` in which elements of the same order are collected
together.
   
For example

    NCPDecompose[NCPolynomial[a**x**b+c+d**x**e+a**x**e**x**b+a**x**y, {x,y}]]

will produce the Association

    <|{1,0}->a**x**b + d**x**e, {1,1}->a**x**y, {2,0}->a**x**e**x**b, {0,0}->c|>

See also:
`NCDecompose`,`NCCompose`.

<a name="NCPDegree">
## NCPDegree
</a>

`NCPDegree[p]` gives the degree of the NCPolynomial `p`.

See also:
[`NCPMonomialDegree`](#NCPMonomialDegree).

<a name="NCPMonomialDegree">
## NCPMonomialDegree
</a>

`NCPDegree[p]` gives the degree of each monomial in the NCPolynomial `p`.

See also:
[`NCDegree`](#NCPMonomialDegree).

<a name="NCPLinearQ">
## NCPLinearQ
</a>

`NCPLinearQ[p]` gives True if the NCPolynomial `p` is linear.   

See also:
[`NCPQuadraticQ`](#NCPQuadraticQ).

<a name="NCPQuadraticQ">
## NCPQuadraticQ
</a>

`NCPQuadraticQ[p]` gives True if the NCPolynomial `p` is quadratic.

See also:
[`NCPLinearQ`](#NCPLinearQ).

<a name="NCPNormalize">
## NCPNormalize
</a>

`NCPNormalizes[p]` gives a normalized version of NCPolynomial p
where all factors that have free commutative products are 
collectd in the scalar.

This function is intended to be used mostly by developers.

See also:
[`NCPolynomial`](#NCPolynomial)