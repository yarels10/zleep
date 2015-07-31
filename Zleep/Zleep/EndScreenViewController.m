//
//  EndScreenViewController.m
//  Zleep
//
//  Created by Yarelly Janet Gomez on 7/28/15.
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import "EndScreenViewController.h"
#import "ZleepManager.h"

@interface EndScreenViewController ()



@property (weak, nonatomic) IBOutlet UIButton *collectZ;

@property (weak, nonatomic) IBOutlet UILabel *zTotal;
@property (weak, nonatomic) IBOutlet UILabel *leftApp;
@property (weak, nonatomic) IBOutlet UILabel *pointsLostLabel;

@property (weak, nonatomic) IBOutlet UILabel *pointsFromZleep;

@end



@implementation EndScreenViewController


//Configuring collecting Z's and what happens when "collect your z's!" button is tapped

- (IBAction)collectZButtonTapped:(id)sender {
}
//
////-(void) alarm
////{
//    EndScreenViewController *destination = [[UIStoryboard storyboardWithName:@"Zleep Manager" bundle:nil] instantiateInitialViewController];
//    
//    
//    [self presentViewController:destination animated:YES completion:nil];
//}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.collectZ.backgroundColor=[UIColor whiteColor];
    self.collectZ.layer.cornerRadius = 10;
    
    
    //Will display the total of number of earned z's
     self.zTotal.text =[@([[ZleepManager sharedInstance] totalZleepPoints]) stringValue];
    
    //wil indicate how long the user has left the app for
   // self.leftApp.text=
    
    
    //will indicate how may points were lost due to leaving the app
    
    //self.pointsLost.text=[@([[ZleepManager sharedInstance] pointsLost]) stringValue];
    
      // self.pointsLost.text = [NSString stringWithFormat:@"%ld", self.question.pointValue];
    
    //will indicate the total of z's that were collected that night after subtracting lost amount of points as well
        //self.pointsLostFromZleep.text
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
    
    




@end
