//
//  ServicesViewController.h
//  KelseyHaircut2
//
//  Created by me on 4/22/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>
#import "ServicesCell.h"

@interface ServicesViewController : UITableViewController<UITableViewDelegate>  {
    
    NSArray *servicesDataArray;
    
}

@property (retain, nonatomic) IBOutlet UITableView *servicesTableView;


@end