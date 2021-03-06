//
//  LoginViewController.m
//  RemindMe
//
//  Created by Sam Wilskey on 9/2/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "LoginViewController.h"
#import "ParseService.h"
#import "AppDelegate.h"
#import "Constants.h"

@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;

@end

@implementation LoginViewController

- (void)viewDidLoad {
  [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

#pragma mark - IBAction
- (IBAction)loginAction:(UIButton *)sender {
  NSString *username = self.usernameInput.text;
  NSString *password = self.passwordInput.text;
  
  [ParseService userLoginWithUsername:username andPassword:password completion:^(NSError *error) {
    if (error) {
      NSLog(@"There has been a login Error");
    } else {
      
      UINavigationController *destination = [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavController"];
      AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
      [UIView transitionWithView:appDelegate.window duration:kDefaultAnimationTime options: UIViewAnimationOptionTransitionFlipFromRight animations:^{
        appDelegate.window.rootViewController = destination;

      } completion:^(BOOL finished) {
      }];
    }
  }];
}

@end