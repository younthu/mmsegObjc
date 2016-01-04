//
//  ViewController.m
//  SampleOSX
//
//  Created by Andrew(Zhiyong) Yang on 1/4/16.
//  Copyright © 2016 FoolDragon. All rights reserved.
//

#import "ViewController.h"
#import <MMSegObjC/MMsegObjC.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    NSArray<NSString*> *arr = [MMSegObjC getTokensFromString:@"我们都喜欢用 Ruby"];
    
    for (NSString *token in arr) {
        NSLog(@"%@", token); // 我们 都 喜欢 用 Ruby
    }
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
