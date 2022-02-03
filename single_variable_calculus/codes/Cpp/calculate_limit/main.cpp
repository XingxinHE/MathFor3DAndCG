#include<iostream>
#include<cmath>
using namespace std;

double Calculate(double num);


int main()
{
	std::cout << "From right..." << std::endl;
	std::cout << Calculate(2) << std::endl;
	std::cout << Calculate(1.5) << std::endl;
	std::cout << Calculate(1.1) << std::endl;
	std::cout << Calculate(1.01) << std::endl;
	std::cout << "From left..." << std::endl;
	std::cout << Calculate(0) << std::endl;
	std::cout << Calculate(0.5) << std::endl;
	std::cout << Calculate(0.9) << std::endl;
	std::cout << Calculate(0.99) << std::endl;
	return 0;
}

double Calculate(double x)
{
	return sqrt((3 - 5 * x + x * x + x * x * x))/(x - 1);
        //return sin(13/x);

}
