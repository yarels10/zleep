//
//  RewardsCollectionViewController.m
//  Zleep
//
//  Created by Johanna Hawkins on 7/30/15.
//  Copyright (c) 2015 Yarelly Janet Gomez. All rights reserved.
//

#import "RewardsCollectionViewController.h"
#import "RewardsItemData.h"
#import "RewardsViewCell.h"
#import "RewardsHeaderView.h"
#import "ZleepManager.h"
@interface RewardsCollectionViewController ()
@property NSNumber *userZs;
@end

@implementation RewardsCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Register cell classes
   /* [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];*/
    
    [self initializeRewardsData];
    
    ZleepManager *zm = [ZleepManager sharedInstance];
}

- (void) initializeRewardsData {
    
   
   // [[ZleepManager sharedInstance] totalZleepPoints];
    
    self.userZs =     @([[ZleepManager sharedInstance] totalZleepPoints]);

    self.rewardsItems = [[NSMutableArray alloc] init];
    
    RewardsItemData *item1 = [[RewardsItemData alloc] init];
    item1.title = @"Dog Biscuits";
    item1.image = @"dog-biscuits.jpg";
    item1.cost = @200;
    item1.isOwned = NO;
    [self.rewardsItems addObject: item1];
    
    RewardsItemData *item2 = [[RewardsItemData alloc] init];
    item2.title = @"Sweet Snacks";
    item2.image = @"bags-of-colored-sugar-snacks.jpg";
    item2.cost = @300;
    item2.isOwned = NO;
    [self.rewardsItems addObject: item2];
    
    RewardsItemData *item3 = [[RewardsItemData alloc] init];
    item3.title = @"Dog Toy";
    item3.image = @"pink-dog-toy.jpg";
    item3.cost = @100;
    item3.isOwned = YES;
    [self.rewardsItems addObject: item3];
    
    RewardsItemData *item4 = [[RewardsItemData alloc] init];
    item4.title = @"Dog House";
    item4.image = @"dog-house.jpg";
    item4.cost = @3000;
    item4.isOwned = NO;
    [self.rewardsItems addObject: item4];
    
    RewardsItemData *item5 = [[RewardsItemData alloc] init];
    item5.title = @"Car Trip";
    item5.image = @"296-1230341005ghUn.jpg";
    item5.cost = @100;
    item5.isOwned = NO;
    [self.rewardsItems addObject: item5];
    
    RewardsItemData *item6 = [[RewardsItemData alloc] init];
    item6.title = @"Hair Brush";
    item6.image = @"hand-clothes-brush.jpg";
    item6.cost = @50;
    item6.isOwned = NO;
    [self.rewardsItems addObject: item6];
    
    RewardsItemData *item7 = [[RewardsItemData alloc] init];
    item7.title = @"Fancy Outfit";
    item7.image = @"naakt-hond.jpg";
    item7.cost = @150;
    item7.isOwned = NO;
    [self.rewardsItems addObject: item7];
    
    RewardsItemData *item8 = [[RewardsItemData alloc] init];
    item8.title = @"Chew Toy";
    item8.image = @"painting-of-labrador-with-toy.jpg";
    item8.cost = @100;
    item8.isOwned = NO;
    [self.rewardsItems addObject: item8];
    
    RewardsItemData *item9 = [[RewardsItemData alloc] init];
    item9.title = @"Parrot Toy";
    item9.image = @"parrot-toy.jpg";
    item9.cost = @200;
    item9.isOwned = NO;
    [self.rewardsItems addObject: item9];
    
    RewardsItemData *item10 = [[RewardsItemData alloc] init];
    item10.title = @"Squeeze Toy";
    item10.image = @"squeeze-toy.jpg";
    item10.cost = @300;
    item10.isOwned = NO;
    [self.rewardsItems addObject: item10];
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    for (RewardsItemData *item in self.rewardsItems) {
        if ([prefs boolForKey:[item title]]) {
            item.isOwned=YES;
            
        }
        
        
    }
                               
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.rewardsItems.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    RewardsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RewardsPrototypeCell" forIndexPath:indexPath];
    
    // Configure the cell
    long row = indexPath.row;
    RewardsItemData *cellData = self.rewardsItems[row];
    UIImage *cellImage = [UIImage imageNamed: cellData.image];
    NSString *costString = [NSString stringWithFormat: @"%@ Z's", cellData.cost];
    
    cell.imageView.image = cellImage;
    cell.rewardName.text = cellData.title;
    cell.rewardInfo.text = cellData.isOwned ? @"Owned" : costString;
    cell.rewardInfo.textColor = cellData.isOwned ? [UIColor greenColor] : [UIColor yellowColor];
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    [collectionView deselectItemAtIndexPath:indexPath animated:NO];
    
    long row = indexPath.row;
    RewardsItemData *cellData = self.rewardsItems[row];
    if (cellData.isOwned) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"You own this" message: @"You already own this item!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil, nil];
        [alert show];
        return;
    }

    if ([self.userZs doubleValue] < [cellData.cost doubleValue]) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"Not enough Zs" message: @"You do not have enough Zs to purchase this item!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil, nil];
        [alert show];
        return;
    }
    
    self.userZs = [NSNumber numberWithFloat: [self.userZs floatValue] - [cellData.cost floatValue]];
    [[ZleepManager sharedInstance ] setTotalZleepPoints:[self.userZs integerValue]];
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:cellData.title];
    cellData.isOwned = YES;

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle: @"It's yours now" message: @"Congratulations! This item belongs to you now!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil, nil];
    [alert show];

    
    // Refresh the updated cell
    [collectionView reloadItemsAtIndexPaths:@[indexPath]];
    
    // Refresh the header
    [collectionView reloadSections:[NSIndexSet indexSetWithIndex:0]];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    RewardsHeaderView *headerView = nil;
    if ([kind isEqual:UICollectionElementKindSectionHeader]){
        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"RewardsHeader" forIndexPath:indexPath];
        
        NSString *headerString = [NSString stringWithFormat: @"Current Z's: %@", self.userZs];
        headerView.currentZsLabel.text = headerString;
        headerView.currentZsLabel.textColor = [UIColor yellowColor];
    }
    
    return headerView;
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/

@end
