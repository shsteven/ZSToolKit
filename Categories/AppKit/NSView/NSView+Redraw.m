//
//  NSView+Redraw.m
//  iReader
//
//  Created by Steven on 11/7/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "NSView+Redraw.h"

@implementation NSView (Redraw)

- (void)redraw {
    [self redrawLayer:self.layer atScale:self.layer.contentsScale];
}

- (void)redrawLayer: (CALayer *)layer atScale: (CGFloat)scale {
    layer.contentsScale = scale;
    
    [layer setNeedsDisplay];
    for (CALayer *sublayer in layer.sublayers)
        [self redrawLayer:sublayer atScale:scale];
}

@end
