//
//  NSMutableAttributedString+dyVerticalAlignment.m
//  huxue
//
//  Created by liukuiqing on 2021/5/18.
//

#import "NSMutableAttributedString+dyVerticalAlignment.h"
#import <UIKit/UIKit.h>

@implementation NSMutableAttributedString (dyVerticalAlignment)

/// 上下对齐方式
/// @param alignmentType 1居中 2、顶部对齐  0和其他：底部对齐
-(void)dyAlignment:(NSInteger)alignmentType{
    __block CGFloat max_h = 0.f,max_d = 0,max_a = 0,max_p = 0;
    NSMutableArray *blocks = [NSMutableArray array];
    [self enumerateAttributesInRange:NSMakeRange(0, self.length) options:NSAttributedStringEnumerationLongestEffectiveRangeNotRequired usingBlock:^(NSDictionary<NSAttributedStringKey,id> * _Nonnull attrs, NSRange range, BOOL * _Nonnull stop) {
        NSTextAttachment* attachment=[attrs valueForKey:NSAttachmentAttributeName];
        UIFont *font = attrs[NSFontAttributeName];
        CGFloat height = 0.f;
        if(attachment){
            font = [UIFont systemFontOfSize:attachment.bounds.size.height];
            font = [UIFont systemFontOfSize:attachment.bounds.size.height*font.pointSize/font.ascender];
            height = font.lineHeight;
            if (height>max_h) {
                max_h = height;
                max_a = attachment.bounds.size.height;
                max_d = max_a-max_h;
                max_p = max_a;
            }
        }else{
            if (font) {
                height = font.lineHeight;
                if (height>max_h) {
                    max_h = height;
                    max_a = font.ascender;
                    max_d = font.descender;
                    max_p = font.pointSize;
                }
            }
        }
        void(^block)(CGFloat max_line_h,CGFloat max_ascender,CGFloat max_descender,CGFloat max_capheight)=^(CGFloat max_line_h,CGFloat max_ascender,CGFloat max_descender,CGFloat max_capheight){
            if (attachment) {
                CGRect tFrame = attachment.bounds;
                CGFloat c_ascender = tFrame.size.height;
                CGFloat c_descender = c_ascender-height;
                CGFloat c_pointSize = tFrame.size.height;
                //转换成font后需要位移值
                CGFloat font_offset = c_descender+(c_ascender-c_descender-c_pointSize)/2;
                switch (alignmentType) {
                    case 1:
                        tFrame.origin.y =  font_offset+(max_h/2.0+max_descender)-(height/2.0+c_descender);
                        break;
                    case 2:
                    {
                        CGFloat top_offset = font_offset +(max_h/2.0+max_descender+max_capheight/2.0)-(height/2.0+c_descender+c_pointSize/2.0);
                        tFrame.origin.y = top_offset;
                        break;
                    }
                    default:{
//                        tFrame.origin.y = font_offset;
                        tFrame.origin.y = (max_descender+(max_ascender-max_descender-max_capheight)/2);
                        break;
                    }
                }
                attachment.bounds = tFrame;
            }else{
                if (font) {
                    CGFloat c_descender = font.descender;
                    CGFloat c_ascender = font.ascender;
                    CGFloat c_pointSize = font.pointSize;
                    CGFloat offset = 0.f;
                    switch (alignmentType) {
                        case 1:{
                            offset = (max_h/2.0+max_descender)-(height/2.0+c_descender);
                        }
                            break;
                        case 2:
                            offset = (max_h/2.0+max_descender+max_capheight/2.0)-(height/2.0+c_descender+c_pointSize/2.0);
                            break;
                        default:
//                            offset = (max_descender -font.descender);
                            offset = (max_descender+(max_ascender-max_descender-max_capheight)/2)-(c_descender+(c_ascender-c_descender-c_pointSize)/2);
                            break;
                    }
                    [self removeAttribute:NSBaselineOffsetAttributeName range:range];
                    [self addAttributes:@{NSBaselineOffsetAttributeName:@(offset)} range:range];
                }
            }
        };
        [blocks addObject:block];
    }];
    for (void(^block)(CGFloat max_line_h,CGFloat max_ascender,CGFloat max_descender,CGFloat max_capheight) in blocks) {
        block(max_h,max_a,max_d,max_p);
    }
}
@end
