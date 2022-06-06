

<div align="center">
    <h1>
        Differentiation
    </h1>
</div>

# 0.Limits

## 0.0. Introduction to limits

### Summary⭐

📌**Definition of right-hand and left-hand limits**

![See text below.](img/images_u0lim1_leftright.svg)

> ​	📍<u>Right-hand limit</u>

Suppose $f(x)$ gets really close to $R$ for values of $x$ that get really close to (*but are not equal to*) $a$ **from the right**. Then we say $R$ is the **right-hand limit** of the function $f(x)$ as $x$ approaches $a$ from the right.

We write:
$$
f(x)\to R \space \text{as}\space x\to a^+\\
\text{or}\\
\lim_{x\to a^+}f(x)=R
$$

> ​	📍<u>Left-hand limit</u>

Suppose $f(x)$ gets really close to $L$ for values of $x$ that get really close to (*but are not equal to*) $a$ **from the left**. Then we say $L$ is the **left-hand limit** of the function $f(x)$ as $x$ approaches $a$ from the left.

We write:
$$
f(x)\to L \space \text{as} \space x\to a^-\\
\text{or}\\
\lim_{x\to a^-}f(x)=L
$$


📌**Possible limit behaviors**

| Index | Right-hand limit | Left-hand limit | R & L                                        | Example                                                      | Image                                                        |
| ----- | ---------------- | --------------- | -------------------------------------------- | ------------------------------------------------------------ | ------------------------------------------------------------ |
| 1️⃣     | exist✔           | exist✔          | $=$✔exist and equal                          | $f(x)=x^2$<br>looks at $x=0$                                 | <img src="img/image-20220203104207473.png" alt="image-20220203104207473"  /> |
| 2️⃣     | exist✔           | exist✔          | $\neq$❌exist but not equal                   | $f(x) = \frac{\sqrt{(3-5x+x^3+x^2)}}{(x-1)}$<br>looks at $x=1$ | <img src="img/image-20220203110211830.png" alt="image-20220203110211830"  /> |
| 3️⃣     | not exist❌       | not exist❌      | ❌$L$&$R$ both blows up to $\pm\infin$        | $f(x)=\frac{1}{x}$<br>looks at $x=0$                         | <img src="img/image-20220203104105031.png" alt="image-20220203104105031"  /> |
| 4️⃣     | not exist❌       | not exist❌      | ❌oscillates and never settle down to a value | $f(x)=\sin(13/x)$<br>looks at $x=0$                          | ![image-20220203113840991](img/image-20220203113840991.png)  |





📌**Limit Definition⭐**

> ​	📍<u>The Limit in Words</u>

If a function $f(x)$ <u>**approaches**</u> some value $L$ as $x$ approaches $a$ from <u>**both**</u> *the right and the left*, then the limit of $f(x)$ exists and equals $L$.



> ​	📍<u>The Limit in Symbols</u>

If
$$
\lim_{x\to a^+}f(x)=\lim_{x\to a^-}f(x)=L
$$
then
$$
\lim_{x\to a}f(x)=L
$$
Alternatively,
$$
f(x)\to L \quad \text{as} \quad x\to a
$$
Remember that $x$ is <u>approaching</u> $a$ but does **not equal** $a$.



📌**The Limit Laws**

Suppose:
$$
\lim_{x\to a}f(x)=L,\quad \lim_{x\to a}g(x)=M
$$
Then we get the following Limit Laws:

> ​	📍Limit Law for Addition

$$
\lim_{x\to a}[f(x)+g(x)]=L+M
$$

> ​	📍Limit Law for Subtraction

$$
\lim_{x\to a}[f(x)-g(x)]=L-M
$$

> ​	📍Limit Law for Multiplication

$$
\lim_{x\to a}[f(x)\cdot g(x)]=L\cdot M
$$

> ​	📍Limit Law for Division(part 1)

$$
\lim_{x\to a}\frac{f(x)}{g(x)}=\frac{L}{M}
$$

### Example

📌**Example: $L\neq R$**

The following example demonstrates the left-hand limit and right-hand limit may not be equal at $x=1$.
$$
f(x) = \frac{\sqrt{(3-5x+x^3+x^2)}}{(x-1)}
$$
To calculate the limit, we can approaches the value as follow:
$$
L\begin{cases}x=0\\x=0.5\\x=0.9\\x=0.99\end{cases}
R\begin{cases}x=2\\x=1.5\\x=1.1\\x=1.01\end{cases}
$$


<img src="img/image-20220203110856068.png" alt="image-20220203110856068" style="zoom: 80%;" />





📌**Example of $DNE$**

$DNE$ stands for <u>does not exist</u>.

