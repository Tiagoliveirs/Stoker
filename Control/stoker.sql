-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 13/04/2025 às 19:12
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `stoker`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `entrada`
--

CREATE TABLE `entrada` (
  `idEntrada` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `fornecedor` int(11) NOT NULL,
  `obs` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fabricante`
--

CREATE TABLE `fabricante` (
  `idFabrica` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `fornecedor`
--

CREATE TABLE `fornecedor` (
  `idFornece` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cnpj` varchar(20) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `idFunci` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `funcao` varchar(20) NOT NULL,
  `usuario` int(11) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefone` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `historicomov`
--

CREATE TABLE `historicomov` (
  `idHM` int(11) NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `lote` int(11) NOT NULL,
  `qtd` decimal(3,2) NOT NULL,
  `usuario` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `obs` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itensentrada`
--

CREATE TABLE `itensentrada` (
  `idItem` int(11) NOT NULL,
  `entrada` int(11) NOT NULL,
  `lote` int(11) NOT NULL,
  `qtd` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `itenssaida`
--

CREATE TABLE `itenssaida` (
  `iditems` int(11) NOT NULL,
  `saida` int(11) NOT NULL,
  `lote` int(11) NOT NULL,
  `qtd` decimal(3,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `lote`
--

CREATE TABLE `lote` (
  `idLote` int(11) NOT NULL,
  `med` int(11) NOT NULL,
  `numLote` varchar(10) NOT NULL,
  `qtd` decimal(3,2) NOT NULL,
  `qtdtotal` double(3,2) NOT NULL,
  `fabricacao` date NOT NULL,
  `validade` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `medicamento`
--

CREATE TABLE `medicamento` (
  `idMed` int(11) NOT NULL,
  `nome` varchar(20) NOT NULL,
  `princAtv` varchar(25) NOT NULL,
  `descricao` varchar(30) NOT NULL,
  `dosagem` decimal(3,2) NOT NULL,
  `codbarras` varchar(13) NOT NULL,
  `forma` varchar(30) NOT NULL,
  `unimedida` varchar(5) NOT NULL,
  `categoria` varchar(20) NOT NULL,
  `fabricante` int(11) NOT NULL,
  `status` enum('Ativo','Inativo','','') NOT NULL,
  `tipo` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `paciente`
--

CREATE TABLE `paciente` (
  `idPaciente` int(11) NOT NULL,
  `nome` varchar(30) NOT NULL,
  `cpf` varchar(11) NOT NULL,
  `endereco` varchar(50) NOT NULL,
  `telefone` varchar(11) NOT NULL,
  `email` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `paciente`
--

INSERT INTO `paciente` (`idPaciente`, `nome`, `cpf`, `endereco`, `telefone`, `email`) VALUES
(1, 'Padrão', '00000000000', 'Indefinido', '75900000000', 'padrao@mail.com');

-- --------------------------------------------------------

--
-- Estrutura para tabela `saida`
--

CREATE TABLE `saida` (
  `id` int(11) NOT NULL,
  `data` datetime NOT NULL,
  `tipo` varchar(15) NOT NULL,
  `usuario` int(11) NOT NULL,
  `destino` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tipomed`
--

CREATE TABLE `tipomed` (
  `idTipoMed` int(11) NOT NULL,
  `descricao` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `tipomed`
--

INSERT INTO `tipomed` (`idTipoMed`, `descricao`) VALUES
(1, 'Fitoterápico'),
(2, 'Alopático'),
(3, 'Homeopático'),
(4, 'Similar'),
(5, 'Genérico'),
(6, 'Referência');

-- --------------------------------------------------------

--
-- Estrutura para tabela `usuario`
--

CREATE TABLE `usuario` (
  `idUsuario` int(11) NOT NULL,
  `username` varchar(30) NOT NULL,
  `senha` varchar(20) NOT NULL,
  `dataCad` date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Despejando dados para a tabela `usuario`
--

INSERT INTO `usuario` (`idUsuario`, `username`, `senha`, `dataCad`) VALUES
(1, 'suporte', '@suporte', '2025-04-11'),
(2, 'admin', 'admin', '2025-04-11'),
(3, 'gerente', 'gerente', '2025-04-11'),
(4, 'operador1', 'operador', '2025-04-11'),
(5, 'operador2', 'operador', '2025-04-11');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `entrada`
--
ALTER TABLE `entrada`
  ADD PRIMARY KEY (`idEntrada`),
  ADD KEY `fornecedor` (`fornecedor`);

--
-- Índices de tabela `fabricante`
--
ALTER TABLE `fabricante`
  ADD PRIMARY KEY (`idFabrica`);

--
-- Índices de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  ADD PRIMARY KEY (`idFornece`);

--
-- Índices de tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`idFunci`);

--
-- Índices de tabela `itensentrada`
--
ALTER TABLE `itensentrada`
  ADD PRIMARY KEY (`idItem`),
  ADD KEY `entrada` (`entrada`),
  ADD KEY `lote` (`lote`);

--
-- Índices de tabela `itenssaida`
--
ALTER TABLE `itenssaida`
  ADD PRIMARY KEY (`iditems`),
  ADD KEY `lote` (`lote`),
  ADD KEY `saida` (`saida`);

--
-- Índices de tabela `lote`
--
ALTER TABLE `lote`
  ADD PRIMARY KEY (`idLote`),
  ADD KEY `med` (`med`);

--
-- Índices de tabela `medicamento`
--
ALTER TABLE `medicamento`
  ADD PRIMARY KEY (`idMed`),
  ADD KEY `tipo` (`tipo`),
  ADD KEY `fabricante` (`fabricante`);

--
-- Índices de tabela `paciente`
--
ALTER TABLE `paciente`
  ADD PRIMARY KEY (`idPaciente`);

--
-- Índices de tabela `saida`
--
ALTER TABLE `saida`
  ADD PRIMARY KEY (`id`),
  ADD KEY `usuario` (`usuario`);

--
-- Índices de tabela `tipomed`
--
ALTER TABLE `tipomed`
  ADD PRIMARY KEY (`idTipoMed`);

--
-- Índices de tabela `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idUsuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `entrada`
--
ALTER TABLE `entrada`
  MODIFY `idEntrada` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fabricante`
--
ALTER TABLE `fabricante`
  MODIFY `idFabrica` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `fornecedor`
--
ALTER TABLE `fornecedor`
  MODIFY `idFornece` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `idFunci` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itensentrada`
--
ALTER TABLE `itensentrada`
  MODIFY `idItem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `itenssaida`
--
ALTER TABLE `itenssaida`
  MODIFY `iditems` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `lote`
--
ALTER TABLE `lote`
  MODIFY `idLote` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `medicamento`
--
ALTER TABLE `medicamento`
  MODIFY `idMed` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `paciente`
--
ALTER TABLE `paciente`
  MODIFY `idPaciente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de tabela `saida`
--
ALTER TABLE `saida`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tipomed`
--
ALTER TABLE `tipomed`
  MODIFY `idTipoMed` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de tabela `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `entrada`
--
ALTER TABLE `entrada`
  ADD CONSTRAINT `entrada_ibfk_1` FOREIGN KEY (`fornecedor`) REFERENCES `fornecedor` (`idFornece`);

--
-- Restrições para tabelas `itensentrada`
--
ALTER TABLE `itensentrada`
  ADD CONSTRAINT `itensentrada_ibfk_1` FOREIGN KEY (`entrada`) REFERENCES `entrada` (`idEntrada`),
  ADD CONSTRAINT `itensentrada_ibfk_2` FOREIGN KEY (`lote`) REFERENCES `lote` (`idLote`);

--
-- Restrições para tabelas `itenssaida`
--
ALTER TABLE `itenssaida`
  ADD CONSTRAINT `itenssaida_ibfk_1` FOREIGN KEY (`lote`) REFERENCES `lote` (`idLote`),
  ADD CONSTRAINT `itenssaida_ibfk_2` FOREIGN KEY (`saida`) REFERENCES `saida` (`id`);

--
-- Restrições para tabelas `lote`
--
ALTER TABLE `lote`
  ADD CONSTRAINT `lote_ibfk_1` FOREIGN KEY (`med`) REFERENCES `medicamento` (`idMed`);

--
-- Restrições para tabelas `medicamento`
--
ALTER TABLE `medicamento`
  ADD CONSTRAINT `medicamento_ibfk_1` FOREIGN KEY (`tipo`) REFERENCES `tipomed` (`idTipoMed`),
  ADD CONSTRAINT `medicamento_ibfk_2` FOREIGN KEY (`fabricante`) REFERENCES `fabricante` (`idFabrica`);

--
-- Restrições para tabelas `saida`
--
ALTER TABLE `saida`
  ADD CONSTRAINT `saida_ibfk_1` FOREIGN KEY (`usuario`) REFERENCES `usuario` (`idUsuario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
