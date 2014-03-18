//
//  MapVC.m
//  National Parks
//
//  Created by Student on 3/17/14.
//  Copyright (c) 2014 Student. All rights reserved.
//

#import "MapVC.h"
@import CoreLocation;

@interface MapVC ()
@property (nonatomic) IBOutlet MKMapView *mapView;
@property (nonatomic) NSMutableArray *markers;

@end

@implementation MapVC{
    CLLocationManager *lm;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    lm = [[CLLocationManager alloc]init];
    lm.desiredAccuracy = kCLLocationAccuracyBest;
    lm.delegate = self;
    lm.distanceFilter = 20;
    lm.headingFilter = 20;
    lm.headingOrientation = 0;
    [lm startUpdatingLocation];
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = 43.1656;
    zoomLocation.longitude = -77.6114;
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation,30*METERS_PER_MILE,30*METERS_PER_MILE);
    
    [self.mapView setRegion:viewRegion animated:YES];
    
    self.markers = [NSMutableArray array];
    
    MyMarker *m1 = [[MyMarker alloc] initWithTitle:@"Victor" Coordinate:CLLocationCoordinate2DMake(42.98, -77.41)];
    MyMarker *m2 = [[MyMarker alloc] initWithTitle:@"Webster" Coordinate:CLLocationCoordinate2DMake(43.2089, -77.4594)];
    MyMarker *m3 = [[MyMarker alloc] initWithTitle:@"IGM" Coordinate:CLLocationCoordinate2DMake(43.083848, -77.6799)];
    
    
    m2.subtitle = @"Where life is worth living";
    [self.markers addObject:m1];
    [self.markers addObject:m2];
    [self.markers addObject:m3];
    [self.mapView addAnnotations:self.markers];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    CLLocation *location = [locations lastObject];
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,30*METERS_PER_MILE,30*METERS_PER_MILE);
    [self.mapView setRegion:viewRegion animated:YES];
    
}

@end
