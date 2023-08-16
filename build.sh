#main.cpp
#include <iostream>
#include "MyLibrary_stub.h"

#int main(int argc, char** argv) {
#    std::cout << "hello from cpp" << std::endl;
#    hs_init(&argc, &argv);
#    helloFromHaskell();
#    hs_exit();
#    return 0;
#}

# MyLibrary.hs
#module MyLibrary where

#foreign export ccall helloFromHaskell :: IO ()

#helloFromHaskell :: IO ()
#helloFromHaskell = putStrLn "Hello from haskell"

ghc -XForeignFunctionInterface -c MyLibrary.hs & g++ -c main.cpp -I/usr/lib/ghc-9.0.2/include & ghc -no-hs-main MyLibrary.o main.o -lstdc++
