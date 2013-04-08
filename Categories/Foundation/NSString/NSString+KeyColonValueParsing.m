//
//  NSString+Parsing.m
//  BookZ
//
//  Created by Steven on 3/14/11.
//  Copyright 2011 Steve's Studio. All rights reserved.
//

#import "NSString+Parsing.h"


@implementation NSString(Parsing)



// Parses "Key:value" style text
// If there are multiple values with the same key, they are housed in a NSMutableArray
- (NSDictionary *)dictionaryByParsingColons {
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionary];
    
    // Break down into lines
    NSCharacterSet *newlineSet = [NSCharacterSet newlineCharacterSet];
    NSArray *lines = [self componentsSeparatedByCharactersInSet:newlineSet];

    NSString *key = nil;
    id value = nil;
            
    for (NSString *line in lines) {
        // Strip leading / trailing whitespace
        line = [line stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        // Validate
        if (![line length]) continue;
        NSArray *components = [line componentsSeparatedByString:@":"];
        if (![components count]) continue;
        
        if ([line characterAtIndex:[line length] - 1] == ':') {
            // This is a key
            key = [line stringByReplacingOccurrencesOfString:@":" withString:@""];
            continue;
        }
        
        // Multiple situation
        if ([components count] == 1) {
            // Handles multiline situation
            // Key:
            // Value1
            // Value2
//            NSString *string = [components lastObject];
//            if ([string characterAtIndex:[string length] - 1] == ':') {
//                // This is a key
//                key = [string stringByReplacingOccurrencesOfString:@":" withString:@""];
//            } else {
            value = [components lastObject];
                if (!key) continue;    // Validate
                // This is (one of) the values
                id existingValue = [dictionary objectForKey:key];
                if (existingValue) {
                    if ([existingValue isKindOfClass:[NSMutableArray class]]) {
                        NSMutableArray *array = (NSMutableArray *)existingValue;
                        [array addObject:value];
                    } else {
                        NSMutableArray *array = [NSMutableArray array];
                        [array addObject:existingValue];
                        [array addObject:value];
                        [dictionary setObject:array forKey:key];
                    }
                    
                } else
                    [dictionary setObject:value forKey:key];

//            }
            continue;
        }
        
        // Single line situation
        key = [components objectAtIndex:0];
        if ([components count] > 2) {
            NSRange r = [line rangeOfString:@":"];
            value = [line substringFromIndex:r.location + r.length];
        } else
        value = [components objectAtIndex:1];
        
        key = [key stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        value = (id)[(NSString *)value stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        
        id existingValue = [dictionary objectForKey:key];
        if (existingValue) {
            if ([existingValue isKindOfClass:[NSMutableArray class]]) {
                NSMutableArray *array = (NSMutableArray *)existingValue;
                [array addObject:value];
            } else {
                NSMutableArray *array = [NSMutableArray array];
                [array addObject:existingValue];
                [array addObject:value];
                [dictionary setObject:array forKey:key];
            }
            
        } else
            [dictionary setObject:value forKey:key];
        
        key = nil;
        value = nil;
    }
    
    return dictionary;
}


@end
