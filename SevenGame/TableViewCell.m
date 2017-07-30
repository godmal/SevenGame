//
//  TableViewCell.m
//  SevenGame
//
//  Created by Dima Gorbachev on 28.04.17.
//  Copyright © 2017 Дмитрий Горбачев. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell
@synthesize imageView;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
