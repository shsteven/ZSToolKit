//
//  NSMutableArray+Ordering.h
//  BookZ
//
//  Created by Steven on 2/10/11.
//  Copyright 2011 Steve's Studio. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSMutableArray(Reordering)

- (void)moveObjectAtIndex: (NSUInteger)fromIndex toIndex: (NSUInteger)toIndex;

@end
