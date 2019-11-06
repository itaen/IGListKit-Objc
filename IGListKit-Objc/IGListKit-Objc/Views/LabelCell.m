//
//  LabelCell.m
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


#import "LabelCell.h"

@interface LabelCell ()
@property (nonatomic,strong) CALayer *separator;
@property (nonatomic,assign) CGFloat singleLineHeight;
@property (nonatomic, strong) UIButton *changeButton;
@end

@implementation LabelCell

- (void)bindViewModel:(id)viewModel {
	BindingItem *item = (BindingItem *)viewModel;
	self.label.text = [NSString stringWithFormat:@"%@%ld",item.text,item.count];
	self.changeButton.hidden = NO;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView addSubview:self.label];
        [self.contentView.layer addSublayer:self.separator];
        self.contentView.backgroundColor = [UIColor whiteColor];
		[self.contentView addSubview:self.changeButton];
    }
    return self;
}

- (void)changeButtonPressed:(UIButton *)sender {
	if (self.delegate) {
		[self.delegate didTapLabelCell:self];
	}
}

- (UIButton *)changeButton {
	if (!_changeButton) {
		_changeButton = [UIButton buttonWithType:UIButtonTypeCustom];
		[_changeButton setTitle:@"点击改变数据" forState:UIControlStateNormal];
		[_changeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
		[_changeButton.titleLabel setFont:[UIFont systemFontOfSize:14]];
		[_changeButton addTarget:self action:@selector(changeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
		_changeButton.hidden = YES;
	}
	return _changeButton;
}

+(UIFont *)font{
    return [UIFont systemFontOfSize:17.0];
}

+(UIEdgeInsets)insets{
    return UIEdgeInsetsMake(8, 15, 8, 15);
}

+(CGFloat)singleLineHeight{
    return self.font.lineHeight + self.insets.top + self.insets.bottom;
}

+(CGFloat)textHeight:(NSString *)text width:(CGFloat)width{
    CGSize constrainedSize = CGSizeMake(width - self.insets.left - self.insets.right, FLT_MAX);
    
    NSDictionary *attributes=@{NSFontAttributeName:self.font};
    
    CGRect bounds=[text boundingRectWithSize:constrainedSize options:NSStringDrawingUsesFontLeading | NSStringDrawingUsesLineFragmentOrigin attributes:attributes context:nil];
    
    return ceil(bounds.size.height) + self.insets.top + self.insets.bottom;
}

- (UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc] init];
        _label.numberOfLines=1;
        _label.font=LabelCell.font;
    }
    return _label;
}

- (CALayer *)separator {
    if (!_separator) {
        _separator = [CALayer layer];
        _separator.backgroundColor=[UIColor colorWithRed:200/255.0 green:199/255.0 blue:204/255.0 alpha:1].CGColor;
    }
    return _separator;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGRect bounds=self.contentView.bounds;
    _label.frame=UIEdgeInsetsInsetRect(bounds, LabelCell.insets);
    CGFloat height=0.5;
    CGFloat left=LabelCell.insets.left;
    _separator.frame=CGRectMake(left, bounds.size.height-height, bounds.size.width-left, height);
	CGFloat buttonWidth = 100.f;
	CGFloat buttonHeight = 55.f;
	_changeButton.frame = CGRectMake(bounds.size.width - buttonWidth, (bounds.size.height - buttonHeight)/2.f,buttonWidth, buttonHeight);
}

-(void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    self.contentView.backgroundColor=[UIColor colorWithWhite:highlighted ? 0.9 : 1 alpha:1];
}


@end
