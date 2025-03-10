//
//  MapView.swift
//  Jungle
//
//  Created by Rahul choudhary on 07/03/25.
//

import SwiftUI
import MapKit

struct MapView: View {
    //MARK: - PROPERTIES
    @State private var region: MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        var mapRegion: MKCoordinateRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        return mapRegion
    }()
    
    let locations : [NationalParklocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        //MARK: - 1. BASIC MAP
        //Map(coordinateRegion: $region)
        //MARK: - 2. ADVANCE MAP
        Map(coordinateRegion: $region,annotationItems: locations, annotationContent: {
            item in
            
            // 1. OLD STYLE PIN
            // MapPin(coordinate: item.loction, tint: .accentColor)
            
            // 2. MAP MARKER
            // MapMarker(coordinate: item.loction, tint: .accentColor)
            
            // 3. CUSTOM MAP ANNOTAION
//            MapAnnotation(coordinate: item.loction){
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 30, height: 30, alignment: .center)
//            }//: ANNOTATION
            
            //Custom map annotation
            MapAnnotation(coordinate: item.loction){
                mapAnnotationView(location: item)
            }
        })//: MAP
        .overlay(
            HStack(alignment: .center, spacing: 12){
                Image("compass")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 48, height: 48, alignment: .center)
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Lattitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                }
            }//: HSTACK
                .padding(.vertical,12)
                .padding(.horizontal,16)
                .background(
                    Color.black
                        .cornerRadius(12)
                        .opacity(0.6)
                )
                .padding()
            , alignment: .top
        )
    }
}

#Preview {
    MapView()
}
