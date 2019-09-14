//
//  LowerCollectionReusableView.h
//  CollectionViewExample
//
//  Created by Roey Honig on 15.9.2019.
//  Copyright © 2019 Roey Honig. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface LowerCollectionReusableView : UICollectionReusableView
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpacerHeigt;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *titleHiegtConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpacerHightConstraint;
@property (weak, nonatomic) NSIndexPath *indexPath;
@end

NS_ASSUME_NONNULL_END
