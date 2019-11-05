//
//  SearchSectionController.h
//  zues
//
//  Created by v on 17/2/14.
//  Copyright © 2017年 v. All rights reserved.
//
/** 
 The examples provided by Facebook are for non-commercial testing and evaluation
 purposes only. Facebook reserves all rights not expressly granted.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 FACEBOOK BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */
#import <IGListKit/IGListKit.h>

@class SearchSectionController;
@protocol SearchSectionControllerDelegate <NSObject>

- (void)searchSectionController:(SearchSectionController *)sectionController didChangeText:(NSString *)text;

@end

@interface SearchSectionController : IGListSectionController<UISearchBarDelegate, IGListScrollDelegate>

/**  */
@property (weak, nonatomic) id<SearchSectionControllerDelegate> delegate;

@end

