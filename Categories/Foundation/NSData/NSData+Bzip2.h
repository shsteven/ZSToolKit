//
//  NSData+Bzip2.h
//  Bzip2Test
//
//  Created by Steven on 2/2/10.
//  Copyright 2010 Steve's Studio. All rights reserved.
//
//  Before using this class, add libbz2.dylib to project


#import <Foundation/Foundation.h>


@interface NSData (Bzip2)

- (BOOL) decompressBzip2ToPath:(NSString *)inPath;

@end
