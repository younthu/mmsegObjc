//
//  MMSegObjCTests.m
//  MMSegObjCTests
//
//  Created by Andrew(Zhiyong) Yang on 1/15/16.
//  Copyright © 2016 FoolDragon. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "MMSegObjC.h"

@interface MMSegObjCTests : XCTestCase

@end

@implementation MMSegObjCTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testGetTokenStrings {
    // Init mmseg
    NSArray<NSString*> *arr = [MMSegObjC getTokenStringsFromString:@"我们都喜欢用 Ruby"];
    
    for (NSString *str in arr) {
        NSLog(@"%@", str);
    }
}

- (void)testGetTokens {
    NSArray<MMSToken*> *tokens = [MMSegObjC getTokensFromString:@"你妈妈叫什么名字, baby"];
    
    for (MMSToken *t in tokens) {
        NSLog(@"%@:%@", NSStringFromRange(t.range), t.text);
    }
}
- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
