//
//  UIWebView+RemoveShadow.m
//  BookZ HD
//
//  Created by Steven Zhang on 4/10/11.
//  Copyright (c) 2011 Steve's Studio. All rights reserved.
//

#import "UIWebView+RemoveShadow.h"

@implementation UIWebView (RemoveShadow)

- (void)removeShadow {
    if ([[self subviews] count] > 0)
    {
        for (UIView* shadowView in [[[self subviews] objectAtIndex:0] subviews])
        {
            [shadowView setHidden:YES];
        }
        
        // unhide the last view so it is visible again because it has the content
        [[[[[self subviews] objectAtIndex:0] subviews] lastObject] setHidden:NO];
    }

}

@end
