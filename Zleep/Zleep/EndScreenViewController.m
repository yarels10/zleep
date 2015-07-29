//
//  EndScreenViewController.m
//  Zleep
//
//  Created by Yarelly Janet Gomez on 7/28/15.
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import "EndScreenViewController.h"

@interface EndScreenViewController ()



@property (weak, nonatomic) IBOutlet UIButton *collectZ;

@property (weak, nonatomic) IBOutlet UILabel *zTotal;
@property (weak, nonatomic) IBOutlet UILabel *leftApp;
@property (weak, nonatomic) IBOutlet UILabel *pointsLost;

@property (weak, nonatomic) IBOutlet UILabel *pointsFromZleep;

@end

@implementation EndScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.collectZ.backgroundColor=[UIColor whiteColor];
    self.collectZ.layer.cornerRadius = 10;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 
*/

//-(IBAction)buttonTapped(UIStoryboardSegue*)
    
    
    
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
