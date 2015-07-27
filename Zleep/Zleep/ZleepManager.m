//
//  ZleepManager.m
//  Zleep
//
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import "ZleepManager.h"
#import "ZleepManagerDelegate.h"

#define ZLEEP_POINTS_KEY @"totalZleepPoints"

@implementation ZleepManager


#pragma mark - Singleton

+ (instancetype)sharedInstance
{
    static ZleepManager *sharedManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedManager = [[ZleepManager alloc] init];
    });
    
    return sharedManager;
}

#pragma mark - App Events

- (void)userLeftApp
{
    NSLog(@"User left the app.");
    
    if ([self.delegate respondsToSelector:@selector(userLeftApp)])
    {
        NSLog(@"Informing the delegate that we've left the app.");
        [self.delegate userLeftApp];
    }
    else
    {
        NSLog(@"No delegate cares that the app has been left. :(");
    }
}

- (void)userEnteredApp
{
    NSLog(@"User entered the app.");

    if ([self.delegate respondsToSelector:@selector(userEnteredApp)])
    {
        NSLog(@"Informing the delegate that we've entered the app.");
        [self.delegate userEnteredApp];
    }
    else
    {
        NSLog(@"No delegate cares that the app has been entered :(");
    }
}

#pragma mark - Point Management

- (void)addZleepPoints:(NSInteger)toAdd
{
    NSLog(@"Adding some zleep points...");
    [[NSUserDefaults standardUserDefaults] setInteger:[self totalZleepPoints] + toAdd forKey:ZLEEP_POINTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

- (NSInteger)totalZleepPoints
{
    return [[NSUserDefaults standardUserDefaults] integerForKey:ZLEEP_POINTS_KEY];
}

- (void)setTotalZleepPoints:(NSInteger)totalZleepPoints
{
    NSLog(@"Saving the user's total zleep points (%ld)", totalZleepPoints);
    [[NSUserDefaults standardUserDefaults] setInteger:totalZleepPoints forKey:ZLEEP_POINTS_KEY];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
