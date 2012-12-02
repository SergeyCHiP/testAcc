//
//  ViewController.m
//  test3D
//
//  Created by Siarhei Hermanovich on 30.06.12.
//  Copyright (c) 2012 BSTU. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize motionManager;
@synthesize imageView;
@synthesize label;
@synthesize rotation;

- (void)viewDidLoad
{
    im = malloc(100);
    for(int i =0; i<6; i++)
        im[i] = [UIImage imageNamed:[NSString stringWithFormat:@"test3D_%d.png",i]];
    
    imageView.image = im[3];
    
    self.motionManager = [[CMMotionManager alloc] init];
    motionManager.gyroUpdateInterval = kUpdateInterval;
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [motionManager startGyroUpdatesToQueue:queue withHandler:
     ^(CMGyroData *gyroData /*AccelerometerData *accelerometerData*/, NSError *error){
         if(error){
         //    [motionManager stopAccelerometerUpdates];
             [motionManager stopGyroUpdates];
         } else {
             /*    CMAcceleration acceleration = accelerometerData.acceleration;
             int i = acceleration.y/0.1;
             if (i>=6) i = 5;
             if (i<0) i = 0;
             [imageView performSelectorOnMainThread:@selector(setImage:)
                                             withObject:im[i]
                                          waitUntilDone:NO];
              */
             [(ViewController *)self setRotation:gyroData.rotationRate];
             [(ViewController *)self performSelectorOnMainThread:@selector(labelRate)
                                                           withObject:nil
                                                        waitUntilDone:NO];
             
             
         }
     }];

    [super viewDidLoad];
}

- (void)viewDidUnload
{
    
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)labelRate
{
    label.text = [NSString stringWithFormat:@"x: %f, y: %f, z: %f", rotation.x, rotation.y, rotation.z];
}

- (void)dealloc {
    [super dealloc];
}
@end
