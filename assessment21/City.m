//
//  City.m
//  assessment21
//
//  Created by Chris Snyder on 7/31/14.
//  Copyright (c) 2014 Chris Snyder. All rights reserved.
//

#import "City.h"

@implementation City

-(instancetype) initWithName: (NSString *) cityName state: (NSString *) stateName picture:(UIImage *)cityImage
{
    self = [super init];
    self.cityName = cityName;
    self.stateName = stateName;
    self.cityImage = cityImage;

    return  self;
}
@end
