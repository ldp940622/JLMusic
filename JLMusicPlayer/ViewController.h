//
//  ViewController.h
//  JLMusicPlayer
//
//  Created by 李大鹏 on 15/5/7.
//  Copyright (c) 2015年 李大鹏. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "AFNetworking.h"
#import "STKAudioPlayer.h"
#import "Song.h"
#import "SongListTableViewController.h"
#import "PlayerSingleton.h"
#import "UIImageView+AFNetworking.h"
#import "MBProgressHUD.h"

@interface ViewController : UIViewController <STKAudioPlayerDelegate>

@property (strong, nonatomic) Song *playingSong;    // 正在播放的歌曲
@property (strong, nonatomic) STKAudioPlayer *player;
@property (strong, nonatomic) IBOutlet UIPageControl *page;
@property (strong, nonatomic) IBOutlet UISlider *progress;
@property (strong, nonatomic) IBOutlet UILabel *progressValue;
@property (retain, nonatomic) NSTimer *timer;
@property (strong, nonatomic) IBOutlet UIButton *playBtn;
@property (strong, nonatomic) IBOutlet UIImageView *img;
@property (nonatomic)NSInteger tag;
- (IBAction)playAction:(id)sender;
- (IBAction)listAction:(id)sender;
- (IBAction)playNextAction:(id)sender;
- (IBAction)playPreviousAction:(id)sender;


@end
