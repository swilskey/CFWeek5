//
//  Queue.h
//  RemindMe
//
//  Created by Sam Wilskey on 9/1/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Queue : NSObject
- (NSNumber *)dequeue;
- (void)enqueue:(NSNumber *)value;
@end
