//
//  ViewController.m
//  KelseyHaircut2
//
//  Created by me on 6/26/13.
//  Copyright (c) 2013 me. All rights reserved.
//

#import "ViewController.h"
#import <EventKitUI/EventKitUI.h>
#import <Parse/Parse.h>

#define IS_IPHONE (!IS_IPAD)
#define IS_IPAD (UI_USER_INTERFACE_IDIOM() != UIUserInterfaceIdiomPhone)


@interface ViewController ()

@end



@implementation ViewController



@synthesize datePicker;
@synthesize dateSelectedButton;
@synthesize emailkelseybutton;
@synthesize callkelseybutton;
@synthesize daysSinceButton;
@synthesize aboutKelsey;












- (IBAction)emailKelsey:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"mailto:Kelsey.Studio4Salon@gmail.com"]]];
    
}





- (IBAction)callKelsey:(id)sender {
    
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"telprompt:2146624213"]];
    
}

- (IBAction)directionsToKelsey:(id)sender {
    
    NSURL *url = [NSURL URLWithString:@"https://maps.google.com/maps?q=6465+E+Mockingbird+Ln,+Dallas,+TX&hl=en&sll=32.820665,-96.731542&sspn=0.845926,1.565552&oq=6465+&hnear=6465+E+Mockingbird+Ln,+Dallas,+Texas+75214&t=m&z=17"];
                  
    [[UIApplication sharedApplication] openURL:url];
    
}

- (IBAction)daysSinceButtonTouched:(id)sender {
    
    datePicker.backgroundColor = [UIColor whiteColor];
    
    [datePicker setHidden:NO];
    [dateSelectedButton setHidden:NO];
    [aboutKelsey setHidden:YES];
    [daysSinceButton setHidden: YES];
    
    //  [emailkelseybutton setHidden:YES];
    
    //  [seteventbutton setHidden:YES];
    
    //  [callkelseybutton setHidden:YES];
    
    
    
    NSDate *now = [NSDate date];
    [datePicker setDate:now animated:YES];
    
    

}

- (IBAction)dateSelected:(id)sender {
    
    NSDate *dateselected = [datePicker date];
    
    
    [datePicker setHidden:YES];
    [dateSelectedButton setHidden:YES];
    [daysSinceButton setHidden:NO];
    [aboutKelsey setHidden:NO];
    
    
    
    
    
    NSDate *now = [NSDate date];
    
    NSLog(@"the date today is %@",now);
    NSLog(@"the date of last haircut was %@",dateselected);
    
    NSTimeInterval days_since = [now timeIntervalSinceDate: dateselected];
    NSInteger days_since_int = days_since;
    days_since_int = (days_since_int / 86400);
    
    
    NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"MM-dd-yy"];
    NSString *haircutdateString = [dateformatter stringFromDate:dateselected];
    
    NSString *buttonTitle = [NSString stringWithFormat:@"Days since your last visit on %@ is %li", haircutdateString, (long)days_since_int];
    
    
    
    
    [daysSinceButton setTitle:buttonTitle forState: UIControlStateNormal];
    
    
    
    
    NSLog(@"the integer days_since_int is %ld", (long)days_since_int);
    
    if (days_since_int > 0) {
        [daysSinceButton setTitleColor:[UIColor colorWithRed:100/255.0f green:150/255.0f blue:255/255.0f alpha:1.0f] forState:UIControlStateNormal]; }
    
        if (days_since_int > 59) {
            [daysSinceButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal]; }
    
            if (days_since_int > 99) {
                [daysSinceButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal]; }
    
                
                
                
                
                
                // NSMutableDictionary *appDefaults = [NSMutableDictionary dictionary];
                
                NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
                // NSNumber *lasthaircut = [NSNumber numberWithDouble:[dateselected timeIntervalSince1970]];
                [defaults setObject:dateselected forKey:@"dateOfLastHaircut"];
                [defaults synchronize];
                
                
                NSLog(@"%@",dateselected);
                
                

}



        
        
- (void)viewDidLoad  {
            
            
            
            [super viewDidLoad];
    
            self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"wallpaperblackconcreteshort.jpg"]];
    
    
    
            // Do any additional setup after loading the view, typically from a nib.
            
            NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
            NSDate *lasthaircutdate = [defaults objectForKey:@"dateOfLastHaircut"];
            
            NSLog(@"the date of last haircut was %@",lasthaircutdate);
            
    
            [daysSinceButton.titleLabel setTextAlignment: NSTextAlignmentCenter];
    
    
    
                                if (lasthaircutdate != nil)  {
                
                                        NSDateFormatter *dateformatter = [[NSDateFormatter alloc] init];
                                        [dateformatter setDateFormat:@"MM-dd-yy"];
                                        NSString *haircutdateString = [dateformatter stringFromDate:lasthaircutdate];
                                    
                
                
                
                                        NSDate *now = [NSDate date];
                
                                        NSLog(@"the date today is %@",now);
                                        NSLog(@"the date of last haircut was %@",lasthaircutdate);
                
                                        NSTimeInterval days_since = [now timeIntervalSinceDate: lasthaircutdate];
                                        NSInteger days_since_int = days_since;
                
                
                
                
                
                                        days_since_int = (days_since_int / 86400);
                
                                    NSString *buttonTitle = [NSString stringWithFormat:@"Days since your last visit on %@ is %li", haircutdateString, (long)days_since_int];
                                    
                                    
                                    
                                    
                                    [daysSinceButton setTitle:buttonTitle forState: UIControlStateNormal];
                                    
                                    
                                    
                                    
                                    NSLog(@"the integer days_since_int is %ld", (long)days_since_int);
                                    
                                    if (days_since_int > 0) {
                                        [daysSinceButton setTitleColor:[UIColor colorWithRed:100/255.0f green:150/255.0f blue:255/255.0f alpha:1.0f] forState:UIControlStateNormal]; }
                                    
                                    if (days_since_int > 59) {
                                        [daysSinceButton setTitleColor:[UIColor yellowColor] forState:UIControlStateNormal]; }
                                    
                                    if (days_since_int > 99) {
                                        [daysSinceButton setTitleColor:[UIColor redColor] forState:UIControlStateNormal]; }

                
                
                
                
                                      
                
                                    
                                    
                                
                                        } else {
                
                                            NSDate *now = [NSDate date];
                
                                            NSLog(@"else bracket - the date today is %@",now);
                                            NSLog(@"else brackeet - the date of last haircut was %@",lasthaircutdate);
                
                                            NSTimeInterval days_since = [now timeIntervalSinceDate: now];
                                            NSInteger days_since_int = days_since;
                                            days_since_int = (days_since_int / 86400);
                                            NSString *days_since_string = [NSString stringWithFormat:@"%ld", (long)days_since_int];
                                            NSString *buttonTitle = [NSString stringWithFormat:@"Days since your last visit on %@ is %li", days_since_string, (long)days_since_int];
                                            
                                            [daysSinceButton setTitle:buttonTitle forState: UIControlStateNormal];

                
                                        }
            


            
        }
        


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (void)dealloc {
    
    [datePicker release];
    [emailkelseybutton release];
    [callkelseybutton release];
 
    [daysSinceButton release];
    [dateSelectedButton release];
    
    [aboutKelsey release];
    [super dealloc];
}

@end
        