Considering:
$$
j(x)=\sin(13/x), \text{what is }\lim_{x\to 0^+}j(x)?
$$

```c++
int main()
{
	std::cout << "j(x) = sin(13/x)" << std::endl;
	std::cout << Calculate(1) << std::endl;
	std::cout << Calculate(0.5) << std::endl;
	std::cout << Calculate(0.1) << std::endl;
	std::cout << Calculate(0.01) << std::endl;
	return 0;
}

double Calculate(double x)
{
    return sin(13/x);
}
```

The result seems weird:

```bash
➜  calculate_limit git:(main) ✗ ./main.exe
j(x) = sin(13/x)
0.420167
0.762558
-0.930106
-0.580513
```

it oscillates and **never settle down** to a value.



📌**Example: Graph including most behaviors**

![At x equals negative 2.9, the funtion is near 3. At x equals negative 2, the function is 2. At x equals negative 1.9, the function is near 1.](img/images_u0lim1_estlimits.svg)
$$
\begin{align}
\lim_{x\to(-2)^-}f(x)&=3\\
\lim_{x\to(-2)^+}f(x)&=1\\
\lim_{x\to(-2)}f(x)&=DNE\\
f(-2)&=2\\
\\\\
\lim_{x\to1^-}f(x)&=2\\
\lim_{x\to1^+}f(x)&=2\\
\lim_{x\to1}f(x)&=2\\
f(1)&=DNE\\
\\\\
\lim_{x\to3^-}f(x)&=DNE\\
\lim_{x\to3^+}f(x)&=1\\
\lim_{x\to3}f(x)&=DNE\\
f(3)&=1\\
\end{align}
$$
1️⃣If $L/R$ exists, the other one does not have to exist.  e.g. $x=3$

2️⃣$L$ not have to equal $R$, vice versa. e.g. $x=-2,x=3$

3️⃣If $\lim_{x\to a}=K$, $f(a)$ does not have to be $K$.   e.g.$x=1$ 





📌**Example: Floor Function**

The floor function is quite fun. Please take some time taste the following graph and equations.

<img src="img/image-20220203122021892.png" alt="image-20220203122021892" style="zoom:80%;" />
$$
\begin{align}
\lim_{x\to2^-}\lfloor x\rfloor&=1\\
\lim_{x\to2^+}\lfloor x\rfloor&=2\\
\lim_{x\to2}\lfloor x\rfloor&=DNE\\
\lfloor2\rfloor&=2
\end{align}
$$


## 0.1. Continuity

### Summary⭐

📌**Definition of *continuity* at a point**

We say that a function $f$ is **continuous at a point** $x=a$ if
$$
\lim_{x\to a}f(x) = f(a)
$$
In particular, if either $f(a)$ or $\lim_{x\to a}f(x)$ fails to exist, then $f$ is discontinuous at $a$.



We say that a function is **right-continuous at a point** $x=a$ if $\lim_{x\to a^+}f(x) = f(a)$

We say that a function is **left-continuous at a point** $x=a$ if $\lim_{x\to a^-}f(x) = f(a)$



📌**Types of Discontinuities**

> ​	📍Jump Discontinuity

If the left-hand limit $\lim_{x\to a^-}$ and the right-hand limit $\lim_{x\to a^+}$ both exist at a point $x=a$, but they are not equal, then we say that $f$ has a **jump discontinuity** at $x=a$.

![img](img/images_u0lim2_jump.svg)

> ​	📍Removable Discontinuity

If the overall limit $\lim_{x\to a}f(x)$ exists (i.e., the left- and right-hand limits agree), but the overall limit does not equal $f(a)$, then we say that $f$ has a **removable discontinuity** at $x=a$.

![img](img/images_u0lim2_removable.svg)



📌**Definition of continuous function**

A function $f(x)$ is continuous if for every point $c$ in the domain of $f(x)$ , the function $f$ is continuous at the point $x=c$.



📌**Basic Continuous Functions**

> ​	The following functions are continuous at ***all real numbers***:

- all polynomials
- $\sqrt[3]{x}$
- $\abs{x}$
- $\cos x$ and $\sin x$
- exponential function $a^x$ with base $a>0$

> ​	The following functions are continuous ***at the specified values*** of $x$:

- $\sqrt{x}$, for $x>0$
- $\tan x$, at all $x$ where it is defined
- logarithmic functions $\log_{a}x$ with base $a>0$, for $x>0$



📌**Limit laws and continuity**

If the function $f$ and $g$ are continuous everywhere, then:

