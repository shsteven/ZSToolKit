//
//  NSString+CharsetDetector.m
//  BookZ_HD
//
//  Created by Steven on 1/6/11.
//  Copyright 2011 Steve's Studio. All rights reserved.
//

#import "NSString+CharsetDetector.h"
#include "chardetect.h"

@implementation NSString(CharsetDetector)

#define BUFSIZE 4096

+ (NSStringEncoding)detectedEncodingOfFile: (NSString *)path {
	chardet_t chardetContext;
    FILE     *fp;
    char      buf[BUFSIZE], charset[CHARDET_MAX_ENCODING_NAME];
    int       ret, len;
	
    CFStringEncoding cfenc;
    CFStringRef      charsetStr;
	
    chardet_create(&chardetContext);
	
    chardet_reset(chardetContext);
    fp = fopen([path fileSystemRepresentation], "r");
    if (! fp)
		return NSUTF8StringEncoding;
	
    do
    {
        len = fread(buf, 1, sizeof(buf), fp);
        ret = chardet_handle_data(chardetContext, buf, len);
    } while (ret == CHARDET_RESULT_OK && (feof(fp) == 0));
	
    fclose(fp);
    chardet_data_end(chardetContext);
	
    ret = chardet_get_charset(chardetContext, charset, CHARDET_MAX_ENCODING_NAME);
    if (ret != CHARDET_RESULT_OK)
        return NSUTF8StringEncoding;
	
    // NSLog(@"charset: %s\n", charset);
    charsetStr = CFStringCreateWithCString(NULL, charset, kCFStringEncodingUTF8);
    cfenc = CFStringConvertIANACharSetNameToEncoding(charsetStr);
    CFRelease(charsetStr);
	
    chardet_destroy(chardetContext);
	
    return CFStringConvertEncodingToNSStringEncoding(cfenc);
	
}

@end
