# Cálculo do Valor Presente de um Título de Cupom
# Vamos considerar um título público que paga cupons anuais de $50 durante 10 anos,
# e ao final do período, o valor nominal de $1000 é devolvido. A taxa de juros (ou a taxa de desconto) 
# no mercado é de 6%.

#instalaçao e carregamento da biblioteca
install.packages("lifecontingencies")
library(lifecontingencies)

# Definição da taxa de juros
interest_rate <- 0.06

# Número de anos até o vencimento do título
n_years <- 10

# Valor do cupom anual
cupom <- 50

# Valor nominal do título (a ser pago no vencimento)
valor_nominal <- 1000

# Calculo do valor presente dos cupons
valor_presente_cupons <- annuity(i = interest_rate, n = n_years) * cupom
valor_presente_cupons

# Calculo do valor presente do valor nominal
valor_presente_nominal <- valor_nominal / (1 + interest_rate)^n_years
valor_presente_nominal

# Valor presente total do título
valor_presente_total <- valor_presente_cupons + valor_presente_nominal
valor_presente_total


# Esse cálculo mostra que o valor presente do título público, 
# considerando os cupons anuais e o valor nominal, é de aproximadamente $926,40. 
# Isso significa que, com uma taxa de desconto de 6%, este seria o valor justo a pagar por esse título hoje, 
# levando em conta todos os fluxos de caixa futuros descontados.