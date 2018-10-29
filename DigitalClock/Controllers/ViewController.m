//
//  ViewController.m
//  DigitalClock
//
//  Created by Anjali Kevadiya on 10/19/18.
//  Copyright © 2018 Anjali Kevadiya. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self setUpLayout];
}

#pragma mark - Setting Tap
-(IBAction)settingTap:(id)sender
{
    SettingsViewController *settingViewController = [self.storyboard instantiateViewControllerWithIdentifier:@"SettingsViewController"];
    settingViewController.delegate = self;
    [self.navigationController pushViewController:settingViewController animated:NO];
}

-(void)getClockColorData:(UIColor *)color
{
    [_hourFirstDigitView setColorForSegments:color];
    [_hourSecondDigitView setColorForSegments:color];
    [_minFirstDigitView setColorForSegments:color];
    [_minSecondDigitView setColorForSegments:color];
    [_secFirstDigitView setColorForSegments:color];
    [_secSecondDigitView setColorForSegments:color];
    [_lblColn setTextColor:color];
    [_lblAM setTextColor:color];
    [_lblPM setTextColor:color];
    [_lblDayMonth setTextColor:color];
}

-(void)getClock24HourData:(BOOL)is24Hour
{
    [self hoursMethod:is24Hour];
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(finalTime) userInfo:nil repeats:YES];
}


-(void)finalTime
{
    //NSLog(@"[CommanUtils getClock24Hour] %d",[CommanUtils getClock24Hour]);
    [self hoursMethod:[CommanUtils getClock24Hour]];
    [self minutesMethod];
    [self secondsMethod];
}

#pragma mark - Get Hour
-(void)hoursMethod : (BOOL)is24Hour {
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (is24Hour == NO)
    {
        [dateFormatter setDateFormat:@"hh"];
        [_lblAM setHidden:false];
        [_lblPM setHidden:false];
    } else {
        [dateFormatter setDateFormat:@"HH"];
        [_lblAM setAlpha:0.0f];
        [_lblPM setAlpha:0.0f];
    }
    
    [dateFormatter setTimeZone: [NSTimeZone timeZoneWithName:[CommanUtils getClockTimeZone]]];
    NSString *strDate1 = [dateFormatter stringFromDate:[NSDate date]];
    //NSLog(@"strDate1 %@",strDate1);

    NSMutableArray *array = [NSMutableArray array];
    NSString *str = strDate1;
    for (int i = 0; i < [str length]; i++) {
        NSString *ch = [str substringWithRange:NSMakeRange(i, 1)];
        [array addObject:ch];
        //NSLog(@"array %@",array);
    }
    [CommanUtils getFirstSingleDigitNumberMethod:array andSingleDigitView:_hourFirstDigitView andDigitIsZero:true];
    [CommanUtils getSecondSingleDigitNumberMethod:array andSingleDigitView:_hourSecondDigitView andDigitIsZero:false];
}

#pragma mark - Get Minute
-(void)minutesMethod {
    
    NSString *newDate = [CommanUtils getSystemTime:@"mm"];
    
    NSMutableArray *array = [NSMutableArray array];
    NSString *str = newDate;
    for (int i = 0; i < [str length]; i++) {
        NSString *ch = [str substringWithRange:NSMakeRange(i, 1)];
        [array addObject:ch];
        //NSLog(@"array %@",array);
    }
    [CommanUtils getFirstSingleDigitNumberMethod:array andSingleDigitView:_minFirstDigitView andDigitIsZero:false];
    [CommanUtils getSecondSingleDigitNumberMethod:array andSingleDigitView:_minSecondDigitView andDigitIsZero:false];
}

-(void)secondsMethod {
    NSString *newDate = [CommanUtils getSystemTime:@"ss"];

    NSMutableArray *array = [NSMutableArray array];
    NSString *str = newDate;
    for (int i = 0; i < [str length]; i++) {
        NSString *ch = [str substringWithRange:NSMakeRange(i, 1)];
        [array addObject:ch];
        //NSLog(@"array %@",array);
        
    }
    [CommanUtils getFirstSingleDigitNumberMethod:array andSingleDigitView:_secFirstDigitView andDigitIsZero:false];
    [CommanUtils getSecondSingleDigitNumberMethod:array andSingleDigitView:_secSecondDigitView andDigitIsZero:false];
}

#pragma mark - SetUpLayouts
-(void)setUpLayout
{
    [timer invalidate];
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(finalTime) userInfo:nil repeats:YES];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapOnImage:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [_layerViewOnImage addGestureRecognizer:tapGesture];

    [_btnSetting setHidden: true];
    
    _lblDayMonth.text = [CommanUtils getSystemTime:@"EEEE MMMM"];
    
    NSString *strDate = [CommanUtils getSystemTime:@"hh:mm a"];
    NSString *strFinalDate = [strDate substringFromIndex:[strDate length] - 2];
    //NSLog(@"strFinalDate:%@",strFinalDate);
    if ([strFinalDate isEqualToString:@"AM"]) {
        [_lblAM setAlpha:1.0];
        [_lblPM setAlpha:0.2];
    } else {
        [_lblPM setAlpha:1.0];
        [_lblAM setAlpha:0.2];
    }
    //NSLog(@"[CommanUtils getClock24Hour] %d",[CommanUtils getClock24Hour]);
    [self hoursMethod:[CommanUtils getClock24Hour]];
    [self minutesMethod];
    [self secondsMethod];

    NSString *strColor = [CommanUtils getClockColor];
    UIColor *color;

    if (strColor.length > 0) {
        if ([strColor isEqualToString:kParot]) {
            color = kParotColor;
        }
        else if ([strColor isEqualToString:kRed]) {
            color = kRedColor;
        }
        else if ([strColor isEqualToString:kBlue]) {
            color = kBlueColor;
        }
        else if ([strColor isEqualToString:kGreen]) {
            color = kGreenColor;
        }
    }
    else
    {
        color = kBlueColor;
    }
    [self getClockColorData:color];
    
    UIImage* image = [UIImage imageWithData:[CommanUtils getClockImage]];
    _imgView.image=image;
}

-(void)tapOnImage:(UITapGestureRecognizer *)recognizer
{
    if (_isSetting == false) {
        _isSetting = true;
        [_btnSetting setHidden:false];
    }
    else
    {
        _isSetting = false;
        [_btnSetting setHidden:true];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
