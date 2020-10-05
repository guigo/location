## :computer: Projeto

Loca.ai é uma plataforma simples para cadastro de veiculo para locação, 
precisando apenas de nome, cpf, email e senha.

Um projeto para o teste da Ao³, configurações e como funciona toda organização dos projetos.

## :pushpin: Tecnologias

Esse projeto foi desenvolvido com as seguintes tecnologias:

- [Rails](https://rubyonrails.org/)
- [Ruby](https://www.ruby-lang.org/pt/)
- [Postgres](https://www.postgresql.org/)
- [Yarn Workspaces](https://classic.yarnpkg.com/en/docs/workspaces/)
- [Docker](https://www.docker.com/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## :point_down: Executando o projeto

No seu terminal copie e cole ou digite o comando abaixo:

```git
git clone https://github.com/guigo/location.git
````

Após realizar o clone acesse a pasta do projeto:

```git
cd location
````

Logo em seguida digite o comando __*yarn*__ para baixar e atualizar as dependências do projeto  

Para executar o projeto local primeiramente, digite em seu terminal os comandos:

*é necessário que você tenha configurado seu banco de dados e*
*alterado as informações do arquivo database.yml conforme seu banco de dados*

```terminal
docker-compose build
````

```terminal
docker-compose run web rails db:setup
````

```terminal
docker-compose run web rails db:seed
````

```terminal
docker-compose up
````

## :point_down: Acessando o projeto

```terminal
email: admin@locaai.com.br
senha: 123456
````

O sistema possui dois tipos de usuarios, admin e cliente:

Cliente: Acessa apenas o layout do portal, e reserva de veiculos.
Admin: Acessar o cadastro de veiculo e cadastro usuarios.

Quando o cliente reservar um carro, e entrar no veiculo para efeturar uma nova reserva as datas da antiga solcitação está bloqueadar no datepicker.

Obs: Se o usuario não estiver logado no sistema, será solicitado o login para que o mesmo possa efeturar a reserva. Após o login o usuario é redirecionado a tela do veiculo no qual deseja reservar.

 Na consulta para o site da fipe, estou utilizando a gem [Fipe Api](https://github.com/caiofct/fipe_api)

## :point_down: Executando os testes

  Esta sendo utilizado as seguintes gem's para teste:

- [RSpec](https://github.com/rspec/rspec-rails)
- [Factory Bot](https://github.com/thoughtbot/factory_bot)
- [Database Cleaner](https://github.com/DatabaseCleaner/database_cleaner)
- [Shouda Matcher](https://github.com/thoughtbot/shoulda-matchers)
- [Faker](https://github.com/faker-ruby/faker)


```terminal
bundle exec rspec spec/
````

Obs: esta senddo coberto nos teste, as rotas os modelo e relacionamento. Devido o tempo não consegui finalizar os teste de controller.

---
Feito com coração, café e muito esforço :heart: :rocket: