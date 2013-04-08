//
//  WhiteView.m
//  ePub Reader
//
//  Created by Steven Zhang on 10/2/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "WhiteView.h"

@implementation WhiteView

- (void)drawRect:(NSRect)dirtyRect {
    // set any NSColor for filling, say white:
    [[NSColor whiteColor] setFill];
    NSRectFill(dirtyRect);
}

@end