- $f+g$ is continuous everywhere
- $f-g$ is continuous everywhere
- $f\cdot g$ is continuous everywhere
- $f\circ g$ is continuous everywhere,  ($\circ$ means compose, e.g. $f(g(x))$)
- $\frac{f}{g}$ is continuous where it is defined.



📌**Intermediate Value Theorem**

if $f$ is a function which is continuous on the interval $[a,b]$ and $M$ lies between the value $f(a)$ and $f(b)$, then there is at least one point $c$ between $a$ and $b$ such that $f(c)=M$

(A function is **continuous on a closed interval** $[a,b]$ if it is right-continuous at $a$, left-continuous at $b$, and continuous at all points between $a$ and $b$.)

<img src="img/image-20220203130246703.png" alt="image-20220203130246703" style="zoom:67%;" />

### Example

📌**Example: Graph with Continuity**

![img](img/images_u0lim2_continuitytest2.svg)

| At     | Left-continuous | Right-continuous | Continuous | Removable Discontinuity | Jump Discontinuity |
| ------ | --------------- | ---------------- | ---------- | ----------------------- | ------------------ |
| $x=-2$ | ❌               | ❌                | ❌          | ⭕                       |                    |
| $x=-1$ | ✔               | ✔                | ✔          |                         |                    |
| $x=1$  | ❌               | ❌                | ❌          | ⭕                       |                    |
| $x=3$  | ❌               | ✔                | ❌          |                         | ⭕                  |
| $x=4$  | ✔               | ✔                | ✔          |                         |                    |



📌**Example: $f,g$ not continuous, but $f+g$ might be continuous**

In the summary section, we know that if the function $f$ and $g$ are continuous everywhere, then $f+g$ is continuous everywhere.

But on the **contrary**, if $f,g$ are not continuous, $f+g$ might be continuous!
$$
\begin{align}
f(x)&=\lfloor x \rfloor\\
g(x)&=-\lfloor x \rfloor\\
f(x)+g(x)&=\bold{0}
\end{align}
$$
Constant $\bold{0}$ is continuous everywhere.



📌**Example: Suppose that $f(1)=2$ and $f(4)=4$ . Must the graph $f$ of intersect the line $y=3$?**

![images_u0lim5_ivt2](img/images_u0lim5_ivt2.svg)

Not really. Because it doesn't say this is a continuous function. Therefore the following function need not to intersect with the line.

![images_u0lim5_ivtsol2](img/images_u0lim5_ivtsol2.svg)



### Misc

📌**What makes the Intermediate Value Theorem a deep result?**

The Intermediate Value Theorem is <u>**profound**</u> because it <u>takes information that is local</u> by nature, and allows you to <u>conclude a global result</u>. Continuity at a point is local information, because it only requires knowledge of the function's behavior near that point. But somehow, if we know this fact at every point on an interval, then the Intermediate Value Theorem tells us something about the overall, or global behavior - namely, that the function has to take on a particular value, or its graph has to cross a certain line.





## 0.2. Limits of quotients

### Summary⭐

📌**Limit Law for Division**

If:
$$
\lim_{x\to a}f(x)=L\quad\text{and } \lim_{x\to a}g(x)=M
$$
then:
$$
\begin{align}
\text{Case 1: If }&M\neq0,\text{then }\lim_{x\to a}\frac{f(x)}{g(x)}=\frac{L}{M}\\
\text{Case 2: If }&M=0,\text{but }L\neq0,\text{then }\lim_{x\to a}\frac{f(x)}{g(x)}\text{ does not exist}\\
\text{Case 3: If both }&M=0\text{ and }L=0,\text{then }\lim_{x\to a}\frac{f(x)}{g(x)}\text{might be exist, or it might not exist.}
\end{align}
$$
Regarding the 3rd situation, More work is necessary to determine whether the last type of limit exists, and what it is if it does exist.





### Example

📌**Example - Limit Laws**

Suppose that:
$$
\lim_{x\to-1}f(x)=0, \lim_{x\to-1}g(x)=17, \lim_{x\to-1}h(x)=0
$$
We have:
$$
\begin{align}
\lim_{x\to-1}g(x)h(x)&=0\\
\lim_{x\to-1}\frac{g(x)}{f(x)}&=DNE\\
\lim_{x\to-1}f(x)+g(x)+h(x)&=17\\
\lim_{x\to-1}\frac{f(x)}{h(x)}&=\text{Cannot be determined based on the information given}\\
\lim_{x\to-1}\frac{f(x)+h(x)}{g(x)}&=0
\end{align}
$$



**📌Example of dealing with Case 3**

Normally, when you encounter polynomial function, you would need a **<u>factorization</u>**.

