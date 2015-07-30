//
//  inZleepViewController.h
//  Zleep
//
//  Created by Ashton Summers on 7/27/15.
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZleepManager.h"
#import "ZleepManagerDelegate.h"

@interface inZleepViewController : UIViewController <ZleepManagerDelegate>

@property NSDate *startDate;
@property NSDate *endDate;


@end
