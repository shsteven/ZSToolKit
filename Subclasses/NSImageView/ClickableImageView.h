//
//  ClickableImageView.h
//  ePub Reader
//
//  Created by Steven Zhang on 13/3/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol ClickableImageViewDelegate <NSObject>

- (void)clickableImageViewDidClick: (id)imageView;

@end

@interface ClickableImageView : NSImageView

@property (strong) NSImage *highlightedImage;
@property (assign) IBOutlet id <ClickableImageViewDelegate> delegate;

@end
