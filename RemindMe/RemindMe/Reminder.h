//
//  Reminder.h
//  RemindMe
//
//  Created by Sam Wilskey on 9/2/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import <Parse/Parse.h>

@interface Reminder : PFObject<PFSubclassing>
+ (NSString *)parseClassName;
@property (strong,nonatomic) NSString *title;
@property (strong,nonatomic) PFGeoPoint *location;
@property (nonatomic) int radius;
@property (strong,nonatomic) NSString *userId;
@end
