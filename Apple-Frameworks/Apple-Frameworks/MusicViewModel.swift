//
//  MusicViewModel.swift
//  Apple-Frameworks
//
//  Created by Mark Dubouzet on 1/10/25.
//

 
import SwiftUI

struct MusicItem:  Identifiable, Decodable {
    let id = UUID() // For SwiftUI List
    let trackId: Int
    let trackName: String
    let artistName: String
    let artworkUrl100: String // 100x100 album art URL
    
    private enum CodingKeys: String, CodingKey {
        case trackId, trackName, artistName, artworkUrl100// No "id" here
    }
}

class MusicViewModel: ObservableObject {
    @Published var musicItems: [MusicItem] = []

    func fetchMusic(searchTerm: String) {
        let formattedTerm = searchTerm.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""
        let urlString = "https://itunes.apple.com/search?term=\(formattedTerm)&entity=song&limit=200"

        guard let url = URL(string: urlString) else { return }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let result = try JSONDecoder().decode(SearchResult.self, from: data)
                    DispatchQueue.main.async {
                        self.musicItems = result.results
                    }
                } catch {
                    print("Error decoding JSON: \(error)")
                }
            }
        }.resume()
    }
}

struct SearchResult: Decodable {
    let results: [MusicItem]
}
