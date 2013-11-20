//
//  NDDTrampoline.m
//  NDDesiderata
//
//  Created by Nathan Douglas on 03/06/2013.
//
//

@implementation NDDTrampoline {
	NSMethodSignature *(^selectorHandler)(SEL);
	void (^invocationHandler)(NSInvocation *);
}

+ (instancetype)trampolineWithSelectorHandler:(NSMethodSignature *(^)(SEL))selectorHandler
  invocationHandler:(void (^)(NSInvocation *))invocationHandler {
	NDDTrampoline *result = [self alloc];
	result->selectorHandler = [selectorHandler copy];
	result->invocationHandler = [invocationHandler copy];
	return result;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)selector {
	return self->selectorHandler(selector);
}

- (void)forwardInvocation:(NSInvocation *)invocation {
	self->invocationHandler(invocation);
}

@end
