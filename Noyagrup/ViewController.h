//
//  ViewController.h
//  Noyagrup
//
//  Created by Developertas on 17.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Details.h"
#import "MasterViewController.h"
@interface ViewController : UIViewController <UIAlertViewDelegate>




@property (strong,nonatomic) IBOutlet UITextField *firmaLabel;
@property (strong,nonatomic) IBOutlet UITextField *yetkiliLabel;
@property (strong,nonatomic) IBOutlet UITextField *telefonLabel;
@property (strong,nonatomic) IBOutlet UITextField *faxLabel;
@property (strong,nonatomic) IBOutlet UITextField *ePostaLabel;
@property (strong,nonatomic) IBOutlet UITextField *projeLabel;
@property (strong,nonatomic) IBOutlet UITextField *gecerlilikLabel;
@property (strong,nonatomic) IBOutlet UILabel *iskontoLabel;
@property (strong,nonatomic) IBOutlet UILabel *euroKur;

@property (nonatomic, assign) bool secim;

@property (strong,nonatomic) IBOutlet UISwitch *switchComp;

@property (strong,nonatomic) IBOutlet UISwitch *switchComp2;


@property (nonatomic,retain) Details *detail;

@property (strong, nonatomic) IBOutlet UISlider *iskontoSlider;

@property (nonatomic, assign) MasterViewController* parentObject;

- (IBAction)iskontoSlider:(UISlider *)sender;

- (IBAction)cancel:(id)sender;

- (IBAction)done:(id)sender;

- (IBAction)backgroundTap:(id)sender;




@end
