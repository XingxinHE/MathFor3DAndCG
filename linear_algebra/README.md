# 1.Vector

## 1.1 Definition


📌 **colon notation and index range**

$a_{r:s}$ means slicing index $r$ to index $s$ elements in vector $a$. The size is $s-r+1$



📌**indexing**

when you see $a_i$ , there might be 2 different meaning.

- the $i$-th vector in the collection of vectors.
- the $i$-th element in the vector.

Therefore, for clarity. We use

- $a_i$ as the $i$-th vector.
- $(a_i)j$ as the $j$-th element of the $i$-th vector.




## 1.3. Scalar-vector multiplication



### 1.3.3. Linear combination

scalar: $\beta_1,\cdots,\beta_n$

vector: $a_1,\cdots,a_n$

linear combination: $\beta_1\alpha_1+\cdots+\beta_n\alpha_n$, where $\beta_1,\cdots,\beta_n$ called *coefficients* of this linear combination



📌 **Linear combination of unit vectors**

Nothing special, just a linear combination using *unit vectors* as bases.




📌 **Special linear combinations**

*sum* , when $\beta_1=\cdots=\beta_n=1$

*mean* , when $\beta_1=\cdots=\beta_n=\frac{1}{n}$

*affine combination* , when $\beta_1+\cdots+\beta_n=1$

*convex combination / mixture / weighted average* , when *affine combination* $\geq 0$



### 1.3.4. Example

📌 **Line and Segment**

This is a good example of *affine combination*.

Use $c$ to represent a point on a line formed by $a,b$. Where $\theta$ is a scalar $0\leq\theta\leq1$
$$
c = (1-\theta)a+\theta b
$$
<img src="img/image-20210901224447023.png" alt="image-20210901224447023" style="zoom:50%;" />



## 1.5. Complexity of vector computation

📌 **computer representation of numbers and vectors**

The real numbers $\mathbb{R}$ are stored in **floating point format**. It is either *64-bits* or *8-bytes*. Therefore, there are $2^{64}$ real numbers in a `x64` computer.



📌 **floating point operation**

When computer carries out arithmetic operation, the result is rounded to the nearest floating point number. The very small error is called **round-off error**. Now you understand why you can't compare the *equality* of `float`.

Because the left hand side and right hand side are not equal sometimes!! But the error between is extremely small.



📌 **flop counts and complexity**

> ​	**flop** = floating point operation per second

> ​	**complexity** ,  2 meanings
>
> > 	1. In theoretical computer science, the term `complexity` is to mean the number of flops of the best method to carry out the computation. It always is denoted as $O$.
> >  	2. In this book, it means the number of flops required by a specific method.



📌 **complexity of vector operation**

- $n$ times
  - scalar-vector multiplication and division of $n$-vector , e.g. $aV$
  - vector addition and subtraction  $n$-vector, e.g. $P+V$
- $2n$ times
  - inner product of  $n$-vectors, e.g. $P^TV = P_1V_1+\cdots+P_nV_n$. Multiplication takes $n$ times, addition takes $n-1$ times. But for simplicity, we denote as $2n$ times.



📌 **complexity of sparse vector operation**

> ​	$x,y$ are sparse vectors.

> ​	$ax$ takes $nnz(x)$ times.

> ​	$x+y$ takes 
>
> > 1. less than $\min\{\bold{nnz}(x),\bold{nnz}(y)\}$ times
> > 2. 0 times if $x$ and $y$ have zero overlapped.

> ​	$x^Ty$ takes
>
> > 1. less than $2\min\{\bold{nnz}(x),\bold{nnz}(y)\}$
> > 2. 0 times if they are not overlapped.



# 2.Linear Function

This chapter is mainly on Linear Function and Affine Function.

## 2.1. Basics of Linear Function


### 2.1.2. Inner Product Function

📌 **What is it?**

An inner product function is like:
$$
f(x)=a^Tx = a_1x_1+a_2x_2+\cdots+a_nx_n
$$
$a$:   is a $n$-vector

$x$:   is also a $n$-vector

Since it is an inner product function, $f(x)$ therefore can be seen as a **weighted sum function** where $a$​ is the weight vector.



📌 **Superposition叠加性 & Linearity线性性**

