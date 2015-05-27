//
//  ViewController.m
//  JLMusicPlayer
//
//  Created by 李大鹏 on 15/5/7.
//  Copyright (c) 2015年 李大鹏. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.player = [PlayerSingleton sharedInstance].player;
	self.player.delegate = self;

	if ([PlayerSingleton sharedInstance].song) {
		// 如果播放歌曲存在
		self.progress.value = self.player.progress / self.player.duration;
        self.navigationItem.title = [PlayerSingleton sharedInstance].song.songName;
		if (![[PlayerSingleton sharedInstance].song.mp3Url isEqual:[self.player currentlyPlayingQueueItemId]]) {
			// 不是正在播放的歌曲
			[self.player play:[PlayerSingleton sharedInstance].song.mp3Url];
		}
		else {
			NSLog(@"Same Song");
		}
	}

	[self.img setImageWithURL:[NSURL URLWithString:[PlayerSingleton sharedInstance].song.imgUrl]];
	self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(playProgress:) userInfo:nil repeats:YES];
	[self.progress addTarget:self action:@selector(changeProgress:) forControlEvents:UIControlEventValueChanged];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)changeProgress:(id)sender {
	UISlider *control = sender;
	[self.player seekToTime:control.value * self.player.duration];
}

- (void)playProgress:(NSTimer *)timer {
	self.progress.value = self.player.progress / self.player.duration;
}

- (IBAction)playAction:(id)sender {
	if (self.player.state == STKAudioPlayerStatePaused) {
		[self.playBtn setBackgroundImage:[UIImage imageNamed:@"PauseIcon.png"] forState:UIControlStateNormal];
		[self.player resume];
	}
	else {
		[self.playBtn setBackgroundImage:[UIImage imageNamed:@"PlayIcon.png"] forState:UIControlStateNormal];
		[self.player pause];
	}
}

- (IBAction)listAction:(id)sender {
	SongListTableViewController *songList = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"SongList"];
	UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithTitle:@"Playing" style:UIBarButtonItemStyleBordered target:nil action:nil];
	[self.navigationItem setBackBarButtonItem:backItem];
	[self.navigationController pushViewController:songList animated:YES];
}

# pragma mark -
# pragma mark STKAudioPlayerDelegate
/// Raised when an item has started playing
- (void)audioPlayer:(STKAudioPlayer *)audioPlayer didStartPlayingQueueItemId:(NSObject *)queueItemId {
	NSLog(@"ID:%@", queueItemId);
}

/// Raised when an item has finished buffering (may or may not be the currently playing item)
/// This event may be raised multiple times for the same item if seek is invoked on the player
- (void)audioPlayer:(STKAudioPlayer *)audioPlayer didFinishBufferingSourceWithQueueItemId:(NSObject *)queueItemId {
	NSLog(@"finish");
}

/// Raised when the state of the player has changed
- (void)audioPlayer:(STKAudioPlayer *)audioPlayer stateChanged:(STKAudioPlayerState)state previousState:(STKAudioPlayerState)previousState {
	NSLog(@"%u\t%u", state, previousState);
    if (state == STKAudioPlayerStatePlaying) {
        [self.playBtn setBackgroundImage:[UIImage imageNamed:@"PauseIcon.png"] forState:UIControlStateNormal];
    }
    else {
        [self.playBtn setBackgroundImage:[UIImage imageNamed:@"PlayIcon.png"] forState:UIControlStateNormal];
    }
}

/// Raised when an item has finished playing
- (void)audioPlayer:(STKAudioPlayer *)audioPlayer didFinishPlayingQueueItemId:(NSObject *)queueItemId withReason:(STKAudioPlayerStopReason)stopReason andProgress:(double)progress andDuration:(double)duration {
}

/// Raised when an unexpected and possibly unrecoverable error has occured (usually best to recreate the STKAudioPlauyer)
- (void)audioPlayer:(STKAudioPlayer *)audioPlayer unexpectedError:(STKAudioPlayerErrorCode)errorCode {
}

@end
