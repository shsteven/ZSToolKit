//
//  NSEvent+MakeKeyDownEvent.h
//  iReader
//
//  Created by Steven Zhang on 3/5/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSEvent (MakeKeyDownEvent)

+(NSEvent*) makeKeyDownEvent:(NSString*)str modifierFlags:(NSUInteger)flags;

@end
