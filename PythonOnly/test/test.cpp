#include <boost/python.hpp>
#include<iostream>
using namespace std;
using namespace boost::python;
namespace p = boost::python;


// ただの関数
int add(int lhs,int rhs){
  return lhs + rhs;
}



//BOOST_PYTHON_MODULE()の引数がmodule名
BOOST_PYTHON_MODULE(test){
  Py_Initialize();
  using namespace boost::python;
  //CPPの関数を登録する
  //Pythonでの関数名, addはそれに対応するC++で書いた関数
  def("add",&add);
}
// g++ -c test.cpp -Wall -O2 -fPIC -I/usr/local/python/include/python3.12 
// g++ test.o -o test.so -shared -I/usr/local/python/include/python3.12 -lboost_python312 
