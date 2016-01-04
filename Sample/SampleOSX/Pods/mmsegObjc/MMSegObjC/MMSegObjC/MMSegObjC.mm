//
//  MMSegObjC.m
//  MMSegObjC
//
//  Created by Andrew(Zhiyong) Yang on 12/30/15.
//  Copyright © 2015 FoolDragon. All rights reserved.
//

#import "MMSegObjC.h"
#import "algor.h"
#import "dict.h"
static rmmseg::Algorithm *_algo;
using namespace rmmseg;


@implementation MMSegObjC

+(NSString*)getStringFromWChar:(const wchar_t*) inStr{
    char *outStr = NULL;
    size_t size = wcstombs(NULL, inStr, 0);
    outStr = new char[size + 1];
    memset(outStr, 0, size * sizeof(char));
    size_t ret = wcstombs(outStr, inStr, size+1);
    if (ret == -1) {
        delete[] outStr;
        outStr = NULL;
    }
    NSString *string = [NSString stringWithCString:outStr encoding:NSUTF8StringEncoding];
    return string;
}
+ (void)load{
    [self initializeEngine];
}

+ (void)initializeEngine{
    
   // Load dictionaries(chars&words)
    NSString *builtInChars = [[NSBundle mainBundle] pathForResource:@"chars" ofType:@"dic"];
    NSString *builtInWords = [[NSBundle mainBundle] pathForResource:@"words" ofType:@"dic"];
    rmmseg::dict::load_chars([builtInChars cStringUsingEncoding:NSUTF8StringEncoding]);
    rmmseg::dict::load_words([builtInWords cStringUsingEncoding:NSUTF8StringEncoding]);
    
}

+ (NSArray<NSString*> *)getTokensFromString:(NSString*)text{
    rmmseg::Algorithm algo = rmmseg::Algorithm(text.UTF8String,strlen(text.UTF8String));// don't use test.length, it returns count of characters instead of bytes.
    
    NSMutableArray<NSString*> *result = [NSMutableArray array];
    
    while (true) {
        Token t = algo.next_token();
        
        if (t.text == 0) {
            break;
        }
        
        NSString *str = [[NSString alloc]initWithBytes:t.text length:t.length encoding:NSUTF8StringEncoding];//[NSString stringWithCString:t.text encoding:NSUTF8StringEncoding];//[[NSString alloc] initWithBytes:t.text length:t.length encoding:NSUTF8StringEncoding];
//        str = [str substringToIndex:t.length/2];
        [result addObject:str];
    }
    
    return result;
}



-(wchar_t*)getWCharFromString:(NSString *)inStr{
    const char *cString = [inStr cStringUsingEncoding:NSUTF8StringEncoding];
    setlocale(LC_CTYPE, "UTF-8");
    wchar_t *outStr = NULL;
    size_t size = mbstowcs(NULL, cString, 0);
    outStr = new wchar_t[size + 1];
    if (outStr) {
        memset(outStr, 0, size * sizeof(wchar_t));
        size_t ret = mbstowcs(outStr, cString, size+1);
        if (ret == -1) {
            delete[] outStr;
            outStr = NULL;
        }
    }
    return outStr;
}
@end
