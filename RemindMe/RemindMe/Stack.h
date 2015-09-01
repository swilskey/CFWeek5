//
//  Stack.h
//  RemindMe
//
//  Created by Sam Wilskey on 9/1/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack : NSObject
- (NSNumber *) pop;
- (void) push:(NSNumber*)value;
@end
