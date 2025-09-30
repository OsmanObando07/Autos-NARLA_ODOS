USE AutosNarlaDB;
GO

-- Ejemplo 1: Transacci�n para insertar un veh�culo
BEGIN TRANSACTION;

BEGIN TRY
    INSERT INTO Vehiculos (Codigo, MarcaID, Modelo, AnioProduccion, NumeroChasis, TipoCombustible, Cilindraje, TipoVehiculoID, PrecioAdquisicion, PrecioVenta, Stock, EsClasico)
    VALUES ('VEH0051', 1, 'Camry', 2023, 'ZX12CV34BN56', 'H�brido', 2.5, 1, 200000, 230000, 3, 0);

    -- Validar que no haya m�s de 4 unidades en stock para ese modelo
    IF (SELECT SUM(Stock) FROM Vehiculos WHERE Modelo = 'Camry') > 4
    BEGIN
        THROW 50000, 'No se puede tener m�s de 4 unidades del mismo modelo en inventario.', 1;
    END

    COMMIT TRANSACTION;
    PRINT 'Veh�culo insertado correctamente y stock validado.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;
GO


-- Ejemplo 2: Transacci�n para registrar una venta y actualizar stock
BEGIN TRANSACTION;

BEGIN TRY
    DECLARE @vehiculoID INT = 1; -- Veh�culo a vender
    DECLARE @clienteID INT = 3; -- Cliente que compra
    DECLARE @precioFinal DECIMAL(10,2) = 180000;

    -- Insertar venta
    INSERT INTO Ventas (VehiculoID, ClienteID, FechaVenta, PrecioFinal)
    VALUES (@vehiculoID, @clienteID, GETDATE(), @precioFinal);

    -- Reducir stock del veh�culo vendido
    UPDATE Vehiculos
    SET Stock = Stock - 1
    WHERE VehiculoID = @vehiculoID;

    -- Validar que el stock no sea negativo
    IF (SELECT Stock FROM Vehiculos WHERE VehiculoID = @vehiculoID) < 0
    BEGIN
        THROW 50001, 'Stock insuficiente para la venta.', 1;
    END

    COMMIT TRANSACTION;
    PRINT 'Venta registrada y stock actualizado.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;
GO


-- Ejemplo 3: Transacci�n para aplicar un descuento a un veh�culo
BEGIN TRANSACTION;

BEGIN TRY
    DECLARE @vehiculoID INT = 2;
    DECLARE @porcentajeDescuento DECIMAL(4,2) = 8.5; -- max 10%

    IF @porcentajeDescuento > 10
    BEGIN
        THROW 50002, 'Descuento no puede superar el 10%.', 1;
    END

    INSERT INTO Descuentos (VehiculoID, Porcentaje)
    VALUES (@vehiculoID, @porcentajeDescuento);

    COMMIT TRANSACTION;
    PRINT 'Descuento aplicado correctamente.';
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION;
    PRINT 'Error: ' + ERROR_MESSAGE();
END CATCH;
GO
