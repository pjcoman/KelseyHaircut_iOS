//
//  ServicesViewController.m
//  KelseyHaircut2
//
//  Created by me on 4/22/14.
//  Copyright (c) 2014 me. All rights reserved.
//

#import "ServicesViewController.h"

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
    
    [self performSelector:@selector(retrieveFromParse)];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallpaperblackconcreteshort.jpg"]];
    
    
    [servicesTableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    
    self.servicesTableView.backgroundColor = [UIColor blackColor];
}

- (void) retrieveFromParse {
    
    PFQuery *retrieveMenu = [PFQuery queryWithClassName:@"services"];
    [retrieveMenu orderByAscending:@"sort"];
    
    
    
    
    [retrieveMenu findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        
        NSLog(@"%@",objects);
        
        if (!error)  {
            servicesDataArray = [[NSArray alloc] initWithArray:objects];
        }
        
        [servicesTableView reloadData];
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
    return servicesDataArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    ServicesCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    
    
    // Configure the cell...
    
    
    
    if (cell == nil) {
        cell = [[ServicesCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];}
    PFObject *tempObject = [servicesDataArray objectAtIndex:indexPath.row];
    cell.service.text = [tempObject objectForKey:@"service"];
    cell.price.text = [tempObject objectForKey:@"price"];
    
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
