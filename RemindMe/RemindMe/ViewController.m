//
//  ViewController.m
//  RemindMe
//
//  Created by Sam Wilskey on 8/31/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "ViewController.h"
#import "Stack.h"
#import "Queue.h"
#import "Anagrams.h"

#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController () <MKMapViewDelegate,CLLocationManagerDelegate>

@property (strong,nonatomic) UILongPressGestureRecognizer *longPressRecognizer;
@property (strong,nonatomic) CLLocationManager *locationManager;

@property (weak,nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)location1:(UIButton *)sender;
- (IBAction)location2:(UIButton *)sender;
- (IBAction)location3:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.mapView.delegate = self;
  self.mapView.showsUserLocation = true;
  
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(47.623557, -122.336071), 200, 200)];
  
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  [self.locationManager requestWhenInUseAuthorization];
  [self.locationManager startUpdatingLocation];
  
  self.longPressRecognizer = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressAction:)];
  [self.mapView addGestureRecognizer:self.longPressRecognizer];
  
  //Code Challenges
  Stack *stack = [[Stack alloc] init];
  [stack push:@35];
  [stack push:@54];
  [stack push:@75];
  NSLog(@"%@",[stack pop]);
  
  Queue *queue = [[Queue alloc] init];
  [queue enqueue:@34];
  [queue enqueue:@433];
  [queue enqueue:@53];
  NSLog(@"%@", [queue dequeue]);
  
  NSString *string1 = @"aligned";
  NSString *string2 = @"dealing";
  if([Anagrams isStringAnagram:string1 of:string2]) {
    NSLog(@"is Anagram");
  }
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)longPressAction:(UILongPressGestureRecognizer *)pressed {
  if(pressed.state == UIGestureRecognizerStateBegan) {
    CGPoint point = [pressed locationInView:self.mapView];
    CLLocationCoordinate2D cords = [self.mapView convertPoint:point toCoordinateFromView:self.view];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.coordinate = cords;
    annotation.title = @"New Reminder";
    [self.mapView addAnnotation:annotation];
  }
}
#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  
}

#pragma mark - IBActions

- (IBAction)location1:(UIButton *)sender {
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(45.481225, -122.697245), 200, 200) animated:true];
}

- (IBAction)location2:(UIButton *)sender {
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(33.810485, -117.918989), 200, 200) animated:true];
}

- (IBAction)location3:(UIButton *)sender {
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(53.483132, -2.200109), 200, 200) animated:true];
}

#pragma mark - CLLocationManagerDelgate

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
  CLLocation *location = locations.lastObject;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
  switch (status) {
    case kCLAuthorizationStatusAuthorizedWhenInUse:
      [self.locationManager startUpdatingLocation];
      break;
    default:
      NSLog(@"Error with Location Authorization");
      break;
  }
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
  if([annotation isKindOfClass:[MKUserLocation class]]) {
    return nil;
  }
  
  MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"AnnotationView"];
  pinView.annotation = annotation;
  
  if(!pinView) {
    pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"AnnotationView"];
    pinView.canShowCallout = true;
    pinView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    
  }
  
  pinView.animatesDrop = true;
  
  return pinView;
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
  [self performSegueWithIdentifier:@"ShowReminderDetailView" sender:view];
}

@end
