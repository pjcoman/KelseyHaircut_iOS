//
//  ScheduleViewController.h
//  KelseyHaircut2
//
//  Created by me on 4/22/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ScheduleCell.h"

@interface ScheduleViewController : UITableViewController<UITableViewDelegate>  {
    
    NSArray *scheduleDataArray;
    
}

@property (retain, nonatomic) IBOutlet UITableView *scheduleTableView;


@end
