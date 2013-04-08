//
//  NSManagedObjectContext+Fetch.h
//  BookZ
//
//  Created by Steve on 11-6-23.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@interface NSManagedObjectContext (NSManagedObjectContext_Fetch)

- (NSSet *)fetchObjectsForEntityName:(NSString *)newEntityName
                       withPredicate:(id)stringOrPredicate, ...;

@end
