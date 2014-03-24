//
//  RouteViewController.h
//  mu108.2.hw
//
//  Created by Pavel on 06.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface RouteViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) NSManagedObjectContext* context;
@property (strong, nonatomic) NSFetchedResultsController* resultsController;

@end
