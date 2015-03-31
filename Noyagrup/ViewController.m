//
//  ViewController.m
//  Noyagrup
//
//  Created by Developertas on 17.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import "ViewController.h"
#import "MasterViewController.h"
#import "Details.h"
#import "PDFRenderer.h"

@interface ViewController ()

@end

@implementation ViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    
}
- (void)viewDidLoad
{
    Details *detail = [Details sharedDataModel];
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    NSString *kur = [NSString stringWithFormat:@"%.2f",detail.euro];
    self.euroKur.text = kur;
    
    detail.montajFiyat=100.00;
    detail.devreyeAlmaFiyat=100.00;
    
    UISwipeGestureRecognizer *rightSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    
    [self.view addGestureRecognizer:rightSwipe];
    
    UISwipeGestureRecognizer *leftSwipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(didSwipe:)];
    
    leftSwipe.direction = UISwipeGestureRecognizerDirectionLeft ;
    
    [self.view addGestureRecognizer:leftSwipe];
    
    

    // Do any additional setup after loading the view.
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)backgroundTap:(id)sender {
    
    [self.view endEditing:TRUE];
    
}

-(IBAction)cancel:(id)sender{

    [self dismissModalViewControllerAnimated: YES];
    

}

-(IBAction)done:(id)sender {
    _detail= [Details sharedDataModel];
    
    
    if ([self.firmaLabel.text isEqual:@""])
        _detail.firma = @"...................................";
    else
        _detail.firma = self.firmaLabel.text;
    
    if ([self.yetkiliLabel.text isEqual:@""])
        _detail.yetkili =@"................................";
    else
        _detail.yetkili =self.yetkiliLabel.text;
    
    if ([self.telefonLabel.text isEqual:@""])
        _detail.telefon = @"...................................";
    else
        _detail.telefon = self.telefonLabel.text;
    
    if ([self.faxLabel.text isEqual:@""])
        _detail.fax = @"...................................";
    else
        _detail.fax = self.faxLabel.text;
    if ([self.ePostaLabel.text isEqual:@""])
        _detail.ePosta = @"...................................";
    else
        _detail.ePosta = self.ePostaLabel.text;
    if ([self.projeLabel.text isEqual:@""])
        _detail.proje = @"...................................";
    else
        _detail.proje = self.projeLabel.text;
    
    if ([self.gecerlilikLabel.text isEqual:@""])
        _detail.gecerlilikTarihi = @"................................gun";
    else
        _detail.gecerlilikTarihi = self.gecerlilikLabel.text;

    if ([self.iskontoLabel.text isEqual:@""])
        _detail.iskonto = @".........................";
    else
        _detail.iskonto = self.iskontoLabel.text.floatValue;
    
   
    if (self.switchComp.isOn)
        _detail.bayii = FALSE;
    else
        _detail.bayii = TRUE;
    
    
    if (self.switchComp2.isOn)
        _detail.devre = FALSE;
    else
        _detail.devre = TRUE;
    
    
    [_detail getPriceForOneProduct];
    [_detail setTotalPriceForOffer];
    [_detail setNumberOfDevices];
    [_detail setTotalDealerPriceForOffer];
    [_detail setDealerPrices];
    [_detail setDate];
    
    
   
   
    


    
}

- (IBAction)iskontoSlider:(UISlider *)sender {

    NSString *str = [NSString stringWithFormat:@"%i", (int) self.iskontoSlider.value ];
    self.iskontoLabel.text = str ;

}

- (void)didSwipe: (UISwipeGestureRecognizer *) sender{
    
    Details *detail = [Details sharedDataModel];
  
    UISwipeGestureRecognizerDirection direction = sender.direction;
   
    UIAlertView *alertFiyat = [[UIAlertView alloc] initWithTitle:@"" message:@"" delegate:self cancelButtonTitle:@"Iptal" otherButtonTitles:@"Onayla", nil];
    
    alertFiyat.alertViewStyle = UIAlertViewStylePlainTextInput;

    UITextField* tf = [alertFiyat textFieldAtIndex:0];
    tf.keyboardType = UIKeyboardTypeNumberPad;

    
    switch ( direction ) {
        case UISwipeGestureRecognizerDirectionRight:
           
            
            alertFiyat.delegate=self;
            alertFiyat.tag = 0;
            alertFiyat.title = @"Montaj Ucretlendirmesi";
            alertFiyat.message = @"Montaj icin teklif edilecek fiyat";
            
            
            self.secim = 0;
            
            [alertFiyat show];
            break;
            
        case UISwipeGestureRecognizerDirectionLeft:
            alertFiyat.delegate=self;
            alertFiyat.tag = 1;
            alertFiyat.title = @"Devreye Alma Ucretlendirmesi";
            alertFiyat.message = @"Devreye alma icin teklif edilecek fiyat";
            
            
            self.secim = 1;
            
            [alertFiyat show];
            break;
            
        default:
            break;
    }
 
 
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {

    Details *detail = [Details sharedDataModel];
    
    if (buttonIndex==1) {
        
        if (!self.secim) {
            detail.montajDefault = NO;
        NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            detail.montajFiyat = str.floatValue;
            NSLog(@"MONTAJ %.2f",detail.montajFiyat);
        }
        
        if (self.secim) {
            detail.devreDefault = NO;
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            detail.devreyeAlmaFiyat = str.floatValue;
            NSLog(@"DEVREYE AL %.2f",detail.devreyeAlmaFiyat);

        }
        
        
    }



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

@end

