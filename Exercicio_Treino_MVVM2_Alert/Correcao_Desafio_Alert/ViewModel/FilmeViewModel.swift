//
//  FilmeViewModel.swift
//  Correcao_MVVM(Alert)
//
//  Created by Gabriel Policastro on 02/06/22.
//

import Foundation

class FilmeViewModel {
    private let filme: Filme
    
    init(filme: Filme) {
        self.filme = filme
    }
    
    func getNome() -> String {
        let nome = removerHifen()
        return nome
    }
    
    private func removerHifen() -> String {
        var tituloFilme = filme.nome
        if tituloFilme.contains("-") {
            tituloFilme.removeLast()
            return tituloFilme
        }
        return tituloFilme
    }
}
