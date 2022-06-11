### A Pluto.jl notebook ###
# v0.19.8

using Markdown
using InteractiveUtils

# ╔═╡ a72826c6-7279-41ea-83a2-99234e6e90a9
using LinearAlgebra, SparseArrays, Test

# ╔═╡ 86193e5e-e8c7-11ec-009e-99e0d27f3f6e
md"# 1 Vector"

# ╔═╡ 966e4a03-7164-456a-9805-169b8e033c92
md"
## 1.1
*Julia timing test*. Determine how much time it takes for your computer to compute the inner product of two vectors of length $10^8$ (100 million), and use this to estimate (very crudely) how many Gflops/sec your computer can carry out. The following code generates two (random) vectors of length $10^8$, and times the evaluation of the inner product.
"

# ╔═╡ c9822bc7-d005-4e5d-ab8b-505b6bfb17eb
md"

The computing time of the following operation can be seen.

```julia
a = randn(10^8);
b = randn(10^8);
@time s=a'*b
```

"

# ╔═╡ 8fd94d3e-9235-4a76-be03-9c9f2bbd679b
begin
function func_1_1()
	a = randn(10^8);
	b = randn(10^8);
	@time s=a'*b;
end
func_1_1()
end



# ╔═╡ 2bb57707-f513-4ccd-bfd3-4d90a2a5d6e1
md"
How long would it take a person to carry this out, assuming the person can carry out **a floating-point operation** every 10 seconds for 8 hours each day?

The detail of such operation is the following formula.

$a^Tb = a_1b_1+a_2b_2+\cdots+a_nb_n$


Therefore, the number of operation is $10^8+\frac{10^8}{2}-1$
"



# ╔═╡ 34e8e29c-ac37-443c-a427-c289a93ae8b8
person_day = (10^8 + (10^8/2-1)) / (8 * 3600 / 10)

# ╔═╡ 5499125b-12e1-4431-9cf3-5599ad7ce352
md"Then the day required is $(person_day)."

# ╔═╡ 2713085e-322a-4055-93ed-f7e608f316d4
md"
## 1.2

*Creating vectors in Julia*. In each of the parts below, use Julia to create the described vector $a$. In each case, check that $a^Tx$ gives the correct result, for a random vector $x$.

* (a) $a^Tx$ extracts (is equal to) the 5th entry of the 10-vector $x$.
* (b) $a^Tx$ is the weighted average of a 3-vector $x$, assigning weights 0.3 to the first component, 0.4 to the second, and 0.3 to the third.
* (c) $a^Tx$ (with $x$ a 22-vector) is the sum of $x_i$ for $i$ a multiple of a 4, minus the sum of $x_i$ for $i$ a multiple of 7.
* (d) $a^Tx$ (with $x$ an 11-vector) is the average of the middle five entries of $x$, i.e., entries 4 to 8.
"

# ╔═╡ aeeb04de-b52f-4833-9f9d-cb83d31b34ba
begin

# solution (a)
x = randn(10);
y = zeros(10);
y[5]=1;
flag = x[5] == x'*y;
if(flag)
	println("The vector of (a): $(y)")
end

# solution (b)
x = randn(3);
y = [0.3, 0.4, 0.3];
result = x'*y;
expected = x[1]*y[1] + x[2]*y[2] + x[3]*y[3];
flag = (result-expected)<eps(Float32);
if(flag)
	println("The vector of (b): $(y)")
else
	println("Damn! Solution(b) failed!")
end

# solution (c)
x = randn(22);
y = zeros(22);
for i in 1:22
	if(i%4 == 0)
		y[i] = 1
	elseif(i%7 == 0)
		y[i] = -1
	end
end
result = x'*y;
expected = x[4]*1 + x[7]*(-1) + x[8]*1 + x[12]*1 + x[14]*(-1) + x[16]*1 + x[20]*1 + x[21]*(-1);
flag = (result-expected)<eps(Float32);
if(flag)
	println("The vector of (c): $(y)")
else
	println("Damn! Solution(c) failed! result=$(result), expected=$(expected).")
end

# solution (d)
n=11;
x = randn(n);
y = zeros(n);
mid = round(Int32, n/2);
for i in -2:2
	y[mid+i] = 1/5;
end
result = x'*y;
expected = (x[4]+x[5]+x[6]+x[7]+x[8])/5;
flag = (result-expected)<eps(Float32);
if(flag)
	println("The vector of (d): $(y)")
else
	println("Damn! Solution(d) failed! result=$(result), expected=$(expected).")
end

end

# ╔═╡ 3b26467c-6866-45f2-b724-8000f7646681
md"## 1.3

*Vector expressions*  Suppose $a = (4, −2, 1)$. Determine whether each expression below is valid notation. If it is, give its value.

* (a) ✅$(a,a)$
* (b) ❌$a − [4, −2, 0]$
* (c) ✅$a −\begin{bmatrix}4\\-2\\3\end{bmatrix}$
* (d) ✅$a + (2, 6)$

"

