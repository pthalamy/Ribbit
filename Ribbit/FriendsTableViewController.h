//
//  FriendsTableViewController.h
//  Ribbit
//
//  Created by Pierre Thalamy on 20/11/15.
//  Copyright © 2015 Pierre Thalamy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface FriendsTableViewController : UITableViewController

@property (strong, nonatomic) PFRelation *friendsRelation;
@property (strong, nonatomic) NSArray *friends;

@end
