//
//  ViewController.m
//  QASAlignment
//
//  Created by liukuiqing on 2021/8/18.
//

#import "ViewController.h"
#import "NSMutableAttributedString+dyVerticalAlignment.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *lab1 = [[UILabel alloc] initWithFrame:CGRectMake(60, 100, 200, 100)];
    [self.view addSubview:lab1];
    NSMutableAttributedString*moreAtt = [[NSMutableAttributedString alloc] initWithString:@"查看全部 " attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:22]}];
    NSTextAttachment *taMent = [[NSTextAttachment alloc] init];
    taMent.image = [UIImage imageNamed:@"test_0@3x"];
    taMent.bounds = CGRectMake(0, 0, 12, 12);
    [moreAtt appendAttributedString:[NSAttributedString attributedStringWithAttachment:taMent]];
    [moreAtt dyAlignment:dyVerticalAlignmentTypeCenter];
    lab1.attributedText = moreAtt;
    
    UILabel *lab2 = [[UILabel alloc] initWithFrame:CGRectMake(60, 200, 320, 100)];
    [self.view addSubview:lab2];
    NSMutableAttributedString*moreAtt2 = [[NSMutableAttributedString alloc] initWithString:@"查看全部 " attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:28]}];
    NSTextAttachment *taMent2 = [[NSTextAttachment alloc] init];
    taMent2.image = [UIImage imageNamed:@"test_0@3x"];
    taMent2.bounds = CGRectMake(0, 0, 49, 49);
    [moreAtt2 appendAttributedString:[NSAttributedString attributedStringWithAttachment:taMent2]];
    [moreAtt2 dyAlignment:dyVerticalAlignmentTypeTop];
    lab2.attributedText = moreAtt2;
    lab2.backgroundColor = [[UIColor redColor] colorWithAlphaComponent:0.3];
    [lab2 sizeToFit];
    
    UILabel *lab3 = [[UILabel alloc] initWithFrame:CGRectMake(60, 300, 200, 100)];
    [self.view addSubview:lab3];
    NSMutableAttributedString*moreAtt3 = [[NSMutableAttributedString alloc] initWithString:@"查看全部 " attributes:@{NSForegroundColorAttributeName:[UIColor grayColor],NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    NSTextAttachment *taMent3 = [[NSTextAttachment alloc] init];
    taMent3.image = [UIImage imageNamed:@"test_0@3x"];
    taMent3.bounds = CGRectMake(0, 0, 29, 29);
    [moreAtt3 appendAttributedString:[NSAttributedString attributedStringWithAttachment:taMent3]];
    [moreAtt3 dyAlignment:dyVerticalAlignmentTypeBottom];
    lab3.attributedText = moreAtt3;
}


@end
