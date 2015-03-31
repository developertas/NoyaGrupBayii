//
//  LoginViewController.m
//  NoyaGrup
//
//  Created by Developertas on 8.09.2014.
//  Copyright (c) 2014 NoyaGrup. All rights reserved.
//

#import "LoginViewController.h"
#import "Details.h"
#import <objc/message.h>

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize background;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"LWC 1 ");
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    UIDevice* thisDevice = [UIDevice currentDevice];
    
    
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad){
        
        if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad && [[UIScreen mainScreen] respondsToSelector:@selector(scale)] && [UIScreen mainScreen].scale > 1)
        {
            self.background.image = [UIImage imageNamed:@"loginRetinaiPad.png"]; // new iPad
            NSLog(@"Retina");
        }
        else
        {
            self.background.image = [UIImage imageNamed:@"loginiPad.png"];
            NSLog(@"Non-Retina");
        }
    }
    
    
}
-(void)viewDidAppear:(BOOL)animated{
    
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        objc_msgSend([UIDevice currentDevice], @selector(setOrientation:),    UIInterfaceOrientationLandscapeLeft | UIInterfaceOrientationLandscapeLeft );
    }
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return (interfaceOrientation == UIInterfaceOrientationMaskLandscape);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backgroundTap:(id)sender {
    
    [self.view endEditing:YES];
    
}

-(void)login:(id)sender {
    Details *detail = [Details sharedDataModel];
    NSString *durum = [NSString stringWithFormat:@"Uye girisi %@ olarak yapildi.", [self checkLogin]];
    NSLog(@"%@",durum);
    detail.giris = [self checkLogin];
    if (detail.giris != @"hata") {
    [self performSegueWithIdentifier:@"login_success" sender:self];
    }
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField {

    [textField resignFirstResponder];
    return YES;

}

-(NSString *)checkLogin {

    NSString *message = [[NSString alloc] init ];
    if ([self.usernameTextField.text isEqualToString:@"noyagrup"] && [self.passwordTextField.text isEqualToString:@"1402admin"])
    {
            message = @"noyagrup";
        }
        else if ([self.usernameTextField.text isEqualToString:@"bayii"] && [self.passwordTextField.text isEqualToString:@"ngbayii"])
            {
                message = @"bayii";
            }
      
                else
                {
                    message = @"hata";
                    NSLog(@"HATA"); 
                }
        
    if ([message isEqualToString:@"hata"]) {
        
        [self alertStatus:@"Hatali kullanici adi ya da sifre girdiniz!" :@"Hatali Giris" :0 ];

    }
    return message;
}


- (void) alertStatus:(NSString *)msg :(NSString *)title :(int) tag
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:msg
                                                       delegate:self
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil, nil];
     alertView.tag = tag;
    
    [alertView show];
}
@end
