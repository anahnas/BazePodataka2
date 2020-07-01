-- Generated by Oracle SQL Developer Data Modeler 19.4.0.350.1424
--   at:        2020-01-29 01:13:40 CET
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



CREATE TABLE clan (
    id_cl       INTEGER,
    dat_uc      DATE,
    ime         VARCHAR2(19),
    prz         VARCHAR2(19),
    mbr         INTEGER NOT NULL,
    lk_pib      INTEGER NOT NULL,
    lk_int_br1  INTEGER NOT NULL,
    tip_cl      VARCHAR2(19) NOT NULL
);

ALTER TABLE clan
    ADD CONSTRAINT ch_inh_clan CHECK ( tip_cl IN (
        'Clan_Up_Od',
        'Koordinator',
        'Praktikant',
        'Reg_Clan'
    ) );

ALTER TABLE clan
    ADD CONSTRAINT clan_pk PRIMARY KEY ( mbr,
                                         lk_pib,
                                         lk_int_br1 );

CREATE TABLE clan_up_od (
    sif_cuo  INTEGER NOT NULL,
    mbr      INTEGER NOT NULL,
    pib      INTEGER NOT NULL,
    int_br1  INTEGER NOT NULL
);

ALTER TABLE clan_up_od
    ADD CONSTRAINT clan_up_od_pk PRIMARY KEY ( mbr,
                                               pib,
                                               int_br1 );

ALTER TABLE clan_up_od ADD CONSTRAINT clan_up_od_pkv1 UNIQUE ( sif_cuo );

CREATE TABLE drzi (
    predavanja_naz_pred  VARCHAR2(19) NOT NULL,
    predavanja_naz_ob    VARCHAR2(19) NOT NULL,
    predavanja_pib       INTEGER NOT NULL,
    predavanja_int_br1   INTEGER NOT NULL,
    mentorise_sif_rc     INTEGER NOT NULL,
    mentorise_naz_ob     VARCHAR2(19) NOT NULL,
    mentorise_pib        INTEGER NOT NULL,
    mentorise_int_br1    INTEGER NOT NULL
);

ALTER TABLE drzi
    ADD CONSTRAINT drzi_pk PRIMARY KEY ( predavanja_naz_pred,
                                         predavanja_naz_ob,
                                         predavanja_pib,
                                         predavanja_int_br1,
                                         mentorise_sif_rc,
                                         mentorise_naz_ob,
                                         mentorise_pib,
                                         mentorise_int_br1 );

CREATE TABLE generalna_direkcija (
    int_br       INTEGER NOT NULL,
    reg_br       INTEGER,
    br_lok_kanc  INTEGER
);

ALTER TABLE generalna_direkcija ADD CONSTRAINT generalna_direkcija_pk PRIMARY KEY ( int_br );

CREATE TABLE koordinator (
    sif_k    INTEGER NOT NULL,
    mbr      INTEGER NOT NULL,
    pib      INTEGER NOT NULL,
    int_br1  INTEGER NOT NULL
);

ALTER TABLE koordinator
    ADD CONSTRAINT koordinator_pk PRIMARY KEY ( mbr,
                                                pib,
                                                int_br1 );

ALTER TABLE koordinator ADD CONSTRAINT koordinator_pkv1 UNIQUE ( sif_k );

CREATE TABLE lk (
    pib                         INTEGER NOT NULL,
    naz_mjesta                  VARCHAR2(19),
    generalna_direkcija_int_br  INTEGER NOT NULL
);

ALTER TABLE lk ADD CONSTRAINT lk_pk PRIMARY KEY ( pib,
                                                  generalna_direkcija_int_br );

CREATE TABLE mentorise (
    reg_clan_sif_rc  INTEGER NOT NULL,
    obuka_naz_ob     VARCHAR2(19) NOT NULL,
    obuka_pib        INTEGER NOT NULL,
    obuka_int_br1    INTEGER NOT NULL
);

ALTER TABLE mentorise
    ADD CONSTRAINT mentorise_pk PRIMARY KEY ( reg_clan_sif_rc,
                                              obuka_naz_ob,
                                              obuka_pib,
                                              obuka_int_br1 );

CREATE TABLE nadgleda (
    tim_naz_t            VARCHAR2(19) NOT NULL,
    koordinator_mbr      INTEGER NOT NULL,
    koordinator_pib      INTEGER NOT NULL,
    koordinator_int_br1  INTEGER NOT NULL
);

