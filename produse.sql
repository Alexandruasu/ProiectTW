DROP TYPE IF EXISTS brand;
DROP TYPE IF EXISTS tipuri_echipamente_audio;

CREATE TYPE brand AS ENUM( 'JBL', 'BOSE', 'SAMSUNG');
CREATE TYPE tipuri_echipamente_audio AS ENUM('casti', 'boxe', 'amplificatoare', 'accesorii ');
CREATE TYPE nume_tip_categorie AS ENUM('casti over-ear', 'casti in-ear', 'boxe portabile', 'boxe de birou', 'amplificatoare audio', 'cabluri audio', 'cabluri', 'suporturi si standuri');
CREATE TYPE culori AS ENUM('negru', 'alb', 'gri', 'albastru', 'rosu', 'verde', 'galben', 'portocaliu', 'mov', 'roz', 'maro', 'bej');
CREATE TYPE tip_garantie AS ENUM ('standard 1 an','standard 2 ani','extins 3 ani','extins 5 ani','fără garanție');
CREATE TABLE IF NOT EXISTS echipamente_audio (
   id serial PRIMARY KEY,
   nume VARCHAR(50) UNIQUE NOT NULL,
   descriere TEXT,
   pret NUMERIC(8,2) NOT NULL, 
   tip_produs tipuri_echipamente_audio DEFAULT 'casti',
   nume_tip nume_tip_categorie ,
   numar_decibeli INT NOT NULL CHECK (numar_decibeli>=0),
   categorie brand ,
   specificatie VARCHAR [], --pot sa nu fie specificare deci nu punem NOT NULL
   garantie BOOLEAN NOT NULL DEFAULT FALSE,
   conectivitate_cu_fir BOOLEAN NOT NULL DEFAULT FALSE,
   greutate_grame INT NOT NULL CHECK (greutate_grame >= 0);
   culoare culori[]
   tip_garantie tip_garantie,
   data_adaugare TIMESTAMP DEFAULT current_timestamp,
   imagine VARCHAR(300),  
);

