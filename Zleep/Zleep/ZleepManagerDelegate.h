//
//  ZleepManagerDelegate.h
//  Zleep
//
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZleepManagerDelegate <NSObject>

// Called when the user leaves the application.
- (void)userLeftApp;

// Called when the user enters the application.
- (void)userEnteredApp;

@end