> ​	since $x^2+2x-3=0,\quad x^2-3x+2=0 \quad \text{when }x=0$, therefore we need to factorization.

$$
\begin{align}
\lim_{x\to1}\frac{x^2+2x-3}{x^2-3x+2} &= \lim_{x\to1}\frac{(x-1)(x+3)}{(x-1)(x-2)}\\
&=\lim_{x\to1}\frac{\cancel{(x-1)}(x+3)}{\cancel{(x-1)}(x-2)}\\
&=-4
\end{align}
$$



> ​	since $x+1=0,\quad x+\frac{1}{x}+2=0 \quad \text{when }x=-1$, therefore we need to factorization.

$$
\begin{align}
\lim_{x\to-1}\frac{x+1}{x+\frac{1}{x}+2}&=\lim_{x\to-1}\frac{x(x+1)}{x(x+\frac{1}{x}+2)}\\
&=\lim_{x\to-1}\frac{x^2+x}{x^2+1+2x}\\
&=\lim_{x\to-1}\frac{x(x+1)}{(x+1)(x+1)}\\
&=\lim_{x\to-1}\frac{x\cancel{(x+1)}}{(x+1)\cancel{(x+1)}}\\
&=\lim_{x\to-1}\frac{-1}{0}\\
&=DNE
\end{align}
$$





📌**More Example - Division Limit**

> ​	$\text{Case 1: If }&M\neq0,\text{then }\lim_{x\to a}\frac{f(x)}{g(x)}=\frac{L}{M}\\$

$$
\begin{align}
\lim_{x\to2}\frac{1/x+x^2}{x-3}&=\frac{4.5}{-1}=-4.5\quad\text{(Case 1)}\\
\end{align}
$$



> ​	$\text{Case 2: If }&M=0,\text{but }L\neq0,\text{then }\lim_{x\to a}\frac{f(x)}{g(x)}\text{ does not exist}\\$

$$
\begin{align}
\lim_{x\to0^+}\frac{2\cos x+1}{x^2+x}&=\frac{2\cross1+1}{0+0} = DNE\quad\text{(Case 2)}\\
\end{align}
$$







> ​	$\text{Case 3: If both }M=0\text{ and }L=0,\text{then }\lim_{x\to a}\frac{f(x)}{g(x)}\text{might be exist, or it might not exist.}$

======>factorization
$$
\begin{align}
\lim_{x\to2}\frac{12/x-3x}{2-3x+x^2}&=-6\quad\text{(Case 3, elaborate👇)}\\
&=\lim_{x\to2}\frac{x(12/x-3x)}{x(2-3x+x^2)}\\
&=\lim_{x\to2}\frac{12-3x^2}{x(x^2-3x+2)}\\
&=\lim_{x\to2}-\frac{3x^2-12}{x(x^2-3x+2)}\\
&=\lim_{x\to2}-\frac{3(x^2-4)}{x(x^2-3x+2)}\\
&=\lim_{x\to2}-\frac{3(x+2)(x-2)}{x(x-1)(x-2)}\\
&=\lim_{x\to2}-\frac{3(x+2)\cancel{(x-2)}}{x(x-1)\cancel{(x-2)}}\\
&=\lim_{x\to2}-\frac{3(2+2)}{2(2-1)}=-6
\end{align}
$$



======>factorization
$$
\begin{align}
\lim_{x\to3}\frac{2x^2-10x+12}{x^3-6x^2+9x}&=\lim_{x\to3}\frac{2(x^2-5x+6)}{x(x^2-6x+9)}\\
&=\lim_{x\to3}\frac{2(x-2)(x-3)}{x(x-3)^2}\\
&=\lim_{x\to3}\frac{2(x-2)}{x(x-3)}\\
&=\lim_{x\to3}\frac{2(3-2)}{3(3-3)}\\
&=\lim_{x\to3}\frac{2\cross1}{0}\\
\text{therefore, the result is }DNE
\end{align}
$$



======>factorization
$$
\begin{align}
\lim_{x\to0}\frac{3x^3+x^2}{x^3+x^2+x}&=\lim_{x\to0}\frac{x^2(3x+1)}{x^2(x+1+\frac{1}{x})}\\
&=\lim_{x\to0}\frac{3x+1}{x+1+\frac{1}{x}}\\
&=\lim_{x\to0}\frac{3\cross0+1}{0+1+\frac{1}{0}}\\
&=\lim_{x\to0}\frac{1}{1+\infin}\\
&=\text{because denominator is + infinity, therefore the whole is 0}\\
&=0
\end{align}
$$



