//
//  ViewController.m
//  ImageAutoCircularScroll
//
//  Created by Shankar Mallick on 22/11/16.
//  Copyright © 2016 Shankar_iOS. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *cloudLayer;
    CABasicAnimation *cloudLayerAnimation;
    
    ///UIImage *cloudsImage;
    BOOL verticalScroll;
    CFTimeInterval animationDuration;
}
@property (weak, nonatomic) IBOutlet UIImageView *imgVw;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    [self cloudScroll];
}
-(void)cloudScroll {
    UIImage *cloudsImage = [self resizeimage:[UIImage imageNamed:@"19bc6daa"] WithscreenSize:self.view.bounds.size];
    UIColor *cloudPattern = [UIColor colorWithPatternImage:cloudsImage];
    cloudLayer = [CALayer layer];
    cloudLayer.backgroundColor = cloudPattern.CGColor;
    
    cloudLayer.transform = CATransform3DMakeScale(1, -1, 1);
    
    cloudLayer.anchorPoint = CGPointMake(0, 1);
    
    CGSize viewSize = self.imgVw.bounds.size;
    cloudLayer.frame = CGRectMake(0, 0, cloudsImage.size.width + viewSize.width, viewSize.height);
    
    [self.imgVw.layer addSublayer:cloudLayer];
    
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointMake(-cloudsImage.size.width, 0);
    cloudLayerAnimation = [CABasicAnimation animationWithKeyPath:@"position"];
    cloudLayerAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    cloudLayerAnimation.fromValue = [NSValue valueWithCGPoint:startPoint];
    cloudLayerAnimation.toValue = [NSValue valueWithCGPoint:endPoint];
    cloudLayerAnimation.repeatCount = HUGE_VALF;
    cloudLayerAnimation.duration = 30.0;
    [self applyCloudLayerAnimation];
    
}

- (void)applyCloudLayerAnimation {
    [cloudLayer addAnimation:cloudLayerAnimation forKey:@"position"];
}

-(UIImage *)resizeimage:(UIImage *)image WithscreenSize:(CGSize)size{
    
    CGRect rect = CGRectMake(0,0,image.size.width,size.height);
    UIGraphicsBeginImageContext( rect.size );
    [image drawInRect:rect];
    UIImage *picture1 = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    NSData *imageData = UIImagePNGRepresentation(picture1);
    UIImage *img=[UIImage imageWithData:imageData];
    return img;
}


-(IBAction)animateBackground6 {
    UIImage *backgroundImage = [UIImage imageNamed:@"19bc6daa"];
    UIColor *backgroundPattern = [UIColor colorWithPatternImage:backgroundImage];
    CALayer *background = [CALayer layer];
    background.backgroundColor = backgroundPattern.CGColor;
    background.transform = CATransform3DMakeScale(1, -1, 1);
    background.anchorPoint = CGPointMake(0, 1);
    CGSize viewSize = self.imgVw.bounds.size;
    background.frame = CGRectMake(0, 0, viewSize.width,  backgroundImage.size.height +   viewSize.height);
    [self.imgVw.layer addSublayer:background];
    
    CGPoint startPoint = CGPointZero;
    CGPoint endPoint = CGPointMake(0, -backgroundImage.size.height);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation.fromValue = [NSValue valueWithCGPoint:endPoint];
    animation.toValue = [NSValue valueWithCGPoint:startPoint];
    animation.repeatCount = HUGE_VALF;
    animation.duration = 5.0;
    [background addAnimation:animation forKey:@"position"];
}

@end
