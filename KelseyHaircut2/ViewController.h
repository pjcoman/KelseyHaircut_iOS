//
//  ViewController.h
//  KelseyHaircut2
//
//  Created by me on 6/26/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController  {
    
    
}


- (IBAction)emailKelsey:(id)sender;
- (IBAction)callKelsey:(id)sender;
- (IBAction)directionsToKelsey:(id)sender;
- (IBAction)daysSinceButtonTouched:(id)sender;
- (IBAction)dateSelected:(id)sender;

@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (retain, nonatomic) IBOutlet UIButton *daysSinceButton;
@property (retain, nonatomic) IBOutlet UIButton *emailkelseybutton;
@property (retain, nonatomic) IBOutlet UIButton *callkelseybutton;
@property (retain, nonatomic) IBOutlet UIButton *dateSelectedButton;
@property (retain, nonatomic) IBOutlet UIButton *aboutKelsey;



@end
