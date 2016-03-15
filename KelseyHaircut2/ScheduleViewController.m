//
//  ScheduleViewController.m
//  KelseyHaircut2
//
//  Created by me on 4/22/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "ScheduleViewController.h"
#import "Backendless.h"
#import "HoursObject.h"

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
    
    [self performSelector:@selector(retrieveFromBackendless)];
    
        
    [scheduleTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.scheduleTableView.backgroundColor = [UIColor blackColor];
    
    [scheduleTableView reloadData];
    
}

- (void) retrieveFromBackendless {
    
    
    
    hoursObjectArray = [[NSMutableArray alloc] initWithCapacity:7];
    
    
    @try {
        BackendlessDataQuery *query = [BackendlessDataQuery query];
        QueryOptions *queryOptions = [QueryOptions new];
        queryOptions.sortBy = @[@"sort ASC"];
        query.queryOptions = queryOptions;
        
        NSDate *startTime = [NSDate date];
        BackendlessCollection *objects = [[backendless.persistenceService of:[HoursObject class]] find: query];
        
        NSArray *currentPage =[objects getCurrentPage];
        NSLog(@"Loaded %lu hours objects", (unsigned long)[currentPage count]);
        NSLog(@"Total hours objects in the Backendless starage - %@", [objects getTotalObjects]);
        
        for (HoursObject *hoursObject in currentPage) {
            NSLog(@"Hours day of week = %@", hoursObject.dayofweek);
            NSLog(@"Hours hours = %@", hoursObject.hours);
            
            [hoursObjectArray addObject:hoursObject];
            
            
        }
        
       
        
        NSLog(@"Total time (ms) - %g", 1000*[[NSDate date] timeIntervalSinceDate:startTime]);
        
        NSLog(@"%@",hoursObjectArray);
    }
    
    @catch (Fault *fault) {
        NSLog(@"Server reported an error: %@", fault);
    }
    
   

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
    return hoursObjectArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ScheduleCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    // Configure the cell...
    
    
    
    if (cell == nil) {
        cell = [[ScheduleCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];}
    HoursObject *tempObject = [hoursObjectArray objectAtIndex:indexPath.row];
    cell.dayofweek.text = tempObject.dayofweek;
    cell.hours.text = tempObject.hours;
    
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