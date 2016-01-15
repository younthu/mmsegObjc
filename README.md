# mmsegObjc

**About mmsegObjc**

Objective C wrapper of rmmseg-cpp, http://rmmseg-cpp.rubyforge.org/

rmmseg-cpp is Chinese word segmentation library for Ruby in C++,https://github.com/pluskid/rmmseg-cpp

**Platform support**

Supports both iOS and OSX.

**Version** 

Latest mmsegObjc is based on rmmseg-cpp-0.2.9, https://github.com/pluskid/rmmseg-cpp/tree/rmmseg-cpp-0.2.9 .

# Usage
Install via pod
```
pod 'mmsegObjc'
```

Sample code

```objc
#import <MMSegObjC/MMsegObjC.h>

- (void)testGetTokenStrings {
    // Init mmseg
    NSArray<NSString*> *arr = [MMSegObjC getTokenStringsFromString:@"我们都喜欢用 Ruby"];
    
    for (NSString *str in arr) {
        NSLog(@"%@", str); // 我们 都 喜欢 用 Ruby
    }
}

- (void)testGetTokens {
    NSArray<MMSToken*> *tokens = [MMSegObjC getTokensFromString:@"你妈妈叫什么名字, baby"];
    
    for (MMSToken *t in tokens) {
        NSLog(@"%@:%@", NSStringFromRange(t.range), t.text);
        //{0, 1}:你
        //{1, 2}:妈妈
        //{3, 1}:叫
        //{4, 2}:什么
        //{6, 2}:名字
        //{10, 4}:baby
    }
}
```

You can download the source code and try to run those unit tests in project MMSegObjC.xcodeproj.

Also, there is sample project with 'pod' integrated.

# Dictionaries
As far as v0.0.3, we used dictionaries from rmmseg-cpp, the pod will install dictonaries by default.

To make it simple, we exposed no interface for loading extra dictionaries. If you have dictionaries trained by yourself, it should not be so hard to load it, by looking into 

```objc
[MMSegObjC initializeEngine];
```

# Log

1. 2016/01/02, The sample compiles and run well. Next, create a pod spec for it.
2. 2016/01/04, mmsegObjc is ready for release.
3. 2016/01/05, latest mmsegObjc is based on rmmseg-cpp-0.2.9, https://github.com/pluskid/rmmseg-cpp.
