
//
//  VCTableViewCell.m
//  text
//
//  Created by 江涛 on 16/7/16.
//  Copyright © 2016年 jiangtao. All rights reserved.
//

#import "VCTableViewCell.h"
#import "Masonry.h"

@implementation VCTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.label];
    }
    return self;
}

    - (void)setOpen:(BOOL)open
    {
        if (open == YES) {
            self.label.numberOfLines = 0;
        } else {
            self.label.numberOfLines = 1;
        }
        
        [self layoutIfNeeded];
    }


    - (void)layoutSubviews
    {
        [super layoutSubviews];
        
        [self.label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_top).offset(8);
            make.left.mas_equalTo(self.contentView.mas_left).offset(8);
            make.right.mas_equalTo(self.contentView.mas_right).offset(-8);
            make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-8);        
        }];
    }


- (UILabel *)label
{
    if (!_label) {
        _label = [UILabel new];
        _label.text = @"这些内容太多，不能单独一行完全显示，通过实现点击TableViewCell，将内容完全展示，实现方法也相对简单。";
    }
    return _label;
}

@end
