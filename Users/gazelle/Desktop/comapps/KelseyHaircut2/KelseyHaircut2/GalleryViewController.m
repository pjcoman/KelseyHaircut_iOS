//
//  GalleryViewController.m
//  KelseyHaircut2
//
//  Created by me on 6/26/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "GalleryViewController.h"

@interface GalleryViewController ()

@end

@implementation GalleryViewController
@synthesize imageView;

int imageIndex = 0;

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender {
    
    NSLog( @"swiped");
    
    NSArray *images=[[NSArray alloc] initWithObjects:
                     @"sp0.jpg",
                     @"sp1.jpg",
                     @"sp2.jpg",
                     @"sp3.jpg",
                     @"sp4.jpg",
                     @"sp5.jpg",
                     @"sp6.jpg",
                     @"style1.jpg",
                     @"style2.jpg",
                     @"style3.jpg",
                     @"style4.jpg",
                     @"style5.jpg",
                     @"style6.jpg",
                     @"style7.jpg",
                     @"style8.jpg",
                     @"style9.jpg", nil];
    
    
    UISwipeGestureRecognizerDirection direction =
    [(UISwipeGestureRecognizer *) sender direction];
    
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
            imageIndex++;
            break;
            
        case UISwipeGestureRecognizerDirectionRight:
            imageIndex--;
            break;
        default:
            break;
    }
    imageIndex = (imageIndex < 0) ? ([images count] -1):
    imageIndex % [images count];
    imageView.image = [UIImage imageNamed:[images objectAtIndex:imageIndex]];
    
    
    
    
    

    
    
}


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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [imageView release];
    [super dealloc];
}

@end
