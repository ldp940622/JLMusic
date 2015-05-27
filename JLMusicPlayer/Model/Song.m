//
//  Song.m
//  JLMusicPlayer
//
//  Created by 李大鹏 on 15/5/16.
//  Copyright (c) 2015年 李大鹏. All rights reserved.
//

#import "Song.h"

@implementation Song
@synthesize songId, songName, artistsId, artistsName, albumId, albumName, mp3Url, imgUrl;
+ (void)getData:(void (^)(NSArray *songsList))block {
    NSString *url = @"http://lovetxc.com/api/";
//    NSString *localUrl = @"192.168.1.111/api/login.php";
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
	[manager GET:url parameters:nil success: ^(AFHTTPRequestOperation *operation, id responseObject) {
	    if ([[(NSDictionary *)responseObject objectForKey:@"status"]isEqualToString:@"success"]) {
	        NSArray *songsList = [(NSDictionary *)responseObject objectForKey:@"info"];
//            [self getSongsList:songsList];
	        block(songsList);
		}
//	    block(responseObject);
	} failure: ^(AFHTTPRequestOperation *operation, NSError *error) {
	    NSLog(@"error :%@", error);
	}];
}

//- (void)show {
//	[self getData: ^(id data) {
//	    self.data = data;
//	    NSLog(@"%@", self.data);
//	}];
//}

//- (NSArray *)getSongsList {
//	[self getData: ^(id data) {
//	    return (NSArray *)data;
//	}];
//}

+ (NSMutableArray *)getSongsList:(NSArray *)songList {
	NSMutableArray *list = [[NSMutableArray alloc]init];
	for (NSDictionary *dic in songList) {
		Song *song = [[Song alloc]init];
		song.songId = [NSString stringWithFormat:@"%@", [dic objectForKey:@"songId"]];
		song.songName = [dic objectForKey:@"songName"];
		song.artistsId = [dic objectForKey:@"artistsId"];
		song.artistsName = [dic objectForKey:@"artistsName"];
		song.albumId = [dic objectForKey:@"alubumId"];
		song.albumName = [dic objectForKey:@"albumName"];
		song.mp3Url = [dic objectForKey:@"mp3Url"];
        song.imgUrl = [dic objectForKey:@"imgUrl"];
		[list addObject:song];
	}
	return list;
}

@end
