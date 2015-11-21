//
//  LoginViewController.m
//  Ribbit
//
//  Created by Pierre Thalamy on 19/11/15.
//  Copyright © 2015 Pierre Thalamy. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.hidesBackButton = YES;
}

- (IBAction)login:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    
    if ( ([username length] == 0) || ([password length] == 0)) {
        UIAlertController *noUsernameAlertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Make sure you entered your username and password." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [noUsernameAlertController addAction:dismiss];
        [self presentViewController:noUsernameAlertController animated:YES completion:nil];
    } else {
        [PFUser logInWithUsernameInBackground:username password:password
                                            block:^(PFUser *user, NSError *error) {
            if (!user) {
                UIAlertController *loginFailedAlert = [UIAlertController alertControllerWithTitle:@"Login Failed" message:@"Please check your username and password." preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
                [loginFailedAlert addAction:dismiss];
                [self presentViewController:loginFailedAlert animated:YES completion:nil];
            } else {  // Hooray! Let them use the app now.
                [self.navigationController popToRootViewControllerAnimated:YES];
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
