USE tf_grupo10

CREATE TABLE IF NOT EXISTS `tf_grupo10`.`noticia` (
  `idnoticia` INT NOT NULL AUTO_INCREMENT,
  `idusuario` INT NOT NULL,
  `titulo` VARCHAR(50) NOT NULL,
  `creada` DATETIME NOT NULL,
  `publicada` INT(1) NOT NULL DEFAULT 0,
  `contenido` TEXT NULL DEFAULT NULL,
  PRIMARY KEY (`idnoticia`),
  INDEX `idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `idusuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `tf_grupo10`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS `tf_grupo10`.`usuario` (
  `idusuario` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `username` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(15) NULL DEFAULT NULL,
  `rol` INT(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`idusuario`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `telefono_UNIQUE` (`telefono` ASC) VISIBLE,
  UNIQUE INDEX `idusuario_UNIQUE` (`idusuario` ASC) VISIBLE);
  
  CREATE TABLE IF NOT EXISTS `tf_grupo10`.`comentario` (
  `idcomentario` INT NOT NULL AUTO_INCREMENT,
  `idnoticia` INT NOT NULL,
  `idusuario` INT NOT NULL,
  `creado` DATETIME NOT NULL,
  `contenido` TEXT NOT NULL,
  PRIMARY KEY (`idcomentario`),
  INDEX `idnoticia_idx` (`idnoticia` ASC) VISIBLE,
  INDEX `idusuario_idx` (`idusuario` ASC) VISIBLE,
  CONSTRAINT `idnoticia`
    FOREIGN KEY (`idnoticia`)
    REFERENCES `tf_grupo10`.`noticia` (`idnoticia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idusuario`
    FOREIGN KEY (`idusuario`)
    REFERENCES `tf_grupo10`.`usuario` (`idusuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `tf_grupo10`.`categoria` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT,
  `titulo` VARCHAR(45) NOT NULL,
  `contenido` TEXT NULL,
  PRIMARY KEY (`idcategoria`));
  
  CREATE TABLE IF NOT EXISTS `tf_grupo10`.`noticia_categoria` (
  `idnoticia_categoria` INT NOT NULL,
  `idnoticia` INT NOT NULL,
  `idcategoria` INT NOT NULL,
  PRIMARY KEY (`idnoticia_categoria`),
  INDEX `idnoticia_idx` (`idnoticia` ASC) VISIBLE,
  INDEX `idcategoria_idx` (`idcategoria` ASC) VISIBLE,
  CONSTRAINT `idnoticia`
    FOREIGN KEY (`idnoticia`)
    REFERENCES `tf_grupo10`.`noticia` (`idnoticia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idcategoria`
    FOREIGN KEY (`idcategoria`)
    REFERENCES `tf_grupo10`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `tf_grupo10`.`etiqueta` (
  `idetiqueta` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `contenido` TEXT NULL,
  PRIMARY KEY (`idetiqueta`));
  
  CREATE TABLE IF NOT EXISTS `tf_grupo10`.`noticia_etiqueta` (
  `idnoticia_etiqueta` INT NOT NULL,
  `idnoticia` INT NOT NULL,
  `idetiqueta` INT NOT NULL,
  PRIMARY KEY (`idnoticia_etiqueta`),
  INDEX `idnoticia_idx` (`idnoticia` ASC) VISIBLE,
  INDEX `idetiqueta_idx` (`idetiqueta` ASC) VISIBLE,
  CONSTRAINT `idnoticia`
    FOREIGN KEY (`idnoticia`)
    REFERENCES `tf_grupo10`.`noticia` (`idnoticia`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `idetiqueta`
    FOREIGN KEY (`idetiqueta`)
    REFERENCES `tf_grupo10`.`etiqueta` (`idetiqueta`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
    CREATE TABLE IF NOT EXISTS `tf_grupo10`.`blog` (
  `idblog` INT NOT NULL,
  `info` TEXT NULL,
  `telefono` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `descargas` VARCHAR(45) NULL,
  PRIMARY KEY (`idblog`),
  UNIQUE INDEX `idblog_UNIQUE` (`idblog` ASC) VISIBLE);