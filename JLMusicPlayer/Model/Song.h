//
//  Song.h
//  JLMusicPlayer
//
//  Created by 李大鹏 on 15/5/16.
//  Copyright (c) 2015年 李大鹏. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface Song : NSObject
@property (strong, nonatomic) NSString *songId;
@property (strong, nonatomic) NSString *songName;
@property (strong, nonatomic) NSString *artistsId;
@property (strong, nonatomic) NSString *artistsName;
@property (strong, nonatomic) NSString *albumId;
@property (strong, nonatomic) NSString *albumName;
@property (strong, nonatomic) NSString *mp3Url;
@property (strong, nonatomic) NSString *imgUrl;
//@property (retain, nonatomic) NSArray *urlList;
@property (strong, nonatomic) id data;

+ (void)getData:(void (^)(NSArray *songsList))block;
//- (void)show;
+ (NSMutableArray *)getSongsList:(NSArray *)songList;
@end
