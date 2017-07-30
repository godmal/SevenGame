//
//  TableViewCell.h
//  SevenGame
//
//  Created by Dima Gorbachev on 28.04.17.
//  Copyright © 2017 Дмитрий Горбачев. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
