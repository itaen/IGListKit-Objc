//
//  BindingItem.h
//  IGListKit-Objc
//
//  Created by itaen on 2019/11/6.
//  Copyright © 2019 itaen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <IGListDiffable.h>

@interface BindingItem : NSObject<IGListDiffable>

@property (nonatomic, copy) NSString *text;
@property (nonatomic, assign) NSUInteger count;

- (instancetype)initWithText:(NSString *)text count:(NSUInteger)count;

@end
