//
//  ZleepManager.h
//  Zleep
//
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZleepManagerDelegate;

@interface ZleepManager : NSObject

@property (weak) id<ZleepManagerDelegate> delegate;

@property NSInteger totalZleepPoints;

- (void)addZleepPoints:(NSInteger)toAdd;

#pragma mark - App LifeCycle methods

- (void)nagUserForLeaving;

// Called when the user leaves the application.
- (void)userLeftApp;

// Called when the user enters the application.
- (void)userEnteredApp;

#pragma mark - Singleton

+ (instancetype)sharedInstance;

@end
