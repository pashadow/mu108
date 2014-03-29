//
//  Bus.h
//  mu108.2.hw
//
//  Created by Pavel on 24.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@class Route;

@interface Bus : NSManagedObject<MKAnnotation>

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Route *route;

@end
