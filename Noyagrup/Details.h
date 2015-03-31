//
//  Details.h
//  Noyagrup
//
//  Created by Developertas on 17.08.2014.
//  Copyright (c) 2014 Noyagrup. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Details : NSObject
@property (nonatomic, copy) NSString *firma;
@property (nonatomic, copy) NSString *yetkili;
@property (nonatomic, copy) NSString *telefon;
@property (nonatomic, copy) NSString *fax;
@property (nonatomic, copy) NSString *ePosta;
@property (nonatomic, copy) NSString *proje;
@property (nonatomic, copy) NSString *tarih;
@property (nonatomic, copy) NSString *gecerlilikTarihi;
@property (nonatomic, copy) NSString *selected;
@property (nonatomic, copy) NSString *fileName;
@property (nonatomic, copy) NSString *giris;


@property (nonatomic, copy) NSString *fileNameURL;

@property (nonatomic, assign) int clickedPosition;


@property (nonatomic, assign) int iskonto;
@property (nonatomic, assign) float euro;

@property (nonatomic, assign) int hc2No;
@property (nonatomic, assign) int hclNo;
@property (nonatomic, assign) int relay1No;
@property (nonatomic, assign) int relay2No;
@property (nonatomic, assign) int wallNo;
@property (nonatomic, assign) int smokeNo;
@property (nonatomic, assign) int floodNo;
@property (nonatomic, assign) int motionNo;
@property (nonatomic, assign) int dimmerNo;
@property (nonatomic, assign) int rgbwNo;
@property (nonatomic, assign) int universalNo;
@property (nonatomic, assign) int sirenNo;
@property (nonatomic, assign) int globalNo;
@property (nonatomic, assign) int doorWindowNo;
@property (nonatomic, assign) int trvNo;
@property (nonatomic, assign) int roller1No;
@property (nonatomic, assign) int roller2No;
@property (nonatomic, assign) int ipCamNo;
@property (nonatomic, assign) int termometreNo;
@property (nonatomic, assign) int handControllerNo;
@property (nonatomic, assign) int ipCamOutNo;
@property (nonatomic, assign) int celikKapiNo;
@property (nonatomic, assign) int dogalgazNo;
@property (nonatomic, assign) int tempHumNo;
@property (nonatomic, assign) int kollektorNo;

@property (nonatomic, copy) NSString* hc2NoStr;
@property (nonatomic, copy) NSString* hclNoStr;
@property (nonatomic, copy) NSString* relay1NoStr;
@property (nonatomic, copy) NSString* relay2NoStr;
@property (nonatomic, copy) NSString* wallNoStr;
@property (nonatomic, copy) NSString* smokeNoStr;
@property (nonatomic, copy) NSString* floodNoStr;
@property (nonatomic, copy) NSString* motionNoStr;
@property (nonatomic, copy) NSString* dimmerNoStr;
@property (nonatomic, copy) NSString* rgbwNoStr;
@property (nonatomic, copy) NSString* universalNoStr;
@property (nonatomic, copy) NSString* sirenNoStr;
@property (nonatomic, copy) NSString* globalNoStr;
@property (nonatomic, copy) NSString* doorWindowNoStr;
@property (nonatomic, copy) NSString* trvNoStr;
@property (nonatomic, copy) NSString* roller1NoStr;
@property (nonatomic, copy) NSString* roller2NoStr;
@property (nonatomic, copy) NSString* ipCamNoStr;
@property (nonatomic, copy) NSString* termometreNoStr;
@property (nonatomic, copy) NSString* handControllerNoStr;
@property (nonatomic, copy) NSString* ipCamOutNoStr;
@property (nonatomic, copy) NSString* celikKapiNoStr;
@property (nonatomic, copy) NSString* dogalgazNoStr;
@property (nonatomic, copy) NSString* tempHumNoStr;
@property (nonatomic, copy) NSString* kollektorNoStr;

