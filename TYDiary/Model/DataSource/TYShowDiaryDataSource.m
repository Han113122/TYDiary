//
//  TYShowDiaryDataSource.m
//  TYDiary
//
//  Created by taoYe on 15/5/30.
//  Copyright (c) 2015年 renyuxian. All rights reserved.
//

#import "TYShowDiaryDataSource.h"
#import "TYDiaryCollectionCell.h"
#import "TYDiary.h"
#import "TYDiaryDao.h"

@interface TYShowDiaryDataSource ()

@end

static NSString *__DiaryCellIdentifier = @"Cell";

@implementation TYShowDiaryDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.ids.count;
}

//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//    return nil;
//}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    TYDiaryCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:__DiaryCellIdentifier forIndexPath:indexPath];
    cell = [TYDiaryCollectionCell renderCellWithCollectionCell:collectionView indexPath:indexPath diary:self.ids[indexPath.row] cell:cell];
    return cell;
}

@end
