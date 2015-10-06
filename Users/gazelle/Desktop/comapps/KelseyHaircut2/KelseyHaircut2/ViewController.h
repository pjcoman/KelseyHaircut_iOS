//
//  ViewController.h
//  KelseyHaircut2
//
//  Created by me on 6/26/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController


- (IBAction)emailKelsey:(id)sender;

- (IBAction)createEvent:(id)sender;

- (IBAction)callKelsey:(id)sender;



- (IBAction)directionsToKelsey:(id)sender;

@property (retain, nonatomic) IBOutlet UIDatePicker *datePicker;






- (IBAction)setHaircutDate:(id)sender;


@property (retain, nonatomic) IBOutlet UIButton *setDaysSinceLastVisit;


- (IBAction)dateSelected:(id)sender;

@property (retain, nonatomic) IBOutlet UIButton *dateSelectedButton;



@end
