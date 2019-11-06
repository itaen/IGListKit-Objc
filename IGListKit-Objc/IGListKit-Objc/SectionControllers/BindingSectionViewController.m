//
//  BindingSectionViewController.m
//  IGListKit-Objc
//
//  Created by itaen on 2019/11/6.
//  Copyright © 2019 itaen. All rights reserved.
//

#import "BindingSectionViewController.h"
#import "LabelCell.h"

@interface BindingSectionViewController ()<LabelCellDelegate>

@property (nonatomic, assign) NSUInteger count;

@end

@implementation BindingSectionViewController

- (instancetype)init {
	self = [super init];
	if (self) {
		self.dataSource = self;
	}
	return self;
}

- (nonnull UICollectionViewCell<IGListBindable> *)sectionController:(nonnull IGListBindingSectionController *)sectionController cellForViewModel:(nonnull id)viewModel atIndex:(NSInteger)index {
	LabelCell *cell = [self.collectionContext dequeueReusableCellOfClass:[LabelCell class] forSectionController:sectionController atIndex:index];
	[cell setDelegate:self];
	return cell;
}

- (CGSize)sectionController:(nonnull IGListBindingSectionController *)sectionController sizeForViewModel:(nonnull id)viewModel atIndex:(NSInteger)index {
	return CGSizeMake([self.collectionContext containerSize].width, 55);
}

- (nonnull NSArray<id<IGListDiffable>> *)sectionController:(nonnull IGListBindingSectionController *)sectionController viewModelsForObject:(nonnull id)object {
	BindingItem *item;
	
	if (_count) {
		item = [[BindingItem alloc] initWithText:@"新数据" count:_count];//recreating based on old model data
	}else{
		item = (BindingItem *)object;
	}
	return @[item];
}

- (void)didTapLabelCell:(LabelCell *)cell {
	_count = 999;
	[self updateAnimated:YES completion:nil];
}

@end
