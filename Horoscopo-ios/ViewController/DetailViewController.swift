//
//  DetailViewController.swift
//  Horoscopo-ios
//
//  Created by Mananas on 7/11/25.
//

import UIKit

class DetailViewController: UIViewController {
    
    var horoscope: Horoscope!

    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var predictionTextview: UITextView!
   
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        navigationItem.title = horoscope.name
       
        
        if #available(iOS 26.0, *){
            navigationItem.subtitle = horoscope.dates
        }else{
            
        }
        
        signImageView.image = horoscope.getSignIcon()
        getPrediction(period: "daily")
    }
    
    
    func getPrediction(period: String){
        let url = URL(string: "https://horoscope-app-api.vercel.app/api/v1/get-horoscope/\(period)?sign=\(horoscope.id)")
        Task{
            do{
                let (data, response) = try await URLSession.shared.data(from:url!)
                if let str = String(data: data, encoding: .utf8){
                    print("Succesfully decocoded: \(str)")
                }
                
            }catch{
                print(error)
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
