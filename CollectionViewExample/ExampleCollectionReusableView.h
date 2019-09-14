//
//  ExampleCollectionReusableView.h
//  CollectionViewExample
//
//  Created by Roey Honig on 14.9.2019.
//  Copyright © 2019 Roey Honig. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExampleCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet UILabel *sectionLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *pressMeHeightConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *secondSpacerHeightConstant;
@property (weak, nonatomic) NSIndexPath *indexPath;
@end

NS_ASSUME_NONNULL_END
