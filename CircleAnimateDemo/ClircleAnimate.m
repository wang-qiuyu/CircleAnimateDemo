//
//  ClircleAnimate.m
//  CircleAnimateDemo
//
//  Created by qiuyu wang on 16/7/19.
//  Copyright © 2016年 qiuyu wang. All rights reserved.
//

#import "ClircleAnimate.h"

@implementation ClircleAnimate

//创建环绕动画, 传入三个属性分别是 : 运动开始的角度(右侧90度为0), 运动结束的角度, 以及传入的是第几个物体
-(void)createCircle:(float)startAngle andEndAngle:(float)endAngle
{
    //        //设置运转动画的路径
    //        CGMutablePathRef curvedPath = CGPathCreateMutable();
    //        //    //160,240为圆心,100为半径 （0，2*M_PI）为起始角度和结束角度，1为顺时针，0 为逆时针
    //        CGPathAddArc(curvedPath, NULL, self.frame.size.width/2, self.frame.size.height/2, radiusLength+x*2, startAngle, endAngle, 0);
    //        pathAnimation.path = curvedPath;
    //        CGPathRelease(curvedPath);
    
    //创建运动的轨迹动画
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    pathAnimation.calculationMode = kCAAnimationPaced;
    pathAnimation.fillMode = kCAFillModeForwards;
    pathAnimation.removedOnCompletion = NO;
    pathAnimation.duration = 5.0;
    pathAnimation.repeatCount = 2;
    
    float x = 20;
    float radiuscale = 0.5;
    
    CGFloat origin_x = self.frame.size.width/2;
    CGFloat origin_y = self.frame.size.height/2;
    CGFloat radiusX = 100;
    
    CGMutablePathRef ovalfromarc = CGPathCreateMutable();
    CGAffineTransform t2 = CGAffineTransformConcat(CGAffineTransformConcat(
                                                                           CGAffineTransformMakeTranslation(-origin_x, -origin_y),
                                                                           CGAffineTransformMakeScale(1, radiuscale)),
                                                   CGAffineTransformMakeTranslation(origin_x, origin_y));
    CGPathAddArc(ovalfromarc, &t2, origin_x, origin_y, radiusX,startAngle,endAngle, 1);
    pathAnimation.path = ovalfromarc;
    CGPathRelease(ovalfromarc);
    
    UIView * circleView1 = [[UIImageView alloc] init];
    [self addSubview:circleView1];
    circleView1.frame = CGRectMake(160, 130, x, x);
    [circleView1.layer setCornerRadius:x/2];
    circleView1.backgroundColor = [UIColor yellowColor];
    //设置运转的动画
    [circleView1.layer addAnimation:pathAnimation forKey:@"moveTheCircleOne"];
    
    //画标准圆
//    UIGraphicsBeginImageContext(CGSizeMake(320,origin_x*2));
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGContextSetStrokeColorWithColor(ctx, [UIColor whiteColor].CGColor);
//    CGContextAddArc(ctx, origin_x, origin_y, 100,startAngle,endAngle, 1);
//    CGContextDrawPath(ctx, kCGPathStroke);
//    UIImage *curve = UIGraphicsGetImageFromCurrentImageContext();
//    UIGraphicsEndImageContext();
//    
//    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 460)];
//    imageView.image = curve;
//    [self addSubview:imageView];
}
//贝塞尔
- (void)drawRect:(CGRect)rect {
    CGFloat origin_x = self.frame.size.width/2;
    CGFloat origin_y = self.frame.size.height/2;

    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSaveGState(context);
    
    //    一段圆弧
    //    CGFloat startAngle = 0, endAngle = M_PI*2 ;
    //
    //    CGPoint center = CGPointMake(origin_x, origin_y);
    //    UIBezierPath* clip = [UIBezierPath bezierPathWithArcCenter:center
    //                                                        radius:MAX(200, 200)
    //                                                    startAngle:startAngle
    //                                                      endAngle:endAngle
    //                                                     clockwise:YES];
    //    [clip addLineToPoint:center];
    //    [clip closePath];
    //    [clip addClip];
    //整个椭圆
    UIBezierPath *arc = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(origin_x-100, origin_y-50, 200, 100)];
    [[UIColor whiteColor] setStroke];
    [arc stroke];
    CGContextRestoreGState(context);
}

-(void)setCircleAnimationBackgroundColor:(UIColor *)aColor
{
    self.backgroundColor = aColor;
    [self createCircle: M_PI / 6 andEndAngle:M_PI / 6 + 2 * M_PI];

}


@end
