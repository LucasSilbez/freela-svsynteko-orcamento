async function getProdutosFromPHP() {
    const response = await fetch('../../data/fetchJson.php'); // Substitua pelo caminho correto
    return response.json();
}


async function popularSelectFromPHP(tipoProduto) {
    const selectElement = document.getElementById(tipoProduto);
    const produtosDoTipo = await getProdutosFromPHP();

    produtosDoTipo[tipoProduto].forEach((produto) => {
        const option = document.createElement("option");
        option.value = produto.id;
        option.text = produto.nome;
        selectElement.appendChild(option);
    });
}

popularSelectFromPHP("vinilicos");
popularSelectFromPHP("rodapes");
popularSelectFromPHP("acessorios");


async function gerarOrcamentoVini() {
    const vinilicoId = document.getElementById("vinilicos").value;

    const quantidadeVinilicoTotalOriginal = parseFloat(document.getElementById("metragemTotal").value);
    const metragemLinearOriginal = parseFloat(document.getElementById("metragemLinear").value);

    let increasePercentage = 0.15; // Aumento padrão é de 15%

    if (document.getElementById("increase10Percent").checked) {
        increasePercentage = 0.10;
    }

    const quantidadeVinilicoTotal = quantidadeVinilicoTotalOriginal * (1 + increasePercentage);
    const metragemLinear = Math.ceil(metragemLinearOriginal * (1 + increasePercentage));

    const rodapeId = document.getElementById("rodapes").value;

    const produtosPHP = await getProdutosFromPHP();

    const precoVinilico = produtosPHP.vinilicos.find(produto => produto.id == vinilicoId)["preco_total_caixa"];
    const precoRodape = produtosPHP.rodapes.find(produto => produto.id == rodapeId)["preco_total_barra"];
    const valorCmRodape = produtosPHP.rodapes.find(produto => produto.id == rodapeId)["cm"];

    const metragemPorCaixa = produtosPHP.vinilicos.find(produto => produto.id == vinilicoId)["metragem_embalagem_cx"];
    let quantidadeCaixas = quantidadeVinilicoTotal / metragemPorCaixa;
    quantidadeCaixas = Math.ceil(quantidadeCaixas);

    let quantidadeCola1_5kg = 0;
    let quantidadeCola5kg = 0;

    const rodapeSelecionado = produtosPHP.rodapes.find(produto => produto.id == rodapeId);
    if (rodapeSelecionado && !rodapeSelecionado.cordao) {
        const rendimentoPorCola1_5kg = 20;


        quantidadeCola1_5kg = Math.ceil(metragemLinear / rendimentoPorCola1_5kg);


        if (metragemLinear > 40) {

            quantidadeCola5kg = 1;
            quantidadeCola1_5kg = 0;
        }
    }


    let quantidadeColaLVT = Math.ceil(quantidadeVinilicoTotal / 10);
    let quantidadePrimer = Math.ceil(quantidadeVinilicoTotalOriginal / 60);
    let quantidadeMassaNivelante = Math.ceil(quantidadeVinilicoTotal / 4 + 1);

    const custoColaLVT = quantidadeColaLVT * produtosPHP.acessorios.find(produto => produto.nome == "Cola para piso LVT")["preco"];
    const custoPrimer = quantidadePrimer * produtosPHP.acessorios.find(produto => produto.nome == "Primer")["preco"];
    const custoCola1_5kg = quantidadeCola1_5kg * produtosPHP.acessorios.find(produto => produto.nome == "Cola para rodapé Persipisos 1.5kg")["preco"];
    const custoCola5kg = quantidadeCola5kg * produtosPHP.acessorios.find(produto => produto.nome == "Cola para rodapé Persipisos 5kg")["preco"];
    const custoMassaNivelante = quantidadeMassaNivelante * produtosPHP.acessorios.find(produto => produto.nome == "Massa auto nivelante")["preco"];

    const quantidadePacotePregos = 1;

    const custoPacotePregos = quantidadePacotePregos * produtosPHP.acessorios.find(produto => produto.nome == "Pacote Pregos")["preco"];

    const tamanhoBarra = produtosPHP.rodapes.find(produto => produto.id == rodapeId)["tamanho_barra"];
    let quantidadeBarras = metragemLinear / tamanhoBarra;
    quantidadeBarras = Math.ceil(quantidadeBarras);
    const custoRodapes = quantidadeBarras * precoRodape;

    const custoVinilico = quantidadeCaixas * precoVinilico;


    const cordaoId = produtosPHP.rodapes.find(produto => produto.nome === "Eucafloor Cordão Estilo")?.id;
    let quantidadeCordao = parseFloat(document.getElementById("quantidadeCordao").value);
    if (isNaN(quantidadeCordao)) {
        quantidadeCordao = 0;
    }
    const precoCordao = produtosPHP.rodapes.find(produto => produto.id == cordaoId)["preco_total_barra"];
    const custoCordao = quantidadeCordao * precoCordao;

    const custoMaoDeObra = 25 * quantidadeVinilicoTotal;

    const custoMaoDeObraCordao = metragemLinear * valorCmRodape;

    const custoFrete = 224;

    const subtotal = custoVinilico + custoRodapes + custoColaLVT + custoPrimer + custoMassaNivelante + custoPacotePregos +
        custoMaoDeObra + custoMaoDeObraCordao + custoFrete + custoCordao + custoCola1_5kg + custoCola5kg;

    const totalLucro = subtotal * 1.35;

    const lucro = totalLucro - subtotal;

    const cartao = totalLucro * 1.12;

    const tabelaOrcamento = document.getElementById("tabelaOrcamento");
    tabelaOrcamento.innerHTML = `
    <div id="tableContainer" class="table-responsive">
    <table id="resultadoOrcamento" class="table table-bordered table-striped">
    <h2>Resultado Orçamento</h2>
        <thead>
            <tr id="destaque">
                <th>Descrição</th>
                <th>Quantidade</th>
                <th>Subtotal</th>
            </tr>
        </thead>
        <tbody>
        
        <tr>
            <td>Caixas de ${produtosPHP.vinilicos.find(produto => produto.id == vinilicoId).nome}</td>
            <td>${quantidadeCaixas.toFixed(0)}</td>
            <td>${custoVinilico.toFixed(2)}</td>
        </tr>
        <tr>
            <td>${produtosPHP.rodapes.find(produto => produto.id == rodapeId).nome} (${produtosPHP.rodapes.find(produto => produto.id == rodapeId).cm} cm)</td>
            <td>${quantidadeBarras.toFixed(0)}</td>
            <td>${custoRodapes.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Cola para piso LVT</td>
            <td>${quantidadeColaLVT}</td>
            <td>${custoColaLVT.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Cola para rodapé (1.5kg)</td>
            <td>${quantidadeCola1_5kg}</td>
            <td>${custoCola1_5kg.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Cola para rodapé (5kg)</td>
            <td>${quantidadeCola5kg}</td>
            <td>${custoCola5kg.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Primer</td>
            <td>${quantidadePrimer}</td>
            <td>${custoPrimer.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Massa auto nivelante</td>
            <td>${quantidadeMassaNivelante}</td>
            <td>${custoMassaNivelante.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Pacote de pregos</td>
            <td>${quantidadePacotePregos}</td>
            <td>${custoPacotePregos.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Mão de obra</td>
            <td>Para ${quantidadeVinilicoTotal.toFixed(0)}m²</td>
            <td>${custoMaoDeObra.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Mão de obra rodapé</td>
            <td>Para ${valorCmRodape.toFixed(0)}cm</td>
            <td>${custoMaoDeObraCordao.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Frete</td>
            <td>1</td>
            <td>${custoFrete.toFixed(2)}</td>
        </tr>
        <tr>
            <td>${produtosPHP.rodapes.find(produto => produto.nome === "Eucafloor Cordão Estilo").nome}</td>
            <td>${quantidadeCordao.toFixed(0)}</td>
            <td>${custoCordao.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Subtotal</td>
            <td>-</td>
            <td>${subtotal.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Lucro</td>
            <td>35%</td>
            <td>${lucro.toFixed(2)}</td>
        </tr>
        <tr id="destaque">
            <td colspan="2"><strong>Total</strong></td>
            <td>${totalLucro.toFixed(2)}</td>
        </tr>
        <tr>
            <td>Total no cartão</td>
            <td>Juros 12%</td>
            <td>${cartao.toFixed(2)}</td>
            </tr>
            </tbody>
        </table>
    </div>
    `;
    tabelaOrcamento.style.display = 'block';
}