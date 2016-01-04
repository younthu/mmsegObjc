# mmsegObjc
Objective C wrapper of rmmseg-cpp, http://rmmseg-cpp.rubyforge.org/

rmmseg-cpp is Chinese word segmentation library for Ruby in C++,https://github.com/pluskid/rmmseg-cpp

# Usage
Install via pod
```
pod 'mmsegObjc', :git => "https://github.com/younthu/mmsegObjc"
```

Sample code

```objc
#import <MMSegObjC/MMsegObjC.h>

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    NSArray<NSString*> *arr = [MMSegObjC getTokensFromString:@"我们都喜欢用 Ruby"];
    
    for (NSString *token in arr) {
        NSLog(@"%@", token); // 我们 都 喜欢 用 Ruby
    }
}
```

# Log

1. 2016/01/02, The sample compiles and run well. Next, create a pod spec for it.
2. 2016/01/04, mmsegObjc is ready for release.
