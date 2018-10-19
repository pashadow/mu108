//
//  Route.h
//  mu108.2.hw
//
//  Created by Pavel on 29.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Bus, PathPoint;

@interface Route : NSManagedObject

@property (nonatomic) int32_t identifier;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * price;
@property (nonatomic, retain) NSString * specification;
@property (nonatomic, retain) NSSet *buses;
@property (nonatomic, retain) NSSet *points;

+ (Route *)routeWithIdentifier:(int32_t)identifier inManagedObjectContext:(NSManagedObjectContext *)context error:(NSError **)error;
+ (NSSet *)updatedRoutesWithArrayOfDictionaries:(NSArray *)dictionaries
                                      predicate:(NSPredicate *)predicate
                           managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end

@interface Route (CoreDataGeneratedAccessors)

- (void)addBusesObject:(Bus *)value;
- (void)removeBusesObject:(Bus *)value;
- (void)addBuses:(NSSet *)values;
- (void)removeBuses:(NSSet *)values;

- (void)addPointsObject:(PathPoint *)value;
- (void)removePointsObject:(PathPoint *)value;
- (void)addPoints:(NSSet *)values;
- (void)removePoints:(NSSet *)values;

@end
