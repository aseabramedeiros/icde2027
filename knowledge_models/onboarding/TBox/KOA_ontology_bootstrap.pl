% =====================================================================
% KOA TBox (schema-only) - generated from predicate signatures
% No individuals (ABox) facts are produced here.
% =====================================================================

:- module(koa_tbox, [
    base_iri/1,
    class/1,
    predicate_signature/2,
    datatype_property/2,
    object_property/2,
    domain/2,
    range/2,
    label/2
]).

base_iri('http://example.org/koa#').

% --- Classes ----------------------------------------------------------
class(contract).
label(contract, 'Contract').

% --- Predicates / Properties (schema) --------------------------------
% Convention:
%   datatype_property(PredicateName, Arity) for unary predicates
%   object_property(PredicateName, Arity)   for predicates with arity >= 2
%   domain(PredicateName/Arity, contract)
%   range(PredicateName/Arity, xsd_string | thing)

predicate_signature(contract, 1).
label(contract/1, 'contract/1').
datatype_property(contract, 1).
domain(contract/1, contract).
range(contract/1, xsd_string).

predicate_signature(contract_clause, 4).
label(contract_clause/4, 'contract_clause/4').
object_property(contract_clause, 4).
domain(contract_clause/4, contract).
range(contract_clause/4, thing).

predicate_signature(contract_clause_fact, 5).
label(contract_clause_fact/5, 'contract_clause_fact/5').
object_property(contract_clause_fact, 5).
domain(contract_clause_fact/5, contract).
range(contract_clause_fact/5, thing).

predicate_signature(contract_metadata, 3).
label(contract_metadata/3, 'contract_metadata/3').
object_property(contract_metadata, 3).
domain(contract_metadata/3, contract).
range(contract_metadata/3, thing).


% ===============================
% Frozen vocabulary (TBox)
% ===============================

% Allowed keys for contract_metadata/3
allowed_metadata_key(centro_custo).
allowed_metadata_key(cnpj_contratado).
allowed_metadata_key(cnpj_contratante).
allowed_metadata_key(contratado).
allowed_metadata_key(contratante).
allowed_metadata_key(data_autorizacao).
allowed_metadata_key(data_ip_ati_degat).
allowed_metadata_key(ip_ati_degat).
allowed_metadata_key(lei_aplicavel).
allowed_metadata_key(numero_ocs).
allowed_metadata_key(numero_sap).
allowed_metadata_key(objeto).
allowed_metadata_key(partes).
allowed_metadata_key(procedimento_licitatorio).
allowed_metadata_key(regulamento).
allowed_metadata_key(rubrica_orcamentaria).
allowed_metadata_key(tipo_contrato).

% Allowed fact types for contract_clause_fact/5
allowed_fact_type(anexo_matriz_riscos).
allowed_fact_type(atribuicoes_gestor).
allowed_fact_type(condicao_prorrogacao_nao_concluida).
allowed_fact_type(consequencia_apresentacao_fora_prazo).
allowed_fact_type(consequencia_descumprimento_niveis).
allowed_fact_type(consequencia_execucao_parcial).
allowed_fact_type(consequencia_nao_apresentacao).
allowed_fact_type(consequencia_nao_demanda_total).
allowed_fact_type(consequencia_nao_solicitacao).
allowed_fact_type(consequencia_recusa_prorrogacao).
allowed_fact_type(consequencia_rescisao).
allowed_fact_type(consequencias_rescisao).
allowed_fact_type(data_inicial_reajuste).
allowed_fact_type(direito_bndes_deduzir).
allowed_fact_type(direito_equilibrio).
allowed_fact_type(documento_fiscal).
allowed_fact_type(documentos_revisao).
allowed_fact_type(forma_cobranca_multas).
allowed_fact_type(forma_pagamento).
allowed_fact_type(forma_prorrogacao).
allowed_fact_type(formas_rescisao).
allowed_fact_type(foro).
allowed_fact_type(hipoteses_execucao_garantia).
allowed_fact_type(indice_reajuste).
allowed_fact_type(informacoes_documento).
allowed_fact_type(juros_mora).
allowed_fact_type(legislacao_rescisao).
allowed_fact_type(liberacao_garantia).
allowed_fact_type(motivos_revisao).
allowed_fact_type(multa_inexecucao_parcial).
allowed_fact_type(multa_inexecucao_total).
allowed_fact_type(multa_mora).
allowed_fact_type(objeto).
allowed_fact_type(obrigacoes).
allowed_fact_type(padroes_servico).
allowed_fact_type(penalidades).
allowed_fact_type(periodicidade_reajuste).
allowed_fact_type(prazo_analise_bndes).
allowed_fact_type(prazo_apresentacao_documento).
allowed_fact_type(prazo_complementacao_garantia).
allowed_fact_type(prazo_comunicacao_interesse_prorrogacao).
allowed_fact_type(prazo_manifestacao_prorrogacao).
allowed_fact_type(prazo_maximo_prorrogacao).
allowed_fact_type(prazo_pagamento).
allowed_fact_type(prazo_pagamento_apos_recebimento).
allowed_fact_type(prazo_solicitacao_reajuste_revisao).
allowed_fact_type(prazo_substituicao).
allowed_fact_type(prazo_suspensao).
allowed_fact_type(prazo_validade_garantia).
allowed_fact_type(prazo_vigencia).
allowed_fact_type(reajuste_matriz).
allowed_fact_type(referencia_execucao).
allowed_fact_type(referencia_recebimento).
allowed_fact_type(responsabilidade_contratado).
allowed_fact_type(responsavel_recebimento).
allowed_fact_type(retencoes_tributarias).
allowed_fact_type(tipo_garantia).
allowed_fact_type(valor_garantia).
allowed_fact_type(valor_incluso).
allowed_fact_type(valor_maximo).
allowed_fact_type(vedacao_aditivos).
allowed_fact_type(vigencia_minima_garantia).

% Fallback (quando não encaixar no vocabulário congelado):
%   contract_metadata_raw(ContractId, KeyText, Value, Evidence).
%   contract_clause_fact_raw(ContractId, ClauseId, FactTypeText, Data, Evidence).
