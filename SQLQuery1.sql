
CREATE TABLE CuentasContables (
    id INT IDENTITY(1,1) PRIMARY KEY,
    nombre VARCHAR(100)
);

CREATE TABLE MovimientosContables (
    id INT IDENTITY(1,1) PRIMARY KEY,
    idCuentaContable INT,
    fecha DATE,
    monto DECIMAL(12,2),
    FOREIGN KEY (idCuentaContable) REFERENCES CuentasContables(id)
);