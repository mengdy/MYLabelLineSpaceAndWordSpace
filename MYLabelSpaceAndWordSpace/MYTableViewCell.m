//
//  MYTableViewCell.m
//  MYLabelSpaceAndWordSpace
//
//  Created by mengdy on 17/12/5.
//  Copyright © 2017年 mengdy. All rights reserved.
//

#import "MYTableViewCell.h"

@implementation MYTableViewCell


-(instancetype)init{

    self = [super init];
    if (self) {
        
    }
    return self;
}

-(void)drawRect:(CGRect)rect{

    [self addSubview:self.contentLabel];
    [self addSubview:self.lineView];
}


-(UILabel *)contentLabel{

    if (!_contentLabel) {
        
        _contentLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 0, self.frame.size.width - 40, 0)];
        _contentLabel.numberOfLines = 0;
        _contentLabel.font = [UIFont systemFontOfSize:16];
        _contentLabel.textColor = [UIColor blackColor];
    }
    return _contentLabel;
}

-(UIView *)lineView{

    if (!_lineView) {
        
        _lineView = [[UIView alloc]initWithFrame:CGRectMake(0,CGRectGetMaxY(self.contentLabel.frame)+10,self.frame.size.width, 0.5)];
        _lineView.backgroundColor = [[UIColor grayColor] colorWithAlphaComponent:0.5];
    }
    return _lineView;
}




- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
