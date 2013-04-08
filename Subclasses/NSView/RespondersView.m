//
//  RespondersView.m
//  SwipeVCTest
//
//  Created by Steven Zhang on 31/1/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "RespondersView.h"

@implementation RespondersView

- (void)awakeFromNib {
//    self.layer.cornerRadius = 10.0;
}

- (void)setViewController:(NSViewController *)newController
{
    if (viewController)
    {
        NSResponder *controllerNextResponder = [viewController nextResponder];
        [super setNextResponder:controllerNextResponder];
        [viewController setNextResponder:nil];
    }
    
    viewController = newController;
    
    if (newController)
    {
        NSResponder *ownNextResponder = [self nextResponder];
        [super setNextResponder: viewController];
        [viewController setNextResponder:ownNextResponder];
    }
}

- (void)setNextResponder:(NSResponder *)newNextResponder
{
    if (viewController)
    {
        [viewController setNextResponder:newNextResponder];
        return;
    }
    
    [super setNextResponder:newNextResponder];
}

@end