ALTER TABLE nadgleda
    ADD CONSTRAINT nadgleda_pk PRIMARY KEY ( tim_naz_t,
                                             koordinator_mbr,
                                             koordinator_pib,
                                             koordinator_int_br1 );

CREATE TABLE obuka (
    naz_ob      VARCHAR2(19) NOT NULL,
    lk_pib      INTEGER NOT NULL,
    lk_int_br1  INTEGER NOT NULL
);

ALTER TABLE obuka
    ADD CONSTRAINT obuka_pk PRIMARY KEY ( naz_ob,
                                          lk_pib,
                                          lk_int_br1 );

CREATE TABLE osniva (
    tim_naz_t           VARCHAR2(19) NOT NULL,
    clan_up_od_mbr      INTEGER NOT NULL,
    clan_up_od_pib      INTEGER NOT NULL,
    clan_up_od_int_br1  INTEGER NOT NULL
);

ALTER TABLE osniva
    ADD CONSTRAINT osniva_pk PRIMARY KEY ( tim_naz_t,
                                           clan_up_od_mbr,
                                           clan_up_od_pib,
                                           clan_up_od_int_br1 );

CREATE TABLE praktikant (
    sif_pr   INTEGER NOT NULL,
    mbr      INTEGER NOT NULL,
    pib      INTEGER NOT NULL,
    int_br1  INTEGER NOT NULL
);

ALTER TABLE praktikant
    ADD CONSTRAINT praktikant_pk PRIMARY KEY ( mbr,
                                               pib,
                                               int_br1 );

ALTER TABLE praktikant ADD CONSTRAINT praktikant_pkv1 UNIQUE ( sif_pr );

CREATE TABLE predaje (
    predavanja_naz_pred  VARCHAR2(19) NOT NULL,
    predavanja_naz_ob    VARCHAR2(19) NOT NULL,
    predavanja_pib       INTEGER NOT NULL,
    predavanja_int_br1   INTEGER NOT NULL,
    sp_sar_jmbg          INTEGER NOT NULL
);

ALTER TABLE predaje
    ADD CONSTRAINT predaje_pk PRIMARY KEY ( predavanja_naz_pred,
                                            predavanja_naz_ob,
                                            predavanja_pib,
                                            predavanja_int_br1,
                                            sp_sar_jmbg );

CREATE TABLE predavanja (
    naz_pred          VARCHAR2(19) NOT NULL,
    obuka_naz_ob      VARCHAR2(19) NOT NULL,
    obuka_lk_pib      INTEGER NOT NULL,
    obuka_lk_int_br1  INTEGER NOT NULL
);

ALTER TABLE predavanja
    ADD CONSTRAINT predavanja_pk PRIMARY KEY ( naz_pred,
                                               obuka_naz_ob,
                                               obuka_lk_pib,
                                               obuka_lk_int_br1 );

CREATE TABLE radi (
    tim_naz_t         VARCHAR2(19) NOT NULL,
    reg_clan_mbr      INTEGER NOT NULL,
    reg_clan_pib      INTEGER NOT NULL,
    reg_clan_int_br1  INTEGER NOT NULL
);

ALTER TABLE radi
    ADD CONSTRAINT radi_pk PRIMARY KEY ( tim_naz_t,
                                         reg_clan_mbr,
                                         reg_clan_pib,
                                         reg_clan_int_br1 );

CREATE TABLE reg_clan (
    sif_rc   INTEGER NOT NULL,
    mbr      INTEGER NOT NULL,
    pib      INTEGER NOT NULL,
    int_br1  INTEGER NOT NULL
);

ALTER TABLE reg_clan
    ADD CONSTRAINT reg_clan_pk PRIMARY KEY ( mbr,
                                             pib,
                                             int_br1 );

ALTER TABLE reg_clan ADD CONSTRAINT reg_clan_pkv1 UNIQUE ( sif_rc );

CREATE TABLE sp_sar (
    ime_sar     VARCHAR2(19),
    prz_sar     VARCHAR2(19),
    zvanje_sar  VARCHAR2(19),
    jmbg        INTEGER NOT NULL
);

ALTER TABLE sp_sar ADD CONSTRAINT sp_sar_pk PRIMARY KEY ( jmbg );

CREATE TABLE tim (
    naz_t       VARCHAR2(19) NOT NULL,
    naz_od      VARCHAR2(19),
    lk_pib      INTEGER NOT NULL,
    lk_int_br1  INTEGER NOT NULL
);

ALTER TABLE tim ADD CONSTRAINT tim_pk PRIMARY KEY ( naz_t );

