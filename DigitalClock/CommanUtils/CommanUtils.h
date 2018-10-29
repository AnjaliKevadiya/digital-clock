//
//  CommanUtils.h
//  DigitalClock
//
//  Created by Anjali Kevadiya on 10/25/18.
//  Copyright © 2018 Anjali Kevadiya. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SingleDigitView.h"

@interface CommanUtils : NSObject

+(NSString *)getClockTimeZone;
+(void)setClockTimeZone : (NSString *)timeZone;

+(NSString *)getClockColor;
+(void)setClockColor : (NSString *)color;

+(BOOL)getClock24Hour;
+(void)setClock24Hour : (BOOL)is24hour;

+(NSData *)getClockImage;
+(void)setClockImage : (NSData *)imageData;

+(NSInteger)getPagerIndex;
+(void)setPagerIndex : (NSInteger)index;

+(NSString *)getSystemTime : (NSString *)dateTimeFormate;

+(void)getFirstSingleDigitNumberMethod : (NSArray *)dateArray andSingleDigitView : (SingleDigitView *)singleDigitView andDigitIsZero : (BOOL)digitIsZero;
+(void)getSecondSingleDigitNumberMethod : (NSArray *)dateArray andSingleDigitView : (SingleDigitView *)singleDigitView andDigitIsZero : (BOOL)digitIsZero;

@end
