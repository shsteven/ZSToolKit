//
//  UINavigationBar+DropShadow.m
//  Taxi Fare
//
//  Created by Steven on 25/7/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "UINavigationBar+DropShadow.h"
#import <QuartzCore/QuartzCore.h>

@implementation UINavigationBar (DropShadow)

-(void)willMoveToWindow:(UIWindow *)newWindow {
    [super willMoveToWindow:newWindow];
    self.layer.shadowColor = [UIColor blackColor].CGColor;
    self.layer.shadowOpacity = 1;
    self.layer.shadowOffset = CGSizeMake(0,4);
    CGRect shadowPath = CGRectMake(self.layer.bounds.origin.x - 10, self.layer.bounds.size.height - 6, self.layer.bounds.size.width + 20, 5);
    self.layer.shadowPath = [UIBezierPath bezierPathWithRect:shadowPath].CGPath;
    self.layer.shouldRasterize = YES;
}

- (void)enableShadow {
    self.clipsToBounds = NO;
    [self setNeedsDisplay];

}

- (void)disableShadow {
    self.clipsToBounds = YES;
    [self setNeedsDisplay];
}

@end
