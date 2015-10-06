//
//  AboutKelseyViewController.m
//  KelseyHaircut2
//
//  Created by me on 9/9/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "AboutKelseyViewController.h"

#define IS_IPHONE (!IS_IPAD)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)

@interface AboutKelseyViewController ()

@end


@implementation AboutKelseyViewController






- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    
    
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallpaperblackconcreteshort.jpg"]]; 
    
    
}

- (void)viewDidAppear:(BOOL)animated
{
    
    [super viewDidAppear:(BOOL)animated];
    

   
    
    

    
}

-(void)viewWillLayoutSubviews {
    
    [super viewDidLayoutSubviews];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)dealloc {
   
    
    [aboutKelsey release];
 
    [super dealloc];
}


@end
