//
//  ScheduleViewController.m
//  KelseyHaircut2
//
//  Created by me on 4/22/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "ScheduleViewController.h"

#define IS_IPHONE (!IS_IPAD)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

@interface ScheduleViewController ()

@end



@implementation ScheduleViewController
@synthesize scheduleTableView;



- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallpaperblackconcreteshort.jpg"]];
    
    [self performSelector:@selector(retrieveFromParse)];
    
        
    [scheduleTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.scheduleTableView.backgroundColor = [UIColor blackColor];
    
}

- (void) retrieveFromParse {
    
    PFQuery *retrieveMenu = [PFQuery queryWithClassName:@"hours"];
    [retrieveMenu orderByAscending:@"sort"];
    
    
    
    
    [retrieveMenu findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSLog(@"%@",objects);
        
        if (!error)  {
            scheduleDataArray = [[NSArray alloc] initWithArray:objects];
        }
        
        [scheduleTableView reloadData];
    }];
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    // Return the number of rows in the section.
    return scheduleDataArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    // Configure the cell...
    
    
    
    if (cell == nil) {
        cell = [[ScheduleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];}
    PFObject *tempObject = [scheduleDataArray objectAtIndex:indexPath.row];
    cell.dayofweek.text = [tempObject objectForKey:@"dayofweek"];
    cell.hours.text = [tempObject objectForKey:@"hours"];
    
    if (IS_IPAD)  {
        
        cell.dayofweek.font = [UIFont fontWithName:@"Chalkduster" size:40];
        cell.hours.font = [UIFont fontWithName:@"Chalkduster" size:40];
        
        
        
        
    }

    return cell;
    
    
    
}





- (void)dealloc {
    
    [scheduleTableView release];
    [super dealloc];
}
@end