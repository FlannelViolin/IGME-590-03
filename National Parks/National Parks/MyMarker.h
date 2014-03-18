//
//  MyMarker.h
//  National Parks
//
//  Created by Student on 3/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface MyMarker : NSObject<MKAnnotation>
@property (nonatomic) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

-(id)initWithTitle:(NSString*)title Coordinate:(CLLocationCoordinate2D)coord;
@end
