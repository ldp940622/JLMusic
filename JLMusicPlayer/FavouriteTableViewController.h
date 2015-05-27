//
//  FavouriteTableViewController.h
//  JLMusicPlayer
//
//  Created by 李大鹏 on 15/5/17.
//  Copyright (c) 2015年 李大鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Song.h"
#import "ViewController.h"
#import "PlayerSingleton.h"
#import "TableViewCell.h"
#import "MBProgressHUD.h"

@interface FavouriteTableViewController : UITableViewController
@property (strong, nonatomic) NSArray *songsList;
@property (strong, nonatomic) Song *song;
- (IBAction)addAction:(id)sender;

@end
