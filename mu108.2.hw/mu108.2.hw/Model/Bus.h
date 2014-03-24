//
//  Bus.h
//  mu108.2.hw
//
//  Created by Pavel on 24.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Route;

@interface Bus : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Route *route;

@end
