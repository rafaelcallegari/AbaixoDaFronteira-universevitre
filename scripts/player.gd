extends CharacterBody2D

# Pixels por segundo. Num viewport de 320x180 isso atravessa a tela em pouco
# mais de 4 segundos — rápido o bastante pra não ser chato, lento o bastante
# pra dar pra ver a colisão acontecendo.
const VELOCIDADE := 70.0


func _physics_process(_delta: float) -> void:
	# get_vector lê as quatro ações de uma vez e devolve um vetor já
	# normalizado. Somar -1/+1 em x e y na mão faz a diagonal ficar 41% mais
	# rápida que a reta — é o primeiro bug de movimento que todo mundo escreve.
	var direcao := Input.get_vector(
		"mover_esquerda", "mover_direita", "mover_cima", "mover_baixo"
	)

	# `velocity` não é variável local: é propriedade herdada de
	# CharacterBody2D. move_and_slide() vai ler ela de dentro do próprio nó,
	# por isso ela é atribuída em vez de passada como argumento.
	velocity = direcao * VELOCIDADE

	# move_and_slide() é o passo de física inteiro: move, detecta colisão e
	# desliza ao longo da parede em vez de travar na diagonal. O delta entra
	# aqui por dentro, vindo do relógio de física — é por isso que o parâmetro
	# da função leva `_` na frente, marcando que de propósito ninguém o usa.
	move_and_slide()
