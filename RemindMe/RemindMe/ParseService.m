//
//  ParseService.m
//  RemindMe
//
//  Created by Sam Wilskey on 9/3/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "ParseService.h"
#import <Parse/Parse.h>

@implementation ParseService

+ (void)userLoginWithUsername:(NSString *)username andPassword:(NSString *)password completion:(void (^)(NSError *))completionHandler {
  
  [PFUser logInWithUsernameInBackground:username password:password block:^(PFUser *user, NSError *error) {
    
    if(user) {
      completionHandler(nil);
    } else {
      completionHandler(error);
    }
  }];
}

+ (void)signupWithUsername:(NSString *)username andPassword:(NSString *)password andEmail:(NSString *)email completion:(void (^)(NSError *))completionHandler {
  
  PFUser *user = [PFUser user];
  user.username = username;
  user.password = password;
  user.email = email;
  
  [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
    if(succeeded) {
      completionHandler(nil);
    } else {
      completionHandler(error);
    }
  }];
}

+ (void)findRemindersForUser:(void(^)(NSError *, NSArray *))completionHandler {
  PFQuery *query = [PFQuery queryWithClassName:@"Reminder"];
  [query whereKey:@"userId" equalTo:[PFUser currentUser].objectId];
  
  [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
    if (error) {
      completionHandler(error, nil);
    } else {
      completionHandler(nil, objects);
    }
  }];
  
}

@end