# ╔═╡ 1a5a72a0-c555-49b5-ab33-63efda33be63
begin
function func_1_3()
	a = [4, -2, 1];
	a_a = a + a
	@test_throws DimensionMismatch a_b = a' - [4,-2,0]
	a_c = a - [4,-2,3]
	a_d = [a; [2,6]]
	println("(a,a) = $(a_a)")
	println("a − [4, −2, 0] =$(a_c)")
	println("a + (2, 6) = $(a_d)")
end
func_1_3()
end

# ╔═╡ 15159cf0-4694-42ba-a5f1-12fd0db89b3c
md"# 1.4

The 7-vector $c$ represents the daily earnings of a company over one week, with $c_1$ the earnings on Sunday, $c_2$ the earnings on Monday, and so on, with $c_7$ the earnings on Saturday. (Negative entries in the earnings vector mean a loss on that day.)
Express the following quantities in the form $a^Tc$. In each case, give $a$ (which can be different for the different quantities, of course).

* (a) Wednesday’s earnings.
* (b) The total earnings over the week.
* (c) The average weekend earnings.
* (d) The average weekday earnings.
* (e) The difference between the average weekend earnings and the average weekday earnings.
"

# ╔═╡ 7204ac27-24a4-4be5-8d99-de8ea8776368
begin
function func_1_4()
	DAY = 7
	c = randn(7)
	# (a)
	a_a = zeros(DAY)
	a_a[4] = 1
	# (b)
	a_b = ones(DAY)
	# (c)
	a_c = zeros(DAY)
	a_c[1] = 1/2
	a_c[end] = 1/2
	# (d)
	a_d = zeros(DAY)
	a_d[2:6] .= 1/5
	# (e)
	a_e = copy(-a_c)
	a_e[2:6] = a_d[2:6]

	# unit testing - a
	actual = a_a'*c;
	expected = c[4];
	flag = (actual-expected)<eps(Float32);
	if(flag)
		println("(a) is correct, the vector is: $(a_a)")
	else
		println("Damn! Solution(a) failed!")
	end

	# unit testing - a
	actual = a_b'*c;
	expected = c[1]+c[2]+c[3]+c[4]+c[5]+c[6]+c[7];
	flag = (actual-expected)<eps(Float32);
	if(flag)
		println("(b) is correct, the vector is: $(a_b)")
	else
		println("Damn! Solution(b) failed!")
	end

	# unit testing - c
	actual = a_c'*c;
	expected = 0.5 * (c[1]+c[7]);
	flag = (actual-expected)<eps(Float32);
	if(flag)
		println("(c) is correct, the vector is: $(a_c)")
	else
		println("Damn! Solution(c) failed!")
	end

	# unit testing - d
	actual = a_d'*c;
	expected = (1/5) * (c[2]+c[3]+c[4]+c[5]+c[6]);
	flag = (actual-expected)<eps(Float32);
	if(flag)
		println("(d) is correct, the vector is: $(a_d)")
	else
		println("Damn! Solution(d) failed!")
	end

	# unit testing - e
	actual = a_e'*c;
	expected = (a_c'*c - a_d'*c);
	flag = (abs(actual)-abs(expected))<eps(Float32);
	if(flag)
		println("(e) is correct, the vector is: $(a_e)")
	else
		println("Damn! Solution(e) failed!")
	end

end

func_1_4()

end

# ╔═╡ 672de437-58bb-4841-8da2-7e6b99b2a621
md"## 1.5

*When an inner product or scalar-vector product is zero*. Given $n$-vectors $a, b, x$, and scalar $\alpha$.
Select one choice in each subproblem below.
- (a) If $a^Tb = 0$, then
  - (i) at least one of a or b must be $0$
  - (ii) both $a$ and $b$ must be $0$
  - (iii) both $a$ and $b$ can be nonzero ✅
- (b) If $\alpha x = 0$, then
  - (i) one of $\alpha$ or $x$ must be $0$ ✅
  - (ii) both $\alpha$ and $x$ must be $0$
  - (iii) both $\alpha$ and $x$ can be nonzero
"

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
LinearAlgebra = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"
SparseArrays = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"
Test = "8dfed614-e22c-5e08-85e1-65c5234f0b40"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
"""

# ╔═╡ Cell order:
# ╠═a72826c6-7279-41ea-83a2-99234e6e90a9
# ╟─86193e5e-e8c7-11ec-009e-99e0d27f3f6e
# ╟─966e4a03-7164-456a-9805-169b8e033c92
# ╟─c9822bc7-d005-4e5d-ab8b-505b6bfb17eb
# ╟─8fd94d3e-9235-4a76-be03-9c9f2bbd679b
# ╟─2bb57707-f513-4ccd-bfd3-4d90a2a5d6e1
# ╟─34e8e29c-ac37-443c-a427-c289a93ae8b8
# ╟─5499125b-12e1-4431-9cf3-5599ad7ce352
# ╟─2713085e-322a-4055-93ed-f7e608f316d4
# ╟─aeeb04de-b52f-4833-9f9d-cb83d31b34ba
# ╟─3b26467c-6866-45f2-b724-8000f7646681
# ╟─1a5a72a0-c555-49b5-ab33-63efda33be63
# ╟─15159cf0-4694-42ba-a5f1-12fd0db89b3c
# ╟─7204ac27-24a4-4be5-8d99-de8ea8776368
# ╟─672de437-58bb-4841-8da2-7e6b99b2a621
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
