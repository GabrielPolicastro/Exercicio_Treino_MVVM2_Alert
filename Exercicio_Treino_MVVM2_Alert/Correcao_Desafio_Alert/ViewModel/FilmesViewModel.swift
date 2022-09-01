//
//  FilmesViewModel.swift
//  Correcao_Desafio_Alert
//
//  Created by Gabriel Policastro on 02/06/22.
//

import Foundation

protocol FilmesViewModelDelegate {
    func reloadData()
}
// FilmesViewModel instancia a classe filho Filme
class FilmesViewModel { // a viewModel serve para fazer a logica da tabela, como quantidade de linhas e celulas
    var delegate: FilmesViewModelDelegate? // usou essa var para assinar o protocolo e usar a funcao reloadData
    var quantidadeDeFilmes: Int = 0
    
    
    private var listaDeFilmes: [Filme] = []
    private var listaDeFilmesFavoritos: [Filme] = []
    private let service = Service() // essa é uma instancia de Serviço, ela se comunica com Servico para que a classe ViewModel consiga buscar o array de filmes.
    
    
    func buscaFilmes() {  // essa funcao vai na Service buscar a lista de filmes, e ela tambem precisa estar na ViewControler, em ViewDidLoad, pois é na tela que ela chama os filmes( com delay de 10 segundos)
        
        service.getListaDeFilmes(somaUm: {
            filmes in
            // eu tenho meu array de filmes
            self.quantidadeDeFilmes = filmes.count
            self.listaDeFilmes = filmes
            
            self.delegate?.reloadData()
        })
    }
    
    func getCellViewModel(posicao: Int) -> FilmeViewModel {
        let filme = listaDeFilmes[posicao] // eh a mesma coisa q ficaria na viewController com indexpath.row, mas no caso ela pede a posicao por parametro com Int
        let cellViewModel = FilmeViewModel(filme: filme)
        return cellViewModel
    }
    
    
    func getDetalheDoFilmeViewModel(posicao: Int?) -> DetalheDoFilmeViewModel? {
        guard let posicao = posicao else { return nil }
        
        let filmeSelecionado = listaDeFilmes[posicao] //
        let ehFavorito = listaDeFilmesFavoritos.contains { filmeFavorito in
            return filmeSelecionado.nome == filmeFavorito.nome //
        }
        
        
        let detalheDoFilmeViewModel = DetalheDoFilmeViewModel(filme: filmeSelecionado, ehFavorito: ehFavorito)
        detalheDoFilmeViewModel.favoritoDelegate = self
        
        return detalheDoFilmeViewModel
    }
}

extension FilmesViewModel: FavoritoDelegate {
    func removerDosFavoritos(filme: Filme) {
        listaDeFilmesFavoritos.removeAll { filmeFavorito in
            return filme.nome == filmeFavorito.nome
        }
    }
    
    func adicionarNosFavoritos(filme: Filme) {
        listaDeFilmesFavoritos.append(filme)
    }
}
