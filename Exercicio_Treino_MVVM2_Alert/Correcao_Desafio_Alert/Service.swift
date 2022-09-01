//
//  Service.swift
//  Correcao_Desafio_Alert
//
//  Created by Gabriel Policastro on 02/06/22.
//

import Foundation


class Service {
    
    private let filmes: [Filme] = [
        Filme(poster: "cidade_de_deus",
              nome: "Cidade de Deus",
              ano: 2000,
              genero: "Crime"
             ),
        Filme(poster: "harry_potter",
              nome: "Harry Potter",
              ano: 2000,
              genero: "Infantil"
             ),
        Filme(poster: "cassino_royale",
              nome: "Cassino Royale",
              ano: 2000,
              genero: "Ação"
             ),
        Filme(poster: "as_branquelas",
              nome: "As Branquelas",
              ano: 2000,
              genero: "Comédia"
             ),
        Filme(poster: "senhor_dos_aneis",
              nome: "Senhor dos Aneis",
              ano: 2000,
              genero: "Fantasia"
             ),
        Filme(poster: "wolf",
              nome: "Lobo de Wall Street-",
              ano: 2000,
              genero: "Drama"
             ),
        Filme(poster: "holy_mountain",
              nome: "Holy Mountain-",
              ano: 2000,
              genero: "Fantasia"
             ),
    ]
    
    func getListaDeFilmes(somaUm: @escaping ([Filme]) -> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            somaUm(self.filmes)
        })
    }
}
