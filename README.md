# Aplicativo de Gerenciamento de Clientes para Panificadora

## Visão Geral

Este aplicativo foi desenvolvido como parte de uma proposta de atividade avaliativa para o professor Igor Falcão. Utilizando a tecnologia Flutter e o plugin `sqflite` para persistência de dados SQLite, o aplicativo oferece uma solução eficiente para a gestão de clientes em uma panificadora. Proporciona uma experiência intuitiva e prática para o cadastro, visualização, edição e exclusão de clientes.

## Funcionalidades Principais

### Tela Inicial

A tela inicial apresenta uma lista organizada de todos os clientes cadastrados na panificadora. Essa listagem permite uma rápida visualização das informações essenciais sobre cada cliente.

##### Ações possiveis

- Inicializar o app a primeira vez realiza o **create** da tabela Clientes

### Tela de Cadastro

Na tela de cadastro, os usuários podem adicionar novos clientes fornecendo informações essenciais, como nome, bairro e descrição. O processo é simplificado, com um botão claramente identificado para finalizar o cadastro e armazenar os dados na base de dados SQLite utilizando o `sqflite`.

##### Ações possiveis

- **insert** na tabela Client

### Tela de Edição

A tela de edição permite que os usuários modifiquem as informações de um cliente existente. Os campos de nome, bairro e descrição são apresentados para edição. Além disso, são fornecidos botões distintos para salvar as alterações e deletar o cliente, proporcionando controle total sobre os dados.

##### Ações possiveis

- **delete** na tabela Client
- **update** na tabela Client

## Tecnologias Utilizadas

- **Flutter:** O aplicativo é desenvolvido em Flutter, um framework open-source para a criação de interfaces de usuário multiplataforma.
- [**SQLite e sqflite:**](https://pub.dev/packages/sqflite/install) A persistência de dados é gerenciada através do SQLite, utilizando o plugin [`sqflite`](https://pub.dev/packages/sqflite/install) do Flutter, que fornece uma camada de abstração para facilitar a integração e operações no banco de dados SQLite.

## Integrantes

- Leonardo filho
- Paulo Eduardo
- Filipe Borja e Douglas Ronan

## Conclusão

O aplicativo de gerenciamento de clientes para panificadora oferece uma solução moderna e eficaz para simplificar as tarefas administrativas relacionadas aos clientes. Com uma interface intuitiva e funcionalidades bem projetadas, o app proporciona uma experiência fluida aos usuários, tornando o processo de cadastro, edição e exclusão de clientes uma tarefa simples e organizada.

## Dependencias necessarias para Executar o Projeto

- Flutter SDK
- Java 8
- Android SDK
- Emulador android(virtual device)

Siga os passos abaixo para clonar e executar o projeto:

## Passo a Passo para Clonar e Executar o Projeto

Siga os passos abaixo para clonar e executar o projeto:

1. **Clone o Repositório:**

   ```bash
   git clone https://github.com/EuSouOMendes/app-panificadora.git

   ```

2. **Acesse o Diretório do Projeto:**

   ```Bash
   cd app-panificadora
   ```

3. **Instale as Dependências:**

   ```Bash
   flutter pub get
   ```

4. **Execute o Projeto:**

   ```Bash
   flutter run
   ```

Certifique-se de ter o Flutter e o Dart SDK instalados na sua máquina antes de executar os comandos acima
