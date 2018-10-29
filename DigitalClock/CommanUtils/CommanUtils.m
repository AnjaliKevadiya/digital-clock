//
//  CommanUtils.m
//  DigitalClock
//
//  Created by Anjali Kevadiya on 10/25/18.
//  Copyright © 2018 Anjali Kevadiya. All rights reserved.
//

#import "CommanUtils.h"

@implementation CommanUtils

+(NSString *)getClockTimeZone;
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kClockTimeZone];
}

+(void)setClockTimeZone : (NSString *)timeZone;
{
    [[NSUserDefaults standardUserDefaults] setObject:timeZone forKey:kClockTimeZone];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getClockColor
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kClockColor];
}

+(void)setClockColor : (NSString *)color;
{
    [[NSUserDefaults standardUserDefaults] setObject:color forKey:kClockColor];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(BOOL)getClock24Hour
{
    return [[NSUserDefaults standardUserDefaults] boolForKey:kClock24Hour];
}

+(void)setClock24Hour : (BOOL)is24hour
{
    [[NSUserDefaults standardUserDefaults] setBool:is24hour forKey:kClock24Hour];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSData *)getClockImage
{
    return [[NSUserDefaults standardUserDefaults] objectForKey:kClockImage];
}

+(void)setClockImage : (NSData *)imageData
{
    [[NSUserDefaults standardUserDefaults] setObject:imageData forKey:kClockImage];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSInteger)getPagerIndex
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:kPagerIndex];
}

+(void)setPagerIndex : (NSInteger)index
{
    [[NSUserDefaults standardUserDefaults] setInteger:index forKey:kPagerIndex];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+(NSString *)getSystemTime : (NSString *)dateTimeFormate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:dateTimeFormate];
    NSString *strDate1 = [dateFormatter stringFromDate:[NSDate date]];
    return strDate1;
}

+(void)getFirstSingleDigitNumberMethod : (NSArray *)dateArray andSingleDigitView : (SingleDigitView *)singleDigitView andDigitIsZero : (BOOL)digitIsZero
{
    if ([[dateArray firstObject] isEqualToString:@"1"]) {
        [singleDigitView becomeOne];
    }
    else if ([[dateArray firstObject] isEqualToString:@"2"]) {
        [singleDigitView becomeTwo];
    }
    else if ([[dateArray firstObject] isEqualToString:@"3"]) {
        [singleDigitView becomeThree];
    }
    else if ([[dateArray firstObject] isEqualToString:@"4"]) {
        [singleDigitView becomeFour];
    }
    else if ([[dateArray firstObject] isEqualToString:@"5"]) {
        [singleDigitView becomeFive];
    }
    else if ([[dateArray firstObject] isEqualToString:@"6"]) {
        [singleDigitView becomeSix];
    }
    else if ([[dateArray firstObject] isEqualToString:@"7"]) {
        [singleDigitView becomeSeven];
    }
    else if ([[dateArray firstObject] isEqualToString:@"8"]) {
        [singleDigitView becomeEight];
    }
    else if ([[dateArray firstObject] isEqualToString:@"9"]) {
        [singleDigitView becomeNine];
    }
    else if ([[dateArray firstObject] isEqualToString:@"0"]) {
        [singleDigitView becomeZero:digitIsZero];
    }
}

+(void)getSecondSingleDigitNumberMethod : (NSArray *)dateArray andSingleDigitView : (SingleDigitView *)singleDigitView andDigitIsZero : (BOOL)digitIsZero
{
    if ([[dateArray lastObject] isEqualToString:@"1"]) {
        [singleDigitView becomeOne];
    }
    else if ([[dateArray lastObject] isEqualToString:@"2"]) {
        [singleDigitView becomeTwo];
    }
    else if ([[dateArray lastObject] isEqualToString:@"3"]) {
        [singleDigitView becomeThree];
    }
    else if ([[dateArray lastObject] isEqualToString:@"4"]) {
        [singleDigitView becomeFour];
    }
    else if ([[dateArray lastObject] isEqualToString:@"5"]) {
        [singleDigitView becomeFive];
    }
    else if ([[dateArray lastObject] isEqualToString:@"6"]) {
        [singleDigitView becomeSix];
    }
    else if ([[dateArray lastObject] isEqualToString:@"7"]) {
        [singleDigitView becomeSeven];
    }
    else if ([[dateArray lastObject] isEqualToString:@"8"]) {
        [singleDigitView becomeEight];
    }
    else if ([[dateArray lastObject] isEqualToString:@"9"]) {
        [singleDigitView becomeNine];
    }
    else if ([[dateArray lastObject] isEqualToString:@"0"]) {
        [singleDigitView becomeZero:digitIsZero];
    }
}

@end
