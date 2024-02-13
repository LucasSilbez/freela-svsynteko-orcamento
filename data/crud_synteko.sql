-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 09/02/2024 às 11:02
-- Versão do servidor: 10.4.28-MariaDB
-- Versão do PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `crud_synteko`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `acessorios`
--

CREATE TABLE `acessorios` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `preco` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `acessorios`
--

INSERT INTO `acessorios` (`id`, `nome`, `preco`) VALUES
(1, 'Manta acrílica 2mm', 40),
(2, 'Pacote Pregos', 15),
(3, 'Cola para rodapé Persipisos 1.5kg', 26),
(4, 'Cola para rodapé Persipisos 5kg', 85),
(5, 'Perfil', 60),
(6, 'Primer', 100),
(7, 'Massa auto nivelante', 100),
(8, 'Cola para piso LVT', 126);

-- --------------------------------------------------------

--
-- Estrutura para tabela `laminados`
--

CREATE TABLE `laminados` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `metragem_embalagem_cx` float NOT NULL,
  `preco_total_caixa` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `laminados`
--

INSERT INTO `laminados` (`id`, `nome`, `metragem_embalagem_cx`, `preco_total_caixa`) VALUES
(5, 'Eucafloor Prime colado', 2.14, 87.57),
(6, 'Eucafloor Prime Click', 2.36, 106.74),
(7, 'Eucafloor Evidence Click 2G', 2.36, 116.97),
(8, 'Eucafloor New Elegance Click 2G', 2.77, 163.77),
(9, 'Eucafloor Gran Elegance', 2.41, 150),
(10, 'Durafloor Novo New Way 7mm', 2.51, 123),
(11, 'Durafloor New Nature 7mm', 2.51, 155),
(12, 'Durafloor Novo Studio 8mm', 2.26, 169),
(13, 'Durafloor Link 7mm', 2.99, 188),
(14, 'Durafloor Novo Unique 8mm', 2.73, 188),
(15, 'Durafloor Strett 8mm', 2.33, 168),
(16, 'Quick Step Premiere Ac4', 2.84, 156.34);

-- --------------------------------------------------------

--
-- Estrutura para tabela `rodapes`
--

CREATE TABLE `rodapes` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `tamanho_barra` float NOT NULL,
  `preco_total_barra` float NOT NULL,
  `cm` int(16) NOT NULL,
  `cordao` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `rodapes`
--

INSERT INTO `rodapes` (`id`, `nome`, `tamanho_barra`, `preco_total_barra`, `cm`, `cordao`) VALUES
(1, 'Eucafloor Rodapé Estilo 5cm', 2.4, 16, 10, NULL),
(2, 'Eucafloor Rodapé Acqua 15 cm com Friso cores Poliestireno', 2.44, 143.45, 15, NULL),
(3, 'Eucafloor Rodapé Acqua 15 cm com Friso Branco Poliestireno', 2.44, 75, 15, NULL),
(4, 'Eucafloor Rodapé Acqua 20 cm s/ friso Branco Poliestireno', 2.44, 130, 20, NULL),
(5, 'Eucafloor Rodapé Acqua 5,5 cm Poliestireno', 2.44, 42, 10, NULL),
(6, 'Eucafloor Rodapé Acqua 11 cm s/ friso Branco Poliestireno', 2.44, 59.1, 11, NULL),
(7, 'Eucafloor Rodapé Acqua 7 cm s/ friso Branco Poliestireno', 2.44, 43.55, 10, NULL),
(8, 'Eucafloor Rodapé Acqua 7 cm com friso Branco Poliestireno', 2.44, 43.55, 10, NULL),
(9, 'Eucafloor Rodapé Estilo 7cm MDF', 2.4, 20.6, 10, NULL),
(10, 'Eucafloor Cordão Estilo', 2.4, 13.9, 10, 1),
(11, 'Eucafloor Rodapé Estilo 10 cm ( apenas branco) MDF', 2.4, 35.71, 10, NULL),
(12, 'Durafloor Rodapé Essencial 5 cm Moulding MDF', 2.1, 15.66, 10, NULL),
(13, 'Durafloor Rodapé Essencial 10 cm Moulding MDF', 2.1, 26, 10, NULL),
(14, 'Durafloor Rodapé Essencial 15 cm Moulding MDF', 2.1, 37, 15, NULL),
(15, 'Durafloor Rodapé Essencial 20 cm Moulding MDF', 2.1, 63.2, 20, NULL),
(16, 'Durafloor Rodapé Easy 8 cm Moulding MDF', 2.1, 25, 10, NULL),
(17, 'Durafloor Rodapé Easy 12 cm Moulding MDF', 2.1, 35, 12, NULL),
(18, 'Durafloor Rodapé Maxx V-01 6 cm Poliestireno', 2.1, 27, 10, NULL),
(19, 'Durafloor Rodapé Maxx M-03 6 cm Poliestireno', 2.1, 38, 10, NULL),
(20, 'Durafloor Rodapé Maxx M-02 7cm Poliestireno', 2.1, 55, 10, NULL),
(21, 'Durafloor Rodapé Maxx M-01 7cm Poliestireno', 2.1, 55, 10, NULL),
(22, 'Durafloor Rodapé Maxx 10 cm Poliestireno', 2.1, 78, 10, NULL),
(23, 'Durafloor Rodapé Maxx M-01 12 cm Poliestireno', 2.1, 98, 12, NULL),
(24, 'Durafloor Rodapé Maxx 15 cm Poliestireno', 2.1, 116.5, 15, NULL),
(25, 'Durafloor Rodapé Maxx 20 cm Poliestireno', 2.1, 114, 20, NULL),
(28, 'Casa Grassi 7cm Poliestireno', 2.4, 41.7, 10, NULL),
(29, 'Casa Grassi 7cm Poliestireno', 2.4, 41.7, 10, NULL);

