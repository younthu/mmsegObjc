//
//  ViewController.m
//  Sample
//
//  Created by Andrew(Zhiyong) Yang on 12/30/15.
//  Copyright © 2015 FoolDragon. All rights reserved.
//

#import "ViewController.h"
#import <MMSegObjC/MMsegObjC.h>
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    // Init mmseg
    NSArray<NSString*> *arr = [MMSegObjC getTokensFromString:@"我们都喜欢用 Ruby"];
    
    for (NSString *str in arr) {
        NSLog(@"%@", str);
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
