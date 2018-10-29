//
//  SettingsViewController.m
//  DigitalClock
//
//  Created by Anjali Kevadiya on 10/24/18.
//  Copyright © 2018 Anjali Kevadiya. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpLayouts];
}

-(IBAction)parotColorBtnTap:(id)sender
{
    fontColor = [UIColor colorWithRed:7.0f/255.0f green:245.0f/255.0f blue:62.0f/255.0f alpha:1];
    strColor = kParot;
}

-(IBAction)redColorBtnTap:(id)sender
{
    fontColor = [UIColor colorWithRed:254.0f/255.0f green:0.0f/255.0f blue:0.0f/255.0f alpha:1];
    strColor = kRed;
}

-(IBAction)blueColorBtnTap:(id)sender
{
    fontColor = [UIColor colorWithRed:67.0f/255.0f green:126.0f/255.0f blue:243.0f/255.0f alpha:1];
    strColor = kBlue;
}

-(IBAction)greenColorBtnTap:(id)sender
{
    fontColor = [UIColor colorWithRed:53.0f/255.0f green:155.0f/255.0f blue:93.0f/255.0f alpha:1];
    strColor = kGreen;
}

-(IBAction)is24HourSwitchTap:(id)sender
{
    isSwitchClick = YES;
    if (_hour24Switch.selected == false) {
        
        _hour24Switch.selected = true;
        is24hours = YES;
    }
    else
    {
        _hour24Switch.selected = false;
        is24hours = NO;
    }
}

#pragma mark - Done Tap
-(IBAction)doneBtnTap:(id)sender
{
    if (fontColor != nil) {
        [_delegate getClockColorData:fontColor];
        [CommanUtils setClockColor:strColor];
    }
    if (isSwitchClick == YES) {
        [_delegate getClock24HourData:is24hours];
        [CommanUtils setClock24Hour:is24hours];
    }

    NSLog(@"color %@",[CommanUtils getClockColor]);
    NSLog(@"is24hour %d",[CommanUtils getClock24Hour]);
    
    [self.navigationController popViewControllerAnimated:NO];
}



#pragma mark - SetUpLayouts
-(void)setUpLayouts
{
    if ([CommanUtils getClock24Hour] == true)
    {
        _hour24Switch.selected = true;
        _hour24Switch.on = true;
    } else {
        _hour24Switch.selected = false;
        _hour24Switch.on = false;
    }
    
    isSwitchClick = NO;

    _parotColorBtn.layer.cornerRadius = _parotColorBtn.frame.size.height / 2;
    _redColorBtn.layer.cornerRadius = _redColorBtn.frame.size.height / 2;
    _blueColorBtn.layer.cornerRadius = _blueColorBtn.frame.size.height / 2;
    _greenColorBtn.layer.cornerRadius = _greenColorBtn.frame.size.height / 2;
    
    _timeZoneArray = [[NSMutableArray alloc] initWithObjects:[NSTimeZone knownTimeZoneNames], nil];
    
    _scrollView.delegate = self;
    [self setScrollViewMethod];

    NSInteger intPickerIndex = [[NSUserDefaults standardUserDefaults] integerForKey:@"PickerIndex"];
    [_timeZonePicker selectRow:intPickerIndex inComponent:0 animated:NO];
    
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
}

-(void)setScrollViewMethod
{
    imgesArry = @[@"img-clock-background-1",@"img-clock-background-2",@"img-clock-background-3",@"img-clock-background-4",@"img-clock-background-5",@"img-clock-background-6",@"img-clock-background-7",@"img-clock-background-8",@"img-clock-background-9"];

    CGRect screen = [[UIScreen mainScreen] bounds];
    CGFloat width = CGRectGetWidth(screen);
    CGFloat height = CGRectGetHeight(screen);
    CGSize mxSize = CGSizeMake( [imgesArry count] * width , height);
    
    [_scrollView setContentSize : mxSize];
    
    self.imgView.translatesAutoresizingMaskIntoConstraints =YES;
    self.imgView.frame = CGRectMake(0, 0, mxSize.width, mxSize.height);
    
    int incX = 0 ;
    
    for( int i = 0; i < [imgesArry count]; i++)
    {
        UIImageView *imagView = [[UIImageView alloc]initWithFrame : CGRectMake(incX,0,width ,height + 44)];
        imagView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@",[imgesArry objectAtIndex:i]]];
        
        [self.imgView addSubview:imagView];
        
        incX+= width;
    }
    _scrollView.contentOffset = CGPointMake(_scrollView.frame.size.width * [CommanUtils getPagerIndex], 44);
}

- (void) orientationChanged:(NSNotification *)note
{
    UIDevice * device = note.object;
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:
            [self setScrollViewMethod];
            break;
            
        case UIDeviceOrientationLandscapeLeft:
            [self setScrollViewMethod];
            break;
            
        case UIDeviceOrientationLandscapeRight:
            [self setScrollViewMethod];
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            [self setScrollViewMethod];
            break;
            
        default:
            break;
    };
}

#pragma mark - UIScrollView Delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
    
    self.lastContentOffset = scrollView.contentOffset.x;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    if (self.lastContentOffset < scrollView.contentOffset.x || self.lastContentOffset > scrollView.contentOffset.x) {
        CGFloat width = scrollView.frame.size.width;
        NSInteger page = (scrollView.contentOffset.x + (0.5f * width)) / width;
        
        UIImage *img = [UIImage imageNamed:[imgesArry objectAtIndex:page]];
        NSData *imageData = UIImagePNGRepresentation(img);
        [CommanUtils setClockImage:imageData];
        if (page != 0) {
            [CommanUtils setPagerIndex:page];
            NSLog(@"[CommanUtils getPagerIndex] %ld",(long)[CommanUtils getPagerIndex]);
        }
    } 
}

#pragma mark - UIPickerView Delegate
-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if ([_timeZoneArray objectAtIndex:0] != nil)
    {
        return [[_timeZoneArray objectAtIndex:0] count];
    }
    return 0;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if ([_timeZoneArray objectAtIndex:0] != nil) {
        return [[_timeZoneArray objectAtIndex:0] objectAtIndex:row];
    }
    return @"empty";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    NSString *selectedTimeZoneString = [[_timeZoneArray objectAtIndex:0] objectAtIndex:row];
    NSLog(@"selectedTimeZoneString %@",selectedTimeZoneString);
    
    [CommanUtils setClockTimeZone:selectedTimeZoneString];
    
    [[NSUserDefaults standardUserDefaults] setInteger:row forKey:@"PickerIndex"];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

-(NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSAttributedString *attString = [[NSAttributedString alloc] initWithString:[[_timeZoneArray objectAtIndex:0] objectAtIndex:row] attributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    return attString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
