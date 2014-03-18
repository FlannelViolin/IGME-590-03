//
//  Park.m
//  National Parks
//
//  Created by Student on 3/18/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "Park.h"

@implementation Park


-(id)initWithName:(NSString *)name latitude:(float)latitude longitude:(float)longitude state:(NSString *)state{
    self = [super init];
    if(self){
        self.name = name;
        self.latitude = latitude;
        self.longitude = longitude;
        self.state = state;
    }
    
    return self;
}

- (CLLocationCoordinate2D)coordinate{
    return CLLocationCoordinate2DMake(self.latitude, self.longitude);
}

-(NSString*)title{
    return self.name;
}
-(NSString*)subtitle{
    return self.state;
}
@end

