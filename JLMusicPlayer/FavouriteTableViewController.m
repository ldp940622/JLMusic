//
//  FavouriteTableViewController.m
//  JLMusicPlayer
//
//  Created by 李大鹏 on 15/5/17.
//  Copyright (c) 2015年 李大鹏. All rights reserved.
//

#import "FavouriteTableViewController.h"

@interface FavouriteTableViewController ()

@end

@implementation FavouriteTableViewController
@synthesize song;

- (void)viewDidLoad {
	[super viewDidLoad];
    // 隐藏表格线
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
	MBProgressHUD * hud = [MBProgressHUD showHUDAddedTo:self.tableView animated:YES];
    hud.labelText = @"Loading...";
	[Song getData: ^(NSArray *songsList) {
	    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
			self.songsList = [Song getSongsList:songsList];
            [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLine];
			[self.tableView reloadData];
			dispatch_async(dispatch_get_main_queue(), ^{
				[MBProgressHUD hideHUDForView:self.view animated:YES];
			});
		});
	}];
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
	return self.songsList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cells"];
	if (cell == nil) {
		cell = [[TableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cells"];
	}
	song = [self.songsList objectAtIndex:indexPath.row];
	cell.textLabel.text = song.songName;
	cell.addBtn.tag = indexPath.row;
	return cell;
}

//
//  TODO:点击cell播放歌曲
//
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	ViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"ViewController"];

	// 定义选择的歌曲
	Song *selectedSong = [self.songsList objectAtIndex:indexPath.row];
	// 将player的歌曲定义成这个
	[PlayerSingleton sharedInstance].song = selectedSong;
	if (![self isExist:selectedSong]) {
		// 如果播放列表中不存在这首歌,则添加到播放列表
		[[PlayerSingleton sharedInstance].songListArray addObject:selectedSong];
	}
	[self.navigationController pushViewController:viewController animated:YES];
}

#pragma mark - Aciton
#pragma -
//
// TODO:点击添加按钮的事件
//
- (IBAction)addAction:(id)sender {
	UIButton *btn = sender;
	Song *addSong = [self.songsList objectAtIndex:btn.tag];
	NSLog(@"%@", addSong.songName);
	if ([self isExist:addSong]) {
		NSLog(@"存在这个歌曲");
	}
	else {
		[[PlayerSingleton sharedInstance].songListArray addObject:addSong];
	}
}

- (BOOL)isExist:(Song *)addSong {
	if ([[PlayerSingleton sharedInstance].songListArray containsObject:addSong]) {
		return YES;
	}
	else {
		return NO;
	}
}

@end