ALTER TABLE clan
    ADD CONSTRAINT clan_lk_fk FOREIGN KEY ( lk_pib,
                                            lk_int_br1 )
        REFERENCES lk ( pib,
                        generalna_direkcija_int_br );

ALTER TABLE clan_up_od
    ADD CONSTRAINT clan_up_od_clan_fk FOREIGN KEY ( mbr,
                                                    pib,
                                                    int_br1 )
        REFERENCES clan ( mbr,
                          lk_pib,
                          lk_int_br1 );

ALTER TABLE drzi
    ADD CONSTRAINT drzi_mentorise_fk FOREIGN KEY ( mentorise_sif_rc,
                                                   mentorise_naz_ob,
                                                   mentorise_pib,
                                                   mentorise_int_br1 )
        REFERENCES mentorise ( reg_clan_sif_rc,
                               obuka_naz_ob,
                               obuka_pib,
                               obuka_int_br1 );

ALTER TABLE drzi
    ADD CONSTRAINT drzi_predavanja_fk FOREIGN KEY ( predavanja_naz_pred,
                                                    predavanja_naz_ob,
                                                    predavanja_pib,
                                                    predavanja_int_br1 )
        REFERENCES predavanja ( naz_pred,
                                obuka_naz_ob,
                                obuka_lk_pib,
                                obuka_lk_int_br1 );

ALTER TABLE koordinator
    ADD CONSTRAINT koordinator_clan_fk FOREIGN KEY ( mbr,
                                                     pib,
                                                     int_br1 )
        REFERENCES clan ( mbr,
                          lk_pib,
                          lk_int_br1 );

ALTER TABLE lk
    ADD CONSTRAINT lk_generalna_direkcija_fk FOREIGN KEY ( generalna_direkcija_int_br )
        REFERENCES generalna_direkcija ( int_br );

ALTER TABLE mentorise
    ADD CONSTRAINT mentorise_obuka_fk FOREIGN KEY ( obuka_naz_ob,
                                                    obuka_pib,
                                                    obuka_int_br1 )
        REFERENCES obuka ( naz_ob,
                           lk_pib,
                           lk_int_br1 );

ALTER TABLE mentorise
    ADD CONSTRAINT mentorise_reg_clan_fk FOREIGN KEY ( reg_clan_sif_rc )
        REFERENCES reg_clan ( sif_rc );

ALTER TABLE nadgleda
    ADD CONSTRAINT nadgleda_koordinator_fk FOREIGN KEY ( koordinator_mbr,
                                                         koordinator_pib,
                                                         koordinator_int_br1 )
        REFERENCES koordinator ( mbr,
                                 pib,
                                 int_br1 );

ALTER TABLE nadgleda
    ADD CONSTRAINT nadgleda_tim_fk FOREIGN KEY ( tim_naz_t )
        REFERENCES tim ( naz_t );

ALTER TABLE obuka
    ADD CONSTRAINT obuka_lk_fk FOREIGN KEY ( lk_pib,
                                             lk_int_br1 )
        REFERENCES lk ( pib,
                        generalna_direkcija_int_br );

ALTER TABLE osniva
    ADD CONSTRAINT osniva_clan_up_od_fk FOREIGN KEY ( clan_up_od_mbr,
                                                      clan_up_od_pib,
                                                      clan_up_od_int_br1 )
        REFERENCES clan_up_od ( mbr,
                                pib,
                                int_br1 );

ALTER TABLE osniva
    ADD CONSTRAINT osniva_tim_fk FOREIGN KEY ( tim_naz_t )
        REFERENCES tim ( naz_t );

ALTER TABLE praktikant
    ADD CONSTRAINT praktikant_clan_fk FOREIGN KEY ( mbr,
                                                    pib,
                                                    int_br1 )
        REFERENCES clan ( mbr,
                          lk_pib,
                          lk_int_br1 );

ALTER TABLE predaje
    ADD CONSTRAINT predaje_predavanja_fk FOREIGN KEY ( predavanja_naz_pred,
                                                       predavanja_naz_ob,
                                                       predavanja_pib,
                                                       predavanja_int_br1 )
        REFERENCES predavanja ( naz_pred,
                                obuka_naz_ob,
                                obuka_lk_pib,
                                obuka_lk_int_br1 );

ALTER TABLE predaje
    ADD CONSTRAINT predaje_sp_sar_fk FOREIGN KEY ( sp_sar_jmbg )
        REFERENCES sp_sar ( jmbg );

