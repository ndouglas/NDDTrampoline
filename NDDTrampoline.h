//
//  NDDTrampoline.h
//  NDDesiderata
//
//  Created by Nathan Douglas on 03/06/2013.
//
//

#import <Foundation/Foundation.h>

/**
 A simple trampoline.
 */

@interface NDDTrampoline : NSProxy

/**
 Creates and returns an instance of NDDTrampoline with the specified selector
 and invocation handler objects.

 @param selectorHandler A block that returns the appropriate method signature
 for a selector passed to it.
 @param invocationHandler A block that handles the passed invocation.
 @return A properly initialized instance of NDDTrampoline.
 */

+ (instancetype)trampolineWithSelectorHandler:(NSMethodSignature *(^)(SEL))selectorHandler
  invocationHandler:(void (^)(NSInvocation *))invocationHandler;

@end

