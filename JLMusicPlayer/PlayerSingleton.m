//
//  PlayerSingleton.m
//  JLMusicPlayer
//
//  Created by 李大鹏 on 15/5/23.
//  Copyright (c) 2015年 李大鹏. All rights reserved.
//

#import "PlayerSingleton.h"

@implementation PlayerSingleton
@synthesize player, song, songListArray;

+ (PlayerSingleton *)sharedInstance {
	static dispatch_once_t onceToken;
	static PlayerSingleton *playerSingletonInstance = nil;
	dispatch_once(&onceToken, ^{
		playerSingletonInstance = [[self alloc]init];
		playerSingletonInstance.player = [[STKAudioPlayer alloc]init];
		playerSingletonInstance.song = [[Song alloc]init];
		playerSingletonInstance.songListArray = [[NSMutableArray alloc]init];
	});
	return playerSingletonInstance;
}

@end
