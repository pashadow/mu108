//
//  MainViewController.h
//  mu108.2.hw
//
//  Created by Pavel on 23.02.14.
//  Copyright (c) 2014 Pavel. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController
- (IBAction)pressButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *welcomeLabel;
@property int clickCount;

@end