@property (nonatomic, copy) NSString* hc2LastStr;
@property (nonatomic, copy) NSString* hclLastStr;
@property (nonatomic, copy) NSString* relay1LastStr;
@property (nonatomic, copy) NSString* relay2LastStr;
@property (nonatomic, copy) NSString* wallLastStr;
@property (nonatomic, copy) NSString* smokeLastStr;
@property (nonatomic, copy) NSString* floodLastStr;
@property (nonatomic, copy) NSString* motionLastStr;
@property (nonatomic, copy) NSString* dimmerLastStr;
@property (nonatomic, copy) NSString* rgbwLastStr;
@property (nonatomic, copy) NSString* universalLastStr;
@property (nonatomic, copy) NSString* sirenLastStr;
@property (nonatomic, copy) NSString* globalLastStr;
@property (nonatomic, copy) NSString* doorWindowLastStr;
@property (nonatomic, copy) NSString* trvLastStr;
@property (nonatomic, copy) NSString* roller1LastStr;
@property (nonatomic, copy) NSString* roller2LastStr;
@property (nonatomic, copy) NSString* ipCamLastStr;
@property (nonatomic, copy) NSString* termometreLastStr;
@property (nonatomic, copy) NSString* handControllerLastStr;
@property (nonatomic, copy) NSString* ipCamOutLastStr;
@property (nonatomic, copy) NSString* celikKapiLastStr;
@property (nonatomic, copy) NSString* dogalgazLastStr;
@property (nonatomic, copy) NSString* tempHumLastStr;
@property (nonatomic, copy) NSString* kollektorLastStr;

@property (nonatomic, copy) NSString* hc2LastDealerStr;
@property (nonatomic, copy) NSString* hclLastDealerStr;
@property (nonatomic, copy) NSString* relay1LastDealerStr;
@property (nonatomic, copy) NSString* relay2LastDealerStr;
@property (nonatomic, copy) NSString* wallLastDealerStr;
@property (nonatomic, copy) NSString* smokeLastDealerStr;
@property (nonatomic, copy) NSString* floodLastDealerStr;
@property (nonatomic, copy) NSString* motionLastDealerStr;
@property (nonatomic, copy) NSString* dimmerLastDealerStr;
@property (nonatomic, copy) NSString* rgbwLastDealerStr;
@property (nonatomic, copy) NSString* universalLastDealerStr;
@property (nonatomic, copy) NSString* sirenLastDealerStr;
@property (nonatomic, copy) NSString* globalLastDealerStr;
@property (nonatomic, copy) NSString* doorWindowLastDealerStr;
@property (nonatomic, copy) NSString* trvLastDealerStr;
@property (nonatomic, copy) NSString* roller1LastDealerStr;
@property (nonatomic, copy) NSString* roller2LastDealerStr;
@property (nonatomic, copy) NSString* ipCamLastDealerStr;
@property (nonatomic, copy) NSString* termometreLastDealerStr;
@property (nonatomic, copy) NSString* handControllerLastDealerStr;
@property (nonatomic, copy) NSString* ipCamOutLastDealerStr;
@property (nonatomic, copy) NSString* celikKapiLastDealerStr;
@property (nonatomic, copy) NSString* dogalgazLastDealerStr;
@property (nonatomic, copy) NSString* tempHumLastDealerStr;
@property (nonatomic, copy) NSString* kollektorLastDealerStr;

@property (nonatomic, assign) int sayac,sayacRow;

@property (strong,nonatomic) NSArray *prices;
@property (strong,nonatomic) NSArray *titles;
@property (strong,nonatomic) NSArray *counting;
@property (strong,nonatomic) NSArray *countingTotal;
@property (strong,nonatomic) NSArray *countingTotalDealer;
@property (strong,nonatomic) NSArray *stokArray;



@property (nonatomic, assign) bool bayii;
@property (nonatomic, assign) bool devre;
@property (nonatomic, assign) bool montajDefault;
@property (nonatomic, assign) bool devreDefault;

