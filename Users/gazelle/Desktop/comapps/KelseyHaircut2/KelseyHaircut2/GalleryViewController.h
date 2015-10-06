//
//  GalleryViewController.h
//  KelseyHaircut2
//
//  Created by me on 6/26/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GalleryViewController : UIViewController

@property (retain, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)handleSwipe:(UISwipeGestureRecognizer *)sender;
@end
