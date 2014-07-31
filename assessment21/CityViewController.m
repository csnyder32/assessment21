//
//  CityViewController.m
//  assessment21
//
//  Created by Chris Snyder on 7/31/14.
//  Copyright (c) 2014 Chris Snyder. All rights reserved.
//

#import "CityViewController.h"

@interface CityViewController ()
@property (weak, nonatomic) IBOutlet UILabel *cityName;

@property (weak, nonatomic) IBOutlet UILabel *stateName;
@property (weak, nonatomic) IBOutlet UIButton *onEditPressed;
@property (weak, nonatomic) IBOutlet UIButton *onSavedPressed;
@property (weak, nonatomic) IBOutlet UITextField *cityEditTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateEditTextField;
@property BOOL buttonIsOn;

@end

@implementation CityViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cityName.text = self.awesomeCity.cityName;
    self.stateName.text = self.awesomeCity.stateName;
    self.cityEditTextField.hidden = YES;
    self.stateEditTextField.hidden = YES;

}
- (IBAction)onEditAction:(id)sender
{
    self.cityEditTextField.hidden = NO;
    self.stateEditTextField.hidden= NO;
    self.cityEditTextField.text = @"";
    self.stateEditTextField.text = @"";
    self.onEditPressed = sender;
    self.buttonIsOn = !self.buttonIsOn;
}
- (IBAction)onSaveAction:(id)sender
{
    self.cityName.text = self.cityEditTextField.text;
    self.stateName.text = self.stateEditTextField.text;
    self.cityEditTextField.hidden = YES;
    self.stateEditTextField.hidden = YES;
    [self.cityEditTextField resignFirstResponder];
    [self.stateEditTextField resignFirstResponder];
}



@end
