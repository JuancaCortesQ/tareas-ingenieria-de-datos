USE BDMascotas;

-- 1️ Agregar columna de vigencia a la tabla Vacuna
ALTER TABLE Vacuna ADD COLUMN Vigencia DATE AFTER enfermedadTratada;

-- 2️ Función para determinar si la vacuna está vigente o vencida
DELIMITER $$
CREATE FUNCTION EstadoVacuna(fechaVigencia DATE)
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
    DECLARE estado VARCHAR(20);
    IF fechaVigencia >= CURDATE() THEN
        SET estado = 'Vigente';
    ELSE
        SET estado = 'Vencida';
    END IF;
    RETURN estado;
END $$
DELIMITER ;

-- 3️Función para mostrar nombre de mascota, raza y dueño
DELIMITER $$
CREATE FUNCTION DatosMascotaDueño(p_idMascota INT)
RETURNS VARCHAR(255)
DETERMINISTIC
BEGIN
    DECLARE v_nombreMascota VARCHAR(150);
    DECLARE v_raza VARCHAR(50);
    DECLARE v_nombreCliente VARCHAR(150);
    DECLARE v_apellidoCliente VARCHAR(150);
    DECLARE resultado VARCHAR(255);

    SELECT M.nombre, M.raza, C.nombre, C.apellido
    INTO v_nombreMascota, v_raza, v_nombreCliente, v_apellidoCliente
    FROM Mascota M
    INNER JOIN Cliente C ON C.codigoMascotasfk = M.codigoMascotas
    WHERE M.codigoMascotas = p_idMascota;

    SET resultado = CONCAT('Mascota: ', v_nombreMascota, ', Raza: ', v_raza, ', Dueño: ', v_nombreCliente, ' ', v_apellidoCliente);
    RETURN resultado;
END $$
DELIMITER ;

-- 4️Trigger que impide eliminar cliente si tiene mascota registrada
DELIMITER $$
CREATE TRIGGER trg_delete_cliente
BEFORE DELETE ON Cliente
FOR EACH ROW
BEGIN
    DECLARE v_count INT;
    SELECT COUNT(*) INTO v_count FROM Mascota WHERE codigoMascotas = OLD.codigoMascotasfk;
    IF v_count > 0 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar el cliente: tiene mascotas registradas';
    END IF;
END $$
DELIMITER ;

-- 5️ Tabla para almacenar clientes eliminados
CREATE TABLE IF NOT EXISTS ClienteEliminados (
    cedula INT,
    nombre VARCHAR(150),
    apellido VARCHAR(150),
    direccion VARCHAR(100),
    telefono VARCHAR(50),
    fechaEliminacion TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 6️ Trigger para guardar el cliente eliminado
DELIMITER $$
CREATE TRIGGER trg_backup_cliente
AFTER DELETE ON Cliente
FOR EACH ROW
BEGIN
    INSERT INTO ClienteEliminados(cedula, nombre, apellido, direccion, telefono)
    VALUES(OLD.cedula, OLD.nombre, OLD.apellido, OLD.direccion, OLD.telefono);
END $$
DELIMITER ;

-- 7️ Agregar columna de fechaActualizacion al cliente
ALTER TABLE Cliente ADD COLUMN fechaActualizacion TIMESTAMP NULL AFTER telefono;

-- 8️Trigger para actualizar la fecha de modificación
DELIMITER $$
CREATE TRIGGER trg_update_cliente_fecha
BEFORE UPDATE ON Cliente
FOR EACH ROW
BEGIN
    SET NEW.fechaActualizacion = NOW();
END $$
DELIMITER ;