//
//  Park.h
//  National Parks
//
//  Created by Student on 3/18/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface Park : NSObject<MKAnnotation>
@property(nonatomic,copy) NSString *name;
@property(nonatomic) float latitude;
@property(nonatomic) float longitude;
@property(nonatomic,copy) NSString *state;
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

-(id) initWithName:(NSString*)name latitude:(float)latitude longitude:(float)longitude state:(NSString *)state;
@end