ALTER TABLE predavanja
    ADD CONSTRAINT predavanja_obuka_fk FOREIGN KEY ( obuka_naz_ob,
                                                     obuka_lk_pib,
                                                     obuka_lk_int_br1 )
        REFERENCES obuka ( naz_ob,
                           lk_pib,
                           lk_int_br1 );

ALTER TABLE radi
    ADD CONSTRAINT radi_reg_clan_fk FOREIGN KEY ( reg_clan_mbr,
                                                  reg_clan_pib,
                                                  reg_clan_int_br1 )
        REFERENCES reg_clan ( mbr,
                              pib,
                              int_br1 );

ALTER TABLE radi
    ADD CONSTRAINT radi_tim_fk FOREIGN KEY ( tim_naz_t )
        REFERENCES tim ( naz_t );

ALTER TABLE reg_clan
    ADD CONSTRAINT reg_clan_clan_fk FOREIGN KEY ( mbr,
                                                  pib,
                                                  int_br1 )
        REFERENCES clan ( mbr,
                          lk_pib,
                          lk_int_br1 );

ALTER TABLE tim
    ADD CONSTRAINT tim_lk_fk FOREIGN KEY ( lk_pib,
                                           lk_int_br1 )
        REFERENCES lk ( pib,
                        generalna_direkcija_int_br );

CREATE OR REPLACE TRIGGER arc_fkarc_14_clan_up_od BEFORE
    INSERT OR UPDATE OF mbr, pib, int_br1 ON clan_up_od
    FOR EACH ROW
DECLARE
    d VARCHAR2(19);
BEGIN
    SELECT
        a.tip_cl
    INTO d
    FROM
        clan a
    WHERE
            a.mbr = :new.mbr
        AND a.lk_pib = :new.pib
        AND a.lk_int_br1 = :new.int_br1;

    IF ( d IS NULL OR d <> 'Clan_Up_Od' ) THEN
        raise_application_error(-20223, 'FK Clan_Up_Od_Clan_FK in Table Clan_Up_Od violates Arc constraint on Table Clan - discriminator column Tip_Cl doesn''t have value ''Clan_Up_Od''');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_14_koordinator BEFORE
    INSERT OR UPDATE OF mbr, pib, int_br1 ON koordinator
    FOR EACH ROW
DECLARE
    d VARCHAR2(19);
BEGIN
    SELECT
        a.tip_cl
    INTO d
    FROM
        clan a
    WHERE
            a.mbr = :new.mbr
        AND a.lk_pib = :new.pib
        AND a.lk_int_br1 = :new.int_br1;

    IF ( d IS NULL OR d <> 'Koordinator' ) THEN
        raise_application_error(-20223, 'FK Koordinator_Clan_FK in Table Koordinator violates Arc constraint on Table Clan - discriminator column Tip_Cl doesn''t have value ''Koordinator''');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_14_reg_clan BEFORE
    INSERT OR UPDATE OF mbr, pib, int_br1 ON reg_clan
    FOR EACH ROW
DECLARE
    d VARCHAR2(19);
BEGIN
    SELECT
        a.tip_cl
    INTO d
    FROM
        clan a
    WHERE
            a.mbr = :new.mbr
        AND a.lk_pib = :new.pib
        AND a.lk_int_br1 = :new.int_br1;

    IF ( d IS NULL OR d <> 'Reg_Clan' ) THEN
        raise_application_error(-20223, 'FK Reg_Clan_Clan_FK in Table Reg_Clan violates Arc constraint on Table Clan - discriminator column Tip_Cl doesn''t have value ''Reg_Clan''');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/

CREATE OR REPLACE TRIGGER arc_fkarc_14_praktikant BEFORE
    INSERT OR UPDATE OF mbr, pib, int_br1 ON praktikant
    FOR EACH ROW
DECLARE
    d VARCHAR2(19);
BEGIN
    SELECT
        a.tip_cl
    INTO d
    FROM
        clan a
    WHERE
            a.mbr = :new.mbr
        AND a.lk_pib = :new.pib
        AND a.lk_int_br1 = :new.int_br1;

    IF ( d IS NULL OR d <> 'Praktikant' ) THEN
        raise_application_error(-20223, 'FK Praktikant_Clan_FK in Table Praktikant violates Arc constraint on Table Clan - discriminator column Tip_Cl doesn''t have value ''Praktikant''');
    END IF;

EXCEPTION
    WHEN no_data_found THEN
        NULL;
    WHEN OTHERS THEN
        RAISE;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            17
-- CREATE INDEX                             0
-- ALTER TABLE                             43
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           4
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0