//
//  PDFRenderer.m
//  Noyagrup
//
//  Created by Developertas on 20.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import "PDFRenderer.h"
#import "CoreText/CoreText.h"
#import "Details.h"

@implementation PDFRenderer

+(void)drawPDF:(NSString*)fileName
{
    // Create the PDF context using the default page size of 612 x 792.
    UIGraphicsBeginPDFContextToFile(fileName, CGRectZero, nil);
    // Mark the beginning of a new page.
    UIGraphicsBeginPDFPageWithInfo(CGRectMake(0, 0, 612, 792), nil);
    Details *detail = [Details sharedDataModel];
    
    
    [self drawLabels];
    [self drawLogo];
    
    int xOrigin = 15;
    int labelCellWidth = 228;
    int rowHeight = 17;
    
    NSLog(@"FKDJSHFKLJHDSKJFHDSJKF %.2f -------- %.2f",detail.montajFiyat , detail.devreyeAlmaFiyat);
    
    
    [self setText];
    
    
    [self drawTableAt:CGPointMake(xOrigin, 170) withRowHeight:rowHeight andColumnWidth:228 andRowCount:1 andColumnCount:1];
    
    
    [self drawTableAt:CGPointMake(xOrigin + labelCellWidth, 170) withRowHeight:rowHeight andColumnWidth:70 andRowCount:1 andColumnCount:5];
    
    [self drawTableAt:CGPointMake(xOrigin, 187) withRowHeight:rowHeight andColumnWidth:578 andRowCount:1 andColumnCount:1];
    
    [self drawTableAt:CGPointMake(xOrigin, 204) withRowHeight:rowHeight andColumnWidth:228 andRowCount:1 andColumnCount:1];
    [self drawTableAt:CGPointMake(xOrigin + labelCellWidth, 204) withRowHeight:rowHeight andColumnWidth:70 andRowCount:1 andColumnCount:5];
    [self drawTableAt:CGPointMake(xOrigin, 222) withRowHeight:rowHeight andColumnWidth:228 andRowCount:1 andColumnCount:1];
    [self drawTableAt:CGPointMake(xOrigin + labelCellWidth, 222) withRowHeight:rowHeight andColumnWidth:70 andRowCount:1 andColumnCount:5];
    [self drawTableAt:CGPointMake(xOrigin, 238) withRowHeight:rowHeight andColumnWidth:578 andRowCount:1 andColumnCount:1];
    int y = 255;
    for (int i =0 ; i<24; i++) {
        
        [self drawTableAt:CGPointMake(xOrigin, y) withRowHeight:rowHeight andColumnWidth:228 andRowCount:1 andColumnCount:1];
        [self drawTableAt:CGPointMake(xOrigin+labelCellWidth, y) withRowHeight:rowHeight andColumnWidth:70 andRowCount:1 andColumnCount:5];
        y=y+17;
    }
    
    [self drawTableAt:CGPointMake(xOrigin + labelCellWidth+2, 722) withRowHeight:rowHeight andColumnWidth:87.5 andRowCount:1 andColumnCount:4];
    [self drawTableAt:CGPointMake(xOrigin + labelCellWidth-85, 739) withRowHeight:rowHeight andColumnWidth:87.5 andRowCount:1 andColumnCount:5];
    
    
    
    // Close the PDF context and write the contents out.
    UIGraphicsEndPDFContext();
}



+(void)drawLineFromPoint:(CGPoint)from toPoint:(CGPoint)to
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineWidth(context, 2.0);
    
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    
    CGFloat components[] = {0.2, 0.2, 0.2, 0.3};
    
    CGColorRef color = CGColorCreate(colorspace, components);
    
    CGContextSetStrokeColorWithColor(context, color);
    
    
    CGContextMoveToPoint(context, from.x, from.y);
    CGContextAddLineToPoint(context, to.x, to.y);
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
    
}
+(void)drawImage:(UIImage*)image inRect:(CGRect)rect
{
    
    [image drawInRect:rect];
    
}

