//
//  SKAnimateScroll.m
//  NoteDemo
//
//  Created by Sunil on 03/01/14.
//  Copyright (c) 2014 Sunil Vaishnav. All rights reserved.
//

#import "SKAnimateScroll.h"
#import "SKImageEffect3D.h"
@implementation SKAnimateScroll

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

+(SKAnimateScroll*)createAnimateScrollOfImages:(NSArray*)arrayOfImages ofScrollRect:(CGRect)rect ofImageSize:(CGSize)imageSize InView:(UIView*)aSuperView withDirection:(ScrollDirection)aDirection{
    SKAnimateScroll *scroll =[[SKAnimateScroll alloc] initWithFrame:rect];
    scroll.arrAllAnimatingImages= arrayOfImages;
    scroll.sizeImageSize=imageSize;
    scroll.delegate=scroll;
    scroll.animationDirection=aDirection;
    [aSuperView addSubview:scroll];
//    scroll.userInteractionEnabled=NO;
    scroll.backgroundColor=[UIColor redColor];
    [scroll initializeScrollViewFirstTime];
    return scroll;
}

-(void)initializeScrollViewFirstTime{

    CGFloat yPosi=0;
    for (int i=0; i<self.arrAllAnimatingImages.count; i++) {
        SKImageEffect3D *imgView=[[SKImageEffect3D alloc] initWithFrame:CGRectMake(0, yPosi, self.sizeImageSize.width, self.sizeImageSize.height)];
        imgView.imgContentView.image=[self.arrAllAnimatingImages objectAtIndex:i];
        [self addSubview:imgView];
        yPosi=yPosi+self.sizeImageSize.height;
    }
    
    self.contentSize=CGSizeMake(self.sizeImageSize.width, yPosi);
    
    
    //get visible images count
    int visibleImages = self.frame.size.height/self.sizeImageSize.height;
    if (fmod(self.frame.size.height, self.sizeImageSize.height)) {
        visibleImages++;
    }
/*
    if (yPosi >= self.frame.size.height) {

        if (visibleImages <= self.arrAllAnimatingImages.count) {
            for (int i=0; i<visibleImages; i++) {
                UIImageView *imgView=[[UIImageView alloc] initWithFrame:CGRectMake(0, yPosi, self.sizeImageSize.width, self.sizeImageSize.height)];
                imgView.image=[self.arrAllAnimatingImages objectAtIndex:i];
                [self addSubview:imgView];
                yPosi=yPosi+self.sizeImageSize.height;
            }
        }
    }else{
        */
        //if (visibleImages <= self.arrAllAnimatingImages.count) {
            for (int i=0; i<visibleImages; i++) {
                SKImageEffect3D *imgView=[[SKImageEffect3D alloc] initWithFrame:CGRectMake(0, yPosi, self.sizeImageSize.width, self.sizeImageSize.height)];
                NSInteger indexOfImage = (i >= self.arrAllAnimatingImages.count)?fmod(i, self.arrAllAnimatingImages.count):i;
                imgView.imgContentView.image=[self.arrAllAnimatingImages objectAtIndex:indexOfImage];
                [self addSubview:imgView];
                yPosi=yPosi+self.sizeImageSize.height;
            }
        //}
//    }
    
    self.contentSize=CGSizeMake(self.sizeImageSize.width, yPosi);

    if (self.animationDirection == kScrollDirectionTop) {
        
        [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateAndScrollToTop) userInfo:nil repeats:YES];
    }else{
        [self setContentOffset:CGPointMake(self.contentOffset.x, self.arrAllAnimatingImages.count*self.sizeImageSize.height)];
        [NSTimer scheduledTimerWithTimeInterval:0.03 target:self selector:@selector(animateAndScrollToBottom) userInfo:nil repeats:YES];
    }
    
    
}

-(void)animateAndScrollToTop{
    CGPoint newPoint=CGPointMake(self.contentOffset.x, self.contentOffset.y+3);
    [self setContentOffset:newPoint animated:NO];
}
-(void)animateAndScrollToBottom{
    CGPoint newPoint=CGPointMake(self.contentOffset.x, self.contentOffset.y-3);
    [self setContentOffset:newPoint animated:NO];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    UIWindow *window;
    if (!window) {
        window=[UIApplication sharedApplication].keyWindow;
    }
    
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[SKImageEffect3D class]]) {
            SKImageEffect3D *contentView = (SKImageEffect3D*)obj;
            [contentView adjustImageOfRect:contentView.frame ofOffset:self.contentOffset];
        }
    }];
    
    if (self.animationDirection == kScrollDirectionTop) {
        if (scrollView.contentOffset.y >= self.arrAllAnimatingImages.count*self.sizeImageSize.height) {
            
            [self setContentOffset:CGPointZero];
        }
    }else{
        if (scrollView.contentOffset.y <= 0) {
            [self setContentOffset:CGPointMake(self.contentOffset.x, self.arrAllAnimatingImages.count*self.sizeImageSize.height)];
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
