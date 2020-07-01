--izlistati regularne clanove koji su drzali predavanje iz oblasti retorike i sortirati im sifre u opadajucem redoslijedu

create or replace view pogled as select distinct sif_rc, mbr, pib, int_br1 from reg_clan rc
    inner join mentorise m on rc.sif_rc = m.reg_clan_sif_rc
    inner join drzi d on m.reg_clan_sif_rc = d.mentorise_sif_rc
    inner join predavanja p on d.mentorise_int_br1 = p.obuka_lk_int_br1
    where p.obuka_naz_ob = 'Retorika' order by rc.sif_rc desc;
    
    
