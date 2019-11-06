//
//  LabelCell.h
//  zues
//
//  Created by mac on 2017/2/11.
//  Copyright © 2017年 v. All rights reserved.
//
/**
 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import <UIKit/UIKit.h>
#import <IGListBindable.h>
#import "BindingItem.h"

@class LabelCell;
@protocol LabelCellDelegate <NSObject>

- (void)didTapLabelCell:(LabelCell *)cell;

@end

@interface LabelCell : UICollectionViewCell<IGListBindable>

@property (nonatomic,strong) UILabel *label;
@property (nonatomic,weak) id <LabelCellDelegate> delegate;

+(CGFloat)textHeight:(NSString *)text width:(CGFloat)width;

+(CGFloat)singleLineHeight;




@end
