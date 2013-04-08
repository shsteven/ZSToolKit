//
//  RXMLElement+Search.m
//  EPubTest
//
//  Created by Steve on 29/1/13.
//  Copyright (c) 2013 Steve. All rights reserved.
//

#import "RXMLElement+Search.h"

@implementation RXMLElement (Search)

- (NSArray *)nodesWithTag: (NSString *)tag {
    // Recursively search through all children
    // Find only one
    
    NSMutableArray *results = [NSMutableArray new];
    
    [self iterate:@"*" usingBlock:^(RXMLElement *element) {
        DLog(@"searching %@", element.tag);

        if ([element.tag isEqualToString:tag]) {
            // This is it!
            [results addObject:element];
        }

        [results addObjectsFromArray:[element nodesWithTag:tag]];

    }];
    
    return [results copy];
}

@end
