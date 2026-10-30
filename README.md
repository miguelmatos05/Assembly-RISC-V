# Arquitetura de Computadores — Projetos em Assembly RISC-V (RV32I)

Repositório com os trabalhos práticos e exercícios desenvolvidos no âmbito da unidade curricular de **Arquitetura de Computadores** (Engenharia Eletrotécnica e de Computadores / Engenharia Informática).

Os programas foram implementados e validados no simulador **RARS** (*RISC-V Assembler and Runtime Simulator*), tendo como alvo a arquitetura base **RV32I** (32 bits).

---

## 📌 Conteúdos do Repositório

### 1. Manipulação e Análise de Vetores
Sub-rotinas desenvolvidas com diferentes tipos e tamanhos de dados, respeitando o alinhamento de memória:
* **Determinação de extremos:** Cálculo do valor máximo e mínimo em vetores de dados do tipo `byte` com sinal, `unsigned word` e `halfword`.
* **Filtragem e contagem por intervalo:** Contagem de elementos que pertencem a um intervalo fechado `[a, b]`.
* **Operações bit a bit e paridade:** Identificação e contagem de números ímpares recorrendo a operações lógicas (`andi`).
* **Transformação in-place:** Inversão da ordem dos elementos de um vetor de inteiros de 32 bits em memória.

### 2. Processamento de Cadeias de Caracteres (Strings)
Implementação de algoritmos de manipulação de vetores de bytes terminados em `0x00` (`'\0'`):
* **Ocorrências de caracteres:** Sub-rotina para contar o número de repetições de um determinado carácter fornecido via registo.
* **Processamento de texto:** Contagem de palavras e separadores em texto ASCII.

---

## ⚙️ Convenções e Arquitetura

Todas as sub-rotinas seguem rigorosamente a ABI padrão do RISC-V:
* **Passagem de argumentos:** Registos `a0` a `a7` (com retornos entregues em `a0`/`a1`).
* **Registos temporários:** `t0` a `t6` (voláteis / *caller-saved*).
* **Registos guardados:** `s0` a `s11` (preservados pela sub-rotina chamada / *callee-saved*).
* **Sub-rotinas não-folha:** Gestão da pilha (*Stack*) com ajuste do `sp` múltiplo de 16 bytes para salvaguardar o endereço de retorno `ra` e registos de contexto.

---

## 🚀 Como Executar no RARS

1. Fazer o download do simulador [RARS](https://github.com/TheThirdOne/rars/releases) (requer Java).
2. Abrir o ficheiro assembly (`.asm` ou `.s`) no editor do RARS.
3. Montar o programa com a tecla `F3` (ou menu *Run → Assemble*).
4. Executar diretamente (`F5`) ou depurar passo a passo (*Step* / `F7`) acompanhando os registos e a memória.
