//
//  Route.h
//  mu108.2.hw
//
//  Created by Pavel on 24.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Route : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSSet *buses;
@property (nonatomic) int32_t identifier;

+ (Route *)routeWithIdentifier:(int32_t)identifier inManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error;
+ (NSSet *)updatedRoutesWithArrayOfDictionaries:(NSArray *)dictionaries
                                      predicate:(NSPredicate *)predicate
                           managedObjectContext:(NSManagedObjectContext *)managedObjectContext;


@end

@interface Route (CoreDataGeneratedAccessors)

- (void)addBusesObject:(NSManagedObject *)value;
- (void)removeBusesObject:(NSManagedObject *)value;
- (void)addBuses:(NSSet *)values;
- (void)removeBuses:(NSSet *)values;

@end
