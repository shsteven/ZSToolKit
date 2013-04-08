//
//  NSData+Bzip2.m
//  Bzip2Test
//
//  Created by Steven on 2/2/10.
//  Copyright 2010 Steve's Studio. All rights reserved.
//
/*
 bzip2 decompression and compression
 Original Source: <http://cocoa.karelia.com/Foundation_Categories/NSData/bzip2_decompression.m>
 (See copyright notice at <http://cocoa.karelia.com>)
 */

/*"	decompress the file to the given path.  Returns 0 or greater if OK; negative is an error code.  You will need to link against libbz2.a, either the one included in Jaguar, or wrapped and linked into your framework/application bundle.
 "*/

#import "bzlib.h"
#import "NSData+Bzip2.h"


@implementation NSData (Bzip2)

- (BOOL) decompressBzip2ToPath:(NSString *)inPath;
{
	// First, create all the sub-directories as needed
	NSArray *components = [inPath pathComponents];
	int i;
	int theCount = [components count];
	
	for (i = 1 ; i < theCount ; i++ )	// DO ALL BUT THE LAST COMPONENT, USE < NOT <=
	{
		NSArray *subComponents = [components subarrayWithRange:
								  NSMakeRange(0,i)];
		NSString *subPath = [NSString pathWithComponents:subComponents];
		BOOL isDir;
		BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:subPath isDirectory:&isDir];
		
		if (!exists)
		{
//			BOOL ok = [[NSFileManager defaultManager] createDirectoryAtPath:subPath attributes:nil];
			BOOL ok = [[NSFileManager defaultManager] createDirectoryAtPath:subPath
												withIntermediateDirectories:YES
																 attributes:nil
																	  error:nil];
			if (!ok)
			{
//				return BZ_IO_ERROR;
                return NO;
            }
		}
	}
	
	int verbosity = 0;
	int small = 0;			// don't use small-memory model
	int bufferSize = 10240;	//	How many bytes to write out at a time
	
	char *buf = malloc(bufferSize);
	const char *pathName = [[NSFileManager defaultManager] fileSystemRepresentationWithPath:inPath];
	
	FILE*   	f = fopen ( pathName, "w" );
	if (nil == f)
	{
//		return BZ_IO_ERROR;
        return NO;
	}
	
	// use trio BZ2_bzDecompressInit, BZ2_bzDecompress and BZ2_bzDecompressEnd for decompression.
	int ret = BZ_OK;
	bz_stream strm;
	strm.bzalloc = NULL;
	strm.bzfree = NULL;
	strm.opaque = NULL;
	ret = BZ2_bzDecompressInit ( &strm, verbosity, small );
	if (ret != BZ_OK) 
//        return ret;
        return NO;
    strm.next_in = (char *)[self bytes];		// the compressed data
	strm.avail_in = [self length];		// how much to read
	while (BZ_OK == ret)
	{
		strm.next_out = buf;				// buffer to write into
		strm.avail_out = bufferSize;		// how much is available in buffer
		ret = BZ2_bzDecompress ( &strm );
		
		// Write out the bufs if we had no error.
		if (BZ_OK == ret || BZ_STREAM_END == ret)
		{
			size_t written = fwrite(buf, sizeof(char), strm.next_out - buf, f);
			if (0 == written)
			{
				NSLog(@"Wrote zero bytes");
			}
		}
	}
	fclose(f);
	free (buf);
	BZ2_bzDecompressEnd ( &strm );
//    return ret ;
    return YES;
}

@end
