//
//  ViewController.m
//  KelseyHaircut2
//
//  Created by me on 6/26/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "ViewController.h"
#import <EventKitUI/EventKitUI.h>


@interface ViewController ()

@end



@implementation ViewController



@synthesize setDaysSinceLastVisit;
@synthesize datePicker;
@synthesize dateSelectedButton;




- (IBAction)emailKelsey:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:Kelsey4hair@gmail.com"]]];
    
}







 - (IBAction)createEvent:(id)sender {
    
    EKEventStore *es = [[EKEventStore alloc] init];
     
     
     
     
     
     
     
    if ([es respondsToSelector:@selector(requestAccessToEntityType:completion:)])
    {
        // the selector is available, so we must be on iOS 6 or newer
        [es requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error) {
            dispatch_async(dispatch_get_main_queue(), ^{
                if (error)
                {
                    // display error message here
                }
                else if (!granted)
                {
                    // display access denied error message here
                }
                else
                {
                    
                    EKEventStore *es = [[EKEventStore alloc] init];
                    
                    EKEvent *awk = [EKEvent eventWithEventStore:es];
                    [awk setTitle:@"appointment with Kels    ey"];
                    [awk setLocation:@"6465 E. Mockingbird Lane Dallas, TX"];

                    
                    EKEventEditViewController *controller = [[EKEventEditViewController alloc] init];
                    controller.eventStore = es;
                    controller.event = awk;
                    controller.editViewDelegate = (id)self;
                    
                    [self presentViewController:controller animated:YES completion:nil];
                    [controller release];
                }
            });
        }];
    }
    else
    {
        EKEventStore *es = [[EKEventStore alloc] init];
        
        EKEvent *awk = [EKEvent eventWithEventStore:es];
        [awk setTitle:@"appointment with Kesley"];
        [awk setLocation:@"6465 E. Mockingbird Lane Dallas, TX"];
        
        EKEventEditViewController *controller = [[EKEventEditViewController alloc] init];
        controller.eventStore = es;
        controller.event = awk; 
        controller.editViewDelegate = (id)self;
        
        [self presentViewController:controller animated:YES completion:nil];
        [controller release];
    
       }
    
    [es release];
    
}

- (void)eventEditViewController:(EKEventEditViewController *)controller
          didCompleteWithAction:(EKEventEditViewAction)action {
    [self dismissViewControllerAnimated:YES completion:nil];
}











- (IBAction)callKelsey:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt:2146624213"]];
    
}

- (IBAction)directionsToKelsey:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"https://maps.google.com/maps?q=6465+E+Mockingbird+Ln,+Dallas,+TX&hl=en&sll=32.820665,-96.731542&sspn=0.845926,1.565552&oq=6465+&hnear=6465+E+Mockingbird+Ln,+Dallas,+Texas+75214&t=m&z=17"];
                  
    [[UIApplication sharedApplication] openURL:url];
    
}

- (IBAction)setHaircutDate:(id)sender {
    
    [datePicker setHidden:NO];
    [dateSelectedButton setHidden:NO];
    
    NSDate *now = [NSDate date];
    [datePicker setDate:now animated:YES];
    

    
}




- (IBAction)dateSelected:(id)sender {
    
    
    NSDate *selected = [datePicker date];
    
    
    [datePicker setHidden:YES];
    [dateSelectedButton setHidden:YES];
    
    
    
  //  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Date and Time Selected" message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    
 //   [alert show];
    
    NSDate *now = [NSDate date];
    
    NSTimeInterval days_since = [now timeIntervalSinceDate: selected];
    NSInteger days_since_int = days_since;
    days_since_int = days_since_int / 86400;
    NSString *days_since_string = [NSString stringWithFormat:@"%d", days_since_int];
    
    [setDaysSinceLastVisit setTitle:days_since_string forState:UIControlStateNormal];
    
    NSMutableDictionary *appDefaults = [NSMutableDictionary dictionary];
    NSNumber *lasthaircut = [NSNumber numberWithDouble:[selected timeIntervalSince1970]];
    [appDefaults setObject:lasthaircut forKey:@"dateOfLastHaircut"];
    [[NSUserDefaults standardUserDefaults] registerDefaults:appDefaults];
    
    
    
    
}



   
    






- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    NSDate *selected = [[NSUserDefaults standardUserDefaults] objectForKey:@"dateOfLastHaircut"];
    
    if (selected == nil) {
        NSDate *set_to_today = [NSDate date];
        NSTimeInterval days_since = [set_to_today timeIntervalSinceDate: set_to_today];
        NSInteger days_since_int = days_since;
        days_since_int = days_since_int / 86400;
        NSString *days_since_string = [NSString stringWithFormat:@"%d", days_since_int];
        
        [setDaysSinceLastVisit setTitle:days_since_string forState:UIControlStateNormal];
        
    }
    
    else  {
        
        NSDate *now = [NSDate date];
        NSTimeInterval days_since = [now timeIntervalSinceDate: selected];
        NSInteger days_since_int = days_since;
        days_since_int = days_since_int / 86400;
        NSString *days_since_string = [NSString stringWithFormat:@"%d", days_since_int];
        
        [setDaysSinceLastVisit setTitle:days_since_string forState:UIControlStateNormal];
        
    }
    
    
    
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (void)dealloc {
    
    [setDaysSinceLastVisit release];
    [datePicker release];
    [dateSelectedButton release];
    [super dealloc];
}

@end
