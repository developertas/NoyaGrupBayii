//
//  MasterViewController.m
//  Noyagrup
//
//  Created by Developertas on 15.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import "MasterViewController.h"
#import "TableCell.h"
#import "StokParser.h"
#import "Details.h"

@interface MasterViewController  () <UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *_objects;
    NSArray *thumbs;
    Details *_detailParent ;
}
@end

@implementation MasterViewController
- (void)awakeFromNib
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.clearsSelectionOnViewWillAppear = NO;
        self.preferredContentSize = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
  
   
   
    
    _detailParent = [Details sharedDataModel];
    
    self.fakeArray = @[ @"82"
                 ,@"82"
                 ,@"100+"
                 ,@"100+"
                 ,@"90"
                 ,@"75"
                 ,@"68"
                 ,@"74"
                 ,@"87"
                 ,@"55"
                 ,@"45"
                 ,@"50"
                 ,@"47"
                 ,@"45"
                 ,@"65"
                 ,@"76"
                 ,@"43"
                 ,@"67"
                 ,@"40"
                 ,@"35"
                 ,@"65"
                 ,@"20"
                 ,@"34"
                 ,@"28"
                 ,@"85"];
    
    self.titles = @[
                 @"Home Center 2 (FGHC2)"
                ,@"Home Center Lite (FGHCLT)"
                ,@"1x3kW Relay Switch (FGS-211)"
                ,@"2x1,5kW Relay Switch (FGS-221)"
                ,@"Wall Plug (FGWPF-101)"
                ,@"Smoke Sensor"
                ,@"Flood Sensor (FGFS-101)"
                ,@"Motion Sensor"
                ,@"Dimmer (FGD-211)"
                ,@"RGBW (FGRGB-101)"
                ,@"Universal Sensor (FGBS-001)"
                ,@"Siren (ZM1601)"
                ,@"Global Cache Infrared (GC-IP2IR)"
                ,@"Door/Window Sensor (FGK-101...107)"
                ,@"TRV (014G0012)"
                ,@"Roller Shutter 2 (FGRM-222)"
                ,@"IP Camera"
                ,@"Termometre (DS-001)"
                ,@"Hand Controller (DSA03202B/W)"
                ,@"IP Camera Outdoor"
                ,@"Celik Kapi Kilit"
                ,@"Dogalgaz Sensoru"
                ,@"Temp./Humidity Sensor w/LCD (ST814-1)"
                ,@"Kollektor Vana"];
    
    self.thumbs = [NSArray arrayWithObjects:
                @"f1.png"
                ,@"f2.png"
                ,@"f3.png"
                ,@"f4.png"
                ,@"f5.png"
                ,@"f6.png"
                ,@"f7.png"
                ,@"f8.png"
                ,@"f9.png"
                ,@"f10.png"
                ,@"f11.png"
                ,@"f12.png"
                ,@"f13.png"
                ,@"f14.png"
                ,@"f15.png"
                ,@"f16.png"
                ,@"f18.png"
                ,@"noyagrup.png"
                ,@"f20.png"
                ,@"f21.png"
                ,@"noyagrup.png"
                ,@"noyagrup.png"
                ,@"f19.png"
                ,@"noyagrup.png",nil];
    
    self.prices = @[
                 @"980.00"
                ,@"490.00"
                ,@"95.00"
                ,@"95.00"
                ,@"110.00"
                ,@"110.00"
                ,@"100.00"
                ,@"100.00"
                ,@"95.00"
                ,@"95.00"
                ,@"75.00"
                ,@"85.00"
                ,@"295.00"
                ,@"85.00"
                ,@"95.00"
                ,@"95.00"
                ,@"150.00"
                ,@"34.00"
                ,@"110.00"
                ,@"230.00"
                ,@"110.00"
                ,@"110.00"
                ,@"85.00"
                ,@"55.00"
                 ];

 
    
    NSURL *urlXML = [NSURL URLWithString:@"http://fibarostok.obilir.net/fibar.xml"];
    NSURLRequest *xmlRequest = [NSURLRequest requestWithURL:urlXML];
    NSURLResponse *xmlResponse ;
    NSError *xmlRequestError ;
    
    
    NSData *data=[NSURLConnection sendSynchronousRequest:xmlRequest returningResponse:&xmlResponse error:&xmlRequestError];
    if (xmlRequestError)
        NSLog(@"XML DOSYASI ALINAMADI");
    StokParser *stokParser = [[StokParser alloc]init];
    NSLog(@"%@",data);
    [stokParser parseXMLFile: data];
    
 
    NSURL *url = [NSURL URLWithString:@"http://rate-exchange.appspot.com/currency?from=EUR&to=TRY"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [[NSURLConnection alloc] initWithRequest:request delegate:self];

  
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    
    data = [[NSMutableData alloc]init];
    
}

