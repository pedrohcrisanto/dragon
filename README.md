
# Teste Desenvolvedor

O projeto consiste na criação de uma API para uma Lista de contatos.

É possivel cadastrar dados assim como visualizar as demais informações, incluindo o endereço do contato com a localização no mapa.

## Configuração

Clone o projeto

```sh
$ git clone https://github.com/pedrohcrisanto/dragon.git
```

Instale as dependências
```sh
$ bundle install
```

Crie o banco e migre as tabelas
```sh
$ rake db:create db:migrate 
```

Inicie o servidor
```sh
$ rails s
```

Para realizar Testes
```sh
$ bundle exec rspec
```

## Postman
Na raiz do projeto existe uma coleção do postman, onde é possivel exportar e visualizar os endpoints disponiveis.

