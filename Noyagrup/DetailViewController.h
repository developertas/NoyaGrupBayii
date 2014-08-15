//
//  DetailViewController.h
//  Noyagrup
//
//  Created by Developertas on 15.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
