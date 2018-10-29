//
//  SingleDigitView.m
//  DigitalClock
//
//  Created by Anjali Kevadiya on 10/20/18.
//  Copyright © 2018 Anjali Kevadiya. All rights reserved.
//

#import "SingleDigitView.h"

@implementation SingleDigitView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self prepare];
    }
    return self;
}

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self prepare];
    }
    return self;
}

-(void)prepare
{
    [[NSBundle mainBundle] loadNibNamed:@"SingleDigitView" owner:self options:nil];
    [self resetSegmentAlpha];
    [self addSubview:self.contentView];
    self.contentView.frame = self.bounds;
    
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
    [self setColorForSegments:color];
}

-(void)getClockData:(UIColor *)color
{
    [self setColorForSegments:color];
}

-(void)setColorForSegments:(UIColor *)color{
    [_topSegmentView setBackgroundColor:color];
    [_topLeftSegmentView setBackgroundColor:color];
    [_bottomLeftSegmentView setBackgroundColor:color];
    [_topRightSegmentView setBackgroundColor:color];
    [_bottomRightSegmentView setBackgroundColor:color];
    [_middleSegmentView setBackgroundColor:color];
    [_bottomSegmentView setBackgroundColor:color];
}

-(void)resetSegmentAlpha
{
    [_topSegmentView setAlpha:0.2];
    [_middleSegmentView setAlpha:0.2];
    [_bottomSegmentView setAlpha:0.2];
    [_topLeftSegmentView setAlpha:0.2];
    [_bottomLeftSegmentView setAlpha:0.2];
    [_topRightSegmentView setAlpha:0.2];
    [_bottomRightSegmentView setAlpha:0.2];
}

-(void)becomeOne
{
    [self resetSegmentAlpha];
    [_topRightSegmentView setAlpha:1.0];
    [_bottomRightSegmentView setAlpha:1.0];
}

-(void)becomeTwo
{
    [self resetSegmentAlpha];
    [_topSegmentView setAlpha:1.0];
    [_topRightSegmentView setAlpha:1.0];
    [_middleSegmentView setAlpha:1.0];
    [_bottomLeftSegmentView setAlpha:1.0];
    [_bottomSegmentView setAlpha:1.0];
}

-(void)becomeThree
{
    [self resetSegmentAlpha];
    [_topSegmentView setAlpha:1.0];
    [_topRightSegmentView setAlpha:1.0];
    [_middleSegmentView setAlpha:1.0];
    [_bottomRightSegmentView setAlpha:1.0];
    [_bottomSegmentView setAlpha:1.0];
}

-(void)becomeFour
{
    [self resetSegmentAlpha];
    [_topLeftSegmentView setAlpha:1.0];
    [_middleSegmentView setAlpha:1.0];
    [_topRightSegmentView setAlpha:1.0];
    [_bottomRightSegmentView setAlpha:1.0];
}

-(void)becomeFive
{
    [self resetSegmentAlpha];
    [_topSegmentView setAlpha:1.0];
    [_topLeftSegmentView setAlpha:1.0];
    [_middleSegmentView setAlpha:1.0];
    [_bottomRightSegmentView setAlpha:1.0];
    [_bottomSegmentView setAlpha:1.0];
}

-(void)becomeSix
{
    [self resetSegmentAlpha];
    [_topSegmentView setAlpha:1.0];
    [_topLeftSegmentView setAlpha:1.0];
    [_bottomLeftSegmentView setAlpha:1.0];
    [_bottomSegmentView setAlpha:1.0];
    [_bottomRightSegmentView setAlpha:1.0];
    [_middleSegmentView setAlpha:1.0];
}

-(void)becomeSeven
{
    [self resetSegmentAlpha];
    [_topSegmentView setAlpha:1.0];
    [_topRightSegmentView setAlpha:1.0];
    [_bottomRightSegmentView setAlpha:1.0];
}

-(void)becomeEight
{
    [self resetSegmentAlpha];
    [_topSegmentView setAlpha:1.0];
    [_topLeftSegmentView setAlpha:1.0];
    [_middleSegmentView setAlpha:1.0];
    [_bottomRightSegmentView setAlpha:1.0];
    [_bottomSegmentView setAlpha:1.0];
    [_bottomLeftSegmentView setAlpha:1.0];
    [_topRightSegmentView setAlpha:1.0];
}

-(void)becomeNine
{
    [self resetSegmentAlpha];
    [_topSegmentView setAlpha:1.0];
    [_topLeftSegmentView setAlpha:1.0];
    [_middleSegmentView setAlpha:1.0];
    [_topRightSegmentView setAlpha:1.0];
    [_bottomRightSegmentView setAlpha:1.0];
}

-(void)becomeZero : (BOOL)isHour
{
    [self resetSegmentAlpha];
    if (isHour == false)
    {
        [_topSegmentView setAlpha:1.0];
        [_topLeftSegmentView setAlpha:1.0];
        [_bottomLeftSegmentView setAlpha:1.0];
        [_topRightSegmentView setAlpha:1.0];
        [_bottomRightSegmentView setAlpha:1.0];
        [_bottomSegmentView setAlpha:1.0];
    }
}

@end
