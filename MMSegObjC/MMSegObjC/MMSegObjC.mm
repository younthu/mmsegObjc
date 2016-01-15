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
#import "token.h"

using namespace rmmseg;

#pragma mark - Helpers pre-define

MMSToken *mmstokenFromToken(Token &token, int loc);

#pragma mark - MMSegObjc Implementation

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
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *builtInChars = [bundle pathForResource:@"chars" ofType:@"dic"];
    NSString *builtInWords = [bundle pathForResource:@"words" ofType:@"dic"];
    NSAssert(nil != builtInChars, @"dict for chars not found");
    NSAssert(nil != builtInWords, @"dict for words not found");
    rmmseg::dict::load_chars([builtInChars cStringUsingEncoding:NSUTF8StringEncoding]);
    rmmseg::dict::load_words([builtInWords cStringUsingEncoding:NSUTF8StringEncoding]);
    
}


+ (NSArray<MMSToken *> *)getTokensFromString:(NSString*)text{
    const char * charBase = text.UTF8String;
    rmmseg::Algorithm algo = rmmseg::Algorithm(charBase,(int)strlen(text.UTF8String));
    
    NSMutableArray<MMSToken *> *result = [NSMutableArray array];
    
    while (true) {
        Token t = algo.next_token();
        
        if (t.text == 0) {
            break;
        }
        
        // TODO: this is not so efficient to get the length of utf string this way.
        NSString *preString = [[NSString alloc]initWithBytes:charBase length:t.text - charBase encoding:NSUTF8StringEncoding];
        [result addObject:mmstokenFromToken(t, preString.length)];
    }
    
    return result;

}
+ (NSArray<NSString*> *)getTokenStringsFromString:(NSString*)text{
    rmmseg::Algorithm algo = rmmseg::Algorithm(text.UTF8String,(int)strlen(text.UTF8String));// don't use test.length, it returns count of characters instead of bytes.
    
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

#pragma mark - helpers
MMSToken *mmstokenFromToken(Token &token, int loc){
    MMSToken *mmsTok = [MMSToken new];
    mmsTok.text = [[NSString alloc]initWithBytes:token.text length:token.length encoding:NSUTF8StringEncoding];
    mmsTok.range = NSMakeRange(loc, mmsTok.text.length);
    
    return mmsTok;
}