+(void)drawText:(NSString*)textToDraw inFrame:(CGRect)frameRect
{
    
    CFStringRef stringRef = (__bridge CFStringRef)textToDraw;
    // Prepare the text using a Core Text Framesetter
    CFAttributedStringRef currentText = CFAttributedStringCreate(NULL, stringRef, NULL);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(currentText);
    
    
    CGMutablePathRef framePath = CGPathCreateMutable();
    CGPathAddRect(framePath, NULL, frameRect);
    
    // Get the frame that will do the rendering.
    CFRange currentRange = CFRangeMake(0, 0);
    CTFrameRef frameRef = CTFramesetterCreateFrame(framesetter, currentRange, framePath, NULL);
    CGPathRelease(framePath);
    
    // Get the graphics context.
    CGContextRef    currentContext = UIGraphicsGetCurrentContext();
    
    // Put the text matrix into a known state. This ensures
    // that no old scaling factors are left in place.
    CGContextSetTextMatrix(currentContext, CGAffineTransformIdentity);
    
    
    // Core Text draws from the bottom-left corner up, so flip
    // the current transform prior to drawing.
    CGContextTranslateCTM(currentContext, 0, frameRect.origin.y*2);
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    
    // Draw the frame.
    CTFrameDraw(frameRef, currentContext);
    
    CGContextScaleCTM(currentContext, 1.0, -1.0);
    CGContextTranslateCTM(currentContext, 0, (-1)*frameRect.origin.y*2);
    
    
    CFRelease(frameRef);
    CFRelease(stringRef);
    CFRelease(framesetter);
}

+(void)drawLabels
{
    
    NSArray* objects = [[NSBundle mainBundle] loadNibNamed:@"pdfView" owner:nil options:nil];
    
    UIView* mainView = [objects objectAtIndex:0];
    
    for (UIView* view in [mainView subviews]) {
        if([view isKindOfClass:[UILabel class]])
        {
            UILabel* label = (UILabel*)view;
            
            
            [self drawText:label.text inFrame:label.frame];
        }
    }
    
}

+(void)drawLogo
{
    Details *detail = [Details sharedDataModel];
    
    
    CGRect kare = CGRectMake(25,35,175,30);
    
    UIImage* logo = [UIImage imageNamed:@"noyagrup.png"];
    [self drawImage:logo inRect:kare];
    
    
    
}

+(void)drawTableAt:(CGPoint)origin
     withRowHeight:(int)rowHeight
    andColumnWidth:(int)columnWidth
       andRowCount:(int)numberOfRows
    andColumnCount:(int)numberOfColumns

{
    
    for (int i = 0; i <= numberOfRows; i++) {
        
        int newOrigin = origin.y + (rowHeight*i);
        
        
        CGPoint from = CGPointMake(origin.x, newOrigin);
        CGPoint to = CGPointMake(origin.x + (numberOfColumns*columnWidth), newOrigin);
        
        [self drawLineFromPoint:from toPoint:to];
        
        
    }
    
    for (int i = 0; i <= numberOfColumns; i++) {
        
        int newOrigin = origin.x + (columnWidth*i);
        
        
        CGPoint from = CGPointMake(newOrigin, origin.y);
        CGPoint to = CGPointMake(newOrigin, origin.y +(numberOfRows*rowHeight));
        
        [self drawLineFromPoint:from toPoint:to];
        
    }
}



