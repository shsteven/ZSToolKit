//
//  NSView+Screenshot.h
//  ePub Reader
//
//  Created by Steven Zhang on 31/1/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import <AppKit/AppKit.h>

@interface NSView (Screenshot)

- (NSImage *)screenshot;

- (NSImage *)layerScreenshot;

@end
