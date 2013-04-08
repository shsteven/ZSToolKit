//
//  ZSDefaultTheme.m
//  iDAV
//
//  Created by Steven on 27/10/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "ZSDefaultTheme.h"

@implementation ZSDefaultTheme


- (UIColor *)mainColor {
    return nil;
}

- (UIColor *)highlightColor  {
    return nil;
}

- (UIColor *)shadowColor  {
    return nil;
}

- (UIColor *)backgroundColor {
    return nil;
}


- (UIImage *)topShadow {
    return nil;
}

- (UIImage *)bottomShadow {
    return nil;
}




- (UIImage *)navigationBackgroundForBarMetrics:(UIBarMetrics)metrics
{
    NSString *name = @"top_bar.png";
//    if (metrics == UIBarMetricsLandscapePhone) {
//        name = [name stringByAppendingString:@"Landscape"];
//    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 8.0, 0.0, 8.0)];   // TODO
    return image;
}

- (UIImage *)barButtonBackgroundForState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics {
#warning Get the right image
    NSString *name = @"back_button";
    /*
     if (barMetrics == UIBarMetricsLandscapePhone) {
     name = [name stringByAppendingString:@"Landscape"];
     }*/
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"_active"];
    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 21.0, 0.0, 13.0)]; // TODO
    return image;
}

- (UIImage *)backBackgroundForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics
{
    NSString *name = @"back_button";
    /*
    if (barMetrics == UIBarMetricsLandscapePhone) {
        name = [name stringByAppendingString:@"Landscape"];
    }*/
    if (state == UIControlStateHighlighted) {
        name = [name stringByAppendingString:@"_active"];
    }
    UIImage *image = [UIImage imageNamed:name];
    image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(0.0, 21.0, 0.0, 13.0)]; // TODO
    return image;
}


#pragma mark -
- (UIView *)tableBackgroundView {
    UIView *view = [[UIView alloc] initWithFrame:CGRectZero];
    view.backgroundColor = [UIColor colorWithRed:0.88 green:0.88 blue:0.88 alpha:1.0];
    return view;
}

@end
