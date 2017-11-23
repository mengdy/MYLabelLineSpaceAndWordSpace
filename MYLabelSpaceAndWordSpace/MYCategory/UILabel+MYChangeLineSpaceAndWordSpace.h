//
//  UILabel+MYChangeLineSpaceAndWordSpace.h
//  MYLabelSpaceAndWordSpace
//
//  Created by mengdy on 17/11/23.
//  Copyright © 2017年 mengdy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (MYChangeLineSpaceAndWordSpace)

/**
 *  改变行间距
 */
+(void)changeLineSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变字间距
 */
+(void)changeWordSpaceForLabel:(UILabel *)label WithSpace:(float)space;

/**
 *  改变行间距和字间距
 */
+(void)changeSpaceForLabel:(UILabel *)label withLineSpace:(float)lineSpace WordSpace:(float)wordSpace;

/**
 * label根据文字的多少改变高度
 */
-(void)sizeWithSt:(NSString *)string font:(CGFloat)font frame:(CGRect)frame;

/**
 * 修改某些字体的颜色
 */


@end
