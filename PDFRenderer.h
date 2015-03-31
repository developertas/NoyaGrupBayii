//
//  PDFRenderer.h
//  Noyagrup
//
//  Created by Developertas on 20.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PDFRenderer : NSObject

+(void)drawPDF:(NSString*)fileName;

+(void)drawText;

+(void)drawLineFromPoint:(CGPoint)from toPoint:(CGPoint)to;

+(void)drawImage:(UIImage*)image inRect:(CGRect)rect;

+(void)drawText:(NSString*)textToDraw inFrame:(CGRect)frameRect;

+(void)drawLabels;

+(void)drawLogo;

+(void)setText;

+(void)drawTableAt:(CGPoint)origin
     withRowHeight:(int)rowHeight
    andColumnWidth:(int)columnWidth
       andRowCount:(int)numberOfRows
    andColumnCount:(int)numberOfColumns;


+(void)drawTableDataAt:(CGPoint)origin
         withRowHeight:(int)rowHeight
        andColumnWidth:(int)columnWidth
           andRowCount:(int)numberOfRows
        andColumnCount:(int)numberOfColumns;
+(NSDictionary*)setAttributeWithFontSize : (float)f andFontName:(NSString*) fontName  andAlignment:(NSTextAlignment *) textAlign ;
@end
