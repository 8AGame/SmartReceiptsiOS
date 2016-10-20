//
//  AdPresentingContainerViewController.m
//  SmartReceipts
//
//  Created by Jaanus Siim on 21/05/15.
//  Copyright (c) 2015 Will Baumann. All rights reserved.
//

#import "AdPresentingContainerViewController.h"
#import "GADConstants.h"
#import "Constants.h"
#import "Database.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
#import "Database+Purchases.h"

@interface AdPresentingContainerViewController () <GADBannerViewDelegate>

@property (nonatomic, strong) IBOutlet UIView *adContainerView;
@property (nonatomic, strong) IBOutlet NSLayoutConstraint *adContainerHeight;
@property (nonatomic, strong) GADBannerView *bannerView;

@end

@implementation AdPresentingContainerViewController

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.bannerView = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
    self.bannerView.adUnitID = AD_UNIT_ID;
    self.bannerView.rootViewController = self;
    [self.bannerView setAutoresizingMask:UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin];
    
    [self.adContainerHeight setConstant:0];
    [self.adContainerView addSubview:self.bannerView];
    [self.bannerView setDelegate:self];

    dispatch_async(dispatch_get_main_queue(), ^{
        [self loadAd];
    });

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(checkAdsStatus) name:SmartReceiptsAdsRemovedNotification object:nil];
}

- (void)checkAdsStatus {
    if (![Database sharedInstance].hasValidSubscription) {
        return;
    }

    SRLog(@"Remove ads");
    [self adView:self.bannerView didFailToReceiveAdWithError:nil];
    [self.bannerView setDelegate:nil];
    [self setBannerView:nil];
}

- (void)loadAd {
    if ([Database sharedInstance].hasValidSubscription) {
        return;
    }

    GADRequest *request = [GADRequest request];
    [request setTestDevices:@[kGADSimulatorID, @"b5c0a5fccf83835150ed1fac6dd636e6"]];
    [self.bannerView loadRequest:request];
}

- (void)adViewDidReceiveAd:(GADBannerView *)view {
    [UIView animateWithDuration:0.3 animations:^{
        self.adContainerHeight.constant = CGRectGetHeight(view.frame);
        [self.view layoutIfNeeded];
    } completion:^(BOOL finished) {
        [self.bannerView setCenter:CGPointMake(CGRectGetWidth(self.adContainerView.frame) / 2, CGRectGetHeight(self.adContainerView.frame) / 2)];
    }];

}

- (void)adView:(GADBannerView *)view didFailToReceiveAdWithError:(GADRequestError *)error {
    [UIView animateWithDuration:0.3 animations:^{
        [self.adContainerHeight setConstant:0];
        [self.view layoutIfNeeded];
    }];
}

@end
