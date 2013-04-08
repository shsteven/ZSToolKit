//
//  RXMLElement+Search.h
//  EPubTest
//
//  Created by Steve on 29/1/13.
//  Copyright (c) 2013 Steve. All rights reserved.
//
//  No luck with RXML's XPath + XHTML
//  Hence manual brute-force search
//  Good for searching **small** xml trees

#import "RXMLElement.h"

@interface RXMLElement (Search)

- (NSArray *)nodesWithTag: (NSString *)tag;

@end