Suppose $f$ is an inner product function, $f$ can therefore be written as $a^T$. We have:
$$
\begin{align}
f(\alpha x+\beta y)&=a^T(\alpha x+ \beta y)\\
&=a^T(\alpha x)+a^T(\beta y)\\
&=\alpha(a^Tx)+\beta(a^Ty)\\
&=\alpha f(x)+\beta f(y)
\end{align}
$$
$x, y$ are $n$-vector.  $\alpha,\beta$​ are scalar. The property above is called **superposition**. A function is **linear** if it satisfies this property.



📌 **Super Formal Definition on Linear**

The function $f: \mathbb{R}^n\to\mathbb{R}$  is linear which it MUST satisfy following 2 property:

- **homogeneity齐次性**.    $f(\alpha x)=\alpha f(x)$   emphasize on scaling
- **Additivity可加性.**    $f(x+y)=f(x)+f(y)$  emphasize on adding



📌**Inner Product Representation of a Linear Function**

The logic can be back and forth.

| Hypothesis/Conclusion                                        | Relation | Hypothesis/Conclusion |
| ------------------------------------------------------------ | -------- | --------------------- |
| A function defined as the inner product of its argument with some fixed vector. | :repeat: | A function is linear. |

We therefore say $a^Tx$ the inner product representation of $f$.



### 2.1.3. Example

📌 **Average**

The average of a $n$-vector can be defined as:
$$
f(x)=(x_1+x_2+\cdots+x_n)/n
$$
It can be denoted as **avg($x$)** . It also can be written as:
$$
f(x)=a^Tx,\text{   st. }\\a=(\frac{1}{n},\frac{1}{n},\cdots,\frac{1}{n})^T=\bold{1}/n
$$
meaning times $1/n$​ for every elements.

 

📌 **Maximum**

The maximum of a $n$-vector can be expressed as followed:
$$
f(x)=\text{max}\{x_1,\cdots,x_n\}
$$
Obviously, it is not a linear function. 



### 2.1.4. Affine Function

📌 **What is it?**

Affine function is (linear function) + (a CONSTANT).
$$
f:\mathbb{R}^n\to\mathbb{R}
\\f(x)=a^Tx+b
$$
$a$:  a $n$-vector

$x$:  a $n$-vector

$b$:  a scalar, normally called **offset**



📌 **Constraint on Superposition**

For linear function, no constraint on superposition.

For affine function, there IS constraint on superposition :warning:where the coefficients have to be **1** in total.

Because superposition is:
$$
f(\alpha x+\beta y)=\alpha f(x)+\beta f(y)
$$
And affine function is:
$$
f(x)=a^Tx+b
$$
Therefore there are **2** in both sides:
$$
b=\alpha b_1+\beta b_2
$$
So the only chance they are the same is that 
$$
\alpha+\beta=1
$$
:thinking: What can we take advantage of this property?

OK, an affine function can satisfy superposition if and only if $\alpha+\beta=1$. Therefore, we can think another way around: if we set $\alpha+\beta=1$, and the function does NOT satisfy superposition, then it is NOT an affine function.



## 2.2. Taylor Approximation

📌 **What for?**

:dart: Application on scalar-valued functions of $n$ variables, or **relations** between $n$ variables and a scalar.
$$
\begin{bmatrix}
x_1\\x_2\\\vdots\\x_n 
\end{bmatrix}
\to a
$$
Normally, this relation is **approximated** by either :one: linear function or :two: affine function. Sometime these 2 functions are called **model**.



📌 **What is Taylor Approximation?**

Suppose that $f: \mathbb{R^n} \to \mathbb{R}$ is differentiable, which means that its partial derivatives exist. Let $z$ be an $n$-vector. The (first-order) *Taylor Approximation* of $f$ near (or at) the point $z$ is the function $\hat{f}(x)$ of $x$ defined as:
$$
\hat{f}(x)=f(z)+\frac{\partial f}{\partial x_1}(z)(x_1-z_1)+\cdots+\frac{\partial f}{\partial x_n}(z)(x_n-z_n)
$$

- $\frac{\partial f}{\partial x_i}(z)$ , denotes the partial derivative of $f$ with respect to its $i$th argument, evaluated at the $n$-vector $z$.

- $\hat{f}$  ,  the hat is a hint that it is an approximation of the function $f$.
- $\hat{f}(x;z)$  , is written with 2nd argument to show the point  $z$ at which the approximation is developed.
- $f(z)$  , the first item of Taylor is **constant**, while others can be seen as the contributions to the change(from $f(z)$) due to the changes in the component of $x$ (from $z$).



📌**Affine Function**