@property (nonatomic, assign) float hc2Last;
@property (nonatomic, assign) float hclLast;
@property (nonatomic, assign) float relay1Last;
@property (nonatomic, assign) float relay2Last;
@property (nonatomic, assign) float wallLast;
@property (nonatomic, assign) float smokeLast;
@property (nonatomic, assign) float floodLast;
@property (nonatomic, assign) float motionLast;
@property (nonatomic, assign) float dimmerLast;
@property (nonatomic, assign) float rgbwLast;
@property (nonatomic, assign) float universalLast;
@property (nonatomic, assign) float sirenLast;
@property (nonatomic, assign) float globalLast;
@property (nonatomic, assign) float doorWindowLast;
@property (nonatomic, assign) float trvLast;
@property (nonatomic, assign) float roller1Last;
@property (nonatomic, assign) float roller2Last;
@property (nonatomic, assign) float ipCamLast;
@property (nonatomic, assign) float termometreLast;
@property (nonatomic, assign) float handControllerLast;
@property (nonatomic, assign) float ipCamOutLast;
@property (nonatomic, assign) float celikKapiLast;
@property (nonatomic, assign) float dogalgazLast;
@property (nonatomic, assign) float tempHumLast;
@property (nonatomic, assign) float kollektorLast;
@property (nonatomic, assign) float iscilik;

@property (nonatomic, copy) NSString* hc2Dealer;
@property (nonatomic, copy) NSString* hclDealer;
@property (nonatomic, copy) NSString* relay1Dealer;
@property (nonatomic, copy) NSString* relay2Dealer;
@property (nonatomic, copy) NSString* wallDealer;
@property (nonatomic, copy) NSString* smokeDealer;
@property (nonatomic, copy) NSString* floodDealer;
@property (nonatomic, copy) NSString* motionDealer;
@property (nonatomic, copy) NSString* dimmerDealer;
@property (nonatomic, copy) NSString* rgbwDealer;
@property (nonatomic, copy) NSString* universalDealer;
@property (nonatomic, copy) NSString* sirenDealer;
@property (nonatomic, copy) NSString* globalDealer;
@property (nonatomic, copy) NSString* doorWindowDealer;
@property (nonatomic, copy) NSString* trvDealer;
@property (nonatomic, copy) NSString* roller1Dealer;
@property (nonatomic, copy) NSString* roller2Dealer;
@property (nonatomic, copy) NSString* ipCamDealer;
@property (nonatomic, copy) NSString* termometreDealer;
@property (nonatomic, copy) NSString* handControllerDealer;
@property (nonatomic, copy) NSString* ipCamOutDealer;
@property (nonatomic, copy) NSString* celikKapiDealer;
@property (nonatomic, copy) NSString* dogalgazDealer;
@property (nonatomic, copy) NSString* tempHumDealer;
@property (nonatomic, copy) NSString* kollektorDealer;

@property (nonatomic, assign) float totalOfferPriceEU;
@property (nonatomic, assign) float totalOfferPriceTL;
@property (nonatomic, assign) float totalDealerPriceEU;
@property (nonatomic, assign) float totalDealerPriceTL;

@property (nonatomic, assign) int lastHomeCenterNo;
@property (nonatomic, assign) int lastModuleNo;
@property (nonatomic,retain) NSArray *dealerPrices ;
@property (nonatomic,retain) NSMutableArray *dealerTotal;
@property (nonatomic,retain) NSMutableArray *masterCounting;

@property (nonatomic, assign) float montajFiyat;
@property (nonatomic, assign) float devreyeAlmaFiyat;
@property (nonatomic, assign) float montajFiyatBayii;
@property (nonatomic, assign) float devreyeAlmaFiyatBayii;


+ (Details *) sharedDataModel;
-(void)getPriceForOneProduct;
-(void)setTotalPriceForOffer;
-(void)setNumberOfDevices;
-(void)setTotalDealerPriceForOffer;
-(void)setDealerPrices;
-(void)setDate;
-(void)clearValues;
-(NSString *)getModulNo;
-(NSString *)getHcNo;
@end
