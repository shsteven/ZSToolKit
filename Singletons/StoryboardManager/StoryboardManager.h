//
//  StoryboardManager.h
//  BookZ CN
//
//  Created by Steven Zhang on 16/5/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StoryboardManager : NSObject

//+ (id)sharedManager;
+ (id)newViewControllerWithIdentifier: (NSString *)identifier;
+ (id)newViewControllerWithIdentifier: (NSString *)identifier inStoryboardNamed: (NSString *)storyboardName;

@end
