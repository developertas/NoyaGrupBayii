//
//  PDFViewController.m
//  Noyagrup
//
//  Created by Developertas on 20.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import "PDFViewController.h"
#import "PDFRenderer.h"
#import "CoreText/CoreText.h"
#import "Details.h"

@implementation PDFViewController

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
    [self setNeedsStatusBarAppearanceUpdate];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    
    
    
    NSString* fileName = [self getPDFFileName];
    
    [PDFRenderer drawPDF:fileName];
    
    
    [self showPDFFile];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)showPDFFile
{
    
    Details *detail = [Details sharedDataModel];
    NSString* pdfFileName = [self getPDFFileName];
     UIDevice* thisDevice = [UIDevice currentDevice];
    CGRect Rect ;
    if(thisDevice.userInterfaceIdiom == UIUserInterfaceIdiomPad)
    {
        Rect =  CGRectMake(0, 0,1020, 720);
    }
    else
    {
        Rect =  CGRectMake(0, 0,320, 640);
       
    }
    
    UIWebView* webView = [[UIWebView alloc] initWithFrame:Rect];
    
    
    NSURL *url = [NSURL fileURLWithPath:pdfFileName];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [webView setScalesPageToFit:YES];
    [webView loadRequest:request];
    
    
    
    [self.view addSubview:webView];
    
    [detail clearValues];
    
    
}
-(IBAction)geri:(id)sender {
    Details *detail = [Details sharedDataModel];
    [self dismissModalViewControllerAnimated:YES];
    [detail.self clearValues];
}


-(IBAction)mail:(id)sender{
    Details *detail = [Details sharedDataModel];

    NSString *subject = detail.fileName;
    
    NSString *content = @"Teklif ektedir.";
    
    NSArray *recipients = [NSArray arrayWithObjects:@"destek@noyagrup.com",nil];
    
    MFMailComposeViewController *composer = [[MFMailComposeViewController alloc]init];
    
    composer.mailComposeDelegate=self;
    [composer setSubject:subject];
    [composer setMessageBody:content isHTML:NO];
    [composer setToRecipients:recipients];

    NSData *fileData = [NSData dataWithContentsOfFile:detail.fileNameURL];

    NSString *mimeType = @"application/pdf";
    
    [composer addAttachmentData:fileData mimeType:mimeType fileName:detail.fileName];

    
    [self presentViewController:composer animated:YES completion:nil];
    
    
    
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{

    switch (result) {
        case MFMailComposeResultCancelled:
            NSLog(@"Mail iptal edildi");
            break;
        
        case MFMailComposeResultSaved:
            NSLog(@"Mail kaydedildi");
            break;
            
        case MFMailComposeResultFailed:
            NSLog(@"Mail gonderme basarisiz");
            break;
            
        case MFMailComposeResultSent:
            NSLog(@"Mail gonderme basarili");
            break;
            
        default:
            break;
    }
    [self dismissViewControllerAnimated:YES completion:NULL];
    
}

-(NSString*)getPDFFileName
{
    Details *detail = [Details sharedDataModel];
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"ddMMYY_HHmmss"];
    NSDateFormatter *dateFormatterMail = [[NSDateFormatter alloc]init];
    [dateFormatterMail setDateFormat:@"dd/MM/YYYY HH_mm_ss"];
    NSString *dateString = [dateFormatter stringFromDate:currDate];
    
    NSString *dateStringMail = [dateFormatterMail stringFromDate:currDate];
    NSLog(@"%@",dateString);
    
    NSString *combined = [NSString stringWithFormat:@"NOYAGRUP_TEKLIF_%@_%@.PDF", detail.yetkili, dateString];
    
    detail.fileName = [NSString stringWithFormat:@"NOYAGRUP TEKLIF  %@  %@.PDF", detail.yetkili, dateStringMail];
    NSString* fileName = combined;
    
    
    
    NSArray *arrayPaths =
    NSSearchPathForDirectoriesInDomains(
                                        NSDocumentDirectory,
                                        NSUserDomainMask,
                                        YES);
    NSString *path = [arrayPaths objectAtIndex:0];
    NSString* pdfFileName = [path stringByAppendingPathComponent:fileName];
    
    detail.fileNameURL = pdfFileName;
    return pdfFileName;
    
}

-(void)plotText:(NSString *)text alignment:(NSString *) align xPos:(int)x yPos:(int)y{
    
    CGRect screenBounds = [[UIScreen mainScreen] bounds];
    
    CATextLayer *textLayer = [[CATextLayer alloc] init];
    textLayer.string = text;
    textLayer.wrapped = YES;
    textLayer.fontSize = 12.f;
    textLayer.alignmentMode = align;
    
    textLayer.frame = CGRectMake(x, y, screenBounds.size.width-12, 14.f);
    [self.view.layer addSublayer:textLayer];
    
    
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
