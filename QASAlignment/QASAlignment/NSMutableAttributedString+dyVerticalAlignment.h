//
//  NSMutableAttributedString+dyVerticalAlignment.h
//  huxue
//
//  Created by liukuiqing on 2021/5/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSUInteger, dyVerticalAlignmentType) {
    dyVerticalAlignmentTypeBottom = 0,
    dyVerticalAlignmentTypeCenter = 1,
    dyVerticalAlignmentTypeTop
};

@interface NSMutableAttributedString (dyVerticalAlignment)
/// @param alignmentType 1居中 2、顶部对齐  0和其他：底部对齐
-(void)dyAlignment:(NSInteger)alignmentType;
@end

NS_ASSUME_NONNULL_END
