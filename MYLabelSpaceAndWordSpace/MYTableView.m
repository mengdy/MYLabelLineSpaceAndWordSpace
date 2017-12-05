//
//  MYTableView.m
//  MYLabelSpaceAndWordSpace
//
//  Created by mengdy on 17/12/5.
//  Copyright © 2017年 mengdy. All rights reserved.
//

#import "MYTableView.h"
#import "NSString+MYAdditions.h"
#import "MYTableViewCell.h"


/*-------------------- 屏幕适配 -----------------------------*/
/** 屏幕高度 */
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
/** 屏幕宽度 */
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
/** 高度比例 */
#define kScreen_H_Scale (kScreenHeight*1.0/667)
/** 宽度比例 */
#define kScreen_W_Scale (kScreenWidth/375)
#define FontWithSize(s) [UIFont fontWithName:@"HelveticaNeue-Light" size:s]
#define SIZE_FONT_CONTENT 16


@interface MYTableView ()<UITableViewDelegate,UITableViewDataSource>


@property (nonatomic,strong)UITableView *tableView;
@property (nonatomic,strong)NSArray     *dataArr;

@end


@implementation MYTableView


-(instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.tableView];
    }

    return self;
}

-(NSArray *)dataArr{

    if (!_dataArr) {
        
        _dataArr =  [NSArray arrayWithObjects:
                     @"我不是说这种态度不可取，只是你有没有想过，如果如你所言看重的是态度，那么只要我们不停努力，不到人生的最后时刻，就不能说我们没有完美的可能，既然胜负未分，为何要提前羞愧？",
                     @"现在做不到，不代表以后也做不到，而且就算一直都做不到，又有什么？努力应该是发自内心的渴求，而不应该来自与别人比较而产生的心理落差，只要真的努力过了，那就足够",
                     @"都说命运天注定，就算再糟糕，也不可能改变，但我不甘心，我想活着，我想活过二十岁，然后一百岁，甚至五百岁，八百岁，活的越久越久，最好能够长生不死……但首先，我必须活过二十岁，所以我活的非常小心，我每天早睡早起，我每天锻炼身体，我从不挑食，但绝不暴食暴饮，我油盐不进，那不是说性格，而是那样的食物才健康，我按着医书上的要求，用小秤量着肉与菜吃，从来不嫌麻烦，直到十二岁后，把所有这些都变成本能",
                     @"我珍惜时间，把所有时间都用来学习修行，我想尽可能在二十岁之前接触到那些最美妙的智慧，更想通过修行来改变自己的命运，这样二十岁之后才会有机会去看更多美妙的风景",
                     @"改变命运真的太难，我这些年活的真的太累，但再累我也想活下去，因为西宁镇的猪头肉切成薄片再蘸了红油与岩盐真的很好吃，因为书上真的有很多有趣有意思的知识，因为生命真的很美好。",
                     @"我不想死，但我不能保证自己能够活过二十岁，更准确地说，我根本没有什么信心，我不想那个给自己寄竹蜻蜓的小姑娘变成望门寡，所以我来到京都，想要退婚，结果呢？",
                     @"所有认识我的人都觉得我早熟，不像是个十四岁的少年，都说我稳重，却不想想……我离死只有五年了，我正青春，却已经被黄土埋了半截，能不稳重吗？可是我怎么能甘心呢！",
                     nil];

    }

    return _dataArr;

}


-(UITableView *)tableView{

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-100) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource= self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
    }
    return _tableView;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataArr.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return [[self.dataArr objectAtIndex:indexPath.row] sizeWithConstrainedToWidth:kScreenWidth - 40 fromFont:FontWithSize(SIZE_FONT_CONTENT) lineSpace:5].height+20;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MYTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        
        cell = [[MYTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.contentLabel.frame = CGRectMake(20, 0, kScreenWidth-40, [[self.dataArr objectAtIndex:indexPath.row] sizeWithConstrainedToWidth:kScreenWidth - 40 fromFont:FontWithSize(SIZE_FONT_CONTENT) lineSpace:5].height);
    cell.contentLabel.text = [self.dataArr objectAtIndex:indexPath.row];
    
    
    return cell;
}



@end
