//
//  BindingItem.m
//  IGListKit-Objc
//
//  Created by itaen on 2019/11/6.
//  Copyright © 2019 itaen. All rights reserved.
//

#import "BindingItem.h"

@implementation BindingItem

- (instancetype)initWithText:(NSString *)text count:(NSUInteger)count {
	self = [super init];
	if (self) {
		self.text = text;
		self.count = count;
	}
	return self;
}

- (id<NSObject>)diffIdentifier {
	return _text;
}

- (BOOL)isEqualToDiffableObject:(BindingItem *)object {
	return [object.text isEqualToString:self.text] && object.count == self.count;
}

@end