-- --------------------------------------------------------

--
-- Estrutura para tabela `vinilicos`
--

CREATE TABLE `vinilicos` (
  `id` int(11) NOT NULL,
  `nome` varchar(200) NOT NULL,
  `metragem_embalagem_cx` float NOT NULL,
  `preco_total_caixa` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Despejando dados para a tabela `vinilicos`
--

INSERT INTO `vinilicos` (`id`, `nome`, `metragem_embalagem_cx`, `preco_total_caixa`) VALUES
(1, 'Eucafloor LVT Basic réguas ( 2mm) colado', 4.68, 322.92),
(2, 'Eucafloor LVT Working placa 60 x60 (3mm) colado', 3.6, 352.8),
(3, 'Eucafloor LVT Working réguas ( 3mm) colado', 3.62, 354.76),
(4, 'Durafloor Urban Colado 2mm', 4.34, 385),
(5, 'Durafloor City Colado 3mm', 3.25, 409),
(6, 'Durafloor Art Colado 3mm', 3.25, 460),
(7, 'Durafloor Inova colado 3mm placa 91 x 91', 5.01, 800.19),
(8, 'Durafloor Inova colado 3mm placa 24 x 29,3', 1.46, 250),
(9, 'Durafloor Inova colado 3mm 60 x 60,90', 3.71, 592.68),
(10, 'Durafloor Inova colado 3mm 60 x 60', 3.6, 575),
(11, 'Durafloor SPC Nativa 4mm Click', 2.5, 610),
(12, 'VinilForte Natural Leve', 4.72, 235.53),
(13, 'VinilForte Natural Leve Largo', 6.48, 420.35),
(14, 'VinilForte Essencial Ultra 48cm x48cm', 3.69, 323.8),
(15, 'VinilForte Essencial Ultra 96cm x96cm', 4.61, 414.71),
(16, 'VinilForte Essencial Leve 48cm x48cm', 3.69, 278.7),
(17, 'VinilForte Essencial Leve 96cm x96cm', 4.61, 376.35),
(18, 'VinilForte Natural Max', 3.31, 256.02);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `acessorios`
--
ALTER TABLE `acessorios`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `laminados`
--
ALTER TABLE `laminados`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `rodapes`
--
ALTER TABLE `rodapes`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `vinilicos`
--
ALTER TABLE `vinilicos`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `acessorios`
--
ALTER TABLE `acessorios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `laminados`
--
ALTER TABLE `laminados`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de tabela `rodapes`
--
ALTER TABLE `rodapes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT de tabela `vinilicos`
--
ALTER TABLE `vinilicos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