+(void)setText {
    
    Details *detail = [Details sharedDataModel];
    
    
    
    
    
    [@"Firma" drawInRect:CGRectMake(400,35, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"Yetkili" drawInRect:CGRectMake(400,45, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"Telefon" drawInRect:CGRectMake(400,55, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"Fax" drawInRect:CGRectMake(400,65, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"E-Posta" drawInRect:CGRectMake(400,75, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"Proje" drawInRect:CGRectMake(400,85, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"Geçerlilik Tarihi" drawInRect:CGRectMake(400,95, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"İskonto Orani" drawInRect:CGRectMake(400,105, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"Tarih" drawInRect:CGRectMake(400,115, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"Euro Kuru" drawInRect:CGRectMake(400,125, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    
    int syc=35;
    for (int i=0;i<10 ; i++) {
        
        [@":" drawInRect:CGRectMake(469,syc, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
        syc=syc+10;
    }
    
    NSString *strFromInt = [NSString stringWithFormat:@" %% %d",detail.iskonto];
    NSString *strFromFloat = [NSString stringWithFormat:@"%.2f TL",detail.euro];
    NSString *yetkiliStr = [NSString stringWithFormat:@"Sn. %@",detail.yetkili];
    NSString *gecerlilikStr = [NSString stringWithFormat:@"%@ gün",detail.gecerlilikTarihi];
    
    [detail.firma drawInRect:CGRectMake(475,35, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [yetkiliStr  drawInRect:CGRectMake(475,45, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [detail.telefon drawInRect:CGRectMake(475,55, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [detail.fax drawInRect:CGRectMake(475,65, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [detail.ePosta drawInRect:CGRectMake(475,75, 160,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [detail.proje drawInRect:CGRectMake(475,85, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [gecerlilikStr drawInRect:CGRectMake(475,95, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [strFromInt drawInRect:CGRectMake(475,105, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [detail.tarih drawInRect:CGRectMake(475,115, 80,20)withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [strFromFloat drawInRect:CGRectMake(475,125, 80,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    
    
    
    
    [@"Ürünler TESF" drawInRect:CGRectMake(18,172,200,20) withAttributes:[self setAttributeWithFontSize:12.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"SF (€)" drawInRect:CGRectMake(240,172,70,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentRight]];
    [@"BF (€)" drawInRect:CGRectMake(240+70,172,70,20)  withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentRight]];
    [@"Adet" drawInRect:CGRectMake(240+70+70,172,70,20)  withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentCenter]];
    [@"Toplam SF (€)" drawInRect:CGRectMake(241.5+210,172,70,20)  withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentRight]];
    [@"Toplam BF (€)" drawInRect:CGRectMake(242+280,172,70,20)  withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentRight]];
    [@"Kontrol Ünitesi" drawInRect:CGRectMake(18,189,210,20)  withAttributes:[self setAttributeWithFontSize:12.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    [@"Modüller / Sensörler" drawInRect:CGRectMake(18,240,210,20)  withAttributes:[self setAttributeWithFontSize:12.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    int y1=223;
    for (int i = 0; i<2; i++) {
        NSString *product =(NSString *)[detail.titles objectAtIndex:i];
        NSString *price =(NSString *)[detail.prices objectAtIndex:i];
        NSString *dealerPrice =(NSString *)[detail.dealerPrices objectAtIndex:i];
        NSString *count =(NSString *)[detail.counting objectAtIndex:i];
        NSString *countPrice =(NSString *)[detail.countingTotal objectAtIndex:i];
        NSString *countPriceDealer =(NSString *)[detail.countingTotalDealer objectAtIndex:i];
        
        CGRect frame5 = CGRectMake(18 , y1, 228, 17);
        [self drawText:product inFrame:frame5];
        [price drawInRect:CGRectMake(220+20 ,y1-17, 70, 17)  withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentRight]];
        [dealerPrice drawInRect:CGRectMake(220+87 ,y1-17, 70, 17)  withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentRight]];
        [count drawInRect:CGRectMake(220+160 ,y1-17, 70, 17)  withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentCenter]];
        
        [countPrice drawInRect:CGRectMake(224+220 ,y1-17, 70, 17) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentRight]];
        
        [countPriceDealer drawInRect:CGRectMake(216+300 ,y1-17, 70, 17) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentRight]];
        
        
        y1=y1+17;
        NSLog(@"%d",y1);
    }
    
    [@"Montaj & Kurulum" drawInRect:CGRectMake(18,665-34,600,20) withAttributes:[self setAttributeWithFontSize:12.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
    
    NSString *tempValueM = [NSString stringWithFormat:@"%.2f",detail.montajFiyat];
    
    
    [tempValueM drawInRect:CGRectMake(218+61,665-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
    
    
    
    [tempValueM drawInRect:CGRectMake(218+59+70,665-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
    
    if (!detail.bayii) {
        [@"1" drawInRect:CGRectMake(218+194,665-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
        [tempValueM drawInRect:CGRectMake(223+264,665-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
        [tempValueM drawInRect:CGRectMake(214+344,665-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
    }
    else {
        [@"0" drawInRect:CGRectMake(218+194,665-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
        [@"-" drawInRect:CGRectMake(218+289,665-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
        [@"-" drawInRect:CGRectMake(216+368,665-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
    }
    
    [@"Devreye Alma" drawInRect:CGRectMake(18,682-34,600,20) withAttributes:[self setAttributeWithFontSize:12.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
    
    NSString *tempValueD = [NSString stringWithFormat:@"%.2f",detail.devreyeAlmaFiyat];
    
    NSLog(@"PDF DEVRE - %@",tempValueD);
    [tempValueD drawInRect:CGRectMake(218+61,682-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
    
    
    
    [tempValueD drawInRect:CGRectMake(218+59+70,682-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
    
    if (!detail.devre) {
        [@"1" drawInRect:CGRectMake(218+194,682-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
        [tempValueD drawInRect:CGRectMake(223+264,682-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
        [tempValueD drawInRect:CGRectMake(214+344,682-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
    }
    else {
        [@"0" drawInRect:CGRectMake(218+194,682-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
        [@"-" drawInRect:CGRectMake(218+289,682-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
        [@"-" drawInRect:CGRectMake(216+368,682-34,600,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentLeft]];
    }
    
    [@"Adet bazlı kademeli fiyatlandırma çizelgesidir. - Fiyatlara KDV dahil değildir." drawInRect:CGRectMake(15,703-34,600,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    
    [@"NOYAGRUP Akıllı Ev & Ofis Sistemleri - 0850 302 66 92 - destek@noyagrup.com - www.noyagrup.com" drawInRect:CGRectMake(15,767,600,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    
    [@"Kısıklı Mh. Alemdağ Cd. Cömert Sk. Aydın Guzel İş Merkezi No:5 D:2 Üsküdar/İSTANBUL - TÜRKİYE - T:0 216 316 02 90-91 -F:0 216 316 02 92" drawInRect:CGRectMake(15,777,600,20) withAttributes:[self setAttributeWithFontSize:8.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentLeft]];
    
    int y = 274;
    for (int i = 0; i<detail.titles.count-2; i++) {
        NSString *product =(NSString *)[detail.titles objectAtIndex:i+2];
        NSString *price =(NSString *)[detail.prices objectAtIndex:i+2];
        NSString *dealerPrice =(NSString *)[detail.dealerPrices objectAtIndex:i+2];
        NSString *count =(NSString *)[detail.counting objectAtIndex:i+2];
        NSString *countPrice =(NSString *)[detail.countingTotal objectAtIndex:i+2];
        NSString *countPriceDealer =(NSString *)[detail.countingTotalDealer objectAtIndex:i+2];
        
        
        CGRect frame = CGRectMake(18 , y, 228, 17);
        [self drawText:product inFrame:frame];
        
        [price drawInRect:CGRectMake(220+20 ,y-17, 70, 17) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentRight]];
        
        [dealerPrice drawInRect:CGRectMake(220+87 ,y-17, 70, 17) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentRight]];
        
        [count drawInRect:CGRectMake(220+160 ,y-17, 70, 17)  withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentCenter]];
        
        
        [countPrice drawInRect:CGRectMake(224+220 ,y-17, 70, 17) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentRight]];
        
        [countPriceDealer drawInRect:CGRectMake(216+300 ,y-17, 70, 17) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica" andAlignment:NSTextAlignmentRight]];
        
        y=y+17;
    }
    
    
    [@"Home Center Adet" drawInRect:CGRectMake(183,726,210,20) withAttributes:[self setAttributeWithFontSize:9.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentCenter]];
    [@"Modül Adet" drawInRect:CGRectMake(182+85,726,210,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentCenter]];
    [@"SF (€/TL)" drawInRect:CGRectMake(187+170,726,210,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentCenter]];
    [@"BF (€/TL)" drawInRect:CGRectMake(187+255,726,210,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentCenter]];
    [@"TOPLAM" drawInRect:CGRectMake(183-85,742,210,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentCenter]];
    
    
    [[detail getHcNo] drawInRect:CGRectMake(183,742,210,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentCenter]];
    [[detail getModulNo] drawInRect:CGRectMake(183+85,742,210,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentCenter]];
    NSString *temp = [NSString stringWithFormat:@"%.2f / %.2f",detail.totalOfferPriceEU , detail.totalOfferPriceTL];
    
    [temp drawInRect:CGRectMake(184+173,742,210,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentCenter]];
    
    NSString *temp2 = [NSString stringWithFormat:@"%.2f / %.2f",detail.totalDealerPriceEU , detail.totalDealerPriceTL];
    
    [temp2 drawInRect:CGRectMake(184+260,742,210,20) withAttributes:[self setAttributeWithFontSize:10.f andFontName:@"Helvetica-Bold" andAlignment:NSTextAlignmentCenter]];
    
    
}

+(NSDictionary*)setAttributeWithFontSize :(float)size andFontName:(NSString*) fontName  andAlignment:(NSTextAlignment *) textAlign {
    
    UIFont *font = [UIFont fontWithName:fontName size:size];
    
    /// Make a copy of the default paragraph style
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    /// Set line break mode
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    /// Set text alignment
    
    
    paragraphStyle.alignment = textAlign;
    
    NSDictionary *attributes = @{ NSFontAttributeName: font,
                                  NSParagraphStyleAttributeName: paragraphStyle };
    
    return attributes;
    
}


@end
