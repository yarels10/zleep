//
//  ViewController.m
//  Zleep
//
//  Created by Yarelly Janet Gomez on 7/27/15.
//  Copyright (c) 2015  All rights reserved.
//

#import "SetupViewController.h"
#import "ZleepManager.h"
#import "inZleepViewController.h"
#import "RewardsCollectionViewController.h"

@interface SetupViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *startTime;
@property (weak, nonatomic) IBOutlet UIDatePicker *endTime;
@property (weak, nonatomic) IBOutlet UILabel *totalZs;


@end

@implementation SetupViewController





- (IBAction)storeButtonHit:(id)sender {
    RewardsCollectionViewController *destination = [[UIStoryboard storyboardWithName:@"Rewards" bundle:nil] instantiateInitialViewController];
                                                
               // [self.navigationController pusViewController:destination animated:YES];
    
    [self.navigationController pushViewController:destination animated:YES];
    
}
- (IBAction)startButtonHit:(id)sender {
   
    NSDateFormatter *dateFormatter= [NSDateFormatter new];
  //  [dateFormatter setDateFormat:@"EEE, hh:mm a"];
    [dateFormatter setDateFormat:@"hhmm"];

    //self.startTime =[dateFormatter stringFromDate: self.startTime];
    
    NSLog(@"StartTime: %@", [dateFormatter stringFromDate: self.startTime.date] );
    NSLog(@"EndTime: %@", [dateFormatter stringFromDate: self.endTime.date] );
 
    //   NSInteger n1 = [[dateFormatter stringFromDate: self.endTime.date] integerValue];
   // NSLog(@"%ld", n1);
    
    
    
    
    inZleepViewController *destination = [[UIStoryboard storyboardWithName:@"inZleep" bundle:nil] instantiateInitialViewController];
    
    destination.startDate = self.startTime.date;
    
    
    
    destination.endDate= self.endTime.date;
    [self presentViewController:destination animated:YES completion:nil];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[[ZleepManager sharedInstance] addZleepPoints:5000];
    //self.totalZs.text = [@([[ZleepManager sharedInstance] totalZleepPoints]) stringValue];
    
}
-(void) viewDidAppear:(BOOL)animated
{
    self.totalZs.text = [@([[ZleepManager sharedInstance] totalZleepPoints]) stringValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 
}

@end
