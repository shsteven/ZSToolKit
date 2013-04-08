//
//  NSString+AutoLinebreak.m
//  NSString+AutoParagraph
//
//  Created by Steven on 1/21/11.
//  Copyright 2011 Steve's Studio. All rights reserved.
//

#import "NSString+AutoLinebreak.h"


@implementation NSString(AutoLinebreak)

- (NSString *)stringByRecalculatingLinebreaks {
	NSMutableArray *array = [NSMutableArray array];
	__block unichar c = '.';		// the last character of the previous line. Initial value . signals a new paragraph
	__block unichar firstCharacter = 'a';	// First character of a line. a "space" will enable triggering newline
	NSCharacterSet *punctuationSet = [NSCharacterSet punctuationCharacterSet];
	NSCharacterSet *spaceSet = [NSCharacterSet whitespaceCharacterSet];
	[self enumerateLinesUsingBlock:^(NSString *line, BOOL *stop){
		if ([line length])
			firstCharacter = [line characterAtIndex:0];
		else
			firstCharacter = 'a';
		if (([punctuationSet characterIsMember:c] && c!=',') || [spaceSet characterIsMember:firstCharacter]) {
			[array addObject:line];
		}
		else {
			NSString *previousLine = [array lastObject];
			NSString *newLine = [previousLine stringByAppendingFormat:@" %@", line];
			[array removeLastObject];
			[array addObject:newLine];
		}

		if ([line length])
			c = [line characterAtIndex:[line length] - 1];
		else
			c = '.'; // an empty line is a signal for new paragraph, hence we use a punctuation
		 
	}];
	return [array componentsJoinedByString:@"\n"];
}

@end
