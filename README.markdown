Just something I was playing with while investigating HOM.

Example:

    @interface NSObject (NDDTrampoline)
    @property (strong, nonatomic, readonly) id try;
    @end

    @implementation NSObject (NDDTrampoline)
    @dynamic try;
    - (id)try {
      return [NDDTrampoline trampolineWithSelectorHandler:^(SEL _selector_) {
        return [self methodSignatureForSelector:_selector_] ?: [NSMethodSignature signatureWithObjCTypes:"@@:"];
      } invocationHandler:^(NSInvocation *_invocation_) {
        if ([self respondsToSelector:_invocation_.selector]) {
          [_invocation_ invokeWithTarget:self];
        }
      }];
    }
    @end
