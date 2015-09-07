//
//  LinkedList.m
//  RemindMe
//
//  Created by Sam Wilskey on 9/4/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "LinkedList.h"
#import "Node.h"

@interface LinkedList()

@property (strong,nonatomic) Node *head;

@end

@implementation LinkedList

- (void) addValueToEnd:(id)value {
  Node *newNode = [[Node alloc] init];
  newNode.value = value;
  
  if(!self.head) {
    self.head = newNode;
    return;
  } else {
    Node *currentNode = self.head;
    
    while (currentNode.next) {
      currentNode = currentNode.next;
    }
    currentNode.next = newNode;
  }
}

- (void) addValueToFront:(id)value {
  Node *newNode = [[Node alloc] init];
  newNode.value = value;
  
  newNode.next = self.head;
  self.head = newNode;
}

- (void) removeLastValue {
  Node *currentNode = self.head;
  Node *lastNode = [[Node alloc] init];
  
  if (!self.head) {
    return;
  }
  
  while (currentNode.next) {
    lastNode = currentNode;
    currentNode = currentNode.next;
  }
  lastNode.next = nil;
}

- (void) removeFirstNode {
  if(!self.head) {
    return;
  }
  self.head = self.head.next;
}

- (void) printList {
  if (!self.head) {
    return;
  }
  Node *currentNode = self.head;
  
  while (currentNode.next) {
    NSLog(@"Value: %@", currentNode.value);
    currentNode = currentNode.next;
  }
  NSLog(@"Value: %@", currentNode.value);
}

@end
