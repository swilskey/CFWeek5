//
//  AddReminderDetailViewController.m
//  RemindMe
//
//  Created by Sam Wilskey on 9/1/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "AddReminderDetailViewController.h"
#import "Constants.h"
#import "Reminder.h"
#import <CoreLocation/CoreLocation.h>

@interface AddReminderDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextField *titleInput;
@property (weak, nonatomic) IBOutlet UISlider *radiusInput;

@property (strong,nonatomic) Reminder *reminder;

@end

@implementation AddReminderDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)saveReminder:(UIButton *)sender {
  NSLog(@"Button Pressed");
  NSString *title = self.titleInput.text;
  int radius = (int) self.radiusInput.value;
  
  double lat = self.location.latitude;
  double lon = self.location.longitude;
  PFGeoPoint *reminderLocation = [PFGeoPoint geoPointWithLatitude:lat longitude:lon];
  
  self.reminder = [Reminder object];
  self.reminder.title = title;
  self.reminder.radius = radius;
  self.reminder.location = reminderLocation;
  self.reminder.userId = [PFUser currentUser].objectId;
  
  [self.reminder saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    if(succeeded) {
      NSLog(@"Save Successfull");
      NSDictionary *userInfo = [NSDictionary dictionaryWithObject:self.reminder forKey:@"reminder"];
      [[NSNotificationCenter defaultCenter] postNotificationName:kReminderNotification object:self userInfo:userInfo];
    } else {
      NSLog(@"Error Saving Reminder");
    }
  }];
}

- (IBAction)deleteReminder:(id)sender {
}



@end
