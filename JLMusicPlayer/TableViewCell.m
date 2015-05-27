//
//  TableViewCell.m
//  JLMusicPlayer
//
//  Created by 李大鹏 on 15/5/26.
//  Copyright (c) 2015年 李大鹏. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize textLabel, addBtn;

- (void)awakeFromNib {
	// Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
	[super setSelected:selected animated:animated];

	// Configure the view for the selected state
}


@end
