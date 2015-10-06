//
//  ScheduleCell.m
//  KelseyHaircut2
//
//  Created by me on 4/22/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "ScheduleCell.h"

@implementation ScheduleCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
    
    
    [_dayofweek release];
    [_hours release];
    [super dealloc];
}
@end

