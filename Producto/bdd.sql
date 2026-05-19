-- Tablas de Catálogo 
create table zonas (
   id_zona number generated always as identity primary key,
   area    varchar(100) not null
);

create table implemento (
   id_implemento number generated always as identity primary key,
   nombre_imple  varchar(100) not null
);

create table objetivo (
   id_objetivo number generated always as identity primary key,
   descrip_obj varchar(100) not null
);

create table nv_actividad (
   id_nv_act   number generated always as identity primary key,
   desc_nv_act varchar(100) not null
);

create table comida (
   id_comida     number generated always as identity primary key,
   nombre_com    varchar(150) not null,
   proteinas     decimal(6,2) not null,
   carbohidratos decimal(6,2) not null,
   lipidos       decimal(6,2) not null,
   calorias      decimal(6,2) not null,
   gramos        decimal(6,2) not null
);

-- Tablas Principales (Dependen de los catálogos)
create table usuario (
   id_usuario   number generated always as identity primary key,
   id_objetivo  number,
   id_nv_act    number,
   correo       varchar(150) unique not null,
   contrasena   varchar(255) not null,
   rol          varchar(50) default 'USER',
   nom_usuario  varchar(100) not null,
   peso         decimal(5,2),
   altura       number,
   tmb_objetivo decimal(6,2),
   cal_diaria   decimal(6,2),
   foreign key ( id_objetivo )
      references objetivo ( id_objetivo ),
   foreign key ( id_nv_act )
      references nv_actividad ( id_nv_act )
);

create table ejercicios (
   id_ejercicio     number generated always as identity primary key,
   id_zona          number,
   id_implemento    number,
   descripcion_ejer varchar(150) not null,
   img_ejer         varchar(255),
   video_ejer       varchar(255),
   foreign key ( id_zona )
      references zonas ( id_zona ),
   foreign key ( id_implemento )
      references implemento ( id_implemento )
);

create table rutina (
   id_rutina   number generated always as identity primary key,
   id_usuario  number not null,
   descripcion varchar(200),
   foreign key ( id_usuario )
      references usuario ( id_usuario )
         on delete cascade
);

-- Tablas Transaccionales y de Intersección (Dependen de las tablas principales)
create table rutina_usuario (
   id_rut_user  number generated always as identity primary key,
   id_usuario   number not null,
   id_rutina    number not null,
   fecha_inicio date not null,
   fecha_fin    date,
   estado       varchar(50),
   foreign key ( id_usuario )
      references usuario ( id_usuario )
         on delete cascade,
   foreign key ( id_rutina )
      references rutina ( id_rutina )
         on delete cascade
);

create table rutina_ejercicio (
   id_rutina    int not null,
   id_ejercicio int not null,
   sets         int not null,
   reps         int not null,
   tiempo       int,
   peso_ejer    decimal(6,2),
   primary key ( id_rutina,
                 id_ejercicio ),
   foreign key ( id_rutina )
      references rutina ( id_rutina )
         on delete cascade,
   foreign key ( id_ejercicio )
      references ejercicios ( id_ejercicio )
);

create table log_macros (
   id_macros       number generated always as identity primary key,
   id_usuario      number not null,
   id_comida       number not null,
   fecha_hora      timestamp not null,
   cantidad_gramos decimal(6,2) not null,
   foreign key ( id_usuario )
      references usuario ( id_usuario )
         on delete cascade,
   foreign key ( id_comida )
      references comida ( id_comida )
);

create table reporte_macros (
   id_report           number generated always as identity primary key,
   id_usuario          number not null,
   fecha               date not null,
   total_calorias      decimal(8,2),
   total_proteinas     decimal(8,2),
   total_carbohidratos decimal(8,2),
   total_lipidos       decimal(8,2),
   unique ( id_usuario,
            fecha ),
   foreign key ( id_usuario )
      references usuario ( id_usuario )
         on delete cascade
);

CREATE TABLE Tipo_Alimentacion (
    id_tipo_alimentacion INT AUTO_INCREMENT PRIMARY KEY,
    nombre_tipo VARCHAR(50) NOT NULL
);

CREATE TABLE Comida_Recomendada (
    id_comida INT AUTO_INCREMENT PRIMARY KEY,
    nombre_comida VARCHAR(100) NOT NULL,
    descripcion_comida VARCHAR(255),
    calorias_porcion FLOAT NOT NULL,
    proteina_porcion FLOAT NOT NULL,
    carbohidratos_porcion FLOAT NOT NULL,
    grasa_porcion FLOAT NOT NULL,
    id_tipo_alimentacion INT,
    FOREIGN KEY (id_tipo_alimentacion) REFERENCES Tipo_Alimentacion(id_tipo_alimentacion)
);

INSERT INTO Tipo_Alimentacion (nombre_tipo) VALUES 
('Omnívora'), ('Vegetariana'), ('Vegana'), ('Keto');