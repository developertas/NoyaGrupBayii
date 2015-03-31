//
//  LoginViewController.h
//  NoyaGrup
//
//  Created by Developertas on 8.09.2014.
//  Copyright (c) 2014 NoyaGrup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *usernameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong,nonatomic) IBOutlet UIImageView *background;

- (IBAction)backgroundTap:(id)sender;


- (IBAction)login:(id)sender;


@end
