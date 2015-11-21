//
//  EditFriendsTableViewController.h
//  Ribbit
//
//  Created by Pierre Thalamy on 18/11/15.
//  Copyright © 2015 Pierre Thalamy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EditFriendsTableViewController : UITableViewController

@property (strong, nonatomic) NSArray *allUsers;
@property (strong, nonatomic) PFUser *currentUser;
@property (strong, nonatomic) NSMutableArray *friends;

- (BOOL)isFriend:(PFUser*)user;

@end
