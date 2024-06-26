# Critical-Nutrition-ML
- Instituição: Universidade Estadual de Santa Cruz
- Curso: Ciência da Computação
- Projeto: Análise do impacto da nutrição na mortalidade de pacientes críticos: um experimento utilizando aprendizado de máquina

#### **Introdução**

#### **Prazo de entrega**
19/06/2024.

## Conteúdo
- Tecnologias;
- ETL;
- EDA;
- Machine Learning Model;
- Instalação;
- Organização do projeto.

## Tecnologias
- Python;
- Conda;
- Jupyter;
- Numpy;
- Pandas;
- Pymannkendall;
- Shap;
- Matplotlib;
- Seaborn;
- Scikit-learn;
- Imbalanced-learn;
- Ipykernel.

## Instalação
Foi utilizado o [Python](https://www.python.org/) v3.11.8.

### Conda
No desenvolvimento foi utilizado o gerenciador de pacotes e ambientes [Conda](https://docs.conda.io/en/latest/). Portanto para prosseguir necessita-se de sua instalação.

Navegar até a pasta de destino
```sh
cd utils
```

Instalar dependências
```sh
conda env create -f environment.yml
```

Ativar
```sh
conda activate tcc_venv
```

Desativar
```sh
conda deactivate
```

### Requirements
Pode-se utilizar o arquivo requirements.txt para criar o ambiente virtual.

Criar ambiente virtual
```sh
python -m venv tcc_venv
```

Ativar
```sh
source ./tcc_venv/bin/activate
```

Navegar até a pasta de destino
```sh
cd utils
```

Instalar dependências
```sh
pip install -r requirements.txt
```

Desativar
```sh
deactivate
```

## Organização do projeto
```sh
.
├── LICENSE
├── main
│   ├── EDA
│   │   └── main.ipynb
│   ├── ETL
│   │   ├── evacuation.ipynb
│   │   ├── fluid_balance.ipynb
│   │   ├── hemodialysis.ipynb
│   │   ├── invasive_ventilation.ipynb
│   │   ├── new_time_window.ipynb
│   │   ├── script.sql
│   │   └── temperature.ipynb
│   └── Machine Learning
│       ├── model_tcc.ipynb
│       └── split_test.ipynb
├── Readme.md
└── utils
    └── enviroment.yml
```