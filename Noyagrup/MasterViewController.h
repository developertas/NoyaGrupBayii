//
//  MasterViewController.h
//  Noyagrup
//
//  Created by Developertas on 15.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController

@property (strong, nonatomic) DetailViewController *detailViewController;

@end
