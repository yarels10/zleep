//
//  RewardsViewCell.h
//  Zleep
//
//  Created by Johanna Hawkins on 7/30/15.
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RewardsViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *rewardName;
@property (weak, nonatomic) IBOutlet UILabel *rewardInfo;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end