Apparently, since there is always a $f(z)$ ,which is a constant, in the beginning, $\hat{f}(x)$ is therefore an **affine function**. It could be written as followed:
$$
\hat{f}(x)=f(z)+\grad f(z)^T(x-z)
$$
- $f(z)$, it is a constant which is the value of this function when $x=z$

- $\grad f(z)$  , is a $n$-vector, the **gradient** of $f$ at the point $z$ is:

$$
\grad f(z)=\begin{bmatrix}\frac{\partial f}{\partial x_1}(z)\\\vdots\\\frac{\partial f}{\partial x_n}(z)\end{bmatrix}
$$

- $(x-z)$, the **deviation/perturbation(偏差/扰动)** of $x$ respect to $z$




📌 **What does it mean by `approximation`?**

A simple example, for $n = 1$, is shown in the following figure. Over the full $x$-axis scale shown, the Taylor approximation $\hat{f}$ does not give a good approximation of the function $f$. But for **$x$ near $z$**, the Taylor approximation is very **good**.

<img src="img/image-20211129222919801.png" alt="image-20211129222919801" style="zoom: 67%;" />

A function f of one variable, and the first-order Taylor approximation $\hat{f}(x)=f(z)+f'(z)(x-z)$



📌 **Example**

Consider the function $f : \mathbb{R}^2 \to \mathbb{R}$ given by $f(x) = x_1 + \text{exp}(x_2 − x_1 )$ , which is not linear or affine. The assignment is to **find** the Taylor Approximation $\hat{f}$ **near the point** $z=(1,2)$.

- first, take the partial derivative of this function:

$$
\grad f(z)=
\begin{bmatrix}
1-\text{exp}(z_2-z_1)\\
\text{exp}(z_2-z_1)
\end{bmatrix}
$$

- two, place $z_2=2, z_1=1$ in it
- $\text{exp}=e,\quad e^1=2.7183$, therefore $\grad f(z)$ at $z=(1,2)$ is:

$$
\grad f(z)=
\begin{bmatrix}
1-e^1\\
e^1
\end{bmatrix}
=
\begin{bmatrix}
-1.7183\\
2.7183
\end{bmatrix}
$$

- $f(z)$ at $z=(1,2)$ is:

$$
f(z)=x_1 + \text{exp}(x_2 − x_1 )=1+e^{2-1}=3.7183
$$

- the Taylor approximation therefore is:

$$
\begin{align}
\hat{f}(x)&=f(z)+\grad f(z)^T(x-z)\\
&=3.7183+\begin{bmatrix}-1.7183&
2.7183\end{bmatrix}^T(x-\begin{bmatrix}1\\2\end{bmatrix})\\
&=3.7183+\begin{bmatrix}-1.7183&
2.7183\end{bmatrix}^T(\begin{bmatrix}x_1\\x_2\end{bmatrix}-\begin{bmatrix}1\\2\end{bmatrix})\\
&=3.7183-1.7183(x_1 -1)+2.7183(x_2-2)
\end{align}
$$

How to measure it is a good approximation:

| $x$           | $f(x)$ | $\hat{f}(x)$ | $\abs{\hat{f}(x)-f(x)}$ |
| ------------- | ------ | ------------ | ----------------------- |
| (1.00, 2.00)  | 3.7183 | 3.7183       | 0.000                   |
| (0.96, 1.98)  | 3.7332 | 3.7326       | 0.0005                  |
| (1 .10, 2.11) | 3.8456 | 3.8455       | 0.0001                  |
| (0.85, 2.05)  | 4.1701 | 4.1119       | 0.0582                  |
| (1.25, 2.41)  | 4.4399 | 4.4032       | 0.0367                  |



## 2.3. Regression Model

📌 **What is it?**
$$
\hat{y} = x^T\beta+v
$$

- $x$, a $n$-vector a.k.a. **feature** vector
  - $x_1,x_2,...,x_n$ are regressor
- $\beta$, a $n$-vector, **weight vector** / coefficient vector
- $v$, a scalar, **offset** / intercept
- $\hat{y}$, the $\hat{}$ symbol indicating it is an estimate / **prediction**
- $y$, dependent variable, **output labels**

Special Indication:

- $\beta, v$ are both parameters tuning this regression model.
- $\beta$ is a weight vector which indicates the dependence between input and the performance of model.
  - e.g. $\beta_{13}$ is bigger, $x_{13}$ has more significant effect on the model
  - e.g. $\beta_{27}$ is smaller, $x_{27}$ has less effect on the model



📌 **Simplified Regression Model Notation**

