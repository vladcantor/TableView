//
//  SynthesizeSingleton.h
//  Komtel
//
//  Created by Iustina Gligor on 3/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

/**
 Modified Synthesize Singleton for Automatic Reference Counting
 dispatch_once solved the problem for safely creating a singlton in that:
 - it guaranties that the code in the block will only be called once in the lifetime of the application
 - it's thread safe "if called simultaniously from multiple threads, this function waits synchronously until the block has completed." 
 - it's faster than other methods such as @synchronize()
 
 */


#ifndef SynthesizeSingletonARC
#define SynthesizeSingletonARC(classname)\
\
+(classname *) sharedInstance{\
\
    static dispatch_once_t pred = 0;\
    __strong static classname *sharedInstance = nil;\
    dispatch_once (&pred, ^{\
        sharedInstance = [[self alloc] init];\
    });\
return sharedInstance;\
}
#endif
