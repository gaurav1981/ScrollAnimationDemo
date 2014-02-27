//
//  ImageEffect.h
//  NoteDemo
//
//  Created by Sunil on 27/12/13.
//  Copyright (c) 2013 Sunil Vaishnav. All rights reserved.
//

#import <Foundation/Foundation.h>

#define const_image_offset_Y  20

@interface SKImageEffect3D : UIView
@property(nonatomic,strong) UIImageView *imgContentView;
@property(assign) CGPoint centerPoint;
@property(strong) UIWindow *window;

-(void)adjustImageOfRect:(CGRect)rect ofOffset:(CGPoint)offset;
@end
