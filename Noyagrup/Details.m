//
//  Details.m
//  Noyagrup
//
//  Created by Developertas on 17.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import "Details.h"

@implementation Details
@synthesize firma,yetkili,telefon,fax,ePosta,proje,gecerlilikTarihi,iskonto,euro,hc2No,hclNo,relay1No,relay2No,wallNo,smokeNo,floodNo,motionNo,dimmerNo,rgbwNo,universalNo,sirenNo,globalNo,doorWindowNo,trvNo,roller1No,ipCamNo,termometreNo,selected,hc2Last,hclLast,relay1Last,relay2Last,wallLast,smokeLast,floodLast,motionLast,dimmerLast,rgbwLast,universalLast,sirenLast,globalLast,doorWindowLast,trvLast,roller1Last,ipCamLast,termometreLast,totalOfferPriceEU,totalOfferPriceTL,lastHomeCenterNo,lastModuleNo,dealerPrices,dealerTotal,iscilik,totalDealerPriceEU,totalDealerPriceTL,handControllerLast,handControllerNo,ipCamOutLast,ipCamOutNo,celikKapiLast,celikKapiNo,dogalgazLast,dogalgazNo,tempHumLast,tempHumNo,prices,titles,counting,countingTotal,countingTotalDealer,sayac,sayacRow,kollektorLast,kollektorNo,tarih,hc2Dealer,hclDealer,relay1Dealer,relay2Dealer,wallDealer,smokeDealer,floodDealer,motionDealer,dimmerDealer,rgbwDealer,universalDealer,sirenDealer,globalDealer,doorWindowDealer,trvDealer,roller1Dealer,ipCamDealer,ipCamOutDealer,termometreDealer,tempHumDealer,celikKapiDealer,kollektorDealer,handControllerDealer,dogalgazDealer,bayii,hc2NoStr,hclNoStr,relay1NoStr,relay2NoStr,wallNoStr,smokeNoStr,floodNoStr,motionNoStr,dimmerNoStr,rgbwNoStr,universalNoStr,sirenNoStr,globalNoStr,doorWindowNoStr,trvNoStr,roller1NoStr,ipCamNoStr,ipCamOutNoStr,termometreNoStr,tempHumNoStr,celikKapiNoStr,kollektorNoStr,handControllerNoStr,dogalgazNoStr,hc2LastStr,hclLastStr,relay1LastStr,relay2LastStr,wallLastStr,smokeLastStr,floodLastStr,motionLastStr,dimmerLastStr,rgbwLastStr,universalLastStr,sirenLastStr,globalLastStr,doorWindowLastStr,trvLastStr,roller1LastStr,ipCamLastStr,ipCamOutLastStr,termometreLastStr,tempHumLastStr,celikKapiLastStr,kollektorLastStr,handControllerLastStr,dogalgazLastStr,hc2LastDealerStr,hclLastDealerStr,relay1LastDealerStr,relay2LastDealerStr,wallLastDealerStr,smokeLastDealerStr,floodLastDealerStr,motionLastDealerStr,dimmerLastDealerStr,rgbwLastDealerStr,universalLastDealerStr,sirenLastDealerStr,globalLastDealerStr,doorWindowLastDealerStr,trvLastDealerStr,roller1LastDealerStr,ipCamLastDealerStr,ipCamOutLastDealerStr,termometreLastDealerStr,tempHumLastDealerStr,celikKapiLastDealerStr,kollektorLastDealerStr,handControllerLastDealerStr,dogalgazLastDealerStr,fileName,fileNameURL,masterCounting,clickedPosition,stokArray,giris,devre,montajFiyat,devreyeAlmaFiyat,montajFiyatBayii,devreyeAlmaFiyatBayii,montajDefault,devreDefault;


static Details *sharedDataModel = nil;

+ (Details *) sharedDataModel
{
    
    @synchronized(self)
    {
        if (sharedDataModel == nil)
        {
            sharedDataModel = [[Details alloc] init];
        }
    }
    return sharedDataModel;
}

