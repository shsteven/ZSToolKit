//
//  ClickableImageView.m
//  ePub Reader
//
//  Created by Steven Zhang on 13/3/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "ClickableImageView.h"

@implementation ClickableImageView

- (void)mouseDown:(NSEvent *)theEvent {
}

- (void)mouseUp:(NSEvent *)theEvent {
    if ([self.delegate respondsToSelector:@selector(clickableImageViewDidClick:)]) {
        [self.delegate clickableImageViewDidClick:self];
    }
}

@end
