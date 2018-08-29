
#import <Foundation/Foundation.h>

@interface NSString (Path)

- (NSString *)cachePath;

- (NSString *)documentPath;

- (NSString *)tmpPath;

- (BOOL)isNilOrEmpty;

- (NSAttributedString *)toAttributedString:(UIFont *)font;
- (CGSize)getAttributedStringSizeOfWidth:(CGFloat)width andFont:(UIFont *)font;
- (CGSize)getSizeOfWidth:(CGFloat)width andFont:(UIFont *)font;
@end
