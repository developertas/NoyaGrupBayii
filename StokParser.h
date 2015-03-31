//
//  StokParser.h
//  NoyaGrup
//
//  Created by Developertas on 5.09.2014.
//  Copyright (c) 2014 NoyaGrup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StokParser : NSObject <NSXMLParserDelegate>

-(void)parseXMLFile:(NSData*) data;

@end
