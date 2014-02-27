//
//  SKAnimateScroll.h
//  NoteDemo
//
//  Created by Sunil on 03/01/14.
//  Copyright (c) 2014 Sunil Vaishnav. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    kScrollDirectionTop,
    kScrollDirectionBottom
}ScrollDirection;

@interface SKAnimateScroll : UIScrollView<UIScrollViewDelegate>{

}
@property(nonatomic,strong) NSArray *arrAllAnimatingImages;
@property(nonatomic,assign) CGSize sizeImageSize;
@property(assign) ScrollDirection animationDirection;
+(SKAnimateScroll*)createAnimateScrollOfImages:(NSArray*)arrayOfImages ofScrollRect:(CGRect)rect ofImageSize:(CGSize)imageSize InView:(UIView*)aSuperView withDirection:(ScrollDirection)aDirection;
@end
