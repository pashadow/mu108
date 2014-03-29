//
//  AppDelegate.h
//  mu108.2.hw
//
//  Created by Pavel on 23.02.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSManagedObjectContext* context;
@property (strong, nonatomic) NSPersistentStoreCoordinator* coordinator;
@property (strong, nonatomic) NSManagedObjectModel* model;

@property (strong, nonatomic) CLLocationManager* locationManager;

@end
