
#import "NSString+Path.h"

@implementation NSString (Path)

- (NSString *)cachePath{
    NSString *fileName = [self lastPathComponent];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    return [path stringByAppendingPathComponent:fileName];
}

- (NSString *)documentPath{
    NSString *fileName = [self lastPathComponent];
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [path stringByAppendingPathComponent:fileName];

}

- (NSString *)tmpPath{
    NSString *fileName = [self lastPathComponent];
    NSString *path = NSTemporaryDirectory();
    return [path stringByAppendingPathComponent:fileName];
}

- (BOOL)isNilOrEmpty{
    if (!self)
        return YES;
    return [self isEqualToString:@""]||[[self stringByReplacingOccurrencesOfString:@" " withString:@""] isEqualToString:@""];
}

- (NSDictionary *)attributedStringAttributes:(UIFont *)font{
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paraStyle.alignment = NSTextAlignmentLeft;
    paraStyle.lineSpacing = 10; //设置行间距
    paraStyle.hyphenationFactor = 1.0;
    paraStyle.firstLineHeadIndent = 0.0;
    paraStyle.paragraphSpacingBefore = 0.0;
    paraStyle.headIndent = 0;
    paraStyle.tailIndent = 0;
    //设置字间距 NSKernAttributeName:@1.2f
    return  @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paraStyle, NSKernAttributeName:@1.2f};
}
- (NSAttributedString *)toAttributedString:(UIFont *)font{
    return [[NSAttributedString alloc] initWithString:self attributes:[self attributedStringAttributes:font]];
}

- (CGSize)getAttributedStringSizeOfWidth:(CGFloat)width andFont:(UIFont *)font{
     return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:[self attributedStringAttributes:font] context:nil].size;
}

- (CGSize)getSizeOfWidth:(CGFloat)width andFont:(UIFont *)font{
    return [self boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:font} context:nil].size;
}
@end
