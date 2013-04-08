//
//  NSString+CharsetDetector.h
//  BookZ_HD
//
//  Created by Steven on 1/6/11.
//  Copyright 2011 Steve's Studio. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSString(CharsetDetector)

+ (NSStringEncoding)detectedEncodingOfFile: (NSString *)path;

@end
