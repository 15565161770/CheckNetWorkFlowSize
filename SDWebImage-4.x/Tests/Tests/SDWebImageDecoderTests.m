/*
 * This file is part of the SDWebImage package.
 * (c) Olivier Poitrey <rs@dailymotion.com>
 * (c) Matt Galloway
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

#define EXP_SHORTHAND   // required by Expecta


#import <XCTest/XCTest.h>
#import <Expecta/Expecta.h>
#import <SDWebImage/SDWebImageDecoder.h>

@interface SDWebImageDecoderTests : XCTestCase

@end

@implementation SDWebImageDecoderTests

- (void)test01ThatDecodedImageWithNilImageReturnsNil {
    expect([UIImage decodedImageWithImage:nil]).to.beNil();
}

- (void)test02ThatDecodedImageWithImageWorksWithARegularJPGImage {
    NSString * testImagePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestImage" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:testImagePath];
    UIImage *decodedImage = [UIImage decodedImageWithImage:image];
    expect(decodedImage).toNot.beNil();
    expect(decodedImage).toNot.equal(image);
}

- (void)test03ThatDecodedImageWithImageDoesNotDecodeAnimatedImages {
    NSString * testImagePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestImage" ofType:@"gif"];
    UIImage *image = [UIImage imageWithContentsOfFile:testImagePath];
    UIImage *animatedImage = [UIImage animatedImageWithImages:@[image] duration:0];
    UIImage *decodedImage = [UIImage decodedImageWithImage:animatedImage];
    expect(decodedImage).toNot.beNil();
    expect(decodedImage).to.equal(animatedImage);
}

- (void)test04ThatDecodedImageWithImageDoesNotDecodeImagesWithAlpha {
    NSString * testImagePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"TestImage" ofType:@"png"];
    UIImage *image = [UIImage imageWithContentsOfFile:testImagePath];
    UIImage *decodedImage = [UIImage decodedImageWithImage:image];
    expect(decodedImage).toNot.beNil();
    expect(decodedImage).to.equal(image);
}

- (void)test05ThatDecodedImageWithImageWorksEvenWithMonochromeImage {
    NSString * testImagePath = [[NSBundle bundleForClass:[self class]] pathForResource:@"MonochromeTestImage" ofType:@"jpg"];
    UIImage *image = [UIImage imageWithContentsOfFile:testImagePath];
    UIImage *decodedImage = [UIImage decodedImageWithImage:image];
    expect(decodedImage).toNot.beNil();
    expect(decodedImage).toNot.equal(image);
}

@end
