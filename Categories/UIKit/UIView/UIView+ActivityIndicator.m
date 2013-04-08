//
//  UIView+ActivityIndicator.m
//  BookZ CN
//
//  Created by Steven Zhang on 27/4/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "UIView+ActivityIndicator.h"

@implementation UIView (ActivityIndicator)

- (void)setActivityIndicatorVisible: (BOOL)visible {
    if (visible) {
        UIActivityIndicatorView *view = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
        view.center = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMidY(self.bounds));
        [self addSubview:view];
        [view startAnimating];
    } else {
        for (UIView *subview in self.subviews) {
            if ([subview isKindOfClass:[UIActivityIndicatorView class]])
                [subview removeFromSuperview];
        }
    }
}

@end
