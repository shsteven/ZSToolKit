//
//  StoryboardManager.m
//  BookZ CN
//
//  Created by Steven Zhang on 16/5/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "StoryboardManager.h"

@implementation StoryboardManager

/*
+ (id)sharedManager
{
    static dispatch_once_t once;
    static StoryboardManager *sharedManager;
    dispatch_once(&once, ^ { sharedManager = [[self alloc] init]; });
    return sharedManager;
}
*/

+ (id)newViewControllerWithIdentifier: (NSString *)identifier {
//    UIStoryboard *storyboard;
    NSString *storyboardName;
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        storyboardName = @"MainStoryboard_iPad";
    } else {
        storyboardName = @"MainStoryboard_iPhone";
    }
//    storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    UIViewController *newVC = (id)[StoryboardManager newViewControllerWithIdentifier:identifier inStoryboardNamed:storyboardName];
    
    return (id)newVC;
}


+ (id)newViewControllerWithIdentifier: (NSString *)identifier inStoryboardNamed: (NSString *)storyboardName {
    UIStoryboard *storyboard;
    
    storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    
    UIViewController *newVC = [storyboard instantiateViewControllerWithIdentifier:identifier];
    
    return (id)newVC;
}

@end
