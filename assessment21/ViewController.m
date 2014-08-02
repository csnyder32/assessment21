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




}

- (void)viewDidLoad
{
    [super viewDidLoad];
    City *chicago = [[City alloc]init];
    chicago.cityName = @"Chicago";
    chicago.stateName = @"Illinos";
    chicago.cityImage = [UIImage imageNamed:@"chicago.png"];
    City *milwaukee = [[City alloc]init];
    milwaukee.cityName = @"Milwaukee";
    milwaukee.stateName = @"Wisconsin";
    milwaukee.cityImage = [UIImage imageNamed:@"milwaukee.png"];
    City *lasvegas = [[City alloc]init];
    lasvegas.cityName = @"Las Vegas";
    lasvegas.stateName = @"Nevada";
    lasvegas.cityImage = [UIImage imageNamed:@"vegas.png"];
    City *cleveland = [[City alloc]init];
    cleveland.cityName = @"Cleveland";
    cleveland.stateName = @"Ohio";
    cleveland.cityImage = [UIImage imageNamed:@"cland.png"];
    self.favoriteCites = [NSMutableArray arrayWithObjects:chicago, milwaukee, lasvegas, cleveland,nil];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    City *locations = [self.favoriteCites objectAtIndex:indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.textLabel.text = locations.cityName;
    cell.detailTextLabel.text = locations.stateName;

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
