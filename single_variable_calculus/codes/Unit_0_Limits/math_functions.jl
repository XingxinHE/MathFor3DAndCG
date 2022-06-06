# Function g(x) #
function g(x)
    x / tan(2x)
end

println("Function: x / tan(2x). Result = -1    $(g(-1))")
println("Function: x / tan(2x). Result = -0.5  $(g(-0.5))")
println("Function: x / tan(2x). Result = -0.1  $(g(-0.1))")
println("Function: x / tan(2x). Result = -0.05 $(g(-0.05))")
println("Function: x / tan(2x). Result = -0.01 $(g(-0.01))")



# Function h(x) #
function h(x)
    (abs(x) + sin(x)) / (x * x)
end

println("Function: (abs(x) + sin(x)) / x * x. Result = 1    $(h(1))")
println("Function: (abs(x) + sin(x)) / x * x. Result = 0.5  $(h(0.5))")
println("Function: (abs(x) + sin(x)) / x * x. Result = 0.1  $(h(0.1))")
println("Function: (abs(x) + sin(x)) / x * x. Result = 0.05 $(h(0.05))")
println("Function: (abs(x) + sin(x)) / x * x. Result = 0.01 $(h(0.01))")



# Function h(x) #
function j(x)
    sin(13 / x)
end
println("Function: sin(13 / x). Result = 1       $(j(1))")
println("Function: sin(13 / x). Result = 0.5     $(j(0.5))")
println("Function: sin(13 / x). Result = 0.1     $(j(0.1))")
println("Function: sin(13 / x). Result = 0.05    $(j(0.05))")
println("Function: sin(13 / x). Result = 0.01    $(j(0.01))")
