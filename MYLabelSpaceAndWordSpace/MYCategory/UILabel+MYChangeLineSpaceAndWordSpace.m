//
//  UILabel+MYChangeLineSpaceAndWordSpace.m
//  MYLabelSpaceAndWordSpace
//
//  Created by mengdy on 17/11/23.
//  Copyright © 2017年 mengdy. All rights reserved.
//

#import "UILabel+MYChangeLineSpaceAndWordSpace.h"
#import "UIColor+Expanded.h"


@implementation UILabel (MYChangeLineSpaceAndWordSpace)

+(void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:space];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(space)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}

+ (void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace {
    
    NSString *labelText = label.text;
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:labelText attributes:@{NSKernAttributeName:@(wordSpace)}];
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setLineSpacing:lineSpace];
    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [labelText length])];
    label.attributedText = attributedString;
    [label sizeToFit];
    
}


-(void)sizeWithSt:(NSString *)string font:(CGFloat)font frame:(CGRect)frame{

    CGRect rect = [string boundingRectWithSize:CGSizeMake(320, 8000)//限制最大的宽度和高度
                                       options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesFontLeading  |NSStringDrawingUsesLineFragmentOrigin//采用换行模式
                                    attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:font]}//传人的字体字典
                                       context:nil];

    
    self.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.width, rect.size.height+font);
}


-(NSMutableAttributedString *)changeLabelSomeStringSizeStr:(NSString *)preString middleStr:(NSString *)middleStr sufStr:(NSString *)sufStr{
    
    NSString *str = [NSString stringWithFormat:@"%@%@%@",preString,middleStr,sufStr];
    
    NSMutableAttributedString *hintString=[[NSMutableAttributedString alloc]initWithString:str];
    //获取要调整颜色的文字位置,调整颜色
    if (preString.length>0) {
        
        NSRange range1=[[hintString string]rangeOfString:preString];
        [hintString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"333333"]range:range1];
        [hintString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:range1];
    }
    if (sufStr.length>0){
        NSRange range2=[[hintString string]rangeOfString:sufStr];
        [hintString addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithHexString:@"f47416"]range:range2];
        [hintString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:12] range:range2];
    }
    return hintString;
}




@end