Although I think this notation is kind of useless, the following is its equation.
$$
\hat{y}=x^T\beta+v=\begin{bmatrix}1\\x\end{bmatrix}^T\begin{bmatrix}v\\\beta\end{bmatrix}
$$
The dimension of $1,v$ are 1.

The dimension of $x,\beta$ are $n$.

Literally no difference from the left hand side.



📌 **House price regression model**

Suppose:

- $y$, the actual selling price of the house
- $x_1$, the house area
- $x_2$, the number of bedrooms
- $\hat{y}$, the estimate price

Then we have:
$$
\hat{y}=x^T\beta+v=\beta_1x_1+\beta_2x_2+v
$$
As a specific numerical example, consider the regression model parameters:
$$
\beta=(148.73,-18.85), \quad v=54.40
$$

- $\beta_1>0$, it is easy to understand, house area:arrow_up_small:, price:arrow_up_small:
- $\beta_2<0$, this is hard to understand, maybe because increasing the number of rooms with same area will be considered as a public house?..(公租房)
- $v>0$, considering when $x_1=0,x_2=0$, then $v=54.40$, that is the value of the lot.(土地价格)



# 3.Norm and Distance

## 3.1. Norm

### 3.1.1. Definition and Properties

📌 **Euclidean Norm(L-2 Norm)**

Suppose:

- $x$ is a $n$-vector
- $\norm{x}$, is denoted as its *norm*.

$$
\norm{x}=\sqrt{x_1^2+x_2^2+\cdots+x_n^2+}
$$

Since it is no difference as the **squareroot of the inner product** of the vector with **itself**, we can write as:
$$
\norm{x}=\sqrt{x^Tx}
$$
Another notation of Euclidean Norm:
$$
\norm{x}_2
$$
The subscript $2$ indicates that the entries of $x$ are raised to the second power. That's why we call it L-2 Norm.



📌 **Why we use $\norm{ }$ to wrap Euclidean Norm?**

> ​	:star:For measuring magnitude

The double bar notation indicates the norm of a vector is a (numerical) measure of its **magnitude**(not considering orientation). Therefore, we can say a vector is **small** if its *norm is a small* number, and **large** is with a *large number*.



📌 **Properties of Norm**

> ​	:one:*nonnegative homogeneity*非负齐次性

$$
\norm{\beta x} = \abs{\beta}\norm{x}
$$

> ​	:two:*Triangle Inequality* (subadditivity次可加性)

$$
\norm{x+y}\leq\norm{x}+\norm{y}
$$

> ​	:three:*Nonnegativity*

$$
\norm{x}\geq0
$$

> ​	:four:*Definiteness*

$$
\norm{x}=0, \text{only if }x=0
$$



📌 **general norm**

Any real-valued function of an $n$-vector that satisfies the **4** properties listed above is called a (**general**) norm. But usually, when talking about norm, we refer to *Euclidean norm*.



### 3.1.2. Descendant of Norm(衍生物)

There are a lot of concepts closely related to norm.

📌**RMS(root-mean-square)**
$$
\bold{rms}(x)=\sqrt{\frac{x_1^2+\cdots+x_n^2}{n}}=\frac{\norm{x}}{\sqrt{n}}
$$

The key idea of RMS is to <u>**compare norms of vectors with different dimensions**</u>.🌟



📌 **Norm of a sum**

Suppose you have 2 vectors, $x$ and $y$. The norm of $x+y$ is:
$$
\norm{x+y}=\sqrt{\norm{x}^2+2x^Ty+\norm{y}^2}
$$


📌 **Norm of a block vectors**

Suppose you have a block vectors $d$ which is composed by $a,b,c$:
$$
d=\begin{matrix}a_1\\\vdots\\a_n\\b_1\\\vdots\\b_n\\c_1\\\vdots\\c_n\end{matrix}
$$
The norm-squared of a stacked vector is the sum of the norm-squared values of its subvectors:
$$
\norm{d}^2=d^Td=a^Ta+b^Tb+c^Tc=\norm{a}^2+\norm{b}^2+\norm{c}^2
$$


This philosophy always is treated as its reverse:  <u>the norm of a stacked vector</u> **is** <u>the norm of the vector formed from the norms of the subvectors</u>.
$$
\norm{(a,b,c)}=\sqrt{\norm{a}^2+\norm{b}^2+\norm{c}^2}=\norm{(\norm{a},\norm{b},\norm{c})}
$$


📌 **Chebyshev Inequality**





