//
//  RouteSidePanelController.m
//  mu108.2.hw
//
//  Created by Pavel on 10.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import "RouteSidePanelController.h"
#import "RouteViewController.h"
#import "MapViewController.h"

@interface RouteSidePanelController ()

@end

@implementation RouteSidePanelController

-(void)awakeFromNib
{
    RouteViewController* routeController = [self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"];
    UINavigationController* navigationController = [self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"];

    [self setLeftPanel:routeController];
    [self setCenterPanel:navigationController];
    
    MapViewController* mapViewController = (MapViewController*)navigationController.topViewController;
    routeController.routeDelegate = mapViewController;
    mapViewController.sidePanelController = self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
