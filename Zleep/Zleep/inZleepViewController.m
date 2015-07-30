//
//  inZleepViewController.m
//  Zleep
//
//  Created by Ashton Summers on 7/27/15.
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import "inZleepViewController.h"
#import "ZleepManager.h"


@interface inZleepViewController ()

@property (weak, nonatomic) IBOutlet UILabel *Quotes;
@property NSArray *quoteArray;
@property NSTimeInterval *timeInterval;
@property (weak, nonatomic) IBOutlet UILabel *alarmSet;
@property NSDate *timeLeftApp;
@property NSDate *timeEnteredApp;
@property NSNumber *totalSecondsOutOfApp;

@end

@implementation inZleepViewController


- (void) quoteAppear
{
    _Quotes.lineBreakMode = NSLineBreakByWordWrapping;
    self.quoteArray = @[@"Shouldn't you be sleeping??",
                        @"Go to sleep!", @"Sleep now and receive maximum Z's!", @"Don't look at me", @"Hi there... Go to sleep",
                        @"If a bird wants to run through an array,\n what would he use?....... A froot loop",
                        @"   If you're reading this then you aren't sleeping", @"Rub-a-dub-dub go to sleep.", @"I know this app is great,\n but you need to go to sleep", @"Wanna hear a joke? Too bad. Go to sleep"];
    
    self.Quotes.text = self.quoteArray[0];
    [self newQuote];

    
    
}

-(void) userLeftApp
{
    self.timeLeftApp = NSDate.date;
    NSLog(@"This is the time that the app was left: %@", self.timeLeftApp);
    
}



-(void) userEnteredApp
{
    NSTimeInterval zleepTimeLeft = [self.endDate timeIntervalSinceDate:NSDate.date];
    NSLog(@"zleep time left = %f", zleepTimeLeft);
    
    [self performSelector:@selector(alarm) withObject:nil
               afterDelay:zleepTimeLeft];
    
    self.timeEnteredApp = NSDate.date;
    
    NSTimeInterval interval = [self.timeEnteredApp timeIntervalSinceDate:self.timeLeftApp];
    // NSLog (@"The user was out of the app for %f seconds", interval);
    self.totalSecondsOutOfApp = @(interval + [self.totalSecondsOutOfApp floatValue]);
   // NSLog(@"Total time spent outside the app: %@", self.totalSecondsOutOfApp);
    
}


-(void) alarm
{
    inZleepViewController *destination = [[UIStoryboard storyboardWithName:@"EndScreen" bundle:nil] instantiateInitialViewController];
    
    
    [self presentViewController:destination animated:YES completion:nil];
}


- (void)viewDidLoad {
    
    [self userEnteredApp];
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self quoteAppear];
    NSDateFormatter *dateFormatter= [NSDateFormatter new];
    [dateFormatter setDateFormat:@"hh:mm a"];
    self.alarmSet.text = [dateFormatter stringFromDate: self.endDate];
    
    [ZleepManager sharedInstance].delegate = self;
    
    NSTimeInterval interval = [self.timeLeftApp timeIntervalSinceDate:self.timeEnteredApp];
    NSLog (@"The user was out of the app for %f seconds", interval);
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






/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
