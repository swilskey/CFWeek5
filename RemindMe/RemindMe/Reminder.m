//
//  Reminder.m
//  RemindMe
//
//  Created by Sam Wilskey on 9/2/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "Reminder.h"
#import <Parse/PFObject+Subclass.h>
#import <CoreLocation/CoreLocation.h>

@interface Reminder() <PFSubclassing>

@end

@implementation Reminder

@dynamic title;
@dynamic location;

+ (NSString * __nonnull)parseClassName {
  return @"Reminder";
}

@end