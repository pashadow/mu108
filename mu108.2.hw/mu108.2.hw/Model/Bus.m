//
//  Bus.m
//  mu108.2.hw
//
//  Created by Pavel on 24.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import "Bus.h"
#import "Route.h"


@implementation Bus

@dynamic name;
@dynamic route;

-(CLLocationCoordinate2D) coordinate {
    return CLLocationCoordinate2DMake(50.005791, 36.230925);
}
-(NSString*) title {
    return self.name;
}

@end
