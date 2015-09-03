//
//  SignUpViewController.m
//  RemindMe
//
//  Created by Sam Wilskey on 9/3/15.
//  Copyright (c) 2015 Wilskey Labs. All rights reserved.
//

#import "SignUpViewController.h"
#import "ParseService.h"
#import "AppDelegate.h"
#import "Constants.h"

@interface SignUpViewController ()
@property (weak, nonatomic) IBOutlet UITextField *usernameInput;
@property (weak, nonatomic) IBOutlet UITextField *emailInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;
@property (weak, nonatomic) IBOutlet UITextField *confirmPasswordInput;

@end

@implementation SignUpViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (IBAction)signupAction:(UIButton *)sender {
  NSString *username = self.usernameInput.text;
  NSString *email = self.emailInput.text;
  NSString *password = self.passwordInput.text;
  NSString *confirmPassword = self.confirmPasswordInput.text;
  
  if([confirmPassword isEqualToString:password]) {
    
    [ParseService signupWithUsername:username andPassword:password andEmail:email completion:^(NSError *error) {
      if(error) {
        NSLog(@"Error Signing Up");
      } else {
        
        UINavigationController *destination = [self.storyboard instantiateViewControllerWithIdentifier:@"MainNavController"];
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        [UIView transitionWithView:appDelegate.window duration:defaultAnimationTime options: UIViewAnimationOptionTransitionFlipFromRight animations:^{
          appDelegate.window.rootViewController = destination;
          
        } completion:^(BOOL finished) {
        }];
      }
    }];
  }
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
