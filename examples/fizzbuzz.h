//
//  fizzbuzz.h
//  wolffiaCo
//
//  Created by Timo Reunanen on 18/02/2014.
//  Copyright (c) 2014 Timo Reunanen. All rights reserved.
//

#ifndef __wolffiaCo__fizzbuzz__
#define __wolffiaCo__fizzbuzz__

#include <stdio.h>

#include "coroutine.h"

class FizzBuzz {
public:
    FizzBuzz() : fizzCount(0), buzzCount(0), counterCount(0) {}
    
    // Define attributes for Runner coroutine.
    CORO_Define(Runner);
    void operator()();
    
    void stats();
    
private:
    
    int fizzCount, buzzCount, counterCount, counter;
    bool first;
    
    // Define attributes for Fizz coroutine.
    CORO_Define(Fizz);
    bool fizz();
    
    // Define attributes for Buzz coroutine.
    CORO_Define(Buzz);
    bool buzz();
};

#endif /* defined(__wolffiaCo__fizzbuzz__) */
