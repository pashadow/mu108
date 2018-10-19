//
//  PathPoint.h
//  mu108.2.hw
//
//  Created by Pavel on 29.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@class Route;

@interface PathPoint : NSManagedObject<MKAnnotation>

@property (nonatomic, retain) NSNumber * x;
@property (nonatomic, retain) NSNumber * y;
@property (nonatomic, retain) NSNumber * z;
@property (nonatomic, retain) Route *route;

@end
