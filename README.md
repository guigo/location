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

---
Feito com coração, café e muito esforço :heart: :rocket: