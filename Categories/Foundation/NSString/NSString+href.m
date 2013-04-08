//
//  NSString+href.m
//  iReader
//
//  Created by Steven on 10/9/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "NSString+href.h"

@implementation NSString (href)

- (NSString *)anchorString {
    NSString *lastPathComponent = [self lastPathComponent];
    NSString *anchor;
    
    NSRange r = [lastPathComponent rangeOfString:@"#"];
    if (r.length && r.location + r.length < [lastPathComponent length]) {
        anchor = [lastPathComponent substringFromIndex:r.location + r.length];
    }
    return anchor;
}

- (NSString *)stringByRemovingAnchor {
    NSRange r = [self rangeOfString:@"#"];
    if (r.length && r.location > 0)
        return [self substringToIndex:r.location];
        
    return self;
}

@end
