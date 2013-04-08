//
//  GrayView.m
//  SwipeVCTest
//
//  Created by Steven Zhang on 31/1/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "GrayView.h"

@implementation GrayView


- (void)drawRect:(NSRect)dirtyRect {
    
    // set any NSColor for filling, say gray
    [[NSColor lightGrayColor] setFill];
    NSRectFill(CGRectInset(dirtyRect, 0.0, 0.0) );
    
}



@end
