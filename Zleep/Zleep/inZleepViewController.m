//
//  inZleepViewController.m
//  Zleep
//
//  Created by Ashton Summers on 7/27/15.
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import "inZleepViewController.h"
#import "ZleepManager.h"
#import "EndScreenViewController.h"


@interface inZleepViewController ()

@property (weak, nonatomic) IBOutlet UILabel *Quotes;
@property NSArray *quoteArray;
@property NSTimeInterval *timeInterval;
@property (weak, nonatomic) IBOutlet UILabel *alarmSet;
@property NSDate *timeLeftApp;
@property NSDate *timeEnteredApp;
@property NSNumber *totalSecondsOutOfApp;
@property NSTimeInterval totalTime;
@property NSNumber *totalPoints;
@property NSNumber *pointsLost;
@property NSNumber *lengthOfZleep;



@end

@implementation inZleepViewController


- (void) quoteAppear
{
    _Quotes.lineBreakMode = NSLineBreakByWordWrapping;
    self.quoteArray = @[@"Shouldn't you be sleeping??",
                        @"Go to sleep!", @"Sleep now and receive maximum Z's!", @"Don't look at me", @"Hi there... Go to sleep",
                        @"   If Toucan Sam wanted to run through an array,\n what would he use?....... A froot loop",
                        @"   If you're reading this then you aren't sleeping", @"Rub-a-dub-dub go to sleep.", @"I know this app is great,\n but you need to go to sleep", @"Wanna hear a joke? Too bad. Go to sleep"];
    
    self.Quotes.text = self.quoteArray[0];
    [self newQuote];

    
    

}

-(void) userLeftApp
{
    //records the time left the user left teh app
    self.timeLeftApp = NSDate.date;
    NSLog(@"This is the time that the app was left: %@", self.timeLeftApp);

}



-(void) userEnteredApp
{
    self.timeEnteredApp = NSDate.date;
    
    //calculates how long the user was out of app
    NSTimeInterval interval = [self.timeEnteredApp timeIntervalSinceDate:self.timeLeftApp];
    NSLog (@"The user was out of the app for %f seconds", interval);
        self.totalSecondsOutOfApp = @(interval + [self.totalSecondsOutOfApp floatValue]);
    NSLog(@"Total time spent outside the app: %@", self.totalSecondsOutOfApp);
    
    
    [self viewDidLoad]; //calls viewDidLoad because when the user re enters the app viewDidLoad is not called
    
    }



-(void) alarm // gets called when its time to wake user
{
    
    self.totalTime = [self.endDate timeIntervalSinceDate:self.startDate];
    [self awardPoints];
    NSLog(@"sleep points time: %f s",self.totalTime);
    
    EndScreenViewController *destination = [[UIStoryboard storyboardWithName:@"EndScreen" bundle:nil] instantiateInitialViewController];
    destination.timeOutOfApp = self.totalSecondsOutOfApp;
    destination.totalPoints = self.totalPoints;
    destination.pointsLost = self.pointsLost;
    destination.pointsFromZleep = self.totalPoints;
   
    [self.navigationController pushViewController:destination animated:YES];
}


- (void)viewDidLoad {
    //calculate the zleepTimeLeft
    NSTimeInterval zleepTimeLeft = [self.endDate timeIntervalSinceDate:NSDate.date];
    NSLog(@"zleep time left = %f seconds", zleepTimeLeft);
    
    [self performSelector:@selector(alarm) withObject:nil
               afterDelay:zleepTimeLeft];

    NSLog(@"Start time %@:", self.startDate);
    
    //[self userEnteredApp];
    
    
    [super viewDidLoad];
    [self quoteAppear];
    
    //sets alarmSet label on UI
    NSDateFormatter *dateFormatter= [NSDateFormatter new];
    [dateFormatter setDateFormat:@"hh:mm a"];
    self.alarmSet.text = [dateFormatter stringFromDate: self.endDate];
    
    [ZleepManager sharedInstance].delegate = self;
    
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) newQuote // Generating a new quote to display on the screen
{
    self.Quotes.text = self.quoteArray[arc4random_uniform(8)];
    
    [self performSelector:@selector(newQuote)withObject:nil afterDelay:10];
    

}


-(void) awardPoints
{
    self.totalPoints = @(self.totalTime * .00277); //- (self.timeLeftApp * 2);
    
    self.totalPoints = @([self.totalPoints doubleValue] - ([self.totalSecondsOutOfApp doubleValue] * .033)+1);
    
    self.pointsLost = @([self.totalSecondsOutOfApp doubleValue] * .033);
    
    NSLog (@"Points lost = %@ ", self.pointsLost);
    
    NSLog(@"total points for sleep; %@", self.totalPoints);
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
