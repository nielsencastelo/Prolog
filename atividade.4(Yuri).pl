%Para encontrar a doen�a atrav�s de um sintoma: sintoma_de(sintoma,_x).
%Para encontrar todos os sintomas de uma doen�a: diagnostico(doen�a,_x).
%Para encontrar o tratamento da doen�a: como_proceder(_x,doen�a).

sintoma_de(dores_no_corpo,gripe).
sintoma_de(tosse_e_espirros,gripe).
sintoma_de(sensa�ao_de_frio,gripe).
sintoma_de(febre,gripe).
sintoma_de(fadiga,gripe).
sintoma_de(dor_de_cabe�a,gripe).
sintoma_de(irrita�ao_nos_olhos,gripe).
sintoma_de(congestao_nasal,gripe).
sintoma_de(dor_severa,otite).
sintoma_de(diminui�ao_da_audi�ao,otite).
sintoma_de(febre,otite).
sintoma_de(irritabilidade,otite).
sintoma_de(desconforto,otite).
sintoma_de(perda_de_apetite,otite).
sintoma_de(secre�ao_no_ouvido,otite).
sintoma_de(tosse,pneumonia).
sintoma_de(fadiga,pneumonia).
sintoma_de(febre,pneumonia).
sintoma_de(falta_de_ar,pneumonia).
sintoma_de(expectora�ao,pneumonia).
sintoma_de(dor_no_peito,pneumonia).
sintoma_de(vomito,meningite).
sintoma_de(dificuldade_de_mover_o_pesco�o,meningite).
sintoma_de(sensibilidade_a_luz_e_aos_ruidos,meningite).
sintoma_de(manchas_na_pele,meningite).
sintoma_de(dificuldade_respiratoria,asma).
sintoma_de(tosse,asma).
sintoma_de(catarro,asma).
sintoma_de(ardencia_e/ou_dor_peitoral,asma).
sintoma_de(chiado_peitoral,asma).
tratamento_de(ingerir_muitos_liquidos,gripe).
tratamento_de(evitar_mudan�as_de_temperatura,gripe).
tratamento_de(aplicar_soro_fisiologico,gripe).
tratamento_de(manter_repuso,gripe).
tratamento_de(antibioticos,otite).
tratamento_de(analgesicos,otite).
tratamento_de(procedimento_cirurgico,otite).
tratamento_de(antibioticos,pneumonia).
tratamento_de(fisioterapia_respiratoria,pneumonia).
tratamento_de(broncodilatadores,asma).
tratamento_de(anti-inflamatorios,asma).
tratamento_de(fisioterapia,asma).

diagnostico(_x,_y):-sintoma_de(_y,_x).
como_proceder(_a,_b):-tratamento_de(_a,_b);write('consulte seu m�dico').













