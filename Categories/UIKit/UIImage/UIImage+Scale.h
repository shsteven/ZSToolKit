//
//  UIImage+Scale.h
//  CardOCR
//
//  Created by Steven Zhang on 5/11/11.
//  Copyright (c) 2011 Steve's Studio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Scale)

- (UIImage *) scaleToSize: (CGSize)size;
- (UIImage *) imageByScalingProportionalToSize: (CGSize)size1;


@end
