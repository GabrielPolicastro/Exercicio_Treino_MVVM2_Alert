//
//  Filme.swift
//  Correcao_Desafio_Alert
//
//  Created by Gabriel Policastro on 02/06/22.
//

import Foundation


class Filme {
    let poster: String 
    let nome: String
    let ano: Int
    let genero: String
    
    init(poster: String, nome: String, ano: Int, genero: String) {
        self.poster = poster
        self.nome = nome
        self.ano = ano
        self.genero = genero
    }
}
