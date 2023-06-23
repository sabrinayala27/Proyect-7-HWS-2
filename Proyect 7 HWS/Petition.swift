//
//  Petition.swift
//  Proyect 7 HWS
//
//  Created by Sabrina Ayala on 08/05/2023.
//

import Foundation

// protocol = Codable .
// estan dentro de un array de datos por lo tanto para utilizarlos necesitamos desenvolver el array con otra estructura
//parsear JSON -> procesar y examinar su contenido
struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}
