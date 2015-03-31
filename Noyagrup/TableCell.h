//
//  TableCell.h
//  Noyagrup
//
//  Created by Developertas on 17.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableCell : UITableViewCell

@property (strong,nonatomic) IBOutlet UILabel *titleLabel;
@property (strong,nonatomic) IBOutlet UILabel *stockLabel;
@property (strong,nonatomic) IBOutlet UILabel *countedStockLabel;
@property (strong,nonatomic) IBOutlet UIImageView *thumbImage;
@property (strong,nonatomic) IBOutlet UILabel *priceLabel;
@property (strong,nonatomic) IBOutlet UILabel *teklifLabel;



@end
