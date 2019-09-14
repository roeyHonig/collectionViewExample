//
//  ViewController.m
//  CollectionViewExample
//
//  Created by Roey Honig on 14.9.2019.
//  Copyright © 2019 Roey Honig. All rights reserved.
//

#import "ViewController.h"
#import "ExampleCollectionViewCell.h"
#import "ExampleCollectionReusableView.h"
#import "LowerCollectionReusableView.h"

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) NSMutableArray *socialSectionData;
@property (nonatomic, strong) NSMutableArray *foodSectionData;
@property (nonatomic, strong) NSMutableArray *computerSectionData;
@property (nonatomic, strong) NSMutableArray *collectionData;
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (weak, nonatomic) IBOutlet UIButton *toggleEditMode;
@property BOOL isEditMode;
- (IBAction)toggleEditDidPress:(UIButton *)sender;

@end

@implementation ViewController
@synthesize collectionData, socialSectionData, foodSectionData, computerSectionData, myCollectionView, isEditMode, toggleEditMode;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    isEditMode = NO;
    // init the collection View Data
    collectionData = [[NSMutableArray alloc] init];
    socialSectionData = [[NSMutableArray alloc] init];
    foodSectionData = [[NSMutableArray alloc] init];
    computerSectionData = [[NSMutableArray alloc] init];
    // social
    [socialSectionData addObject:[UIImage imageNamed:@"facebook"]];
    [socialSectionData addObject:[UIImage imageNamed:@"google"]];
    [socialSectionData addObject:[UIImage imageNamed:@"pinterst"]];
    [socialSectionData addObject:[UIImage imageNamed:@"redit"]];
    [socialSectionData addObject:[UIImage imageNamed:@"twitter"]];
    // food
    [foodSectionData addObject:[UIImage imageNamed:@"food"]];
    [foodSectionData addObject:[UIImage imageNamed:@"halal_food"]];
    // computer
    [computerSectionData addObject:[UIImage imageNamed:@"computer"]];
    [computerSectionData addObject:[UIImage imageNamed:@"mouse"]];
    // set the data
    [collectionData addObject:socialSectionData];
    [collectionData addObject:foodSectionData];
    [collectionData addObject:computerSectionData];
    // set delegates
    myCollectionView.dataSource = self;
    myCollectionView.delegate = self;
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    ExampleCollectionViewCell *cell = (ExampleCollectionViewCell *)[collectionView dequeueReusableCellWithReuseIdentifier:@"exampleCell" forIndexPath:indexPath];
    NSMutableArray *arrayOfImages = (NSMutableArray *)collectionData[indexPath.section];
    [cell.exampleCellImg setImage:arrayOfImages[indexPath.row]];
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [collectionData count];
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSMutableArray *arrayOfImages = (NSMutableArray *)collectionData[section];
    return [arrayOfImages count];
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        ExampleCollectionReusableView *headerView = (ExampleCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"myHeader" forIndexPath:indexPath];
        NSString *headerLabel = @"";
        if (indexPath.section == 0) {
            headerLabel = @"Social";
        } else if (indexPath.section == 1) {
            headerLabel = @"Food";
        } else {
            headerLabel = @"Computers";
        }
        [headerView.sectionLabel setText:headerLabel];
        if (isEditMode) {
            headerView.pressMeHeightConstraint.constant = 30.0;
            headerView.secondSpacerHeightConstant.constant = 5.0;
        } else {
            headerView.pressMeHeightConstraint.constant = 0.0;
            headerView.secondSpacerHeightConstant.constant = 0.0;
        }
        return headerView;
    } else if ([kind isEqualToString:UICollectionElementKindSectionFooter]) {
        LowerCollectionReusableView *footerView = (LowerCollectionReusableView *)[collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"myFooter" forIndexPath:indexPath];
        if (isEditMode) {
            footerView.topSpacerHeigt.constant = 5.0;
            footerView.titleHiegtConstraint.constant = 30.0;
            footerView.bottomSpacerHightConstraint.constant = 5.0;
        } else {
            footerView.topSpacerHeigt.constant = 0.0;
            footerView.titleHiegtConstraint.constant = 0.0;
            footerView.bottomSpacerHightConstraint.constant = 0.0;
        }
        return footerView;
    } else {
        return [[UICollectionReusableView alloc] init];
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (isEditMode) {
        return CGSizeMake(50.0, 105.0);
    } else {
        return CGSizeMake(50.0, 70.0);
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    if (isEditMode) {
        return CGSizeMake(50.0, 40.0);
    } else {
        return CGSizeMake(50.0, 5.0);
    }
}

- (IBAction)toggleEditDidPress:(UIButton *)sender {
    isEditMode = !isEditMode;
    [myCollectionView reloadData];
}
@end
