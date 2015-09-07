//
//  ViewController.m
//  RemindMe
//
//  Created by Sam Wilskey on 8/31/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "ViewController.h"
#import "AddReminderDetailViewController.h"
#import "Constants.h"
#import "Reminder.h"
#import "ParseService.h"

//Code Challenge
#import "Stack.h"
#import "Queue.h"
#import "Anagrams.h"
#import "StringSum.h"
#import "LinkedList.h"

#import <Parse/Parse.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>


@interface ViewController () <MKMapViewDelegate,CLLocationManagerDelegate>

@property (strong,nonatomic) UILongPressGestureRecognizer *longPressRecognizer;
@property (strong,nonatomic) CLLocationManager *locationManager;
@property (strong,nonatomic) NSMutableArray *reminders;


@property (weak,nonatomic) IBOutlet MKMapView *mapView;
- (IBAction)location1:(UIButton *)sender;
- (IBAction)location2:(UIButton *)sender;
- (IBAction)location3:(UIButton *)sender;

@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.locationManager = [[CLLocationManager alloc] init];
  self.locationManager.delegate = self;
  [self.locationManager requestAlwaysAuthorization];
  [self.locationManager startUpdatingLocation];
  
  self.reminders = [[NSMutableArray alloc] init];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reminderNotification:) name:kReminderNotification object:nil];
  
  [ParseService findRemindersForUser:^(NSError *error, NSArray *reminders) {
    if (error) {
      NSLog(@"Error Getting Reminders");
    } else {
      self.reminders = [NSMutableArray arrayWithArray:reminders];
      
      for (int i = 0; i < self.reminders.count; i++) {
        Reminder *newReminder = self.reminders[i];
        PFGeoPoint *point = newReminder.location;
        CLLocationCoordinate2D cords = CLLocationCoordinate2DMake(point.latitude, point.longitude);
        MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
        annotation.coordinate = cords;
        annotation.title = newReminder.title;
        [self.mapView addAnnotation:annotation];
        MKCircle *circle = [MKCircle circleWithCenterCoordinate:cords radius:newReminder.radius];
        
        if ([CLLocationManager isMonitoringAvailableForClass:[CLCircularRegion class]]) {
          
          CLCircularRegion *region = [[CLCircularRegion alloc] initWithCenter:CLLocationCoordinate2DMake(point.latitude, point.longitude) radius:newReminder.radius identifier:newReminder.title];
          
          [self.locationManager startMonitoringForRegion:region];
          //    NSArray *regions = [[self.locationManager monitoredRegions] allObjects];
        }
        [self.mapView addOverlay:circle];
      }
    }
  }];
  
  self.mapView.delegate = self;
  self.mapView.showsUserLocation = true;
  [self.mapView setRegion:MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2DMake(47.623557, -122.336071), 200, 200)];
  
  
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
  
  NSString *string3 = @"th4is is a s2tring123";
  NSLog(@"Int Value = %d", [StringSum stringNumberCount:string3]);
  
  LinkedList *linkedList = [[LinkedList alloc] init];
  [linkedList addValueToEnd:@"1"];
  [linkedList addValueToEnd:@"2"];
  [linkedList addValueToEnd:@"3"];
  [linkedList printList];
  [linkedList removeLastValue];
  [linkedList printList];
  [linkedList removeFirstNode];
  [linkedList printList];
 
  
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

- (void)reminderNotification:(NSNotification *)notification {
  [self.reminders addObject:[notification.userInfo objectForKey:@"reminder"]];
  Reminder *reminder = [notification.userInfo objectForKey:@"reminder"];
  
  PFGeoPoint *point = reminder.location;
  CLLocationCoordinate2D cords = CLLocationCoordinate2DMake(point.latitude, point.longitude);
  MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
  annotation.coordinate = cords;
  annotation.title = reminder.title;
  [self.mapView addAnnotation:annotation];
  MKCircle *circle = [MKCircle circleWithCenterCoordinate:cords radius:reminder.radius];
  
  [self.mapView addOverlay:circle];
  
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
  MKPinAnnotationView *view = (MKPinAnnotationView *)sender;
  CLLocationCoordinate2D location = [view.annotation coordinate];
  AddReminderDetailViewController *destinationVC = [segue destinationViewController];
  
  destinationVC.location = location;
  [view removeFromSuperview];
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

}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
  switch (status) {
    case kCLAuthorizationStatusAuthorizedAlways:
      [self.locationManager startUpdatingLocation];
      break;
    default:
      NSLog(@"Error with Location Authorization");
      break;
  }
}

- (void) locationManager:(CLLocationManager *)manager didEnterRegion:(CLRegion *)region {
  UILocalNotification *notification = [[UILocalNotification alloc] init];
  
  notification.alertTitle = region.identifier;
  notification.alertBody = @"Entered Region";
  
  [[UIApplication sharedApplication] presentLocalNotificationNow:notification];
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

- (MKOverlayRenderer *)mapView:(MKMapView *)mapView rendererForOverlay:(id<MKOverlay>)overlay {
  MKCircleRenderer *renderer = [[MKCircleRenderer alloc] initWithOverlay:overlay];
  renderer.strokeColor = [UIColor redColor];
  renderer.fillColor = [UIColor blueColor];
  renderer.alpha = 0.3;
  
  return renderer;
}

#pragma mark - Dealocate
- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
