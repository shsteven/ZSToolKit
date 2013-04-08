//
//  NSString+SanitizeFilename.m
//  HMGLTransitions
//
//  Created by Steve on 21/7/12.
//
//

#import "NSString+SanitizeFilename.h"

@implementation NSString (SanitizeFilename)

- (NSString *)sanitizeStringForFilename {
    NSCharacterSet* illegalFileNameCharacters = [NSCharacterSet characterSetWithCharactersInString:@":/\\?%*|\"<>"];
    return [[self componentsSeparatedByCharactersInSet:illegalFileNameCharacters] componentsJoinedByString:@""];
}

@end
