//
//  NSString+StripHTMLTags.m
//  BookZ CN
//
//  Created by Steven Zhang on 26/4/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "NSString+StripHTMLTags.h"

@implementation NSString (StripHTMLTags)

-(NSString *) stringByStrippingHTML {
    NSRange r;
    NSString *s = [self copy];
    while ((r = [s rangeOfString:@"<[^>]+>" options:NSRegularExpressionSearch]).location != NSNotFound)
        s = [s stringByReplacingCharactersInRange:r withString:@""];
    return s; }

@end
