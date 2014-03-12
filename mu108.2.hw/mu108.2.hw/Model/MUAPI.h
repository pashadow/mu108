//
//  MUAPI.h
//  mu108.2.hw
//
//  Created by Pavel on 11.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Config.h"

@interface MUAPI : NSObject

+(instancetype)sharedClient;

-(void)getRoutes:(void (^)(NSArray *routes, NSError *error))block;

@end
