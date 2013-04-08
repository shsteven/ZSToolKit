//
//  NSEvent+MakeKeyDownEvent.m
//  iReader
//
//  Created by Steven Zhang on 3/5/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "NSEvent+MakeKeyDownEvent.h"

@implementation NSEvent (MakeKeyDownEvent)

+(NSEvent*) makeKeyDownEvent:(NSString*)str modifierFlags:(NSUInteger)flags
{
	return [NSEvent keyEventWithType:NSKeyDown
							location:NSZeroPoint
					   modifierFlags:flags
						   timestamp:0
						windowNumber:0
							 context:nil
						  characters:str
		 charactersIgnoringModifiers:str
						   isARepeat:NO
							 keyCode:0];
}

@end
