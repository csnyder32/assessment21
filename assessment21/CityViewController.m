//
//  CityViewController.m
//  assessment21
//
//  Created by Chris Snyder on 7/31/14.
//  Copyright (c) 2014 Chris Snyder. All rights reserved.
//

#import "CityViewController.h"
#import "City.h"
#import "ViewController.h"

@interface CityViewController () <UITextFieldDelegate>


@property (weak, nonatomic) IBOutlet UITextField *cityEditTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateEditTextField;
@property BOOL buttonIsOn;
@property (weak, nonatomic) IBOutlet UIImageView *cityImageView;

@end

@implementation CityViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    self.cityEditTextField.text = self.awesomeCity.cityName;
    self.stateEditTextField.text = self.awesomeCity.stateName;
    self.cityImageView.image = self.awesomeCity.cityImage;


}
//updates the content of the table view
-(void)textFieldDidEndEditing:(UITextField *)textField
{
    self.awesomeCity.cityName = self.cityEditTextField.text;
    self.awesomeCity.stateName = self.stateEditTextField.text;

}


@end
