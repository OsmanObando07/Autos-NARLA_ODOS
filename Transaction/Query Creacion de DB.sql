-- Crear la base de datos
CREATE DATABASE AutosNarlaDB;
GO

USE AutosNarlaDB;
GO

-- Tabla de marcas
CREATE TABLE Marcas (
    MarcaID INT PRIMARY KEY IDENTITY(1,1),
    NombreMarca VARCHAR(100) NOT NULL
);

-- Tabla de tipos de veh�culo
CREATE TABLE TipoVehiculo (
    TipoVehiculoID INT PRIMARY KEY IDENTITY(1,1),
    NombreTipo VARCHAR(100) NOT NULL
);

-- Tabla principal de veh�culos
CREATE TABLE Vehiculos (
    VehiculoID INT PRIMARY KEY IDENTITY(1,1),
    Codigo VARCHAR(50) UNIQUE NOT NULL,
    MarcaID INT NOT NULL,
    Modelo VARCHAR(100) NOT NULL,
    AnioProduccion INT NOT NULL,
    NumeroChasis VARCHAR(100) NOT NULL UNIQUE,
    TipoCombustible VARCHAR(50),
    Cilindraje DECIMAL(5,2),
    TipoVehiculoID INT NOT NULL,
    PrecioAdquisicion DECIMAL(10,2),
    PrecioVenta DECIMAL(10,2),
    Stock INT CHECK (Stock <= 4), -- M�ximo 4 por modelo
    EsClasico BIT DEFAULT 0, -- 1 si es cl�sico, 0 si no
    FOREIGN KEY (MarcaID) REFERENCES Marcas(MarcaID),
    FOREIGN KEY (TipoVehiculoID) REFERENCES TipoVehiculo(TipoVehiculoID)
);

-- Tabla de fotos (hasta 6 por veh�culo)
CREATE TABLE FotosVehiculo (
    FotoID INT PRIMARY KEY IDENTITY(1,1),
    VehiculoID INT NOT NULL,
    URLFoto VARCHAR(255),
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID)
);

-- Tabla de clientes
CREATE TABLE Clientes (
    ClienteID INT PRIMARY KEY IDENTITY(1,1),
    NombreCliente VARCHAR(100),
    Telefono VARCHAR(20),
    Email VARCHAR(100)
);

-- Tabla de ventas
CREATE TABLE Ventas (
    VentaID INT PRIMARY KEY IDENTITY(1,1),
    VehiculoID INT NOT NULL,
    ClienteID INT NOT NULL,
    FechaVenta DATE NOT NULL DEFAULT GETDATE(),
    PrecioFinal DECIMAL(10,2), -- Con o sin descuento
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID),
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

-- Tabla de descuentos por veh�culo (m�x 10%)
CREATE TABLE Descuentos (
    DescuentoID INT PRIMARY KEY IDENTITY(1,1),
    VehiculoID INT NOT NULL,
    Porcentaje DECIMAL(4,2) CHECK (Porcentaje <= 10),
    FechaAplicacion DATE DEFAULT GETDATE(),
    FOREIGN KEY (VehiculoID) REFERENCES Vehiculos(VehiculoID)
);
