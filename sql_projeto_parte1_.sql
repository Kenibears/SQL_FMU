-- 1. Tabela Especialidade (Deve ser criada primeiro pois não tem dependências)
CREATE TABLE Especialidade (
    id_especialidade INT PRIMARY KEY,
    nome_especialidade VARCHAR(100) NOT NULL,
    descricao TEXT
);

-- 2. Tabela Paciente
CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    cpf VARCHAR(14) UNIQUE NOT NULL,
    data_nascimento DATE,
    telefone VARCHAR(15)
);

-- 3. Tabela Medico (Depende de Especialidade)
CREATE TABLE Medico (
    id_medico INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    crm VARCHAR(20) UNIQUE NOT NULL,
    telefone VARCHAR(15),
    id_especialidade INT,
    FOREIGN KEY (id_especialidade) REFERENCES Especialidade(id_especialidade)
);

-- 4. Tabela Consulta (Depende de Paciente e Medico)
CREATE TABLE Consulta (
    id_consulta INT PRIMARY KEY,
    data_hora DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Agendada',
    id_paciente INT NOT NULL,
    id_medico INT NOT NULL,
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico)
);

-- 5. Tabela Prescricao (Depende de Consulta)
CREATE TABLE Prescricao (
    id_prescricao INT PRIMARY KEY,
    descricao_medicamento VARCHAR(255) NOT NULL,
    dosagem VARCHAR(100),
    id_consulta INT NOT NULL,
    FOREIGN KEY (id_consulta) REFERENCES Consulta(id_consulta)
);
