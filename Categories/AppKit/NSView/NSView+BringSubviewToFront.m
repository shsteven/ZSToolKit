//
//  NSView+BringSubviewToFront.m
//  iReader
//
//  Created by Steve on 25/9/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "NSView+BringSubviewToFront.h"

@implementation NSView (BringSubviewToFront)

- (void)bringSubviewToFront: (NSView *)subview {
    [subview removeFromSuperview];
    [self addSubview:subview];
}

@end
