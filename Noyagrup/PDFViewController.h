//
//  PDFViewController.h
//  Noyagrup
//
//  Created by Developertas on 20.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageUI/MessageUI.h"

@interface PDFViewController : UIViewController <MFMailComposeViewControllerDelegate>

-(void)showPDFFile;

-(NSString*)getPDFFileName;

-(IBAction)geri:(id)sender;

-(IBAction)mail:(id)sender;

-(void)plotText:(NSString *)text alignment:(NSString *) align xPos:(int)x yPos:(int)y;

@end