-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)theData {

    [data appendData:theData];
}
- (void)connectionDidFinishLoading:(NSURLConnection *)connection {

     [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
    jsonArray = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
   
    NSDictionary *dic = jsonArray;
    NSString *str = dic[@"rate"];
    _detailParent.euro = str.floatValue;
    NSLog(@"%f",_detailParent.euro);
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {

    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Hata " message:@"Internet baglantinizda bir problem saptandi. Lutfen internet baglantiniz oldugundan emin olunuz." delegate:self cancelButtonTitle:@"TAMAM" otherButtonTitles:nil, nil];
    
    [alertView show];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender
{
    if (!_objects) {
        _objects = [[NSMutableArray alloc] init];
    }
    [_objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _titles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TableCell" forIndexPath:indexPath];

    long row = [indexPath row];
    
    cell.titleLabel.text =  _titles[row];
    cell.priceLabel.text =  _prices[row];
    
    

    if ([_detailParent.giris isEqualToString:@"noyagrup"])
    cell.countedStockLabel.text = _detailParent.stokArray[row];
    else {
        cell.countedStockLabel.text = self.fakeArray[row];
    }
    
    cell.thumbImage.image = [UIImage imageNamed:[_thumbs objectAtIndex:indexPath.row]];
    NSString *string = [_detailParent.masterCounting description];
    NSLog(@"%@",_detailParent.masterCounting);
    cell.teklifLabel.text = string;
   
  
   
        return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [_objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    TableCell *cell =(TableCell *) [tableView cellForRowAtIndexPath:indexPath];
    
    _detailParent.selected = cell.titleLabel.text;
    
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        NSDate *object = _objects[indexPath.row];
    }
    NSString *title = [_titles objectAtIndex:indexPath.row];
    NSString *message;
    
    
    if ([_detailParent.selected  isEqual: @"Home Center 2 (FGHC2)"])
    {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.hc2No,title];
    }
    else if ([_detailParent.selected  isEqual: @"Home Center Lite (FGHCLT)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.hclNo,title];
        
    }
    else if ([_detailParent.selected  isEqual: @"1x3kW Relay Switch (FGS-211)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.relay1No,title];
    }
    else if ([_detailParent.selected  isEqual: @"2x1,5kW Relay Switch (FGS-221)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.relay2No,title];
    }
    else if ([_detailParent.selected  isEqual: @"Wall Plug (FGWPF-101)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.wallNo,title];
    }
    else if ([_detailParent.selected  isEqual: @"Smoke Sensor"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.smokeNo,title];
    }
    else if ([_detailParent.selected  isEqual: @"Flood Sensor (FGFS-101)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.floodNo,title];
    }
    else if ([_detailParent.selected  isEqual: @"Motion Sensor"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.motionNo,title];
    }
    else if ([_detailParent.selected  isEqual: @"Dimmer (FGD-211)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.dimmerNo,title];
    }
    else if ([_detailParent.selected  isEqual: @"RGBW (FGRGB-101)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.rgbwNo,title];
    }
    else if ([_detailParent.selected  isEqual: @"Universal Sensor (FGBS-001)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.universalNo,title];
    }
    else if ([_detailParent.selected  isEqual: @"Siren (SE812-1)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.sirenNo,title];
    }
    else if ([_detailParent.selected  isEqual: @"Global Cache Infrared (GC-IP2IR)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.globalNo,title];
        
    }
    else if ([_detailParent.selected  isEqual: @"Door/Window Sensor (FGK-101...107)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.doorWindowNo,title];
        
    }
    else if ([_detailParent.selected  isEqual: @"TRV (014G0012)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.trvNo,title];
    }
    else if ([_detailParent.selected  isEqual: @"Roller Shutter (FGR-221)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.roller1No,title];
    }
    
    else if ([_detailParent.selected  isEqual: @"IP Camera"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.ipCamNo,title];
        
    }
    else if ([_detailParent.selected  isEqual: @"Termometre (DS-001)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.termometreNo,title];
        
    }
    else if ([_detailParent.selected  isEqual: @"Hand Controller (DSA03202B/W)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.handControllerNo,title];
    }
    else if ([_detailParent.selected  isEqual: @"IP Camera Outdoor"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.ipCamOutNo,title];
        
    }
    else if ([_detailParent.selected  isEqual: @"Celik Kapi Kilit"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.celikKapiNo,title];
        
    }
    
    else if ([_detailParent.selected  isEqual: @"Dogalgaz Sensoru"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.dogalgazNo,title];
        
    }
    else if ([_detailParent.selected  isEqual: @"Temp./Humidity Sensor w/LCD (ST814-1)"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.tempHumNo,title];
        
    }
    else if ([_detailParent.selected  isEqual: @"Kollektor Vana"]) {
        message = [NSString stringWithFormat:@"Suan teklifte %d adet %@ bulunmaktadir.",_detailParent.kollektorNo,title];
        
    }
    
    
    
    
    
    
    UIAlertView *alert = [[UIAlertView alloc]
                          initWithTitle:@"Urun adeti" message:message delegate:self cancelButtonTitle:@"Iptal" otherButtonTitles:@"Onayla", nil];
    alert.delegate=self;
    alert.tag = [indexPath row];
    
    alert.alertViewStyle = UIAlertViewStylePlainTextInput;
    
    clickedRow = indexPath.row;
    
    NSLog(@"%@",_detailParent.selected);
    UITextField* tf = [alert textFieldAtIndex:0];
    tf.keyboardType = UIKeyboardTypeNumberPad;
    
    
    
    
    [alert show];
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = _objects[indexPath.row];
        
    }
}

#pragma mark - UIAlertViewDelegate
- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex {


}
-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
   
    
    if (buttonIndex==1) {
        NSLog(@"%@",_detailParent.selected);
        
        if ([_detailParent.selected  isEqual: @"Home Center 2 (FGHC2)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.hc2No = _detailParent.hc2No + str.intValue;
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.hc2No);
        }
        else if ([_detailParent.selected  isEqual: @"Home Center Lite (FGHCLT)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.hclNo = _detailParent.hclNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.hclNo);
        }
        else if ([_detailParent.selected  isEqual: @"1x3kW Relay Switch (FGS-211)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.relay1No = _detailParent.relay1No + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.relay1No);
        }
        else if ([_detailParent.selected  isEqual: @"2x1,5kW Relay Switch (FGS-221)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.relay2No = _detailParent.relay2No + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.relay2No);
        }
        else if ([_detailParent.selected  isEqual: @"Wall Plug (FGWPF-101)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.wallNo = _detailParent.wallNo + str.intValue;
            
            [self.tableView reloadData];            NSLog(@"%i",_detailParent.wallNo);
        }
        else if ([_detailParent.selected  isEqual: @"Smoke Sensor"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.smokeNo =  _detailParent.smokeNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.smokeNo);
        }
        else if ([_detailParent.selected  isEqual: @"Flood Sensor (FGFS-101)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.floodNo = _detailParent.floodNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.floodNo);
        }
        else if ([_detailParent.selected  isEqual: @"Motion Sensor"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.motionNo = _detailParent.motionNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.motionNo);
        }
        else if ([_detailParent.selected  isEqual: @"Dimmer (FGD-211)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.dimmerNo = _detailParent.dimmerNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.dimmerNo);
        }
        else if ([_detailParent.selected  isEqual: @"RGBW (FGRGB-101)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.rgbwNo = _detailParent.rgbwNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.rgbwNo);
        }
        else if ([_detailParent.selected  isEqual: @"Universal Sensor (FGBS-001)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.universalNo = _detailParent.universalNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.universalNo);
        }
        else if ([_detailParent.selected  isEqual: @"Siren (SE812-1)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.sirenNo = _detailParent.sirenNo + str.intValue;
            
            [self.tableView reloadData];
            
            NSLog(@"%i",_detailParent.sirenNo);
        }
        else if ([_detailParent.selected  isEqual: @"Global Cache Infrared (GC-IP2IR)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.globalNo = _detailParent.globalNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.globalNo);
        }
        else if ([_detailParent.selected  isEqual: @"Door/Window Sensor (FGK-101...107)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.doorWindowNo = _detailParent.doorWindowNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.doorWindowNo);
        }
        else if ([_detailParent.selected  isEqual: @"TRV (014G0012)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.trvNo = _detailParent.trvNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.trvNo);
        }
        else if ([_detailParent.selected  isEqual: @"Roller Shutter (FGR-221)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.roller1No = _detailParent.roller1No + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.roller1No);
        }
        
        else if ([_detailParent.selected  isEqual: @"IP Camera"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.ipCamNo = _detailParent.ipCamNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.ipCamNo);
        }
        else if ([_detailParent.selected  isEqual: @"Termometre (DS-001)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.termometreNo =  _detailParent.termometreNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.termometreNo);
        }
        else if ([_detailParent.selected  isEqual: @"Hand Controller (DSA03202B/W)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.handControllerNo = _detailParent.handControllerNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.handControllerNo);
        }
        else if ([_detailParent.selected  isEqual: @"IP Camera Outdoor"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.ipCamOutNo = _detailParent.ipCamOutNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.ipCamOutNo);
        }
        else if ([_detailParent.selected  isEqual: @"Celik Kapi Kilit"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.celikKapiNo = _detailParent.celikKapiNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.celikKapiNo);
        }
        
        else if ([_detailParent.selected  isEqual: @"Dogalgaz Sensoru"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.dogalgazNo = _detailParent.dogalgazNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.dogalgazNo);
        }
        else if ([_detailParent.selected  isEqual: @"Temp./Humidity Sensor w/LCD (ST814-1)"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.tempHumNo = _detailParent.tempHumNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.tempHumNo);
        }
        else if ([_detailParent.selected  isEqual: @"Kollektor Vana"]) {
            NSString *str = [[NSString alloc] initWithString:[[alertView textFieldAtIndex:0]text]];
            
            
            _detailParent.kollektorNo = _detailParent.kollektorNo + str.intValue;
            
            [self.tableView reloadData];
            NSLog(@"%i",_detailParent.tempHumNo);
        }
        
    }

}
- (IBAction)refresh:(id)sender {
    [_detailParent clearValues];
    [self.tableView reloadData];
 
}


@end
