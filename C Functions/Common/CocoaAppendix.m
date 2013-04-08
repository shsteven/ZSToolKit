//
//  CocoaAppendix.m
//  iReader
//
//  Created by Steven on 3/9/12.
//  Copyright (c) 2012 Steve's Studio. All rights reserved.
//

#import "CocoaAppendix.h"

#define kZSSysVersionInvalid		(0x0000)
static SInt32 ver = kZSSysVersionInvalid;

SInt32 ZSGetSysVersion(void)
{
	if (ver == kZSSysVersionInvalid) {
		Gestalt(gestaltSystemVersion, &ver);
	}
	return ver;
}