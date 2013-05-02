//
//  AZSectionTableViewCell.m
//  Alan
//
//  Created by Alan on 2/05/13.
//  Copyright (c) 2013 Alan Zeino. All rights reserved.
//

#import "AZSectionTableViewCell.h"

@implementation AZSectionTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    self.backgroundColor = (selected) ? [UIColor colorWithRed:0.96f green:0.61f blue:0.60f alpha:1.00f] : [UIColor colorWithRed:0.94f green:0.25f blue:0.23f alpha:1.00f];
    self.titleLabel.textColor = (selected) ? [UIColor colorWithRed:0.94f green:0.25f blue:0.23f alpha:1.00f] : [UIColor colorWithRed:0.96f green:0.61f blue:0.60f alpha:1.00f];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated
{
    [super setHighlighted:highlighted animated:animated];
    
    self.backgroundColor = (highlighted) ? [UIColor colorWithRed:0.96f green:0.61f blue:0.60f alpha:1.00f] : [UIColor colorWithRed:0.94f green:0.25f blue:0.23f alpha:1.00f];
    self.titleLabel.textColor = (highlighted) ? [UIColor colorWithRed:0.94f green:0.25f blue:0.23f alpha:1.00f] : [UIColor colorWithRed:0.96f green:0.61f blue:0.60f alpha:1.00f];
}

@end
