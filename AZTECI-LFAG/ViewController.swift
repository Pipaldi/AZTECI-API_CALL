//
//  ViewController.swift
//  AZTECI-LFAG
//
//  Created by Luis Fernando AG on 1/17/22.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // Press button to make API Call
    @IBAction func downloadServices(_ sender: Any) {
        
        let configuration = URLSessionConfiguration.default
        let session = URLSession(configuration: configuration)
        guard let url = URL(string: "http://74.208.173.11/asteci-servicios-core/api/v1/public/manager/app/info") else {
            print("URL inválida")
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode) else {
                return
            }
            guard let data = data else{
                return
            }
            
            if let result = String(data: data, encoding: .utf8){
                print(result)
                
                DispatchQueue.main.async {
                    self.textView.text = ("Data descargada: \n \(result)")
                }
                
            }
        }
        
        task.resume()
        
    }
    
}


