//
//  SignupViewController.m
//  Ribbit
//
//  Created by Pierre Thalamy on 19/11/15.
//  Copyright © 2015 Pierre Thalamy. All rights reserved.
//

#import "SignupViewController.h"

@interface SignupViewController ()

@end

@implementation SignupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //    self.navigationItem.backBarButtonItem.title = @"Back";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)signup:(id)sender {
    NSString *username = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *password = [self.usernameField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
    NSString *email = [self.emailField.text stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];

    if ( ([username length] == 0) || ([password length] == 0) || ([email length] == 0)) {
        UIAlertController *noUsernameAlertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Make sure you enter a username, password and email." preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
        [noUsernameAlertController addAction:dismiss];
        [self presentViewController:noUsernameAlertController animated:YES completion:nil];
    } else {
        PFUser *user = [PFUser user];
        user.username = username;
        user.password = password;
        user.email = email;
        
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (error) {   // Hooray! Let them use the app now.
                UIAlertController *signupFailedAlert = [UIAlertController alertControllerWithTitle:@"Sorry" message:@"error." preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *dismiss = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {}];
                [signupFailedAlert addAction:dismiss];
                [self presentViewController:signupFailedAlert animated:YES completion:nil];
            } else {
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
