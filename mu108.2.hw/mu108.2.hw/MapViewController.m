//
//  MapViewController.m
//  mu108.2.hw
//
//  Created by Pavel on 27.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import "MapViewController.h"
#import "AppDelegate.h"
#import "Bus.h"
#import "Model/PathPoint.h"

@interface MapViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end

@implementation MapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AppDelegate* appDelegate = (AppDelegate* )[UIApplication sharedApplication].delegate;
    self.context = appDelegate.context;
    
    //Bus* bus = [NSEntityDescription insertNewObjectForEntityForName:@"Bus" inManagedObjectContext:self.context];
    
    //bus.name = @"415";
    
    //[self.mapView addAnnotation:bus];
    
//    MKCoordinateRegion newRegion;
//    newRegion.center.latitude = 50.005791;
//    newRegion.center.longitude = 36.230925;
//    newRegion.span.latitudeDelta = 0.1;
//    newRegion.span.longitudeDelta = 0.1;
//    
//    [self.mapView setRegion:newRegion animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MapView delegate

//-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
//    return nil;
//}

#pragma mark - RouteView delegate

-(void)didSelectRoute:(Route*)route {
    [self.mapView removeAnnotations:self.mapView.annotations];
    for (PathPoint* point in route.points) {
        [self.mapView addAnnotation:point];
    }
    [self.sidePanelController showCenterPanelAnimated:YES];
    [self.mapView setRegion:[self getRegionForPoints:route.points] animated:YES];

}
-(MKCoordinateRegion) getRegionForPoints:(NSSet*)points {
    double x = 0;
    double y =0;
    for (PathPoint* point in points) {
        x = x + [point.x floatValue];
        y = y + [point.y floatValue];
    }
    x = x / [points count];
    y = y / [points count];
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = x;
    newRegion.center.longitude = y;
    newRegion.span.latitudeDelta = 0.15;
    newRegion.span.longitudeDelta = 0.15;
    return newRegion;
}

@end