-(void)getPriceForOneProduct{
         hc2Last = hc2No * 980.00;
         NSLog(@"HC2 -- %2.f",hc2Last);
         hclLast = hclNo * 490.00;
         NSLog(@"HCL -- %2.f",hclLast);
        relay1Last = relay1No * 95.00;
         NSLog(@"1x3kW -- %2.f",relay1Last);
        relay2Last = relay2No * 95.00;
         NSLog(@"2x1.5kW -- %2.f",relay2Last);
         wallLast = wallNo * 110.00;
         NSLog(@"Wall Plug -- %2.f",wallLast);
        smokeLast = smokeNo * 110.00;
         NSLog(@"Smoke Sensor -- %2.f",smokeLast);
           floodLast = floodNo * 100.00;
         NSLog(@"Flood Sensor -- %2.f",floodLast);
           motionLast = motionNo * 100.00;
         NSLog(@"Motion Sensor -- %2.f",motionLast);
            dimmerLast = dimmerNo * 95.00;
         NSLog(@"Dimmer -- %2.f",dimmerLast);
           rgbwLast=rgbwNo * 95.00;
         NSLog(@"RGBW -- %2.f",rgbwLast);
        universalLast = universalNo * 75.00;
         NSLog(@"Universal Sensor -- %2.f",universalLast);
           sirenLast = sirenNo * 85.00;
         NSLog(@"Siren -- %2.f",sirenLast);
        globalLast = globalNo * 295.00;
         NSLog(@"Global Cache -- %2.f",globalLast);
        doorWindowLast = doorWindowNo * 85.00;
         NSLog(@"Door/Window -- %2.f",doorWindowLast);
            trvLast = trvNo * 95.00;
         NSLog(@"TRV -- %2.f",trvLast);
           roller1Last = roller1No * 95.00;
         NSLog(@"Roller Shutter -- %2.f",roller1Last);
            ipCamLast = ipCamNo * 150.00;
         NSLog(@" IP Camera -- %2.f",ipCamLast);
          termometreLast = termometreNo * 34.00;
         NSLog(@"DS Temp Sensor -- %2.f",termometreLast);
          handControllerLast = handControllerNo * 110.00;
         NSLog(@"Hand Controller -- %2.f",handControllerLast);
        ipCamOutLast = ipCamOutNo * 230.00;
         NSLog(@"IP Camera Out -- %2.f",ipCamOutLast);
          celikKapiLast = celikKapiNo * 110.00;
         NSLog(@"Celik kapi -- %2.f",celikKapiLast);
        dogalgazLast = dogalgazNo * 110.00;
         NSLog(@"Dogalgaz -- %2.f",dogalgazLast);
        tempHumLast= tempHumNo * 85.00;
         NSLog(@"Temp/Hum -- %2.f",tempHumLast);
        kollektorLast= kollektorNo * 55.00;
         NSLog(@"Kollektor -- %2.f",kollektorLast);

   
    
    NSLog(@"getPriceForOneProduct");
}

