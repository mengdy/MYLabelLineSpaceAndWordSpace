//
//  MYViewController.m
//  MYLabelSpaceAndWordSpace
//
//  Created by mengdy on 17/11/23.
//  Copyright © 2017年 mengdy. All rights reserved.
//

#import "MYViewController.h"
#import "UIColor+Expanded.h"
#import "UILabel+MYChangeLineSpaceAndWordSpace.h"
#import "NSString+MYAdditions.h"
#import "MYTableView.h"


/*-------------------- 屏幕适配 -----------------------------*/
/** 屏幕高度 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
/** 屏幕宽度 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/** 高度比例 */
#define kScreen_H_Scale (kScreenHeight*1.0/667)
/** 宽度比例 */
#define kScreen_W_Scale (kScreenWidth/375)




@interface MYViewController ()

@property (nonatomic,strong)UIButton *showBtn;
@property (nonatomic,strong)UILabel  *showLabel;

@end

@implementation MYViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithHexString:@"fafafa"];

//    [self.view addSubview:self.showBtn];
//    [self.view addSubview:self.showLabel];
    
    
        
    
    MYTableView *table = [[MYTableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - 0)];
    table.backgroundColor = [UIColor grayColor];
    [self.view addSubview:table];
    
 }


-(UIButton *)showBtn{

    if (!_showBtn) {
        
        _showBtn = [[UIButton alloc]initWithFrame:CGRectMake(20*kScreen_W_Scale, 80,kScreenWidth - 40*kScreen_W_Scale, 40*kScreen_H_Scale)];
        _showBtn.backgroundColor = [UIColor whiteColor];
        [_showBtn setTitle:@"显示Label的内容" forState:UIControlStateNormal];
        [_showBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [_showBtn addTarget:self action:@selector(showLabelContent) forControlEvents:UIControlEventTouchUpInside];
    }
    return _showBtn;

}

-(UILabel *)showLabel{

    if (!_showLabel) {
        
        _showLabel = [[UILabel alloc]initWithFrame:CGRectMake(15*kScreen_W_Scale, 140, kScreenWidth-30*kScreen_W_Scale, 1)];
        _showLabel.numberOfLines = 0;
        _showLabel.textColor = [UIColor colorWithHexString:@"333333"];
        _showLabel.font = [UIFont systemFontOfSize:16.f];
        _showLabel.backgroundColor = [UIColor whiteColor];
        
    }
    return _showLabel;
}



-(void)showLabelContent{

    
    self.showLabel.text = @"我不是说这种态度不可取，只是你有没有想过，如果如你所言看重的是态度，那么只要我们不停努力，不到人生的最后时刻，就不能说我们没有完美的可能，既然胜负未分，为何要提前羞愧？";
    
     [self.showLabel sizeWithSt:self.showLabel.text font:16.f frame:self.showLabel.frame];
    //修改行间距
    [UILabel changeLineSpaceForLabel:_showLabel WithSpace:20];
    //修改字与字之间的距离
    [UILabel changeWordSpaceForLabel:_showLabel WithSpace:5];


}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
