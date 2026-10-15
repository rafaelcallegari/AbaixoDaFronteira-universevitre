# CLAUDE.md — protótipo de aprendizado Godot

## O que este projeto é

Andaime de aprendizado, descartável. **Não é o jogo.** O jogo real será um
JRPG curto: mapa andável top-down + combate lateral por turnos. Este
protótipo ensina esses mesmos sistemas em miniatura e depois vai pro lixo.

Contexto do Rafael: vem de Python (bot de RPG no Discord, discord.py +
SQLite, 40 módulos, 1200 testes). Lógica e arquitetura ele tem. O que falta
é modelo mental de engine: nó, cena, sinal, árvore, loop de frame, física.
Abriu o Godot pela primeira vez em 14/10/2026.

Ambiente: Godot 4.7.2 stable, editor em **português do Brasil**.
Viewport 320x180, stretch `canvas_items`, aspect `keep`, textura `Nearest`.

## DIVISÃO DE TRABALHO (a regra mais importante)

**O Rafael monta as cenas no editor. Claude escreve só os `.gd`.**

Não gerar nem editar `.tscn`. Godot é editor-cêntrico e `.tscn` escrito à mão
quebra fácil — mas o motivo principal é outro: montar a árvore de nós é
exatamente o que ele precisa aprender. Terceirizar isso derrota o propósito.

Cada etapa entrega duas coisas, separadas e nessa ordem:

1. **PARA O RAFAEL MONTAR** — a árvore de nós com passo a passo miúdo: que
   botão, que menu, que tipo de nó, que propriedade no Inspetor e para qual
   valor. Nomes de menu em **português** (Cena, Inspetor, Sinais, Criar Nó
   Raiz, Adicionar Nó Filho), nomes de tipo em **inglês** (CharacterBody2D,
   Area2D), que é como o Godot os mostra.
2. **CLAUDE ESCREVE** — os scripts completos, dizendo em que nó cada um é
   anexado.

**Parar ao fim de cada etapa** e esperar ele confirmar que rodou antes de
seguir. Nunca adiantar etapa.

## Restrições

- GDScript, nunca C#
- ZERO arte. `ColorRect` para tudo, cores diferentes para distinguir
- Nenhum plugin, nenhum asset de terceiro
- Um autoload só, e só na etapa 3
- Nenhum TileMapLayer. Parede é `StaticBody2D` com `CollisionShape2D`
- Nenhum teste automatizado — nesta fase custa mais do que paga

## Como explicar (isso é metade do trabalho)

Antes do código de cada etapa, um parágrafo curto: que conceito de engine a
etapa ensina, e por que a solução é essa e não a óbvia vinda de Python.

Dizer na cara onde a diferença com Python é armadilha:

- por que `_process` e `_physics_process` são coisas diferentes, e qual usar
  para movimento
- por que sinal existe, e por que é melhor que o nó de cima ficar perguntando
  o estado do nó de baixo todo frame
- o que `@onready` resolve, e o que acontece sem ele
- por que `get_node("../../Algo")` funciona e é dívida
- quando trocar de cena e quando sobrepor cena

Comentário no código explica **o porquê da escolha de engine**, nunca o que a
linha faz.

## O que NÃO fazer

- Não escrever nem editar `.tscn`
- Não criar save, inventário, ficha, equipamento, loja ou party
- Não usar `Resource` customizado
- Não instalar nada
- Não fazer arte nem procurar asset
- Não adiantar etapa antes do Rafael confirmar que a anterior rodou

## Rodar pela linha de comando

O caminho do `godot.exe` fica em `.claude/godot-path.txt` — ler dali, não
perguntar de novo. Comando:

```
"<caminho do godot.exe>" --path .
```

A saída do jogo (erros e `print`) volta no terminal.

## Entrega

Quatro commits, um por etapa, **cada um rodando** — commitar só depois do
Rafael confirmar. No fim, um `README.md` curto com o que cada cena faz e os
três exercícios dele.
