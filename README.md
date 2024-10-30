# Praticas-em-R
Uso de R nas cadeiras do Mestrado - Finanças e Métodos Quantitativos

Fin_Corp.R:
Exemplo: Cálculo do Valor Presente de um Título de Cupom
Vamos considerar um título público que paga cupons anuais de $50 durante 10 anos, e ao final do período, o valor nominal de $1000 é devolvido. A taxa de juros (ou a taxa de desconto) no mercado é de 6%.

Podemos usar a biblioteca lifecontingencies no R para calcular o valor presente dos pagamentos dos cupons e do valor nominal
(Vide o script em R)

Neste exemplo:

interest_rate é a taxa de juros do mercado (6%).
n_years é o número de anos até o vencimento do título (10 anos).
cupom é o valor do pagamento anual dos cupons ($50).
valor_nominal é o valor de face do título, pago ao final do período ($1000).
annuity() é a função do lifecontingencies que calcula o valor presente dos pagamentos anuais (os cupons).
valor_presente_nominal calcula o valor presente do valor nominal do título, usando a fórmula de desconto.
O valor_presente_total será a soma do valor presente dos pagamentos dos cupons e do valor nominal, representando o valor justo atual do título.

Esse cálculo mostra que o valor presente do título público, considerando os cupons anuais e o valor nominal, é de aproximadamente $926,40. Isso significa que, com uma taxa de desconto de 6%, este seria o valor justo a pagar por esse título hoje, levando em conta todos os fluxos de caixa futuros descontados.

Para calcular o valor presente do título público usando a calculadora financeira HP12C, siga estas etapas:

Dividiremos o Cálculo em Duas Partes:
Valor Presente dos Cupons.
Valor Presente do Valor Nominal.
Parte 1: Cálculo do Valor Presente dos Cupons
Os cupons são uma anuidade de $50 anuais por 10 anos, com uma taxa de juros de 6%. Na HP12C:

Digite 10 e pressione n (número de períodos).
Digite 6 e pressione i (taxa de juros por período).
Digite 50 e pressione PMT (valor do pagamento periódico).
Pressione PV para calcular o valor presente.
O valor presente dos cupons será exibido como aproximadamente -368.00.

Parte 2: Cálculo do Valor Presente do Valor Nominal
Agora precisamos calcular o valor presente do valor nominal de $1000, que será pago ao final dos 10 anos:

Digite 10 e pressione n.
Digite 6 e pressione i.
Digite 1000 e pressione FV (valor futuro).
Digite 0 e pressione PMT (pois não há pagamentos periódicos além dos cupons).
Pressione PV para calcular o valor presente.
O valor presente do valor nominal será exibido como aproximadamente -558.39.

Parte Final: Somar os Valores Presentes
Agora, basta somar os dois valores presentes:

368.00 (valor presente dos cupons)
558.39 (valor presente do valor nominal)
Assim, o valor presente total do título público será 926.39.

Observação
Os valores na HP12C geralmente são exibidos como negativos porque representam um fluxo de saída de dinheiro (como um investimento inicial). Por isso, o valor é mostrado com o sinal negativo.


TIR_no_R.R:


Neste exemplo, estamos utilizando duas abordagens diferentes em R para encontrar a Taxa Interna de Retorno (TIR) de um fluxo de caixa usando funções de rootSolve, pracma e spuRs. Vou detalhar cada etapa e os resultados.

1. Definição do Fluxo de Caixa e Função y(x)

Primeiro, definimos uma função y(x), que representa o valor presente líquido (VPL) do fluxo de caixa:

y = function(x) -800 + 240/(1+x) + 260/((1+x)^2) + 280/((1+x)^3) + 300/((1+x)^4)

O fluxo de caixa consiste em:

	•	Ano 0: -800 (um investimento inicial)
	•	Ano 1: 240
	•	Ano 2: 260
	•	Ano 3: 280
	•	Ano 4: 300

A função y(x) calcula o VPL descontando cada fluxo de caixa pela taxa x. A ideia é encontrar a taxa de desconto que faz com que o VPL seja zero.

2. Uso do Método de Newton-Raphson para Encontrar uma Raiz

A seguir, aplicamos o método de Newton-Raphson para encontrar uma raiz de y(x), com um ponto de partida inicial x = 0.5:

newtonRaphson(y, 0.5)

Resultados da Função newtonRaphson

O resultado do método de Newton-Raphson retorna:

	•	$root: A raiz encontrada, ou seja, o valor de x (TIR) que faz y(x) = 0. Aqui, a raiz é aproximadamente 0.1265553, ou 12,66%.
	•	$f.root: O valor de y(x) na raiz encontrada, que está próximo de zero, confirmando que é uma solução (resíduo muito pequeno).
	•	$niter: Número de iterações que o método Newton-Raphson precisou para convergir à solução.
	•	$estim.prec: Precisão estimada da raiz, que também é muito baixa (próxima de zero), indicando que a solução é precisa.

3. Uso do Método uniroot.all para Encontrar Todas as Raízes

Depois, usamos a função uniroot.all() para buscar todas as raízes de y(x) no intervalo entre -1 e 3. Esta função pode encontrar múltiplas raízes em um intervalo, ao contrário do método Newton-Raphson, que só encontra uma raiz por vez.

Resultado do uniroot.all

	•	A função retorna um único valor, 0.1265598, que é a TIR para o fluxo de caixa definido em y(x), ou seja, o ponto em que o VPL é zero.
	•	Neste caso, obtemos uma TIR próxima a 12,66% para esse fluxo de caixa, o que é consistente com o resultado de newtonRaphson.

Resumo

Esses métodos permitem calcular a TIR para o fluxo de caixa. O método Newton-Raphson encontrou uma única raiz, usando um ponto de partida (0.5), enquanto o uniroot.all buscou todas as raízes no intervalo fornecido. Ambos os métodos retornaram uma TIR consistente de aproximadamente 12,66%, indicando que essa é a taxa de desconto que torna o VPL igual a zero para esse fluxo de caixa.
