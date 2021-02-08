//
//  ViewController.swift
//  TechPod
//
//  Created by 伊藤愛結 on 2021/02/04.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var songNameArray = [String]()
    var fileNameArray = [String]()
    var imageNameArray = [String]()
    var audioPlayer: AVAudioPlayer!
    
    @IBOutlet var table: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //テーブルビューのデータソースメソッドはViewControllerに書くよ
        table.dataSource = self
        
        //テーブルビューのデリゲートメソッドはViewControllerメソッドに書くよ
        table.delegate = self
        
        songNameArray = ["カノン","エリーゼのために","G線上のアリア"]
        fileNameArray = ["cannon","elise","aria"]
        imageNameArray = ["Pachelbel.jpg","Beethoven.jpg","Bach.jpg"]
    }
    
    //セルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songNameArray.count
    }
    
    //ID付きのセルを取得して、セル付属のtextlabelにテストと表示させる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        //セルに曲名を入れる。indexPath.rowは何列目かを格納されている
        cell?.textLabel?.text = songNameArray[indexPath.row]
        
        cell?.imageView?.image = UIImage(named: "imageNameArray[indexPath.row]")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        print("\(songNameArray[indexPath.row])が選ばれました！")
        
        //音楽ファイルの設定
        let audioPath = URL(fileURLWithPath: Bundle.main.path(forResource: fileNameArray[indexPath.row], ofType: "mp3")!)
        
        //再生の準備
        audioPlayer = try? AVAudioPlayer(contentsOf: audioPath)
        
        audioPlayer.play()
    }


}

