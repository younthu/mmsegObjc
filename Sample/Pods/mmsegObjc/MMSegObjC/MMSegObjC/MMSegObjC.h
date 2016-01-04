//
//  MMSegObjC.h
//  MMSegObjC
//
//  Created by Andrew(Zhiyong) Yang on 12/30/15.
//  Copyright © 2015 FoolDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSegObjC : NSObject
+ (void)initializeEngine;
+ (NSArray<NSString*> *)getTokensFromString:(NSString*)text;
@end
