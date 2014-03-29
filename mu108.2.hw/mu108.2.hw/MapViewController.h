//
//  MapViewController.h
//  mu108.2.hw
//
//  Created by Pavel on 27.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "RouteViewController.h"
#import "RouteSidePanelController.h"

@interface MapViewController : UIViewController<MKMapViewDelegate, RouteViewDelegate>

@property (strong, nonatomic) NSManagedObjectContext* context;
@property (weak, nonatomic) RouteSidePanelController* sidePanelController;

@end
