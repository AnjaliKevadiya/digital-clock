//
//  ViewController.h
//  DigitalClock
//
//  Created by Anjali Kevadiya on 10/19/18.
//  Copyright © 2018 Anjali Kevadiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIScrollViewDelegate,SettingsViewControllerProtocol>
{
    NSTimer *timer;
}

@property(nonatomic,weak) IBOutlet SingleDigitView *hourFirstDigitView, *hourSecondDigitView;
@property(nonatomic,weak) IBOutlet SingleDigitView *minFirstDigitView, *minSecondDigitView;
@property(nonatomic,weak) IBOutlet SingleDigitView *secFirstDigitView, *secSecondDigitView;
@property(nonatomic,weak) IBOutlet UILabel *lblAM,*lblPM,*lblDayMonth,*lblColn;
@property(nonatomic,weak) IBOutlet UIButton *btnSetting;
@property(nonatomic,weak) IBOutlet UIImageView *imgView;
@property(nonatomic,weak) IBOutlet UIView *layerViewOnImage;
@property (nonatomic) BOOL isSetting;

-(IBAction)settingTap:(id)sender;

@end

