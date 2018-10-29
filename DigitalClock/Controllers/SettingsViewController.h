//
//  SettingsViewController.h
//  DigitalClock
//
//  Created by Anjali Kevadiya on 10/24/18.
//  Copyright © 2018 Anjali Kevadiya. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SettingsViewControllerProtocol

-(void) getClockColorData : (UIColor *)color;
-(void) getClock24HourData : (BOOL)is24Hour;

@end

@interface SettingsViewController : UIViewController<UIScrollViewDelegate,UIPickerViewDelegate,UIPickerViewDataSource>
{
    UIColor *fontColor;
    NSString *strColor;
    BOOL is24hours,isSwitchClick;
    NSArray *imgesArry;
}

@property(nonatomic,strong) NSMutableArray *timeZoneArray;
@property(nonatomic,weak) id<SettingsViewControllerProtocol> delegate;

@property(nonatomic,weak) IBOutlet UIScrollView *scrollView;
@property(nonatomic,weak) IBOutlet UIImageView *imgView;
@property(nonatomic,weak) IBOutlet UIView *layerViewOnImage;

@property(nonatomic,weak) IBOutlet UIButton *parotColorBtn, *redColorBtn, *blueColorBtn, *greenColorBtn;
@property(nonatomic,weak) IBOutlet UISwitch *hour24Switch;
@property(nonatomic,weak) IBOutlet UIPickerView *timeZonePicker;

@property (nonatomic) CGFloat lastContentOffset;

-(IBAction)parotColorBtnTap:(id)sender;
-(IBAction)redColorBtnTap:(id)sender;
-(IBAction)blueColorBtnTap:(id)sender;
-(IBAction)greenColorBtnTap:(id)sender;
-(IBAction)doneBtnTap:(id)sender;
-(IBAction)is24HourSwitchTap:(id)sender;

@end
