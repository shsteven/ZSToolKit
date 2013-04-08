//
//  NSMutableArray+Ordering.m
//  BookZ
//
//  Created by Steven on 2/10/11.
//  Copyright 2011 Steve's Studio. All rights reserved.
//

#import "NSMutableArray+Ordering.h"


@implementation NSMutableArray(Reordering)

- (void)moveObjectAtIndex: (NSUInteger)fromIndex toIndex: (NSUInteger)toIndex {
	if (fromIndex >= [self count] || toIndex >= [self count]) return;	// Error
	if (fromIndex == toIndex) return;
	id object = [self objectAtIndex:fromIndex];
//	[[object retain] autorelease];
	[self removeObjectAtIndex:fromIndex];
	if (toIndex == [self count])
		[self addObject:object];
	else
		[self insertObject:object atIndex:toIndex];
	
}

@end
