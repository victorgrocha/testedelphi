# Projeto de Pedido em Delphi 12

## Descrição

Este projeto é uma aplicação de gerenciamento de pedidos desenvolvida em Delphi 12, utilizando FireDAC para interação com um banco de dados MySQL. A aplicação permite que os usuários cadastrem clientes, adicionem produtos a um pedido e gerenciem os detalhes do pedido de forma simples e eficiente.

## Funcionalidades

- **Cadastro de Clientes**: Permite buscar e adicionar novos clientes ao sistema.
- **Gerenciamento de Produtos**: Permite buscar produtos e adicionar itens a um pedido.
- **Gravar Pedidos**: Os pedidos podem ser gravados no banco de dados com todos os detalhes dos itens e do cliente.
- **Cálculo de Total do Pedido**: O valor total do pedido é calculado automaticamente com base nos itens adicionados.

## Tecnologias Utilizadas

- **Delphi 12**: Ambiente de desenvolvimento utilizado para criar a aplicação.
- **MySQL**: Sistema de gerenciamento de banco de dados utilizado para armazenar dados dos pedidos e clientes.
- **FireDAC**: Biblioteca utilizada para realizar a conexão e manipulação de dados no banco MySQL.

## Estrutura do Projeto

- **UnitPedido.pas**: Contém a lógica principal da aplicação, incluindo as classes para Clientes, Produtos, Itens de Pedido e a implementação da interface do usuário.
- **UnitBD.pas**: Contém a lógica para conexão com o banco de dados e operações de consulta.

