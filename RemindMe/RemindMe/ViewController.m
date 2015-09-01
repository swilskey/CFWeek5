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
#import <Parse/Parse.h>
#import <MapKit/MapKit.h>

@interface ViewController ()
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)location1:(UIButton *)sender;
- (IBAction)location2:(UIButton *)sender;
- (IBAction)location3:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(47.623557, -122.336071), 200, 200)];
  
  //Test Stack and Queue
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
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (IBAction)location1:(UIButton *)sender {
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(45.481225, -122.697245), 200, 200) animated:true];
}

- (IBAction)location2:(UIButton *)sender {
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(33.810485, -117.918989), 200, 200) animated:true];
}

- (IBAction)location3:(UIButton *)sender {
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(53.483132, -2.200109), 200, 200) animated:true];
}

@end
