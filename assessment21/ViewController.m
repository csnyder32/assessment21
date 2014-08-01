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

- (void)viewDidLoad
{
    [super viewDidLoad];
    City *chicago = [[City alloc]init];
    chicago.cityName = @"Chicago";
    chicago.stateName = @"Illinos";
    City *milwaukee = [[City alloc]init];
    milwaukee.cityName = @"Milwaukee";
    milwaukee.stateName = @"Wisconsin";
    City *lasvegas = [[City alloc]init];
    lasvegas.cityName = @"Las Vegas";
    lasvegas.stateName = @"Nevada";
    City *cleveland = [[City alloc]init];
    cleveland.cityName = @"Cleveland";
    cleveland.stateName = @"Ohio";
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
    if ([self.editButton.title isEqualToString:@"Done"]) {
        [self.favoriteCites removeObjectAtIndex:indexPath.row];

    }
 [self.cityTableView reloadData];
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([self.editButton.title isEqualToString:@"Edit"]) {
    CityViewController *vc = segue.destinationViewController;
    NSIndexPath *indexPath = [self.cityTableView indexPathForSelectedRow];
    vc.awesomeCity = self.favoriteCites[indexPath.row];
    }else if (![self.editButton.title isEqualToString:@"Edit"])
    {
        
    }
}
@end
