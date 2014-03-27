//
//  MUAPI.m
//  mu108.2.hw
//
//  Created by Pavel on 11.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import "MUAPI.h"
#import <CoreData/CoreData.h>
#import "Route.h"
#import "AppDelegate.h"

@implementation MUAPI

+(instancetype)sharedClient
{
    static MUAPI* _sharedClient = nil;

    static dispatch_once_t onceToken = 0;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[self alloc] init];
        _sharedClient.defaultRequestOperationManager = [[AFHTTPRequestOperationManager alloc] initWithBaseURL:[NSURL URLWithString:API_HOST]];

        AppDelegate* appDelegate = (AppDelegate* )[UIApplication sharedApplication].delegate;
        _sharedClient.context = appDelegate.context;
    });
 
    return _sharedClient;
}


-(void)getRoutes:(void (^)(NSError *))block
{
    void (^successBlock)(AFHTTPRequestOperation*, id) = ^(AFHTTPRequestOperation *operation, id responseObject) {
        
        [Route updatedRoutesWithArrayOfDictionaries:responseObject predicate:nil managedObjectContext:self.context];
        block(nil);
    };
    
    void (^failBlock)(AFHTTPRequestOperation*, NSError*) = ^(AFHTTPRequestOperation *operation, NSError *error) {
        block(error);
    };
    
    [self.defaultRequestOperationManager GET:API_ROUTES_PATH parameters:nil success:successBlock failure:failBlock];
}

@end
