//
//  ViewController.h
//  test3D
//
//  Created by Siarhei Hermanovich on 30.06.12.
//  Copyright (c) 2012 BSTU. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

#define kUpdateInterval (10.0f/10.0f)

@interface ViewController : UIViewController <UIAccelerometerDelegate> {
    UIImageView *imageView;
    
    CMMotionManager *motionManager;

    UIImage **im;
}
@property (retain, nonatomic) IBOutlet UILabel *label;

@property (nonatomic, strong) CMMotionManager *motionManager;
@property (nonatomic, strong) IBOutlet UIImageView *imageView;
@property (nonatomic, assign) CMRotationRate rotation;

-(void)labelRate;

@end
