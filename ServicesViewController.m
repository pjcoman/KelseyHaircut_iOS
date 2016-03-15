//
//  ServicesViewController.m
//  KelseyHaircut2
//
//  Created by me on 4/22/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "ServicesViewController.h"
#import "Backendless.h"
#import "ServicesObject.h"

#define IS_IPHONE (!IS_IPAD)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

@interface ServicesViewController ()

@end



@implementation ServicesViewController
@synthesize servicesTableView;



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
    
    [self performSelector:@selector(retrieveFromBackendless)];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallpaperblackconcreteshort.jpg"]];
    
    
    [servicesTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.servicesTableView.backgroundColor = [UIColor blackColor];
    
    servicesTableView.estimatedRowHeight = 60.0;
    
    servicesTableView.rowHeight = UITableViewAutomaticDimension;
    
    [servicesTableView reloadData];
}

- (void) retrieveFromBackendless {
    
    servicesObjectArray = [[NSMutableArray alloc] initWithCapacity:30];
    
    
    @try {
        BackendlessDataQuery *query = [BackendlessDataQuery query];
        QueryOptions *queryOptions = [QueryOptions new];
        queryOptions.sortBy = @[@"sort ASC"];
        query.queryOptions = queryOptions;
        
        NSDate *startTime = [NSDate date];
        BackendlessCollection *objects = [[backendless.persistenceService of:[ServicesObject class]] find: query];
        
        NSArray *currentPage =[objects getCurrentPage];
        NSLog(@"Loaded %lu service objects", (unsigned long)[currentPage count]);
        NSLog(@"Total service objects in the Backendless starage - %@", [objects getTotalObjects]);
        
        for (ServicesObject *serviceObject in currentPage) {
            NSLog(@"Service = %@", serviceObject.service);
            NSLog(@"Price = %@", serviceObject.price);
            
            [servicesObjectArray addObject:serviceObject];
            
            
        }
        
        
        
        NSLog(@"Total time (ms) - %g", 1000*[[NSDate date] timeIntervalSinceDate:startTime]);
        
        NSLog(@"%@",servicesObjectArray);
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
    return servicesObjectArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ServicesCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    // Configure the cell...
    
    
    
    if (cell == nil) {
        cell = [[ServicesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];}
    
    ServicesObject *tempObject = [servicesObjectArray objectAtIndex:indexPath.row];
    cell.service.text = tempObject.service;
    cell.price.text = tempObject.price;
    
    

        
    if (IS_IPAD)  {
        
        cell.service.font = [UIFont fontWithName:@"Chalkduster" size:30];
        cell.price.font = [UIFont fontWithName:@"Chalkduster" size:30];
        
        
        
        
    }

    return cell;
    
    
    
}





- (void)dealloc {
    
    [servicesTableView release];
    [super dealloc];
}
@end
