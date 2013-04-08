//
//  NSFileManager+Path.h
//  BookZ HD
//
//  Created by Steven Zhang on 1/10/11.
//  Copyright (c) 2011 Steve's Studio. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSFileManager (Path)

// Auto suggest a usable path
- (NSString *)suggestedPathForDirectory: (NSString *)dirPath filename: (NSString *)filename;

@end
