//
//  PathPoint.m
//  mu108.2.hw
//
//  Created by Pavel on 29.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import "PathPoint.h"
#import "Route.h"


@implementation PathPoint

@dynamic x;
@dynamic y;
@dynamic z;
@dynamic route;

-(CLLocationCoordinate2D) coordinate {
    return CLLocationCoordinate2DMake([self.x floatValue], [self.y floatValue]);
}

@end
