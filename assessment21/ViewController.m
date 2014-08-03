//
//  ViewController.m
//  assessment21
//
//  Created by Chris Snyder on 7/31/14.
//  Copyright (c) 2014 Chris Snyder. All rights reserved.
//

#import "ViewController.h"
#import "City.h"
#import "CityViewController.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *cityTableView;

@property BOOL buttonToggled;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *editButton;
@property (weak, nonatomic) IBOutlet UITextField *cityAddTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateAddTextField;

@end

@implementation ViewController
//toggle a bar button text item
- (IBAction)toggleButton:(id)sender
{
        if (!self.buttonToggled) {
            [sender setTitle:@"Done"];
            self.buttonToggled = YES;
        }
        else {
            [sender setTitle:@"Edit"];
            self.buttonToggled = NO;
        }
    }
- (IBAction)onAddButton:(id)sender
{
    City *newCity = [[City alloc]init];
    newCity.cityName = self.cityAddTextField.text;
    newCity.stateName = self.stateAddTextField.text;

    [self.favoriteCites addObject:newCity];
    [self.cityTableView reloadData];
    [self.cityAddTextField resignFirstResponder];
    [self.stateAddTextField resignFirstResponder];
    self.cityAddTextField.text = @"";
    self.stateAddTextField.text =@"";




//this will update teh table based on what was typed in the edit screen
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.cityTableView reloadData];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    City *chicago = [[City alloc]initWithName:@"Chicago" state:@"Illinois" picture:[UIImage imageNamed:@"chicago.png"]];
    City *milwaukee = [[City alloc]initWithName:@"Milwaukee" state:@"Wisconsin" picture:[UIImage imageNamed:@"milwaukee.png"]];
    City *lasvegas = [[City alloc]initWithName:@"Las Vegas" state:@"Nevada" picture:[UIImage imageNamed:@"vegas.png"]];
    City *cleveland = [[City alloc]initWithName:@"Cleveland" state:@"Ohio" picture:[UIImage imageNamed:@"cland.png"]];
    self.favoriteCites = [NSMutableArray arrayWithObjects:chicago, milwaukee, lasvegas, cleveland,nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    City *locations = [self.favoriteCites objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = locations.cityName;
    cell.detailTextLabel.text = locations.stateName;
    cell.imageView.image = locations.cityImage;


    return cell;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.favoriteCites.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell* cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.textLabel.textColor = [UIColor greenColor];
}
-(void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.editButton.title isEqualToString:@"Done"])
    {
        [self.favoriteCites removeObjectAtIndex:indexPath.row];
        [self.cityTableView reloadData];
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    CityViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.cityTableView indexPathForSelectedRow];
    vc.awesomeCity = self.favoriteCites[indexPath.row];

}
@end
