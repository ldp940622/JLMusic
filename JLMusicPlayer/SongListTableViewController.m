//
//  SongListTableViewController.m
//  JLMusicPlayer
//
//  Created by 李大鹏 on 15/5/23.
//  Copyright (c) 2015年 李大鹏. All rights reserved.
//

#import "SongListTableViewController.h"

@interface SongListTableViewController ()

@end

@implementation SongListTableViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	// Uncomment the following line to preserve selection between presentations.
	// self.clearsSelectionOnViewWillAppear = NO;

	// Uncomment the following line to display an Edit button in the navigation bar for this view controller.
	// self.navigationItem.rightBarButtonItem = self.editButtonItem;
	NSLog(@"Now Playing:\n%@", [PlayerSingleton sharedInstance].song.songName);
	self.navigationItem.title = @"Playing List";
//    UIBarButtonItem *back = [[UIBarButtonItem alloc]init];
//    back.title = @"Back";
//    self.navigationItem.backBarButtonItem = back;
    UIBarButtonItem *back = [[UIBarButtonItem alloc]initWithTitle:@"Back1111" style:UIBarButtonItemStyleBordered target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:back];
//    NSLog(@"111");
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

#pragma -
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	// Return the number of sections.
	return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	// Return the number of rows in the section.
	return [PlayerSingleton sharedInstance].songListArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cells"];
	if (cell == nil) {
		cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cells"];
	}
	Song *song = [[PlayerSingleton sharedInstance].songListArray objectAtIndex:indexPath.row];
	cell.textLabel.text = song.songName;
	return cell;
}

/*
   // Override to support conditional editing of the table view.
   - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
   }
 */

/*
   // Override to support editing the table view.
   - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
   }
 */

/*
   // Override to support rearranging the table view.
   - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
   }
 */

/*
   // Override to support conditional rearranging of the table view.
   - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
   }
 */

/*
   #pragma mark - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
   }
 */

@end
