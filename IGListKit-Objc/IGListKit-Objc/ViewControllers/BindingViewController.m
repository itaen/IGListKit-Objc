//
//  BindingViewController.m
//  IGListKit-Objc
//
//  Created by itaen on 2019/11/6.
//  Copyright © 2019 itaen. All rights reserved.
//

#import "BindingViewController.h"
#import "BindingSectionViewController.h"
#import <IGListKit.h>

static NSUInteger const kDefaultItemCount = 20;
@interface BindingViewController ()<IGListAdapterDataSource>

@property (nonatomic,strong) IGListAdapter *adapter;
@property (nonatomic,strong) IGListCollectionView *collectionView;

@property (nonatomic,strong) NSMutableArray <BindingItem *> *bindingItems;

@end

@implementation BindingViewController


-(IGListAdapter *)adapter{
	if (!_adapter) {
		_adapter = [[IGListAdapter alloc] initWithUpdater:[IGListAdapterUpdater new] viewController:self workingRangeSize:0];
	}
	return _adapter;
}

- (IGListCollectionView *)collectionView {
	if (!_collectionView) {
		_collectionView = [[IGListCollectionView alloc] initWithFrame:CGRectZero ];
	}
	return _collectionView;
}

- (void)viewDidLoad {
	[super viewDidLoad];
	[self.view addSubview:self.collectionView];
	self.bindingItems = [NSMutableArray array];
	self.adapter.collectionView=self.collectionView;
	self.adapter.dataSource=self;
	[self fakeData];
}

- (void)fakeData {
	for (int i = 0; i < kDefaultItemCount; i++) {
		BindingItem *item = [[BindingItem alloc] initWithText:[NSString stringWithFormat:@"This is text at index %d",i] count:i];
		[self.bindingItems addObject:item];
	}
	[self.adapter performUpdatesAnimated:YES completion:nil];
}

-(void)viewDidLayoutSubviews{
	[super viewDidLayoutSubviews];
	_collectionView.frame=self.view.bounds;
}

-(NSArray<id<IGListDiffable>> *)objectsForListAdapter:(IGListAdapter *)listAdapter{
	return [NSArray arrayWithArray:self.bindingItems];
}

- (IGListSectionController *)listAdapter:(IGListAdapter *)listAdapter sectionControllerForObject:(id)object{
	return [BindingSectionViewController new];
}

-(UIView *)emptyViewForListAdapter:(IGListAdapter *)listAdapter{
	return nil;
}





@end
