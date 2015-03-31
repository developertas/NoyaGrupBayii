//
//  StokParser.m
//  NoyaGrup
//
//  Created by Developertas on 5.09.2014.
//  Copyright (c) 2014 NoyaGrup. All rights reserved.
//

#import "StokParser.h"
#import "Details.h"

@interface StokParser ()

@property NSString *element;
@property NSXMLParser *parser;
@property NSMutableArray *stok;



@end


@implementation StokParser
int x=0;
-(void) StokParser {
    Details *detail = [Details sharedDataModel];
}
-(void)parseXMLFile:(NSData *) data {

    self.parser = [[NSXMLParser alloc] initWithData:data];
    self.parser.delegate = self ;
    BOOL success = [self.parser parse];
    
    if (success) {
        NSLog(@"No errors");
         // get array of users here
        //  NSMutableArray *users = [parser users];
    } else {
        NSLog(@"Error parsing document!");
    }

}

-(void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName
    namespaceURI:(NSString *)namespaceURI
    qualifiedName:(NSString *)qName
    attributes:(NSDictionary *)attributeDict
{
    if ([elementName isEqualToString:@"fibaro"]){
        if (!self.stok)
        {
            self.stok = [[NSMutableArray alloc]init];
            NSLog(@"OLUSTURULDU");
        }
    }
    else
    {
        NSString *adet = [attributeDict objectForKey:@"value"];
        [self.stok addObject:adet ];
        NSLog(@"ADET : %@",adet);
        x++;
    }
}
-(void)parser:(NSXMLParser *)parser
didEndElement:(NSString *)elementName
 namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName {

   
    if ( [elementName isEqualToString:@"fibaro"])
        return;


}
-(void)parserDidEndDocument:(NSXMLParser *)parser {

    Details *detail = [Details sharedDataModel];
    [self.stok addObject:@"-" ];
    [self.stok addObject:@"-" ];
    [self.stok addObject:@"-" ];
    [self.stok addObject:@"-" ];
    [self.stok addObject:@"-" ];
    [self.stok addObject:@"-" ];
    [self.stok addObject:@"-" ];
    
    detail.stokArray = [[NSArray alloc] initWithArray:self.stok];
    return;
}

@end
