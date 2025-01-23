//
//  CoinManager.swift
//  ByteCoin
//
//  Created by Angela Yu on 11/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import Foundation
import UIKit
import CoreLocation

protocol CoinManagerDelegate{
    func didUpdatePrice(price:String, currency:String)
    func didFailWithError(error:Error)
}

struct CoinManager {
    
    var delegate: CoinManagerDelegate?
    
    
    let baseURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    let apiKey = "2AFB59E6-0229-421D-9785-26560A3273B3"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String){
        let urlString = "\(baseURL)/\(currency)?apikey=\(apiKey)"
        
        //1. Create Url
        
        if let url = URL(string: urlString){
            //2. Create a UrlSession
            let session = URLSession(configuration: .default)
            //3. Give Task to Url Session
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    delegate?.didFailWithError(error: error!)
                    return
                }
                //Format Data Into String
                if let safeData = data{
                    if let bitcoinPrice = self.parseJSON(safeData){
                        //Optional : - Round the price Doen to 2 Decimal Place
                        let priceString = String(format: "%.2f", bitcoinPrice)
                        // Call the delegate method in the delegate (View Controller) and
                        // Price along the necessary data.
                        self.delegate?.didUpdatePrice(price: priceString, currency: currency)
                    }
                }
                
            }
            //Start Task to Fetch the Data From Cion API Server
            task.resume()
        }
        
    }
    func parseJSON(_ data: Data) -> Double?{
        //Create a JSONDecoder
        let decoder = JSONDecoder()
        do{
            //Try to decode the data using the CoinData structure
            let decodedData = try decoder.decode(CoinData.self, from: data)
            //Get last property from Coindata
            let lastPrice = decodedData.rate
            print(lastPrice)
            return lastPrice
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
