//
//  LinkedList.h
//  RemindMe
//
//  Created by Sam Wilskey on 9/4/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LinkedList : NSObject

- (void) addValueToEnd:(id)value;
- (void) addValueToFront:(id)value;
- (void) removeLastValue;
- (void) removeFirstNode;
- (void) printList;

@end