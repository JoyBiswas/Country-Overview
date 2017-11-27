//
//  ViewController.swift
//  Country OverView
//
//  Created by MacBook Air on 11/25/17.
//  Copyright © 2017 MacBook Air. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {

    
    @IBOutlet weak var countryInput: UITextField!
    
    var countryPopulation:String!
    var countryCourency:String!
    
    let countryArray = ["afghanistan","albania","algeria","americansamoa","andorra","angola","anguilla","antarctica","antiguaandbarbuda","argentina","armenia","aruba","australia","austria","azerbaijan","bahamas","bahrain","bangladesh","barbados","belarus","belgium","belize","benin","bermuda","bhutan","bolivia","bosnia","botswana","brazil","britishindianoceanterritory","britishvirginislands","brunei","bulgaria","burkinafaso","burundi","cambodia","cameroon","canada","capeverde","caymanislands","entralafricanrepublic","chad","chile","china","christmasisland","cocoskeelingislands","colombia","comoros","cookislands","costarica","croatia","cuba","curacao","cyprus","czechrepublic","congodemocraticrepublic","denmark","djibouti","dominica","dominicanrepublic","easttimor","ecuador","egypt","elsalvador","equatorialguinea","eritrea","estonia","ethiopia","falklands","faroeislands","fiji","finland","france","frenchpolynesia","gabon","gambia","germany","georgia","ghana","gibraltar","greece","greenland","grenada","guam","guatemala","guernsey","guinea","guineabissau","guyana","haiti","honduras","hongkong","hungary","iceland","india","indonesia","iran","iraq","ireland","isleofman","israel","italy","ivorycoast","jamaica","japan","jersey","jordan","kazakhstan","kenya","kiribati","kosovo","kuwait","kyrgyzstan","laos","latvia","lebanon","lesotho","liberia","libya","liechtenstein","lithuania","luxembourg","macau","macedonia","madagascar","malawi","malaysia","maldives","mali","malta","marshallislands","mauritania","mauritius","mayotte","mexico","micronesia","moldova","monaco","mongolia","montenegro","montserrat","morocco","mozambique","burma","namibia","nauru","nepal","netherlands","netherlandsantilles","newcaledonia","newzealand","nicaragua","niger","nigeria","niue","northkorea","northernmarianaislands","norway","oman","pakistan","palau","palestine","panama","papuanewguinea","paraguay","peru","philippines","pitcairnislands","poland","portugal","puertorico","qatar","congo","reunion","romania","russia","rwanda","saintbarthelemy","sthelena","stkitts","stlucia","stmartin","stpierre","stvincent","samoa","sanmarino","saotomeandprincipe","saudiarabia","senegal","serbia","seychelles","sierraleone","singapore","sintmaarten","slovakia","slovenia","solomonislands","somalia","southafrica","southkorea","southsudan","spain","srilanka","sudan","suriname","svalbard","swaziland","sweden","switzerland","syria","taiwan","tajikistan","tanzania","thailand","togo","tokelau","tonga","trinidadandtobago","tunisia","turkey","turkmenistan","turksandcaicos","tuvalu","virginislands","uganda","ukraine","uae","uk","usa","uruguay","uzbekistan","vanuatu","vatican","venezuela","vietnam","wallisandfutuna","westernsahara","yemen","zambia","zimbabwe"]
    
    var picker = UIPickerView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        picker.backgroundColor = UIColor.white
        
        countryInput.inputView = picker
        
        picker.delegate = self
        picker.dataSource = self
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return countryArray.count
        
        
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryArray[row].capitalized
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        countryInput.text = countryArray[row].capitalized
        
        self.view.endEditing(false)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toSelectedCountry" {
            
           let selecteCountry = segue.destination as! CountryDetailsVC
            
            selecteCountry.selectedCountry = countryInput.text!.lowercased()
            
          
            
        }

    
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        self.countryInput.text = ""
    }

    @IBAction func goButtonPressed(_ sender: Any) {
        
        
    }
    

    


}

