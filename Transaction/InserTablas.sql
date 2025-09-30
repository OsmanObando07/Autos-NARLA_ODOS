INSERT INTO Marcas (NombreMarca) VALUES ('Toyota');
INSERT INTO Marcas (NombreMarca) VALUES ('Honda');
INSERT INTO Marcas (NombreMarca) VALUES ('Ford');
INSERT INTO Marcas (NombreMarca) VALUES ('Chevrolet');
INSERT INTO Marcas (NombreMarca) VALUES ('Volkswagen');

INSERT INTO TipoVehiculo (NombreTipo) VALUES ('Sedán');
INSERT INTO TipoVehiculo (NombreTipo) VALUES ('Hatchback');
INSERT INTO TipoVehiculo (NombreTipo) VALUES ('Camioneta Cerrada');
INSERT INTO TipoVehiculo (NombreTipo) VALUES ('Moto');
INSERT INTO TipoVehiculo (NombreTipo) VALUES ('Clásico');

INSERT INTO Vehiculos (Codigo, MarcaID, Modelo, AnioProduccion, NumeroChasis, TipoCombustible, Cilindraje, TipoVehiculoID, PrecioAdquisicion, PrecioVenta, Stock, EsClasico)
VALUES 
('VEH0001', 1, 'Corolla', 2020, 'AB12CD34EF56', 'Gasolina', 1.8, 1, 150000, 185000, 2, 0),
('VEH0002', 2, 'Civic', 2021, 'GH78IJ90KL12', 'Gasolina', 2.0, 1, 160000, 190000, 3, 0),
('VEH0003', 3, 'Ranger', 1992, 'MN34OP56QR78', 'Diésel', 3.2, 5, 80000, 95000, 1, 1),
('VEH0004', 4, 'Cruze', 2018, 'ST90UV12WX34', 'Gasolina', 1.6, 2, 120000, 140000, 2, 0),
('VEH0005', 5, 'Jetta', 1994, 'YZ56AB78CD90', 'Gasolina', 1.8, 5, 70000, 85000, 1, 1);



INSERT INTO Clientes (NombreCliente, Telefono, Email)
VALUES
('Carlos Ramírez', '555-1234', 'carlos.ramirez@example.com'),
('Laura Méndez', '555-5678', 'laura.mendez@example.com'),
('Miguel Torres', '555-9012', 'miguel.torres@example.com'),
('Ana López', '555-3456', 'ana.lopez@example.com'),
('Roberto Díaz', '555-7890', 'roberto.diaz@example.com');


INSERT INTO Ventas (VehiculoID, ClienteID, FechaVenta, PrecioFinal)
VALUES
(1, 1, '2024-07-15', 180000),
(2, 2, '2024-08-10', 185000),
(3, 3, '2024-08-25', 90000),
(4, 4, '2024-09-01', 135000),
(5, 5, '2024-09-15', 80000);




INSERT INTO Ventas (VehiculoID, ClienteID, FechaVenta, PrecioFinal)
VALUES
(1, 1, '2024-07-15', 180000),
(2, 2, '2024-08-10', 185000),
(3, 3, '2024-08-25', 90000),
(4, 4, '2024-09-01', 135000),
(5, 5, '2024-09-15', 80000);



INSERT INTO Descuentos (VehiculoID, Porcentaje)
VALUES
(1, 5),
(2, 7.5),
(3, 10),
(4, 3),
(5, 6);




INSERT INTO FotosVehiculo (VehiculoID, URLFoto)
VALUES
(1, 'https://example.com/fotos/veh1_1.jpg'),
(1, 'https://example.com/fotos/veh1_2.jpg'),
(2, 'https://example.com/fotos/veh2_1.jpg'),
(3, 'https://example.com/fotos/veh3_1.jpg'),
(4, 'https://example.com/fotos/veh4_1.jpg');