-(void)setTotalPriceForOffer {
    
    titles = @[  @"Home Center 2 (FGHC2)"
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

    prices = @[ @"980.00"
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
                ,@"55.00"];
    
    totalOfferPriceEU = (hc2Last + hclLast + relay1Last + relay2Last + wallLast + smokeLast + floodLast + motionLast + dimmerLast +rgbwLast + universalLast + sirenLast + globalLast + doorWindowLast + trvLast + roller1Last +  ipCamLast +termometreLast + handControllerLast + ipCamOutLast + celikKapiLast  +dogalgazLast + tempHumLast + kollektorLast);
    
    if (! bayii) {
        totalOfferPriceEU= totalOfferPriceEU + montajFiyat;
    }
    if (! devre) {
        totalOfferPriceEU= totalOfferPriceEU + devreyeAlmaFiyat;
    }
    totalOfferPriceTL = totalOfferPriceEU * euro;
    
    
    hc2LastStr = [NSString stringWithFormat:@"%.2f",hc2Last];
    hclLastStr = [NSString stringWithFormat:@"%.2f",hclLast];
    relay1LastStr = [NSString stringWithFormat:@"%.2f",relay1Last];
    relay2LastStr = [NSString stringWithFormat:@"%.2f",relay2Last];
    wallLastStr = [NSString stringWithFormat:@"%.2f",wallLast];
    smokeLastStr = [NSString stringWithFormat:@"%.2f",smokeLast];
    floodLastStr = [NSString stringWithFormat:@"%.2f",floodLast];
    motionLastStr = [NSString stringWithFormat:@"%.2f",motionLast];
    dimmerLastStr = [NSString stringWithFormat:@"%.2f",dimmerLast];
    rgbwLastStr = [NSString stringWithFormat:@"%.2f",rgbwLast];
    universalLastStr = [NSString stringWithFormat:@"%.2f",universalLast];
    sirenLastStr = [NSString stringWithFormat:@"%.2f",sirenLast];
    globalLastStr = [NSString stringWithFormat:@"%.2f",globalLast];
    doorWindowLastStr = [NSString stringWithFormat:@"%.2f",doorWindowLast];
    trvLastStr = [NSString stringWithFormat:@"%.2f",trvLast];
    roller1LastStr = [NSString stringWithFormat:@"%.2f",roller1Last];
    ipCamLastStr = [NSString stringWithFormat:@"%.2f",ipCamLast];
    termometreLastStr = [NSString stringWithFormat:@"%.2f",termometreLast];
    handControllerLastStr = [NSString stringWithFormat:@"%.2f",handControllerLast];
    ipCamOutLastStr = [NSString stringWithFormat:@"%.2f",ipCamOutLast];
    celikKapiLastStr = [NSString stringWithFormat:@"%.2f",celikKapiLast];
    dogalgazLastStr = [NSString stringWithFormat:@"%.2f",dogalgazLast];
    tempHumLastStr = [NSString stringWithFormat:@"%.2f",tempHumLast];
    kollektorLastStr = [NSString stringWithFormat:@"%.2f",kollektorLast];
    
    hc2LastDealerStr = [NSString stringWithFormat:@"%.2f",(hc2Last-(hc2Last*iskonto)/100)];
    hclLastDealerStr = [NSString stringWithFormat:@"%.2f",(hclLast-(hclLast*iskonto)/100)];
    relay1LastDealerStr = [NSString stringWithFormat:@"%.2f",(relay1Last-(relay1Last*iskonto)/100)];
    relay2LastDealerStr = [NSString stringWithFormat:@"%.2f",(relay2Last-(relay2Last*iskonto)/100)];
    wallLastDealerStr = [NSString stringWithFormat:@"%.2f",(wallLast-(wallLast*iskonto)/100)];
    smokeLastDealerStr = [NSString stringWithFormat:@"%.2f",(smokeLast-(smokeLast*iskonto)/100)];
    floodLastDealerStr = [NSString stringWithFormat:@"%.2f",(floodLast-(floodLast*iskonto)/100)];
    motionLastDealerStr = [NSString stringWithFormat:@"%.2f",(motionLast-(motionLast*iskonto)/100)];
    dimmerLastDealerStr = [NSString stringWithFormat:@"%.2f",(dimmerLast-(dimmerLast*iskonto)/100)];
    rgbwLastDealerStr = [NSString stringWithFormat:@"%.2f",(rgbwLast-(rgbwLast*iskonto)/100)];
    universalLastDealerStr = [NSString stringWithFormat:@"%.2f",(universalLast-(universalLast*iskonto)/100)];
    sirenLastDealerStr = [NSString stringWithFormat:@"%.2f",(sirenLast-(sirenLast*iskonto)/100)];
    globalLastDealerStr = [NSString stringWithFormat:@"%.2f",(globalLast-(globalLast*iskonto)/100)];
    doorWindowLastDealerStr = [NSString stringWithFormat:@"%.2f",(doorWindowLast-(doorWindowLast*iskonto)/100)];
    trvLastDealerStr = [NSString stringWithFormat:@"%.2f",(trvLast-(trvLast*iskonto)/100)];
    roller1LastDealerStr = [NSString stringWithFormat:@"%.2f",(roller1Last-(roller1Last*iskonto)/100)];
    ipCamLastDealerStr = [NSString stringWithFormat:@"%.2f",(ipCamLast-(ipCamLast*iskonto)/100)];
    termometreLastDealerStr = [NSString stringWithFormat:@"%.2f",(termometreLast-(termometreLast*iskonto)/100)];
    handControllerLastDealerStr = [NSString stringWithFormat:@"%.2f",(handControllerLast-(handControllerLast*iskonto)/100)];
    ipCamOutLastDealerStr = [NSString stringWithFormat:@"%.2f",(ipCamOutLast-(ipCamOutLast*iskonto)/100)];
    celikKapiLastDealerStr = [NSString stringWithFormat:@"%.2f",(celikKapiLast-(celikKapiLast*iskonto)/100)];
    dogalgazLastDealerStr = [NSString stringWithFormat:@"%.2f",(dogalgazLast-(dogalgazLast*iskonto)/100)];
    tempHumLastDealerStr = [NSString stringWithFormat:@"%.2f",(tempHumLast-(tempHumLast*iskonto)/100)];
    kollektorLastDealerStr = [NSString stringWithFormat:@"%.2f",(kollektorLast-(kollektorLast*iskonto)/100)];
    
    if (hc2No == 0) {
        hc2LastStr= @"-";
        hc2LastDealerStr=@"-";
    }
    if (hclNo == 0) {
        hclLastStr= @"-";
        hclLastDealerStr=@"-";
    }
    if (relay1No==0) {
        relay1LastStr= @"-";
        relay1LastDealerStr=@"-";
    }
    if (relay2No==0) {
        relay2LastStr= @"-";
        relay2LastDealerStr=@"-";
    }
    if (ipCamNo==0) {
        ipCamLastStr= @"-";
        ipCamLastDealerStr=@"-";
    }
    if (termometreNo==0) {
        termometreLastStr= @"-";
        termometreLastDealerStr=@"-";
    }
    if (wallNo == 0) {
        wallLastStr= @"-";
        wallLastDealerStr=@"-";
    }
    if (smokeNo == 0) {
        smokeLastStr= @"-";
        smokeLastDealerStr=@"-";
    }
    if (floodNo == 0) {
        floodLastStr= @"-";
        floodLastDealerStr=@"-";
    }
    if (motionNo == 0) {
        motionLastStr= @"-";
        motionLastDealerStr=@"-";
    }
    if (dimmerNo == 0) {
        dimmerLastStr= @"-";
        dimmerLastDealerStr=@"-";
    }
    if (rgbwNo == 0) {
        rgbwLastStr= @"-";
        rgbwLastDealerStr=@"-";
    }
    if (universalNo == 0) {
        universalLastStr= @"-";
        universalLastDealerStr=@"-";
    }
    if (sirenNo == 0) {
        sirenLastStr= @"-";
        sirenLastDealerStr=@"-";
    }
    if (globalNo == 0) {
        globalLastStr= @"-";
        globalLastDealerStr=@"-";
    }
    if (doorWindowNo == 0) {
        doorWindowLastStr= @"-";
        doorWindowLastDealerStr=@"-";
    }
    if (trvNo == 0) {
        trvLastStr= @"-";
        trvLastDealerStr=@"-";
    }
    if (roller1No == 0) {
        roller1LastStr= @"-";
        roller1LastDealerStr=@"-";
    }
   
    if (handControllerNo == 0) {
        handControllerLastStr= @"-";
        handControllerLastDealerStr=@"-";
    }
    if (ipCamOutNo == 0) {
        ipCamOutLastStr= @"-";
        ipCamOutLastDealerStr=@"-";
    }
    if (celikKapiNo==0) {
        celikKapiLastStr= @"-";
        celikKapiLastDealerStr=@"-";
    }
    if (dogalgazNo == 0) {
        dogalgazLastStr= @"-";
        dogalgazLastDealerStr=@"-";
    }
    if (tempHumNo == 0) {
        tempHumLastStr= @"-";
        tempHumLastDealerStr=@"-";
    }
    if (kollektorNo==0) {
        kollektorLastStr= @"-";
        kollektorLastDealerStr=@"-";
    }
   
    
    
    countingTotal = @[hc2LastStr,hclLastStr,relay1LastStr,relay2LastStr,wallLastStr,smokeLastStr,floodLastStr,motionLastStr,dimmerLastStr,rgbwLastStr,universalLastStr,sirenLastStr,globalLastStr,doorWindowLastStr,trvLastStr,roller1LastStr,ipCamLastStr,termometreLastStr,handControllerLastStr,ipCamOutLastStr,celikKapiLastStr,dogalgazLastStr,tempHumLastStr,kollektorLastStr];
    
    
    
   
   
    countingTotalDealer = @[hc2LastDealerStr,hclLastDealerStr,relay1LastDealerStr,relay2LastDealerStr,wallLastDealerStr,smokeLastDealerStr,floodLastDealerStr,motionLastDealerStr,dimmerLastDealerStr,rgbwLastDealerStr,universalLastDealerStr,sirenLastDealerStr,globalLastDealerStr,doorWindowLastDealerStr,trvLastDealerStr,roller1LastDealerStr,ipCamLastDealerStr,termometreLastDealerStr,handControllerLastDealerStr,ipCamOutLastDealerStr,celikKapiLastDealerStr,dogalgazLastDealerStr,tempHumLastDealerStr,kollektorLastDealerStr];

    
    NSLog(@"setTotalPriceForOffer");
}

-(void)setNumberOfDevices {
   
    
    hc2NoStr = [NSString stringWithFormat:@"%d",hc2No];
    hclNoStr = [NSString stringWithFormat:@"%d",hclNo];
    relay1NoStr = [NSString stringWithFormat:@"%d",relay1No];
    relay2NoStr = [NSString stringWithFormat:@"%d",relay2No];
    wallNoStr = [NSString stringWithFormat:@"%d",wallNo];
    smokeNoStr = [NSString stringWithFormat:@"%d",smokeNo];
    floodNoStr = [NSString stringWithFormat:@"%d",floodNo];
    motionNoStr = [NSString stringWithFormat:@"%d",motionNo];
    dimmerNoStr = [NSString stringWithFormat:@"%d",dimmerNo];
    rgbwNoStr = [NSString stringWithFormat:@"%d",rgbwNo];
    universalNoStr = [NSString stringWithFormat:@"%d",universalNo];
    sirenNoStr = [NSString stringWithFormat:@"%d",sirenNo];
    globalNoStr = [NSString stringWithFormat:@"%d",globalNo];
    doorWindowNoStr = [NSString stringWithFormat:@"%d",doorWindowNo];
    trvNoStr = [NSString stringWithFormat:@"%d",trvNo];
    roller1NoStr = [NSString stringWithFormat:@"%d",roller1No];
    ipCamNoStr = [NSString stringWithFormat:@"%d",ipCamNo];
    termometreNoStr = [NSString stringWithFormat:@"%d",termometreNo];
    handControllerNoStr = [NSString stringWithFormat:@"%d",handControllerNo];
    ipCamOutNoStr = [NSString stringWithFormat:@"%d",ipCamOutNo];
    celikKapiNoStr = [NSString stringWithFormat:@"%d",celikKapiNo];
    dogalgazNoStr = [NSString stringWithFormat:@"%d",dogalgazNo];
    tempHumNoStr = [NSString stringWithFormat:@"%d",tempHumNo];
    kollektorNoStr = [NSString stringWithFormat:@"%d",kollektorNo];
    
    
    
    counting = @[hc2NoStr,hclNoStr,relay1NoStr,relay2NoStr,wallNoStr,smokeNoStr,floodNoStr,motionNoStr,dimmerNoStr,rgbwNoStr,universalNoStr,sirenNoStr,globalNoStr,doorWindowNoStr,trvNoStr,roller1NoStr,ipCamNoStr,termometreNoStr,handControllerNoStr,ipCamOutNoStr,celikKapiNoStr,dogalgazNoStr,tempHumNoStr,kollektorNoStr];

    
    
    
    
}

-(void)setDealerPrices{
    
  
    hc2Dealer=[NSString stringWithFormat:@"%.2f",(980.f-(980.f*iskonto)/100.f)];
    hclDealer=[NSString stringWithFormat:@"%.2f", (490.f-(490.f*iskonto)/100.f)];
    relay1Dealer=[NSString stringWithFormat:@"%.2f",(95.f-(95.f*iskonto)/100.f)];
    relay2Dealer=[NSString stringWithFormat:@"%.2f", (95.f-(95.f*iskonto)/100.f)];
    wallDealer=[NSString stringWithFormat:@"%.2f", (110.f-(110.f*iskonto)/100.f)];
    smokeDealer=[NSString stringWithFormat:@"%.2f", (110.f-(110.f*iskonto)/100.f)];
    floodDealer=[NSString stringWithFormat:@"%.2f", (100.f-(100.f*iskonto)/100.f)];
    motionDealer=[NSString stringWithFormat:@"%.2f", (100.f-(100.f*iskonto)/100.f)];
    dimmerDealer=[NSString stringWithFormat:@"%.2f", (95.f-(95.f*iskonto)/100.f)];
    rgbwDealer=[NSString stringWithFormat:@"%.2f", (95.f-(95.f*iskonto)/100.f)];
    universalDealer=[NSString stringWithFormat:@"%.2f", (75.f-(75.f*iskonto)/100.f)];
    sirenDealer=[NSString stringWithFormat:@"%.2f", (85.f-(85.f*iskonto)/100.f)];
    globalDealer=[NSString stringWithFormat:@"%.2f",(295.f-(295.f*iskonto)/100.f)];
    doorWindowDealer=[NSString stringWithFormat:@"%.2f", (85.f-(85.f*iskonto)/100.f)];
    trvDealer=[NSString stringWithFormat:@"%.2f", (95.f-(95.f*iskonto)/100.f)];
    roller1Dealer = [NSString stringWithFormat:@"%.2f",(95.f-(95.f*iskonto)/100.f)];
    ipCamDealer=[NSString stringWithFormat:@"%.2f",(150.f-(150.f*iskonto)/100.f)];
    termometreDealer=[NSString stringWithFormat:@"%.2f",(34.f-(34.f*iskonto)/100.f)];
    handControllerDealer=[NSString stringWithFormat:@"%.2f",(110.f-(110.f*iskonto)/100.f)];
    ipCamOutDealer=[NSString stringWithFormat:@"%.2f", (230.f-(230.f*iskonto)/100.f)];
    celikKapiDealer=[NSString stringWithFormat:@"%.2f", (110.f-(110.f*iskonto)/100.f)];
    dogalgazDealer=[NSString stringWithFormat:@"%.2f", (110.f-(110.f*iskonto)/100.f)];
    tempHumDealer=[NSString stringWithFormat:@"%.2f", (85.f-(85.f*iskonto)/100.f)];
    kollektorDealer=[NSString stringWithFormat:@"%.2f", (55.f-(55.f*iskonto)/100.f)];
    
    dealerPrices = @[hc2Dealer,hclDealer,relay1Dealer,relay2Dealer,wallDealer,smokeDealer,floodDealer,motionDealer,dimmerDealer,rgbwDealer,universalDealer,sirenDealer,globalDealer,doorWindowDealer,trvDealer,roller1Dealer,ipCamDealer,termometreDealer,handControllerDealer,ipCamOutDealer,celikKapiDealer,dogalgazDealer,tempHumDealer,kollektorDealer];

}

-(void)setTotalDealerPriceForOffer{
   
   
    if (!bayii && devre)
        totalDealerPriceEU = totalOfferPriceEU - ((totalOfferPriceEU*iskonto)/100) + (montajFiyat*iskonto)/100 ;
    else if (bayii && !devre)
        totalDealerPriceEU = totalOfferPriceEU - ((totalOfferPriceEU*iskonto)/100) + (devreyeAlmaFiyat*iskonto)/100 ;
    else if (bayii && devre)
        totalDealerPriceEU = totalOfferPriceEU - ((totalOfferPriceEU*iskonto)/100) ;
    else
        totalDealerPriceEU = totalOfferPriceEU - ((totalOfferPriceEU*iskonto)/100) + (devreyeAlmaFiyat*iskonto)/100 + (montajFiyat*iskonto)/100 ;
    
    
    totalDealerPriceTL = totalDealerPriceEU * euro ;
    NSLog(@"setTotalDealerPriceForOffer");
}

-(void)setDate{
    
    NSDate *currDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    [dateFormatter setDateFormat:@"dd.MM.YYYY"];
    tarih = [dateFormatter stringFromDate:currDate];
    
    NSLog(@"setDate");
}

-(NSString *)getHcNo {

    NSString *temp = [[NSString alloc] initWithFormat:@"%d",(hc2No+hclNo)];
    return temp;
    
}

-(void)clearValues {
    
    
    hc2Dealer=0;
    hclDealer=0;
    relay1Dealer=0;
    relay2Dealer=0;
    wallDealer=0;
    smokeDealer=0;
    floodDealer=0;
    motionDealer=0;
    dimmerDealer=0;
    rgbwDealer=0;
    universalDealer=0;
    sirenDealer=0;
    globalDealer=0;
    doorWindowDealer=0;
    trvDealer=0;
    roller1Dealer = 0;
    ipCamDealer=0;
    termometreDealer=0;
    handControllerDealer=0;
    ipCamOutDealer=0;
    celikKapiDealer=0;
    dogalgazDealer=0;
    tempHumDealer=0;
    kollektorDealer=0;
    
    
    hc2Last=0;
    hclLast=0;
    relay1Last=0;
    relay2Last=0;
    wallLast=0;
    smokeLast=0;
    floodLast=0;
    motionLast=0;
    dimmerLast=0;
    rgbwLast=0;
    universalLast=0;
    sirenLast=0;
    globalLast=0;
    doorWindowLast=0;
    trvLast=0;
    roller1Last = 0;
    ipCamLast=0;
    termometreLast=0;
    handControllerLast=0;
    ipCamOutLast=0;
    celikKapiLast=0;
    dogalgazLast=0;
    tempHumLast=0;
    kollektorLast=0;
    
    
    hc2No=0;
    hclNo=0;
    relay1No=0;
    relay2No=0;
    wallNo=0;
    smokeNo=0;
    floodNo=0;
    motionNo=0;
    dimmerNo=0;
    rgbwNo=0;
    universalNo=0;
    sirenNo=0;
    globalNo=0;
    doorWindowNo=0;
    trvNo=0;
    roller1No = 0;
    ipCamNo=0;
    termometreNo=0;
    handControllerNo=0;
    ipCamOutNo=0;
    celikKapiNo=0;
    dogalgazNo=0;
    tempHumNo=0;
    kollektorNo=0;
    

    montajFiyat=100.00;
    devreyeAlmaFiyat = 100.00;
}

-(NSString *)getModulNo {
    
    NSString *temp = [[NSString alloc] initWithFormat:@"%d",(relay1No+relay2No+wallNo+smokeNo+floodNo+motionNo+dimmerNo+rgbwNo+universalNo+sirenNo+globalNo+doorWindowNo+trvNo+roller1No+ipCamNo+termometreNo+handControllerNo+ipCamOutNo+celikKapiNo+dogalgazNo+tempHumNo+kollektorNo)];
    return temp;
    
}


@end