======>factorization
$$
\begin{align}
\lim_{x\to-1}\frac{2x^2+7x+5}{x+1} &= \lim_{x\to-1}\frac{2(x^2+\frac{7}{2}x+\frac{5}{2})}{x+1}\\
&= \lim_{x\to-1}\frac{2(x+1)(x+\frac{5}{2})}{x+1}\\
&= \lim_{x\to-1}\frac{2\cancel{(x+1)}(x+\frac{5}{2})}{\cancel{x+1}}\\
&= \lim_{x\to-1}2(-1+\frac{5}{2})=3\\
\end{align}
$$







**📌$DNE$ Speaking in <u>both</u> left-hand <u>and</u> right-hand**

> ​	Q: Given the results for $\lim_{x\to0^-}\frac{1}{x}$ and $\lim_{x\to0^+}\frac{1}{x}$, what should we say about $\lim_{x\to0}\frac{1}{x}$?

> ​	A: The limit does not exist($DNE$), and it is neither $+\infin$ nor $-\infin$. Let's look at the graph.

<img src="img/image-20220606101513491.png" alt="image-20220606101513491" style="zoom: 25%;" />



**📌$DNE$ Speaking in <u>either</u> both left-hand <u>or</u> right-hand**

We can split it into left-hand and right-hand which are:
$$
\lim_{x\to2^-} \frac{3x}{4-x^2} \text{and }\lim_{x\to2^+} \frac{3x}{4-x^2}
$$

The difference is that:

- in $x\to2^-$, the result of $4-x^2$ is very close to $0$ but $4>x^2$(positive), therefore $\lim_{x\to2^-} \frac{3x}{4-x^2}=+\infin$
- in $x\to2^+$, the result of $4-x^2$ is very close to $0$ but $4<x^2$(negative), therefore $\lim_{x\to2^+} \frac{3x}{4-x^2}=-\infin$

And we can see it from the following graph:

<img src="img/image-20220606103534159.png" alt="image-20220606103534159" style="zoom: 25%;" />



## 0.3. Homework

**📌Quiz**

Why $x^{3/2}+4$ is not continuous?

Because it is not defined where $x<0$ so therefore it is not continuous for all reall $x$.



**📌Quiz**

The root $a$ of a polynomial $p(x)$ has multiplicity $m$ if $(x-a)^m$ is the largest power of $x-a$ that is a factor of $p$. In other words, , $p(x)=(x-a)^ms(x)$where $s(x)$ is a polynomial for which $a$ is not a root.



> ​	Description: The numerator and denominator <u>**can't not be canceled**</u> since the <u>root is different</u>!!



Q1️⃣: If $a$ is a root of multiplicity 5 for the polynomial $p$, and a root of multiplicity 7 for the polynomial $q$, what might be $\lim_{x\to a}\frac{p(x)}{q(x)}$? 

- [ ] 0
- [ ] 1
- [ ] -1
- [ ] 3
- [x] It does not exist

> ​	Explain: The denominator wins in the race to 0 so the limit is not defined.



Q2️⃣: If $a$ is a root of multiplicity 8 for the polynomial $p$, and a root of multiplicity 4 for the polynomial $q$, what might be $\lim_{x\to a}\frac{p(x)}{q(x)}$? 

- [x] 0
- [ ] 1
- [ ] -1
- [ ] 3
- [ ] It does not exist

> ​	Explain: The numerator wins the race to 0, so the limit is 0.



Q3️⃣: If $a$ is a root of multiplicity 6 for the polynomial $p$, and a root of multiplicity 6 for the polynomial $q$, what might be $\lim_{x\to a}\frac{p(x)}{q(x)}$? 

- [ ] 0
- [x] 1
- [x] -1
- [x] 3
- [ ] It does not exist

> ​	Explain: Both numerator and denominator are competing in the race towards zero, so the limit could be any finite, nonzero number!





**📌Quiz**

Let $f(x)=\frac{x-\sqrt[3]x+\cos x}{x^2-4}$ We have calculated the following values of $f$:
$$
\begin{align}
f(-3)&=-.51\\
f(-2.25)&=-1.48\\
f(-1.5)&=.16\\
f(-.75)&=-.26\\
f(0)&=-.25\\
f(.75)&=-.17\\
f(1.5)&=-.24\\
f(2.25)&=.29\\
f(3)&=.11\\
\end{align}
$$
The number of roots of $f$ is **<u>at least</u>** **1**.

We know that this function is not continuous at $\pm2$ and therefore we need to consider that dividing the region into:
$$
(-\infin,-2),(-2,2),(2,+\infin)
$$






<div align="center">
    <h1>
        Integration
    </h1>
</div>



<div align="center">
    <h1>
        Coordinate Systems & Infinite Series
    </h1>
</div>
