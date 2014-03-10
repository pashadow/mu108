//
//  RouteSidePanelController.m
//  mu108.2.hw
//
//  Created by Pavel on 10.03.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import "RouteSidePanelController.h"

@interface RouteSidePanelController ()

@end

@implementation RouteSidePanelController

-(void)awakeFromNib
{
    [self setLeftPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"leftViewController"]];
    [self setCenterPanel:[self.storyboard instantiateViewControllerWithIdentifier:@"centerViewController"]];
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
