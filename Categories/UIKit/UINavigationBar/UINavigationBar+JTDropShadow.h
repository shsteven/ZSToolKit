//
//  UINavigationBar+JTDropShadow.h
//
//  Created by james on 9/20/11.
//  http://ioscodesnippet.tumblr.com
//

#import <UIKit/UIKit.h>

@interface UINavigationBar (JTDropShadow)

- (void)dropShadowWithOffset:(CGSize)offset
                      radius:(CGFloat)radius
                       color:(UIColor *)color
                     opacity:(CGFloat)opacity;


@end
