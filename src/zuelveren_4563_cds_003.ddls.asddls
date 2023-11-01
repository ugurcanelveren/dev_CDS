@AbapCatalog.sqlViewName: 'ZUE_4563_V_003'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'CDS Ödevi 2. Aşama'
define view zuelveren_4563_cds_003
  as select from zue_4563_v_002 as zue_cds003
{
  key zue_cds003.vbeln,
      sum( zue_cds003.conversion_netwr )           as toplam_net_deger,
      zue_cds003.kunnrad                           as musteri_adsoyad,
      count( * )                                   as toplam_fatura_miktar,
      division(cast( sum( zue_cds003.conversion_netwr ) as abap.curr( 10,3 ) ),
               cast( count( * ) as abap.int1 ), 3) as ortalama_miktar,
      substring(zue_cds003.fkdat, 1, 4)            as faturalama_yil,
      substring(zue_cds003.fkdat, 5, 2)            as faturalama_ay,
      substring(zue_cds003.fkdat, 7, 2)            as faturalama_gun,
      left(zue_cds003.inco2_l,3)                   as incoterm_yeri

}

group by
  zue_cds003.vbeln,
  zue_cds003.kunnrad,
  zue_cds003.fkdat,
  zue_cds003.inco2_l
