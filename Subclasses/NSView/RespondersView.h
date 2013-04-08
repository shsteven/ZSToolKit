//
//  RespondersView.h
//  SwipeVCTest
//
//  Created by Steven Zhang on 31/1/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RespondersView : NSView {
    IBOutlet NSViewController *viewController;

}

- (void)setViewController:(NSViewController *)newController;


@end
