--Créer un déclencheur after_products_update sur la table products : 
--lorsque le stock physique devient inférieur au stock d'alerte, une nouvelle ligne est insérée dans la table commander_articles.

CREATE TABLE commander_articles (
    codart INT NOT NULL,
    qte INT,
    datedecommande DATETIME
    
)
ENGINE=InnoDB;




DELIMITER |
CREATE TRIGGER after_products_update
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
IF NEW.pro_stock < NEW.pro_stock_alert
THEN 
INSERT INTO commander_articles(codart, qte, datedecommande)
VALUES (NEW.pro_id, NEW.pro_stock_alert - NEW.pro_stock, NOW());
ELSE IF NEW.pro_stock < NEW.pro_stock_alert
AND OLD.pro_id = NEW.pro_id
THEN 
UPDATE commander_articles
SET codart = NEW.pro_id, qte = NEW.pro_stock_alert - NEW.pro_stock, datedecommande = NOW();
END IF;
END IF;
END |
DELIMITER ;