//
//  ViewController.swift
//  pickerViewComponent
//
//  Created by Abiu Roldan on 12/6/17.
//  Copyright © 2017 Abiu Roldan. All rights reserved.
//

import UIKit

class Country{
    var country: String
    var cities: [String]
    
    init (country: String, cities: [String]){
        self.cities = cities
        self.country = country
    }
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var countryLabel: UILabel!
    
    var countries = [Country]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        countriesAndCities()
        pickerView.delegate = self
        pickerView.dataSource = self
        
    }
    
    func countriesAndCities(){
        countries.append(Country(country: "Mexico", cities:["Aguascalientes", "Baja California", "Baja California Sur", "Campeche", "Ciudad de Mexico", "Coahuila", "Colima", "Chiapas", "Chihuahua", "Durango", "Guanajuato", "Guerrero", "Hidalgo", "Jalisco", "Estado de Mexico", "Michoacan", "Morelos", "Nayarit", "Nuevo Leon", "Oaxaca", "Puebla, ","Queretaro", "Quintana Roo", "San Luis Potosi", "Sinaloa", "Sonora", "Tabasco", "Tamaulipas", "Tlaxcala", "Veracruz", "Yucatan", "Zacatecas"]))
        countries.append(Country(country: "USA", cities: ["Alabama", "New York City", "Washinton", "Nashvill"]))
        countries.append(Country(country: "Australia", cities: ["Sydney", "Melbourne"]))
        countries.append(Country(country: "India", cities: ["Delhi", "Ahmedabad", "Mumbai"]))
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0{
            return countries.count
        }
        else{
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countries[selectedCountry].cities.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return countries[row].country
        }
        else{
            let selectedCountry = pickerView.selectedRow(inComponent: 0)
            return countries[selectedCountry].cities[row]
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerView.reloadComponent(1)
        
        let selectedCountry = pickerView.selectedRow(inComponent: 0)
        let selectedCity = pickerView.selectedRow(inComponent: 1)
        let country = countries[selectedCountry].country
        let city = countries[selectedCountry].cities[selectedCity]
        
        countryLabel.text = "Country: \(country)\nCity: \(city)"
        
    }
    

}

