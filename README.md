# Calculadora de IMC.

Projeto de calculadora IMC em Flutter da DIO - Bootcamp Santander.

## Requisitos:
<ol>
    <li>- [x] Criar classe IMC (Peso / Altura)​​</li>
    <li>- [x] Altura ler em tela de Configurações​</li>
    <li>- [x] Ler dados no app​</li>
    <li>- [x] Calcular IMC ​</li>
    <li>- [x] Gravar dados no SQLite​ ​</li>
    <li>- [x] Exibir em uma lista​​ ​</li>
</ol>

## Fluxograma:


```mermaid
graph LR
A((Inicio)) --> B[Home Page]
B -- Calcular IMC --> C[Insere Dados]
C --> E{Dados Corretos?}
E -- Sim --> F[Exibe Dados e Salva no SQFlite]
E -- Não --> G[Tratativa de Erros]
B --> H[Carrega Histórico no SQFlite]
H --> I[Lista de Cálculos Anteriores]
I -- Remover Index --> J[Excluir Item]
J -- Dado Removido --> I
H -- Voltar --> B
B --> K[Configurações]
K -- Insere Dados --> L{Dados Corretos?}
L -- Sim --> M[Salva Shared Preferences]
L -- Não --> N[Tratativa de erros]
M --> B
K -- Voltar --> B
```

### Minhas redes sociais, conecte-se comigo:
[![Perfil DIO](https://img.shields.io/badge/-Meu%20Perfil%20na%20DIO-30A3DC?style=for-the-badge)](https://www.dio.me/users/otavio_89908)

[![LinkedIn](https://img.shields.io/badge/-LinkedIn-000?style=for-the-badge&logo=linkedin&logoColor=30A3DC)](https://www.linkedin.com/in/ot%C3%A1vio-cunha-827560209/)

[![GitHub](https://img.shields.io/badge/-github-000?style=for-the-badge&logo=github&logoColor=30A3DC)](https://github.com/otaviotfcunha)

### Um pouco do meu GitHub:

![Top Langs](https://github-readme-stats-git-masterrstaa-rickstaa.vercel.app/api/top-langs/?username=otaviotfcunha&layout=compact&bg_color=000&border_color=30A3DC&title_color=FFF&text_color=FFF)

![GitHub Stats](https://github-readme-stats.vercel.app/api?username=otaviotfcunha&theme=transparent&bg_color=000&border_color=30A3DC&show_icons=true&icon_color=30A3DC&title_color=FFF&text_color=FFF)


