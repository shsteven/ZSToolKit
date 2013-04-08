//
//  NSView+Screenshot.m
//  ePub Reader
//
//  Created by Steven Zhang on 31/1/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "NSView+Screenshot.h"

@implementation NSView (Screenshot)

- (NSImage *)screenshot {
    
    NSBitmapImageRep *imageRep = [self bitmapImageRepForCachingDisplayInRect:[self frame]];

    [self cacheDisplayInRect:self.bounds toBitmapImageRep:imageRep];
    
    NSImage *image = [[NSImage alloc] initWithSize:self.frame.size];
    [image addRepresentation:imageRep];
    
    return image;
}

- (NSImage *)layerScreenshot
{
    
    // Retina test
    ////////////
    
    
    int pixelsHigh = (int)[[self layer] bounds].size.height * self.layer.contentsScale;
    int pixelsWide = (int)[[self layer] bounds].size.width * self.layer.contentsScale;
    
    NSBitmapImageRep *cachedImageRep = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:NULL
                                                                         pixelsWide:pixelsWide
                                                                         pixelsHigh:pixelsHigh
                                                                      bitsPerSample:8
                                                                    samplesPerPixel:4
                                                                           hasAlpha:YES
                                                                           isPlanar:NO
                                                                     colorSpaceName:NSCalibratedRGBColorSpace
                                                                       bitmapFormat:0
                                                                        bytesPerRow:0 
                                                                       bitsPerPixel:0];
    NSSize pointSize = [[self layer] bounds].size;

    [cachedImageRep setSize:pointSize];
    NSGraphicsContext * cacheContext = [NSGraphicsContext graphicsContextWithBitmapImageRep:cachedImageRep];
    
    
    [NSGraphicsContext saveGraphicsState];
    [NSGraphicsContext setCurrentContext:cacheContext];
    
    [self.layer renderInContext:cacheContext.graphicsPort];

    [NSGraphicsContext restoreGraphicsState];
    
    NSImage *cachedImage = [[NSImage alloc] initWithSize:pointSize];
    [cachedImage addRepresentation:cachedImageRep];
    
//    CGFloat cachedImageScale = self.layer.contentsScale;
    
    return cachedImage;
    
}

@end
