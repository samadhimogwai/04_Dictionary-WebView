//
//  RankingViewController.swift
//  bookRanking
//
//  Created by Hitomi Mikuni on 2017/04/07.
//  Copyright © 2017年 Hitomi Mikuni. All rights reserved.
//

import UIKit


private let kTagImage = 100
private let kTagTitle = 101
private let kTagDetail = 102
private let kTagMoney = 103



class RankingViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    

    @IBOutlet weak var tableView: UITableView!
    
    // 新書
//    let newBooks: [String] = ["儒教に支配された\n中国人と韓国人の悲劇", "あの会社はこうして潰れた", "応仁の乱", "戦争にチャンスを与えよ", "日本列島100万年史\n大地に刻まれた壮大な物語",]
//    let newBookImageNames: [String] = ["new1", "new2", "new3", "new4", "new5"]
//    let newBookAuthors: [String] = ["ケント・ギルバート", "帝国データバンク情報部　藤森徹", "呉座勇一", "エドワード・ルトワック, 奥山 真司", "山崎 晴雄, 久保 純子"]
//    let newBookMoneys: [String] = ["907円", "918円", "972円", "864円", "1,080円"]
//    let newBookIds: [String] = ["14608812", "14798007", "14512980", "14779004", "14602192"]
//    
    let newBooksDic1: [String: Any] = ["title": "儒教に支配された\n中国人と韓国人の悲劇",
                                      "imageName": "new1",
                                      "author": "ケント・ギルバート",
                                      "money": 907,
                                      "id": "14608812"
                                      ]
    
    let newBooksDic2: [String: Any] = ["title": "あの会社はこうして潰れた",
                                       "imageName": "new2",
                                       "author": "帝国データバンク情報部　藤森徹",
                                       "money": 918,
                                       "id": "14798007"
                                      ]
    let newBooksDic3: [String: Any] = ["title": "応仁の乱",
                                       "imageName": "new3",
                                       "author": "呉座勇一",
                                       "money": 972,
                                       "id": "14512980"
                                      ]
    let newBooksDic4: [String: Any] = ["title": "戦争にチャンスを与えよ",
                                       "imageName": "new4",
                                       "author": "エドワード・ルトワック, 奥山 真司",
                                       "money": 864,
                                       "id": "14779004"
                                      ]
    let newBooksDic5: [String: Any] = ["title": "日本列島100万年史\n大地に刻まれた壮大な物語",
                                       "imageName": "new5",
                                       "author": "山崎 晴雄, 久保 純子",
                                       "money": 1080,
                                       "id": "14602192"
                                      ]
    
    var newBooks: [[String: Any]] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        newBooks.append(newBooksDic1)
        newBooks.append(newBooksDic2)
        newBooks.append(newBooksDic3)
        newBooks.append(newBooksDic4)
        newBooks.append(newBooksDic5)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newBooks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell" , for: indexPath)
        
        let bookDic: [String: Any] = newBooks[indexPath.row]
        
        let imageView = cell.viewWithTag(kTagImage) as? UIImageView
        imageView?.image = UIImage(named: bookDic["imageName"] as! String)
        
        let titleLabel = cell.viewWithTag(kTagTitle) as? UILabel
        titleLabel?.text = bookDic["title"] as? String
        
        let authorLabel = cell.viewWithTag(kTagDetail) as? UILabel
        authorLabel?.text = bookDic["author"] as? String
        
        let moneyLabel = cell.viewWithTag(kTagMoney) as? UILabel
        
        let money = bookDic["money"]!
        moneyLabel?.text = "\(money)円"
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // 行の選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        let bookDic: [String: Any] = newBooks[indexPath.row]

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailViewController = storyboard.instantiateViewController(withIdentifier: "detailViewController") as? DetailViewController
        
        detailViewController?.bookId = bookDic["id"] as! String
        
        navigationController?.pushViewController(detailViewController!, animated: true)
     
    }
    
    
}
