//
//  PlayerSingleton.h
//  JLMusicPlayer
//
//  Created by 李大鹏 on 15/5/23.
//  Copyright (c) 2015年 李大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STKAudioPlayer.h"
#import "Song.h"

@interface PlayerSingleton : NSObject
@property (strong, nonatomic) STKAudioPlayer *player;
@property (strong, nonatomic) Song *song;
@property (strong, nonatomic) NSMutableArray *songListArray;
//@property (nonatomic) NSInteger tag;

+ (PlayerSingleton *)sharedInstance;
@end
