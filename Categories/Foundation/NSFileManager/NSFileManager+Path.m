//
//  NSFileManager+Path.m
//  BookZ HD
//
//  Created by Steven Zhang on 1/10/11.
//  Copyright (c) 2011 Steve's Studio. All rights reserved.
//

#import "NSFileManager+Path.h"

@implementation NSFileManager (Path)

- (NSString *)suggestedPathForDirectory: (NSString *)dirPath filename: (NSString *)filename {
    NSFileManager *fm = [NSFileManager defaultManager];
    
    NSString *path = [dirPath stringByAppendingPathComponent:filename];
    if (![fm fileExistsAtPath:path]) 
        return path;
    
    // Consider all scenarios:
    // Suggested filenames in case of duplication:
    // filename.ext -> filename 1.ext
    // filename.ext1.ext2 -> filename 1.ext1.ext2
    // filename (no ext) -> filename 1
    
    NSArray *components = [filename componentsSeparatedByString:@"."];
    NSString *name = [components objectAtIndex:0];
    NSString *ext;
    if ([components count]) {
        NSMutableArray *array = [components mutableCopy];
        [array removeObjectAtIndex:0];
        ext = [array componentsJoinedByString:@"."];
    }
    
    NSString *resultFilename;
    int count = 0;
    
    do {
        if (ext)
            resultFilename = [NSString stringWithFormat:@"%@ %d.%@", name, count, ext];
        else
            resultFilename = [NSString stringWithFormat:@"%@ %d", name, count];
    
        path = [dirPath stringByAppendingPathComponent:resultFilename];
        
        count ++;
    } while ([fm fileExistsAtPath:path]);
    
    return path;
}

@end
