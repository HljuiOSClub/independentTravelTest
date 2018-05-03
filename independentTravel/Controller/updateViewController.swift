//
//  updateViewController.swift
//  independentTravel
//
//  Created by 李亚非 on 2018/4/28.
//  Copyright © 2018年 李亚非. All rights reserved.
//

import UIKit
import AVFoundation
import MobileCoreServices
import AssetsLibrary
import AVKit
import Alamofire
import MediaPlayer
import SwiftyJSON

class updateViewController: UIViewController,UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    //设置标志，用于标识上传那种类型文件（图片／视频）
    var flag = ""
    //设置服务器地址
    let uploadURL = "http://45.32.137.93:8080/upload"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    
    //按钮事件：上传视频
    @IBAction func uploadVideo(_ sender: Any) {
        videoLib()
    }
    
    
    
    
    //图库 - 视频
    func videoLib(){
        flag = "视频"
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            //初始化图片控制器
            let imagePicker = UIImagePickerController()
            //设置代理
            imagePicker.delegate = self
            //指定图片控制器类型
            imagePicker.sourceType = .photoLibrary;
            //只显示视频类型的文件
            imagePicker.mediaTypes =  [kUTTypeMovie as String]
            //不需要编辑
            imagePicker.allowsEditing = false
            //弹出控制器，显示界面
            self.present(imagePicker, animated: true, completion: nil)
        }
        else {
            print("读取相册错误")
        }
    }
    
    //选择成功后代理
    func imagePickerController(_ picker: UIImagePickerController,didFinishPickingMediaWithInfo info: [String : Any]) {
        if flag == "视频" {
            
            //获取选取的视频路径
            let videoURL = info[UIImagePickerControllerMediaURL] as! URL
            let pathString = videoURL.path
            print("视频地址：\(pathString)")
            //图片控制器退出
            self.dismiss(animated: true, completion: nil)
            let outpath = NSHomeDirectory() + "/Documents/\(Date().timeIntervalSince1970).mp4"
            //视频转码
            self.transformMoive(inputPath: pathString, outputPath: outpath)
        }
    }
    
   
    //上传视频到服务器
    func uploadVideo(mp4Path : URL){
        Alamofire.upload(
            //同样采用post表单上传
            multipartFormData: { multipartFormData in
                multipartFormData.append(mp4Path, withName: "file", fileName: "123456.mp4", mimeType: "video/mp4")
                //服务器地址
        },to: uploadURL,encodingCompletion: { encodingResult in
            switch encodingResult {
            case .success(let upload, _, _):
                //json处理
                upload.responseJSON { response in
                    //解包
                    guard let result = response.result.value else { return }
                    print("\(result)")
                    //须导入 swiftyJSON 第三方框架，否则报错
                    let success = JSON(result)["size"].int
                    if success! >= 1 {
                        print("上传成功")
                        let alert = UIAlertController(title:"提示",message:"上传成功", preferredStyle: .alert)
                        let action2 = UIAlertAction(title: "关闭", style: .default, handler: nil)
                        alert.addAction(action2)
                        self.present(alert , animated: true , completion: nil)
                    }else{
                        print("上传失败")
                        let alert = UIAlertController(title:"提示",message:"上传失败", preferredStyle: .alert)
                        let action2 = UIAlertAction(title: "关闭", style: .default, handler: nil)
                        alert.addAction(action2)
                        self.present(alert , animated: true , completion: nil)
                    }
                }
                //上传进度
                upload.uploadProgress(queue: DispatchQueue.global(qos: .utility)) { progress in
                    print("视频上传进度: \(progress.fractionCompleted)")
                }
            case .failure(let encodingError):
                print(encodingError)
            }
        })
    }
    
    /// 转换视频
    ///
    /// - Parameters:
    ///   - inputPath: 输入url
    ///   - outputPath:输出url
    func transformMoive(inputPath:String,outputPath:String){
        
        
        let avAsset:AVURLAsset = AVURLAsset(url: URL.init(fileURLWithPath: inputPath), options: nil)
        let assetTime = avAsset.duration
        
        let duration = CMTimeGetSeconds(assetTime)
        print("视频时长 \(duration)");
        let compatiblePresets = AVAssetExportSession.exportPresets(compatibleWith: avAsset)
        if compatiblePresets.contains(AVAssetExportPresetLowQuality) {
            let exportSession:AVAssetExportSession = AVAssetExportSession.init(asset: avAsset, presetName: AVAssetExportPresetMediumQuality)!
            let existBool = FileManager.default.fileExists(atPath: outputPath)
            if existBool {
            }
            exportSession.outputURL = URL.init(fileURLWithPath: outputPath)
            
            
            exportSession.outputFileType = AVFileType.mp4
            exportSession.shouldOptimizeForNetworkUse = true;
            exportSession.exportAsynchronously(completionHandler: {
                
                switch exportSession.status{
                    
                case .failed:
                    
                    print("失败...\(String(describing: exportSession.error?.localizedDescription))")
                    break
                case .cancelled:
                    print("取消")
                    break;
                case .completed:
                    print("转码成功")
                    //转码成功后获取视频视频地址
                    let mp4Path = URL.init(fileURLWithPath: outputPath)
                    //上传
                    self.uploadVideo(mp4Path: mp4Path)
                    break;
                default:
                    print("..")
                    break;
                }
            })
        }
    }

}
