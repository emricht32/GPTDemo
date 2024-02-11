//
//  ContentView.swift
//  GPTDemo
//
//  Created by Jonathan Emrich on 2/10/24.
//
import SwiftUI
import Combine

// Protocol for the service that fetches place information
protocol PlaceInfoServiceProtocol {
    func fetchPlaceInfo() async throws -> PlaceInfo
}

// Concrete service that fetches the information
class PlaceInfoService: PlaceInfoServiceProtocol {
    func fetchPlaceInfo() async throws -> PlaceInfo {
        // Simulate network request
        // Replace this with actual networking code to fetch data from an API
        return await withCheckedContinuation { continuation in
            // Simulate network delay
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                continuation.resume(returning: PlaceInfo(imageURL: URL(string: "https://picsum.photos/id/237/200/300")!,//url not added by gpt
                                                        locationName: "Miami, Florida",
                                                        distance: "1 mi away",
                                                        dateRange: "Nov 3-10",
                                                        pricePerNight: "$567"))
            }
        }
    }
}

// ViewModel for each place card
class PlaceCardViewModel: ObservableObject {
    @Published var placeInfo: PlaceInfo?
    var service: PlaceInfoServiceProtocol
    
    init(service: PlaceInfoServiceProtocol) {
        self.service = service
    }
    
    // Method to load place information
    func loadPlaceInfo() {
        Task {
            do {
                let fetchedInfo = try await service.fetchPlaceInfo()
                DispatchQueue.main.async {
                    self.placeInfo = fetchedInfo
                }
            } catch {
                print(error)
            }
        }
    }
}

// Model to hold the fetched place information
struct PlaceInfo {
    var imageURL: URL
    var locationName: String
    var distance: String
    var dateRange: String
    var pricePerNight: String
}

// SwiftUI View for the Place Card
struct PlaceCard: View {
    @ObservedObject var viewModel: PlaceCardViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            // AsyncImage introduced in iOS 15 to load images from a URL
            AsyncImage(url: viewModel.placeInfo?.imageURL) { image in
                image.resizable()
            } placeholder: {
                Color.gray
            }
            .aspectRatio(contentMode: .fill)
            .frame(height: 200)
            .clipped()
            
            HStack {
                VStack(alignment: .leading) {
                    Text(viewModel.placeInfo?.locationName ?? "")
                        .font(.headline)
                    Text(viewModel.placeInfo?.distance ?? "")
                        .font(.subheadline)
                    Text(viewModel.placeInfo?.dateRange ?? "")
                        .font(.subheadline)
                }
                Spacer()
                VStack(alignment: .trailing) {
                    Text(viewModel.placeInfo?.pricePerNight ?? "")
                        .font(.title)
                    Text("/ night")
                        .font(.subheadline)
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.loadPlaceInfo()
        }
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}
struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                // Search Bar
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Where to?", text: .constant(""))
                    Button(action: {}) {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()

                // List of Cards
                ScrollView {
                    VStack(spacing: 20) {
                        ForEach(0..<10) { _ in
                            PlaceCard(viewModel: PlaceCardViewModel(service: PlaceInfoService()))
                        }
                    }
                }

                Spacer()

                // Tab Bar
                TabBar()
            }
            .navigationTitle("Explore")
        }
    }
}

struct TabBar: View {
    var body: some View {
        HStack {
            Spacer()
            Button(action: {}) {
                Image(systemName: "house.fill")
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "heart")
            }
            Spacer()
            Button(action: {}) {
                Image(systemName: "person.fill")
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .shadow(radius: 5)
    }
}

#Preview{
    ContentView()
}
//    }
//}

// Example Usage
//struct ContentView: View {
//    var body: some View {
//        PlaceCard(viewModel: PlaceCardViewModel(service: PlaceInfoService()))
//    }
//}
