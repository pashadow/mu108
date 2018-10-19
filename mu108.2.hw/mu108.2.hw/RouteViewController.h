//
//  RouteViewController.h
//  mu108.2.hw
//
//  Created by Pavel on 06.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Model/Route.h"

@protocol RouteViewDelegate <NSObject>

- (void)didSelectRoute:(Route*)route;

@end

@interface RouteViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (weak, nonatomic) id<RouteViewDelegate> routeDelegate;
@property (strong, nonatomic) NSManagedObjectContext* context;
@property (strong, nonatomic) NSFetchedResultsController* resultsController;

@end
