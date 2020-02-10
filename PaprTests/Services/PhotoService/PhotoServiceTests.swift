//
//  PhotoServiceTests.swift
//  PaprTests
//
//  Created by Mohammed on 09.02.20.
//  Copyright © 2020 Joan Disho. All rights reserved.
//

import RxSwift
import RxBlocking
import Quick
import Nimble
@testable import Papr

class PhotoServiceTests: QuickSpec {
    
    override func spec() {
        super.spec()
        
        describe("Photo Service") {
            context("A user likes a photo") {
                it("should return a success result if the photo has a valid id") {
                    // Given
                    let session = MockTinyNetworkingSession()
                    let fakeNetworkClient = FakeNetworkClient<Unsplash>(session: session)
                    let photoService = PhotoService(unsplash: fakeNetworkClient, cache: Cache.shared)
                    let photo = Photo(id: nil, created: nil, updated: nil, description: nil, color: nil, likes: nil, likedByUser: nil, downloads: nil, views: nil, width: nil, height: nil, user: nil, urls: nil, location: nil, exif: nil, collectionsItBelongs: nil, links: nil, categories: nil)
                    
                    // When
                    do {
                        let result = try photoService.like(photo: photo).toBlocking().first()
                        switch result {
                        case .success(let likedPhoto):
                            expect(likedPhoto.id).to(equal(photo.id))
                        case .failure(let error):
                            expect(error).toNot(beNil())
                        default:
                            fail("Something is wrong with the result")
                        }
                    } catch {
                        fail("An exception was thrown")
                    }
                }
            }
        }
    }
}
