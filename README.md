# CheckList de Viagem

Uma aplicação mobile desenvolvida com **Flutter** que permite criar e gerenciar checklists de viagem de forma organizada e intuitiva.

## 🚀 Funcionalidades

- **Tela Home**: Visualiza todas as viagens cadastradas com cards contendo nome, tipo, data e barra de progresso colorida
- **Cadastro de Viagem**: Formulário para registrar novas viagens com nome, tipo e data
- **Checklist Específico**: Gerencia itens da viagem selecionada com opções de marcar/desmarcar e finalizar
- **Barra de Progresso**: Sistema visual com cores baseadas no percentual de conclusão
- **Interface intuitiva**: Design limpo e navegação simples entre as telas
- **Gestão de itens**: Adicionar, editar e controlar status dos itens do checklist

## 👥 Equipe
- Lucas Alcântara Pinho da Nóbrega - RGM: 29319161
- Tiago Monteiro Simões Cavalcante - RGM: 31638228
- Victor Medeiros Cavalcante - RGM: 30004772

## 📁 Estrutura do projeto
```
checklist_viagem/
├── lib/
│   ├── screens/
│   │   ├── home_screen.dart           # Tela principal com lista de viagens
│   │   ├── travel_form_screen.dart    # Formulário de cadastro de viagem
│   │   └── checklist_screen.dart      # Tela do checklist específico
│   ├── models/
│   │   ├── travel.dart                # Modelo de dados da viagem
│   │   └── checklist_item.dart        # Modelo de dados do item
│   ├── widgets/
│   │   └── travel_card.dart           # Widget do card de viagem
│   └── main.dart                      # Arquivo principal
├── pubspec.yaml                       # Dependências Flutter
└── README.md                          # Este arquivo
```

## 🎨 Sistema de Cores do Progresso

- **Vermelho (0-49%)**: Viagem com poucos itens concluídos
- **Laranja (50%-99%)**: Viagem com progresso moderado
- **Verde (100%)**: Viagem completa

## 📱 Telas do Aplicativo

### Home
- Lista todas as viagens cadastradas
- Cards com informações resumidas e progresso visual
- Navegação para cadastro de nova viagem

### Cadastro de Viagem
- Campos: Nome da viagem, Tipo da viagem, Data
- Validação de formulário
- Retorno automático para tela principal

### Checklist da Viagem
- Exibe itens específicos da viagem selecionada
- Adicionar novos itens ao checklist
- Marcar/desmarcar itens como concluídos
