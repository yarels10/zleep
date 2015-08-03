//
//  EndScreenViewController.m
//  Zleep
//
//  Created by Yarelly Janet Gomez on 7/28/15.
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import "EndScreenViewController.h"
#import "ZleepManager.h"
#import "inZleepViewController.h"
#import "RewardsCollectionViewController.h"

@interface EndScreenViewController ()



@property (weak, nonatomic) IBOutlet UIButton *collectZ;

@property (weak, nonatomic) IBOutlet UILabel *zTotal;
@property (weak, nonatomic) IBOutlet UILabel *leftApp;
@property (weak, nonatomic) IBOutlet UILabel *pointsLostLabel;

@property (weak, nonatomic) IBOutlet UILabel *pointsFromZleepLabel;

@end



@implementation EndScreenViewController




- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.collectZ.backgroundColor=[UIColor whiteColor];
    self.collectZ.layer.cornerRadius = 10;
    
    
    //Will display the total of number of earned z's
    self.zTotal.text =[NSString stringWithFormat:@"Total Zleep Points: %@",self.totalPoints];
    
    //wil indicate how long the user has left the app for
   //self.leftApp.text
    self.leftApp.text=[NSString stringWithFormat:@"Left app for: %@ minute(s)", @(self.timeOutOfApp.integerValue/60)];
    
    
    
    //will indicate how many points were lost due to leaving the app
    
    self.pointsLostLabel.text=[NSString stringWithFormat:@"Points lost from Zleep: %@", self.pointsLost];
    
    //will indicate the amount of zleep points earned from this zleep cycle
    self.pointsFromZleepLabel.text=[NSString stringWithFormat:@"Total points from zleep: %@", @(ceilf(self.pointsFromZleep.floatValue))];
    
   
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}


//inZleepViewController *destination = [[UIStoryboard storyboardWithName:@"inZleep" bundle:nil] instantiateInitialViewController];
//
//destination.startDate = self.startTime.date;
//
//
//
//destination.endDate= self.endTime.date;
//[self presentViewController:destination animated:YES completion:nil];




-(IBAction)buttonTapped:(id)sender {
    

    
    RewardsCollectionViewController *destination=[[UIStoryboard storyboardWithName:@"Rewards" bundle:nil]instantiateInitialViewController];
    
    
    
   
    
    [self.navigationController pushViewController:destination animated:YES];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
    




@end
