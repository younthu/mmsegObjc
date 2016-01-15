//
//  MMSToken.h
//  MMSegObjC
//
//  Created by Andrew(Zhiyong) Yang on 1/15/16.
//  Copyright © 2016 FoolDragon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMSToken : NSObject
@property (nonatomic, copy)   NSString *text;
@property (nonatomic, assign) NSRange  range;
@end
