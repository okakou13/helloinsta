//
//  Comment.swift
//  instaSample2
//
//  Created by 岡田昂典 on 2020/03/05.
//  Copyright © 2020 Kosuke Okada. All rights reserved.
//

import UIKit

class Comment: NSObject {
    
    var postId: String
    var user: User
    var text: String
    var createDate: Date

    init(postId: String, user: User, text: String, createDate: Date) {
        self.postId = postId
        self.user = user
        self.text = text
        self.createDate = createDate
    }

}
