//
//  HomeViewModel.swift
//  NIBM Broker
//
//  Created by Kushani Abeysinghe on 2022-04-01.
//

import SwiftUI
import Firebase
import CoreLocation

//Fetching User Location
class HomeViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    @Published var locationManager = CLLocationManager()
    @Published var search = ""
    
    // Location Details
    @Published var userLocation : CLLocation!
    @Published var userAddress = ""
    @Published var noLocation = false
    
    //ItemData
    @Published var items: [Item] = []
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager){
        //checking location access..
        switch manager.authorizationStatus {
        case .authorizedWhenInUse:
            print("authorized")
            self.noLocation = false
            manager.requestLocation()
        case .denied:
            print("denied")
            self.noLocation = true
        default:
            print("Unknow")
            self.noLocation = false
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error){
        print(error.localizedDescription)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        // reading user location & Extracting Details
        
        self.userLocation = locations.last
        self.extractLocation()
        self.login()
        
    }
    
    func extractLocation(){
        
        CLGeocoder().reverseGeocodeLocation(self.userLocation) { (res, err) in
            guard let safeData = res else{return}
            
            var address = ""
            
            //Getting area and locatlity name
            
            address += safeData.first?.name ?? ""
            address += ""
            address += safeData.first?.locality ?? ""
            
            self.userAddress = address
        }
    }
    
    func fetchData(){
        
        let db = Firestore.firestore()
        
        db.collection("Items").getDocuments { (snap, err) in
            
            guard let itemData = snap else{return}
            
            self.items = itemData.documents.compactMap({ (doc) -> Item? in
                
                let id = doc.documentID
                let type = doc.get("item_type") as! String
                let cost = doc.get("item_cost") as! String
                let size = doc.get("item_size") as! String
                let image = doc.get("item_image") as! String
                let district = doc.get("item_district") as! String
                let town = doc.get("item_town") as! String
                //let contact = doc.get("contact") as! NSNumber
                
                return Item(id: id, item_type: type, item_cost: cost, item_size: size, item_image: image, item_district: district, item_town: town)
            })
        }
    }
    
    func login(){
        
        Auth.auth().signInAnonymously { res, err in
            if err != nil{
                print(err!.localizedDescription)
                return
            }
            print("Success = \(res!.user.uid)")
        }
        
        self.fetchData()
    }
}
