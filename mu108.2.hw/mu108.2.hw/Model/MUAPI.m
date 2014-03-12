//
//  MUAPI.m
//  mu108.2.hw
//
//  Created by Pavel on 11.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import "MUAPI.h"
#import <AFNetworking.h>
#import "Route.h"

@implementation MUAPI

+(instancetype)sharedClient
{
    static MUAPI* _sharedClient = nil;

    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] init];
    });
    return _sharedClient;
}

-(void)getRoutes:(void (^)(NSArray *, NSError *))block
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    void (^successBlock)(AFHTTPRequestOperation*, id) = ^(AFHTTPRequestOperation *operation, id responseObject) {
        NSMutableArray* routeData = [NSMutableArray array];
        for (NSDictionary *dicRoute in responseObject) {
            Route *route = [[Route alloc] init];
            route.title = dicRoute[@"route_title"];
            route.price = dicRoute[@"route_price"];
            [routeData addObject:route];
        };
        block([NSArray arrayWithArray:routeData], nil);
    };
    
    void (^failBlock)(AFHTTPRequestOperation*, NSError*) = ^(AFHTTPRequestOperation *operation, NSError *error) {
        block(nil, error);
    };
    
    [manager GET:[NSString stringWithFormat:@"%@%@", API_HOST, API_ROUTES_PATH] parameters:nil success:successBlock failure:failBlock];
    
}

@end
