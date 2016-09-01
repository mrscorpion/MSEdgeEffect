//
//  MSEdgeAnimationVC.m
//  MSStudyDemos
//
//  Created by mr.scorpion on 16/9/1.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "MSEdgeAnimationVC.h"
#import "UIView+EdgeAnimation.h"

@interface MSEdgeAnimationVC ()
@end

@implementation MSEdgeAnimationVC
#pragma mark - View Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Edge Animation
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pan:)];
    [self.view addGestureRecognizer:panGesture];
    NSLog(@"view pan == %p", panGesture);
    for (UIGestureRecognizer *gesture in self.view.gestureRecognizers) {
        if ([gesture isKindOfClass:[UIPanGestureRecognizer class]]) {
            NSLog(@"forin    pan == %p", panGesture);
        }
    }
    
    // Add Edge Effect
    self.view.edgeFillColor = [UIColor whiteColor];
    [self.view addEdgeEffect];
    
    // Dismiss Animation
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(backAction)];
    tap.numberOfTapsRequired = 2;
    [self.view addGestureRecognizer:tap];
}
#pragma mark - Gesture
- (void)pan:(UIPanGestureRecognizer *)pan
{
    NSLog(@"pan == %p", pan);
}

- (void)backAction
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
