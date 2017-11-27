//
//  CountryDetailsVC.swift
//  Country OverView
//
//  Created by MacBook Air on 11/26/17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import UIKit

class CountryDetailsVC: UIViewController {
    
    
    @IBOutlet weak var countryTitle: UILabel!
    
    @IBOutlet weak var countryCapital: UILabel!
    
    @IBOutlet weak var countryArea: UILabel!
    
    @IBOutlet weak var countryPopulation: UILabel!
    
    @IBOutlet weak var countryGDp: UILabel!
    
    
    @IBOutlet weak var countryLatLon: UILabel!
    
    @IBOutlet weak var countryCourency: UILabel!
    
    
    @IBOutlet weak var countryLanguage: UILabel!
    
    @IBOutlet weak var countryCallingCode: UILabel!
    
    
    
    var selectedCountry:String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countryTitle.text = selectedCountry.uppercased()
        
        let url = URL(string: "http://countrycode.org/"+selectedCountry)
        
        let request = NSMutableURLRequest(url: url!)
        
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            
            
            
            data,response,error in
            
            
            var currency=""
            var population=""
            var callingCode = ""
            var capital=""
            var Area=""
            var GDP=""
            var lat_long=""
            var language=""
            
            
            
            if error != nil {
                
                
                print(error!)
            }else {
                
                
                if  let unweappedata = data {
                    
                    let dataString = NSString(data: unweappedata, encoding: String.Encoding.utf8.rawValue)
                    
                     
                    //we have currency
                    var  stringSeperatorForCurrency = "<i class=\"fa fa-money\"></i>Currency\n                                <ul>\n                                    <li>"
                    
                    //we have population
                    var stringSeperatorForPopulation = "<i class=\"fa fa-user\"></i>Population\n                                <ul>\n                                    <li>"
                    
                    var stringSeparatorForCallingCode = "<h2 class=\"text-uppercase\">"
                    
                    var stringSeperatorForCapital = "<i class=\"fa fa-university\"></i>Capital\n                                <ul>\n                                    <li>"
                    
                    var stringSeperatorForArea = "<i class=\"fa fa-superscript\"></i>Area\n                                <ul>\n                                    <li>"
                    var stringSeparatorForGdp = "<i class=\"fa fa-usd\"></i>GDP\n                                <ul>\n                                    <li>"
                    var stringSeperatorForLat_Lon = "<i class=\"fa fa-compass\"></i>Lat/Long\n                                <ul>\n                                    <li>"
 
                    var stringSeperatorForLanguage = "<i class=\"fa fa-comments\"></i>Languages\n                                <ul>\n                                    <li>"
                    

                    let newCurrencyContent = dataString?.components(separatedBy: stringSeperatorForCurrency)
                    
                    let newPopulationContent = dataString?.components(separatedBy: stringSeperatorForPopulation)
                    
                    let newCallingCodeContent = dataString?.components(separatedBy: stringSeparatorForCallingCode)
                    
                    let newCapitalContent = dataString?.components(separatedBy: stringSeperatorForCapital)
                    
                    let newAreaContent = dataString?.components(separatedBy: stringSeperatorForArea)
                    
                    let newGDPContent = dataString?.components(separatedBy: stringSeparatorForGdp)
                    
                    let newLat_lonContent = dataString?.components(separatedBy: stringSeperatorForLat_Lon)
                    
                    let newLanguageContent = dataString?.components(separatedBy: stringSeperatorForLanguage)
                    
                    
                    
                    
                    if (newCurrencyContent?.count)! > 1 && (newPopulationContent?.count)! > 1 && (newCallingCodeContent?.count)! > 1 && (newCapitalContent?.count)! > 1 && (newAreaContent?.count)! > 1 && (newGDPContent?.count)! > 1 && (newLat_lonContent?.count)! > 1 && (newLanguageContent?.count)! > 1 {
                        
                        stringSeperatorForCurrency = "</li>"
                        stringSeperatorForPopulation = "</li>"
                        stringSeparatorForCallingCode = "</h2>"
                        stringSeperatorForCapital="</li>"
                        stringSeperatorForArea = "<sup>2</sup></li>"
                        stringSeparatorForGdp = "</li>"
                        stringSeperatorForLat_Lon = "</li>"
                        stringSeperatorForLanguage = "</li>"

                        
                        if let veryNewPopolationContent = newPopulationContent?[1].components(separatedBy: stringSeperatorForPopulation) {
                            
                            
                            population=veryNewPopolationContent[0]
                            
                           
                            
                        }
                        
                        if let veryNewCurrencyContent = newCurrencyContent?[1].components(separatedBy: stringSeperatorForCurrency) {
                            
                            currency=veryNewCurrencyContent[0]
                            
                            
                        }
                        if let verynewCallingCodecontent = newCallingCodeContent?[1].components(separatedBy: stringSeparatorForCallingCode) {
                            
                            
                            callingCode=verynewCallingCodecontent[0]
                            
                            
                            
                        }
                        if let verynewCapitalcontent = newCapitalContent?[1].components(separatedBy: stringSeperatorForCapital) {
                            
                            
                            capital=verynewCapitalcontent[0]
                            
                            
                            
                        }
                        if let verynewAreacontent = newAreaContent?[1].components(separatedBy: stringSeperatorForCapital) {
                            
                            
                            Area=verynewAreacontent[0]
                            
                            
                            
                        }
                        if let verynewGDPcontent = newGDPContent?[1].components(separatedBy: stringSeperatorForCapital) {
                            
                            
                            GDP=verynewGDPcontent[0]
                            
                            
                            
                        }
                        if let verynewLat_Long = newLat_lonContent?[1].components(separatedBy: stringSeperatorForLat_Lon) {
                            
                            
                            lat_long=verynewLat_Long[0]
                            
                            
                            
                        }
                        if let verynewLanguage = newLanguageContent?[1].components(separatedBy: stringSeperatorForLanguage) {
                            
                            
                            language=verynewLanguage[0]
                            
                            
                            
                        }
                    }else {
                        print("You have an error")
                    }
                }
                
                
                
                
            }
            
            DispatchQueue.main.sync(execute: {
                
                self.countryCourency.text = currency
                self.countryPopulation.text = population
                self.countryCallingCode.text = callingCode
                self.countryCapital.text = capital.capitalized
                self.countryArea.text = Area.replacingOccurrences(of: "<sup>", with: "p").replacingOccurrences(of: "</sup>", with: "")
                self.countryGDp.text = GDP
                self.countryLatLon.text = lat_long
                self.countryLanguage.text = language
                
            })
            
        }
        
        task.resume()

        
        
    }

    @IBAction func BackButtonPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
        
        
    }
    
}
