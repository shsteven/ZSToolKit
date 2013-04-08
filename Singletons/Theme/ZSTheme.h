//
//  ZSTheme.h
//  iDAV
//
//  Created by Steven on 27/10/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import <Foundation/Foundation.h>



@protocol ZSTheme <NSObject>



- (UIColor *)mainColor;
- (UIColor *)highlightColor;
- (UIColor *)shadowColor;
- (UIColor *)backgroundColor;


- (UIImage *)topShadow;
- (UIImage *)bottomShadow;


- (UIImage *)navigationBackgroundForBarMetrics:(UIBarMetrics)metrics;
- (UIImage *)barButtonBackgroundForState:(UIControlState)state style:(UIBarButtonItemStyle)style barMetrics:(UIBarMetrics)barMetrics;
- (UIImage *)backBackgroundForState:(UIControlState)state barMetrics:(UIBarMetrics)barMetrics;



- (UIView *)tableBackgroundView;

@end

@interface ZSTheme : NSObject

+ (id <ZSTheme>)sharedTheme;

+ (void)customizeAppAppearance;
+ (void)customizeView:(UIView *)view;
+ (void)customizeTableView:(UITableView *)tableView;
//+ (void)customizeTabBarItem:(UITabBarItem *)item forTab:(ZSThemeTab)tab;
+ (void)customizeDoorButton:(UIButton *)button;

@end
