//
//  SingleDigitView.h
//  DigitalClock
//
//  Created by Anjali Kevadiya on 10/20/18.
//  Copyright © 2018 Anjali Kevadiya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SettingsViewController.h"

@interface SingleDigitView : UIView 

@property(weak, nonatomic) IBOutlet UIView *contentView,*topSegmentView,*middleSegmentView,*bottomSegmentView,*topLeftSegmentView,*bottomLeftSegmentView,*topRightSegmentView,*bottomRightSegmentView;

-(void)becomeOne;
-(void)becomeTwo;
-(void)becomeThree;
-(void)becomeFour;
-(void)becomeFive;
-(void)becomeSix;
-(void)becomeSeven;
-(void)becomeEight;
-(void)becomeNine;
-(void)becomeZero : (BOOL)isHour;

-(void)setColorForSegments:(UIColor *)color;

@end
