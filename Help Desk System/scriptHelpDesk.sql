CREATE TABLE IF NOT EXISTS Usuario(

emailUsuario VARCHAR(50) PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
senha VARCHAR(50) NOT NULL,
telefone VARCHAR(20) NOT NULL,
nivelAcesso ENUM('Administrador', 'Tecnico', 'Cliente') NOT NULL
)DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS Chamado(

idChamado INT(10) AUTO_INCREMENT PRIMARY KEY,
descricao VARCHAR(200) NOT NULL,
assunto VARCHAR(200) NOT NULL,
status ENUM('Aberto', 'Em Atendimento', 'Em Espera', 
'Concluido e Atendido Dentro do Prazo', 'Concluido Fora do Prazo e Atendido Dentro do Prazo', 
'Concluido Dentro do Prazo com Atendimento Atrasado', 'Concluido Fora do Prazo com Atendimento Atrasado', 
'Cancelado') NOT NULL,
prioridade ENUM('1', '2', '3', '4') NOT NULL,	
categoria ENUM('Duvida', 'Instalacao', 'Problema', 'Nao Especificada') NOT NULL,
atendimentoAtrasado ENUM('Sim', 'Nao') NOT NULL,
prazoAtendimento DATE NOT NULL,
prazoConclusao DATE NOT NULL,
dataAbertura DATE NOT NULL,
idCliente VARCHAR(50),
idTecnico VARCHAR(50),
idTecnicoTransf VARCHAR(50),

FOREIGN KEY(idCliente) references Usuario(emailUsuario) 
ON UPDATE CASCADE
ON DELETE SET NULL,

FOREIGN KEY(idTecnico) references Usuario(emailUsuario) 
ON UPDATE CASCADE 
ON DELETE SET NULL,

FOREIGN KEY(idTecnicoTransf) references Usuario(emailUsuario) 
ON UPDATE CASCADE 
ON DELETE SET NULL
)DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;

CREATE TABLE IF NOT EXISTS Historico(

idHistorico INT(10) AUTO_INCREMENT PRIMARY KEY,
data DATE NOT NULL,
informacoes VARCHAR(200) NOT NULL,
idChamado INT(10),

FOREIGN KEY(idChamado) references Chamado(idChamado) 
ON UPDATE CASCADE 
ON DELETE SET NULL
)DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;