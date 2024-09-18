-- Crear la base de datos
CREATE DATABASE TiendaBros;
USE TiendaBros;

-- Crear la tabla Autores
CREATE TABLE Autores (
    id INT PRIMARY KEY AUTO INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    nacionalidad VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE NOT NULL
);

-- Crear la tabla Libros
CREATE TABLE Libros (
    id INT PRIMARY KEY AUTO INCREMENT,
    titulo VARCHAR(255) NOT NULL,
    editorial VARCHAR(255) NOT NULL,
    categoria VARCHAR(100) NOT NULL,
    fecha_publicacion DATE NOT NULL,
    precio FLOAT NOT NULL,
    stock INT NOT NULL,
    ISBN VARCHAR(13) NOT NULL UNIQUE
);

-- Tabla intermedia entre Libros y Autores
CREATE TABLE Libro_Autor (
    id_libro INT NOT NULL,
    id_autor INT NOT NULL,
    PRIMARY KEY (id_libro, id_autor),
    FOREIGN KEY (id_libro) REFERENCES Libros(id),
    FOREIGN KEY (id_autor) REFERENCES Autores(id)
);

-- Crear la tabla Clientes
CREATE TABLE Clientes (
    id INT PRIMARY KEY AUTO INCREMENT,
    nombre VARCHAR(255) NOT NULL,
    telefono VARCHAR(20) NOT NULL,
    email VARCHAR(255) NOT NULL,
    direccion VARCHAR(255) NOT NULL
);

-- Crear la tabla Pedidos
CREATE TABLE Pedidos (
    id INT PRIMARY KEY AUTO INCREMENT,
    id_cliente INT NOT NULL,
    fecha_pedido DATE NOT NULL,
    estado VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id)
);

-- Tabla intermedia entre Pedidos y Libros
CREATE TABLE Pedido_Libro (
    id_pedido INT NOT NULL,
    id_libro INT NOT NULL,
    cantidad INT NOT NULL,
    PRIMARY KEY (id_pedido, id_libro),
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id),
    FOREIGN KEY (id_libro) REFERENCES Libros(id)
);

-- Crear la tabla Transacciones
CREATE TABLE Transacciones (
    id INT PRIMARY KEY AUTO INCREMENT,
    id_pedido INT NOT NULL,
    fecha_transaccion DATE NOT NULL,
    monto FLOAT NOT NULL,
    metodo_pago VARCHAR(50) NOT NULL,
    FOREIGN KEY (id_pedido) REFERENCES Pedidos(id)
);
