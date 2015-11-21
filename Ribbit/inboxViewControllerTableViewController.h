//
//  inboxViewControllerTableViewController.h
//  Ribbit
//
//  Created by Pierre Thalamy on 18/11/15.
//  Copyright © 2015 Pierre Thalamy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import <MediaPlayer/MediaPlayer.h>

@interface inboxViewControllerTableViewController : UITableViewController

@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) PFObject *selectedMessage;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@end