INSERT INTO echipamente_audio (
    nume, descriere, pret, tip_produs, nume_tip, numar_decibeli, categorie, specificatie, garantie, conectivitate_cu_fir, greutate_grame, culoare, tip_garantie, data_adaugare, imagine
) VALUES 
('Casti JBL Over-Ear', 'Casti audio de înaltă calitate', 150.00, 'casti', 'casti over-ear', 90, 'JBL', ARRAY['Bluetooth', 'Rezistente la apa'], TRUE, TRUE, 200, ARRAY['negru', 'albastru']::culori[], 'standard 1 an', current_timestamp, 'link_imaginii.jpg'),
('Boxe Bose', 'Boxe de calitate superioară', 300.00, 'boxe', 'boxe portabile', 100, 'BOSE', ARRAY['Bluetooth', 'Baterie de lungă durată'], TRUE, FALSE, 1200, ARRAY['alb']::culori[], 'standard 2 ani', current_timestamp, 'link_imaginii.jpg'),
('Amplificator Samsung', 'Amplificator audio puternic', 500.00, 'amplificatoare', 'amplificatoare audio', 120, 'SAMSUNG', ARRAY['Bluetooth', 'Wi-Fi'], TRUE, FALSE, 3000, ARRAY['negru']::culori[], 'extins 3 ani', current_timestamp, 'link_imaginii.jpg'),
('Casti JBL In-Ear', 'Casti audio compacte și confortabile', 80.00, 'casti', 'casti in-ear', 85, 'JBL', ARRAY['Bluetooth', 'Microfon incorporat'], TRUE, FALSE, 50, ARRAY['negru']::culori[], 'standard 1 an', current_timestamp, 'link_imaginii.jpg'),
('Boxe Samsung de Birou', 'Boxe elegante potrivite pentru mediul de birou', 200.00, 'boxe', 'boxe de birou', 95, 'SAMSUNG', ARRAY['Bluetooth', 'Design compact'], TRUE, FALSE, 800, ARRAY['gri']::culori[], 'standard 2 ani', current_timestamp, 'link_imaginii.jpg'),
('Amplificator JBL', 'Amplificator audio compact și puternic', 400.00, 'amplificatoare', 'amplificatoare audio', 110, 'JBL', ARRAY['Bluetooth', 'Compatibil cu diverse surse audio'], TRUE, FALSE, 2500, ARRAY['negru']::culori[], 'standard 2 ani', current_timestamp, 'link_imaginii.jpg'),
('Căști Samsung Sport', 'Căști pentru activități sportive cu rezistență la apă', 100.00, 'casti', 'casti in-ear', 80, 'SAMSUNG', ARRAY['Bluetooth', 'Rezistente la apă și transpirație'], TRUE, TRUE, 60, ARRAY['galben', 'albastru']::culori[], 'standard 1 an', current_timestamp, 'link_imaginii.jpg'),
('Boxe Bluetooth Bose', 'Boxe compacte și portabile cu sunet de înaltă fidelitate', 250.00, 'boxe', 'boxe portabile', 95, 'BOSE', ARRAY['Bluetooth', 'Autonomie ridicată a bateriei'], TRUE, FALSE, 900, ARRAY['alb']::culori[], 'standard 2 ani', current_timestamp, 'link_imaginii.jpg'),
('Amplificator JBL Profesional', 'Amplificator puternic pentru uz profesional', 600.00, 'amplificatoare', 'amplificatoare audio', 130, 'JBL', ARRAY['Bluetooth', 'Control DSP'], TRUE, FALSE, 3500, ARRAY['negru']::culori[], 'extins 3 ani', current_timestamp, 'link_imaginii.jpg'),
('Casti JBL DJ', 'Casti cu sunet de înaltă calitate pentru DJ', 130.00, 'casti', 'casti over-ear', 95, 'JBL', ARRAY['Bluetooth', 'Design robust'], TRUE, TRUE, 300, ARRAY['negru']::culori[], 'standard 1 an', current_timestamp, 'link_imaginii.jpg'),
('Boxe Bose Surround', 'Boxe pentru experiență audio surround imersivă', 450.00, 'boxe', 'boxe portabile', 105, 'BOSE', ARRAY['Bluetooth', 'Tehnologie de calibrare audio'], TRUE, FALSE, 1500, ARRAY['alb']::culori[], 'standard 2 ani', current_timestamp, 'link_imaginii.jpg'),
('Amplificator Samsung Hi-Fi', 'Amplificator audio de înaltă fidelitate', 700.00, 'amplificatoare', 'amplificatoare audio', 140, 'SAMSUNG', ARRAY['Bluetooth', 'Compatibilitate multiroom'], TRUE, FALSE, 4000, ARRAY['maro']::culori[], 'extins 5 ani', current_timestamp, 'link_imaginii.jpg'),
('Casti Bose Noise Cancelling', 'Casti premium cu tehnologie de anulare a zgomotului', 350.00, 'casti', 'casti over-ear', 100, 'BOSE', ARRAY['Bluetooth', 'Anulare activă a zgomotului'], TRUE, TRUE, 250, ARRAY['rosu']::culori[], 'standard 2 ani', current_timestamp, 'link_imaginii.jpg'),
('Boxe JBL Party', 'Boxe portabile cu lumină ambientală și efecte DJ', 300.00, 'boxe', 'boxe portabile', 110, 'JBL', ARRAY['Bluetooth', 'Efecte luminoase sincronizate cu muzica'], TRUE, FALSE, 1400, ARRAY['verde']::culori[], 'standard 2 ani', current_timestamp, 'link_imaginii.jpg'),
('Amplificator Samsung Bluetooth', 'Amplificator compact și versatil cu conectivitate Bluetooth', 200.00, 'amplificatoare', 'amplificatoare audio', 100, 'SAMSUNG', ARRAY['Bluetooth', 'Control wireless'], TRUE, FALSE, 2000, ARRAY['portocaliu']::culori[], 'standard 2 ani', current_timestamp, 'link_imaginii.jpg'),
('Casti JBL Kids', 'Căști pentru copii cu volum limitat și design colorat', 60.00, 'casti', 'casti over-ear', 85, 'JBL', ARRAY['Bluetooth', 'Limitator de volum integrat'], TRUE, TRUE, 100, ARRAY['roz']::culori[], 'standard 1 an', current_timestamp, 'link_imaginii.jpg');
