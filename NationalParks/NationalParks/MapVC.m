//
//  MapVC.m
//  NationalParks
//
//  Created by Student on 3/11/14.
//  Copyright (c) 2014 Student. All rights reserved.
//
#import <MapKit/MapKit.h>
#import "MapVC.h"
#define METERS_PER_MILE 1609.344;

@interface MapVC()
@property (nonatomic) IBOutlet MKMapView  *mapView;

@end

@implementation MapVC


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
