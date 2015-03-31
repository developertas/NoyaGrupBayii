//
//  MasterViewController.h
//  Noyagrup
//
//  Created by Developertas on 15.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface MasterViewController : UITableViewController {
    NSMutableData *data;
    NSArray *jsonArray;
    int *clickedRow;
}

@property (strong,nonatomic) NSArray *titles;
@property (strong,nonatomic) NSArray *fakeArray;
@property (strong,nonatomic) NSArray *thumbs;
@property (strong,nonatomic) NSArray *stock;
@property (strong,nonatomic) NSArray *prices;
@property (strong,nonatomic) NSMutableArray *masterCounting;

- (IBAction)refresh:(id)sender;




@end
