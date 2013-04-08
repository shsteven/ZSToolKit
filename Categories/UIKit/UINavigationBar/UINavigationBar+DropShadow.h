//
//  UINavigationBar+DropShadow.h
//  Taxi Fare
//
//  Created by Steven on 25/7/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//
//  Must explicitly call EnableShadow to take effect

#import <UIKit/UIKit.h>

@interface UINavigationBar (DropShadow)

- (void)enableShadow;

- (void)disableShadow;

@end
