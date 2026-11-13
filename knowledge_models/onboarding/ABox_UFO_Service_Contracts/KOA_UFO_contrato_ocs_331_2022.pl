% ===== KOA Combined Output | contract_id: contrato_ocs_331_2022 =====

% ===== 1) UFO Ontology =====
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SERVICE CONTRACT ONTOLOGY EM PROLOG
% Inspirada em UFO-L + UFO-S + Service Contract Ontology (Griffo et al., 2017)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% META-ESTRUTURA (TBox: classes, especializações, relações entre classes)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Predicados básicos de metamodelo
class(C).          % C é uma classe ontológica
subclass_of(C, P). % C é subclasse de P
disjoint(C1, C2).  % C1 e C2 são disjuntas conceitualmente

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Núcleo UFO-A / UFO-C simplificado
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class(agent).           % agente (pessoa, organização etc.)
class(relator).         % relator genérico
class(moment).          % propriedade/momento (trope no sentido do UFO)

class(social_relator).
class(legal_relator).

subclass_of(social_relator, relator).
subclass_of(legal_relator, social_relator).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LEGAL MOMENTS E LEGAL RELATORS (UFO-L)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class(legal_moment).
class(legal_entitlement).      % vantagens jurídicas
class(legal_burden_or_lack).  % ônus / falta de prerrogativa

subclass_of(legal_entitlement, legal_moment).
subclass_of(legal_burden_or_lack, legal_moment).

% Tipos de legal relators
class(simple_legal_relator).
class(complex_legal_relator).

subclass_of(simple_legal_relator, legal_relator).
subclass_of(complex_legal_relator, legal_relator).

% ---------------------------------------------------------------------------
% Right / Duty
% ---------------------------------------------------------------------------

class(right).
class(right_to_action).
class(right_to_omission).

class(duty).
class(duty_to_act).
class(duty_to_omit).

subclass_of(right, legal_entitlement).
subclass_of(right_to_action, right).
subclass_of(right_to_omission, right).

subclass_of(duty, legal_burden_or_lack).
subclass_of(duty_to_act, duty).
subclass_of(duty_to_omit, duty).

% ---------------------------------------------------------------------------
% NoRight / Permission
% ---------------------------------------------------------------------------

class(no_right).
class(no_right_to_action).
class(no_right_to_omission).

class(permission).
class(permission_to_act).
class(permission_to_omit).

subclass_of(no_right, legal_burden_or_lack).
subclass_of(no_right_to_action, no_right).
subclass_of(no_right_to_omission, no_right).

subclass_of(permission, legal_entitlement).
subclass_of(permission_to_act, permission).
subclass_of(permission_to_omit, permission).

% ---------------------------------------------------------------------------
% Power / Subjection (Liability)
% ---------------------------------------------------------------------------

class(power).
class(subjection).

subclass_of(power, legal_entitlement).
subclass_of(subjection, legal_burden_or_lack).

% ---------------------------------------------------------------------------
% Disability / Immunity
% ---------------------------------------------------------------------------

class(disability).
class(immunity).

subclass_of(disability, legal_burden_or_lack).
subclass_of(immunity, legal_entitlement).

% ---------------------------------------------------------------------------
% Liberty (liberdade desprotegida como complex legal relator)
% ---------------------------------------------------------------------------

class(liberty_relator).
subclass_of(liberty_relator, complex_legal_relator).

% ---------------------------------------------------------------------------
% Tipos de Simple Legal Relator (pares correlatos)
% ---------------------------------------------------------------------------

class(right_duty_relator).
class(noright_permission_relator).
class(power_subjection_relator).
class(disability_immunity_relator).

subclass_of(right_duty_relator, simple_legal_relator).
subclass_of(noright_permission_relator, simple_legal_relator).
subclass_of(power_subjection_relator, simple_legal_relator).
subclass_of(disability_immunity_relator, simple_legal_relator).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CORRELAÇÃO ENTRE LEGAL MOMENTS (Hohfeld + Alexy)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Correlatos em nível de classe
correlates(right_to_action,   duty_to_act).
correlates(duty_to_act,       right_to_action).

correlates(right_to_omission, duty_to_omit).
correlates(duty_to_omit,      right_to_omission).

correlates(permission_to_act,     no_right_to_action).
correlates(no_right_to_action,    permission_to_act).

correlates(permission_to_omit,    no_right_to_omission).
correlates(no_right_to_omission,  permission_to_omit).

correlates(power,      subjection).
correlates(subjection, power).

correlates(disability, immunity).
correlates(immunity,   disability).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SERVICE RELATIONS E SERVICE CONTRACTS (núcleo UFO-S simplificado)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

class(service_relation).
class(service_agreement).
class(legal_service_agreement).

subclass_of(service_agreement, service_relation).
subclass_of(legal_service_agreement, service_agreement).

% Papéis em relações de serviço
class(service_provider_role).
class(target_customer_role).
class(hired_service_provider_role).
class(service_customer_role).

subclass_of(hired_service_provider_role, service_provider_role).
subclass_of(service_customer_role,       target_customer_role).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SERVICE CONTRACT ONTOLOGY (Fig. 4 do artigo)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Em um Legal Service Agreement, cada parte tem Entitlements e Burdens/Lacks
class(hsp_entitlement).      % Hired Service Provider Entitlement
class(hsp_burden_or_lack).   % Hired Service Provider Burden/Lack
class(sc_entitlement).       % Service Customer Entitlement
class(sc_burden_or_lack).    % Service Customer Burden/Lack

subclass_of(hsp_entitlement, legal_entitlement).
subclass_of(sc_entitlement,  legal_entitlement).

subclass_of(hsp_burden_or_lack, legal_burden_or_lack).
subclass_of(sc_burden_or_lack,  legal_burden_or_lack).

% Composição: um Legal Service Agreement é composto de legal moments
% associados a cada papel (provider x customer).
relator_component(legal_service_agreement, hsp_entitlement).
relator_component(legal_service_agreement, hsp_burden_or_lack).
relator_component(legal_service_agreement, sc_entitlement).
relator_component(legal_service_agreement, sc_burden_or_lack).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ESQUEMA PARA INSTÂNCIAS (ABox): AGENTES, ACORDOS, CLÁUSULAS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% instance_of(Instancia, Classe).
% Você vai usar isso para criar indivíduos (contratos, cláusulas, agentes...).

:- dynamic instance_of/2.
:- dynamic plays_role/3.
:- dynamic legal_relation_instance/4.
:- dynamic clause_of/2.

% plays_role(Agente, Papel, Acordo).
% Ex.: plays_role(aws, hired_service_provider_role, aws_sns_agreement).
%      plays_role(cliente_x, service_customer_role, aws_sns_agreement).
plays_role(Agent, Role, Agreement).

% clause_of(ClauseId, Agreement).
% ClauseId é uma cláusula (ou grupo de cláusulas) de um acordo específico.
clause_of(ClauseId, Agreement).

% legal_relation_instance(ClauseId, LegalMoment, Bearer, Action).
%
% ClauseId   - identificador da cláusula
% LegalMoment- classe do momento jurídico (duty_to_omit, power, immunity...)
% Bearer     - quem tem esse momento (agente ou papel)
% Action     - ação/omissão ou descrição da conduta
%
% Exemplos (para você popular depois, inspirados no artigo):
% legal_relation_instance(clause_17_1, duty_to_omit, customer, share_service_with_third_parties).
% legal_relation_instance(clause_17_1, right_to_omission, provider, share_service_with_third_parties).

legal_relation_instance(ClauseId, LegalMomentClass, Bearer, Action) :-
    clause_of(ClauseId, _Agreement),
    class(LegalMomentClass),
    (   atom(Bearer)
    ;   plays_role(Bearer, _, _)
    ),
    atom(Action).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% REGRAS AUXILIARES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% fecho transitivo de subclass_of/2
subclass_of_trans(C, P) :-
    subclass_of(C, P).
subclass_of_trans(C, P) :-
    subclass_of(C, X),
    subclass_of_trans(X, P).

% is_a(Inst, Classe) — verifica se Inst é instância (direta ou indireta) de Classe
is_a(Inst, Classe) :-
    instance_of(Inst, C0),
    (   C0 = Classe
    ;   subclass_of_trans(C0, Classe)
    ).

% um legal_moment é um entitlement se a classe dele cai abaixo de legal_entitlement
is_entitlement(Inst) :-
    instance_of(Inst, C),
    subclass_of_trans(C, legal_entitlement).

% um legal_moment é um burden/lack se cai abaixo de legal_burden_or_lack
is_burden_or_lack(Inst) :-
    instance_of(Inst, C),
    subclass_of_trans(C, legal_burden_or_lack).

% Dado um LegalMomentClass, encontrar seu correlato (em termos de classe)
correlative_class(LMClass, CorrelateClass) :-
    correlates(LMClass, CorrelateClass).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% FIM DA ONTOLOGIA BASE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% ===== 2) Generated UFO ABox =====
% UFO-only grounding generated from: KOA_Contrato_OCS_331_2022_-_Leadcomm.pl
% contract_id: contrato_ocs_331_2022

instance_of(contrato_ocs_331_2022, legal_service_agreement).

instance_of(banco_nacional_de_desenvolvimento_economico_e_social_bndes, agent).
instance_of(leadcomm_comercio_importacao_e_exportacao_ltda, agent).

plays_role(banco_nacional_de_desenvolvimento_economico_e_social_bndes, service_customer_role, contrato_ocs_331_2022).
plays_role(leadcomm_comercio_importacao_e_exportacao_ltda, hired_service_provider_role, contrato_ocs_331_2022).

clause_of(clausula_primeira_objeto, contrato_ocs_331_2022).
clause_of(clausula_segunda_vigencia, contrato_ocs_331_2022).
clause_of(clausula_terceira_local_prazo_condicoes_execucao_objeto, contrato_ocs_331_2022).
clause_of(clausula_quarta_niveis_servico, contrato_ocs_331_2022).
clause_of(clausula_quinta_recebimento_objeto, contrato_ocs_331_2022).
clause_of(clausula_sexta_preco, contrato_ocs_331_2022).
clause_of(clausula_oitava_equilibrio_economico_financeiro_contrato, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_primeiro, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_segundo, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_segundo_i, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_segundo_ii, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_segundo_iii, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_terceiro, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_quarto, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_quarto_i, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_quarto_ii, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_quarto_iii, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_quarto_iv, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_quinto, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_quinto_i, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_quinto_ii, contrato_ocs_331_2022).
clause_of(clausula_oitava_paragrafo_sexto, contrato_ocs_331_2022).
clause_of(clausula_nona_matriz_riscos, contrato_ocs_331_2022).
clause_of(clausula_nona_paragrafo_primeiro, contrato_ocs_331_2022).
clause_of(clausula_nona_paragrafo_segundo, contrato_ocs_331_2022).
clause_of(clausula_decima_garantia_contratual, contrato_ocs_331_2022).
clause_of(clausula_decima_caucao_dinheiro, contrato_ocs_331_2022).
clause_of(clausula_decima_seguro_garantia, contrato_ocs_331_2022).
clause_of(clausula_decima_seguro_garantia_a, contrato_ocs_331_2022).
clause_of(clausula_decima_seguro_garantia_a_1, contrato_ocs_331_2022).
clause_of(clausula_decima_seguro_garantia_a_2, contrato_ocs_331_2022).
clause_of(clausula_decima_seguro_garantia_a_3, contrato_ocs_331_2022).
clause_of(clausula_decima_fianca_bancaria, contrato_ocs_331_2022).
clause_of(clausula_decima_fianca_bancaria_a, contrato_ocs_331_2022).
clause_of(clausula_decima_fianca_bancaria_a_1, contrato_ocs_331_2022).
clause_of(clausula_decima_fianca_bancaria_a_2, contrato_ocs_331_2022).
clause_of(clausula_decima_fianca_bancaria_a_3, contrato_ocs_331_2022).
clause_of(clausula_decima_paragrafo_primeiro, contrato_ocs_331_2022).
clause_of(clausula_decima_paragrafo_segundo, contrato_ocs_331_2022).
clause_of(clausula_decima_paragrafo_terceiro, contrato_ocs_331_2022).
clause_of(clausula_decima_paragrafo_quarto, contrato_ocs_331_2022).
clause_of(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, contrato_ocs_331_2022).
clause_of(clausula_decima_oitava_penalidades, contrato_ocs_331_2022).
clause_of(clausula_decima_nona_alteracoes_contratuais, contrato_ocs_331_2022).
clause_of(clausula_vigésima_extincao_contrato, contrato_ocs_331_2022).
clause_of(clausula_vigésima_primeira_disposicoes_finais, contrato_ocs_331_2022).
clause_of(clausula_setima_pagamento, contrato_ocs_331_2022).
clause_of(clausula_decima_primeira_obrigacoes_contratado, contrato_ocs_331_2022).
clause_of(clausula_decima_segunda_conduta_etica, contrato_ocs_331_2022).
clause_of(clausula_decima_terceira_sigilo_informacoes, contrato_ocs_331_2022).
clause_of(clausula_decima_quarta_acesso_e_protecao_de_dados_pessoais, contrato_ocs_331_2022).
clause_of(clausula_decima_quinta_obrigações_do_bndes, contrato_ocs_331_2022).
clause_of(clausula_decima_sexta_equidade_de_genero_e_valorizacao_da_diversidade, contrato_ocs_331_2022).

legal_relation_instance(clausula_primeira_objeto, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, provide_siem_solution).
legal_relation_instance(clausula_primeira_objeto, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, receive_siem_solution).
legal_relation_instance(clausula_segunda_vigencia, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, apresentar_manifestacao_prorrogacao).
legal_relation_instance(clausula_segunda_vigencia, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, comunicar_interesse_prorrogacao).
legal_relation_instance(clausula_segunda_vigencia, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, manifestar_interesse_prorrogacao).
legal_relation_instance(clausula_segunda_vigencia, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, sujeicao_as_penalidades).
legal_relation_instance(clausula_terceira_local_prazo_condicoes_execucao_objeto, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, execute_object_according_to_specifications).
legal_relation_instance(clausula_terceira_local_prazo_condicoes_execucao_objeto, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, demand_object_execution_according_to_specifications).
legal_relation_instance(clausula_quarta_niveis_servico, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, execute_services_according_to_quality).
legal_relation_instance(clausula_quarta_niveis_servico, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, suffer_price_reduction_for_non_compliance).
legal_relation_instance(clausula_quarta_niveis_servico, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, require_service_execution_according_to_quality).
legal_relation_instance(clausula_quarta_niveis_servico, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, apply_price_reduction_for_non_compliance).
legal_relation_instance(clausula_quarta_niveis_servico, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, suffer_penalties_for_non_compliance).
legal_relation_instance(clausula_quarta_niveis_servico, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, apply_penalties_for_non_compliance).
legal_relation_instance(clausula_quinta_recebimento_objeto, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, effect_object_receipt).
legal_relation_instance(clausula_quinta_recebimento_objeto, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, effect_object_receipt).
legal_relation_instance(clausula_sexta_preco, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, pay_contracted_price).
legal_relation_instance(clausula_sexta_preco, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, receive_payment).
legal_relation_instance(clausula_sexta_preco, no_right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, demand_indemnization).
legal_relation_instance(clausula_sexta_preco, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, bear_cost_of_error).
legal_relation_instance(clausula_sexta_preco, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, accept_reduced_payment).
legal_relation_instance(clausula_oitava_equilibrio_economico_financeiro_contrato, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, exercise_right_to_economic_financial_balance).
legal_relation_instance(clausula_oitava_equilibrio_economico_financeiro_contrato, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, exercise_right_to_economic_financial_balance_contracted).
legal_relation_instance(clausula_oitava_equilibrio_economico_financeiro_contrato, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, revise_prices_to_maintain_balance).
legal_relation_instance(clausula_oitava_equilibrio_economico_financeiro_contrato, power, leadcomm_comercio_importacao_e_exportacao_ltda, revise_prices_to_maintain_balance_contracted).
legal_relation_instance(clausula_oitava_paragrafo_primeiro, power, leadcomm_comercio_importacao_e_exportacao_ltda, request_price_adjustment).
legal_relation_instance(clausula_oitava_paragrafo_primeiro, subjection, banco_nacional_de_desenvolvimento_economico_e_social_bndes, be_subject_to_price_adjustment_request).
legal_relation_instance(clausula_oitava_paragrafo_segundo, permission_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, revise_prices).
legal_relation_instance(clausula_oitava_paragrafo_segundo, permission_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, request_price_revision).
legal_relation_instance(clausula_oitava_paragrafo_segundo_i, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, formulate_bndes_requirement).
legal_relation_instance(clausula_oitava_paragrafo_segundo_ii, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, provide_revision_documents).
legal_relation_instance(clausula_oitava_paragrafo_segundo_ii, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, receive_revision_documents).
legal_relation_instance(clausula_oitava_paragrafo_segundo_iii, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, apresentar_planilhas_custos).
legal_relation_instance(clausula_oitava_paragrafo_segundo_iii, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, receive_planilhas_custos).
legal_relation_instance(clausula_oitava_paragrafo_terceiro, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, convocar_contratado_negociar_reducao_precos).
legal_relation_instance(clausula_oitava_paragrafo_terceiro, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, ser_convocado_para_negociar_reducao_precos).
legal_relation_instance(clausula_oitava_paragrafo_terceiro, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, apresentar_informacoes_solicitadas).
legal_relation_instance(clausula_oitava_paragrafo_terceiro, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, solicitar_informacoes).
legal_relation_instance(clausula_oitava_paragrafo_quarto, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, solicitar_reajuste_ou_revisao_de_precos).
legal_relation_instance(clausula_oitava_paragrafo_quarto, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, solicitar_reajuste_ou_revisao_de_precos).
legal_relation_instance(clausula_oitava_paragrafo_quarto_i, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, solicitar_reajuste_revisao_precos).
legal_relation_instance(clausula_oitava_paragrafo_quarto_i, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, solicitar_reajuste_revisao_precos).
legal_relation_instance(clausula_oitava_paragrafo_quarto_ii, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, request_price_readjustment).
legal_relation_instance(clausula_oitava_paragrafo_quarto_ii, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, request_price_readjustment).
legal_relation_instance(clausula_oitava_paragrafo_quarto_iii, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, analyze_price_adjustment_request).
legal_relation_instance(clausula_oitava_paragrafo_quarto_iii, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, deliver_cost_variation_proofs).
legal_relation_instance(clausula_oitava_paragrafo_quarto_iv, no_right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, claim_retroactive_price_adjustment).
legal_relation_instance(clausula_oitava_paragrafo_quarto_iv, disability, leadcomm_comercio_importacao_e_exportacao_ltda, receive_retroactive_price_adjustment).
legal_relation_instance(clausula_oitava_paragrafo_quinto, permission_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, condicionar_continuidade_contrato).
legal_relation_instance(clausula_oitava_paragrafo_quinto, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, condicionar_continuidade_contrato_power).
legal_relation_instance(clausula_oitava_paragrafo_quinto_i, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, negotiate_prices).
legal_relation_instance(clausula_oitava_paragrafo_quinto_i, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, negotiate_prices).
legal_relation_instance(clausula_oitava_paragrafo_quinto_ii, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, rescind_contract).
legal_relation_instance(clausula_oitava_paragrafo_quinto_ii, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, provide_30_day_notice).
legal_relation_instance(clausula_oitava_paragrafo_quinto_ii, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, receive_rescission_notice).
legal_relation_instance(clausula_oitava_paragrafo_sexto, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, receive_reajusted_values).
legal_relation_instance(clausula_oitava_paragrafo_sexto, no_right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, claim_indemnification_rescission).
legal_relation_instance(clausula_nona_matriz_riscos, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, establish_responsibilities).
legal_relation_instance(clausula_nona_matriz_riscos, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, manage_risk).
legal_relation_instance(clausula_nona_matriz_riscos, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, absorb_risk).
legal_relation_instance(clausula_nona_paragrafo_primeiro, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, respect_financial_equilibrium_clause).
legal_relation_instance(clausula_nona_paragrafo_primeiro, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, demand_financial_equilibrium_clause_respect).
legal_relation_instance(clausula_nona_paragrafo_segundo, duty_to_omit, leadcomm_comercio_importacao_e_exportacao_ltda, omit_celebration_additives).
legal_relation_instance(clausula_nona_paragrafo_segundo, no_right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, no_right_celebrate_additives).
legal_relation_instance(clausula_decima_garantia_contratual, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, provide_contractual_guarantee).
legal_relation_instance(clausula_decima_garantia_contratual, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, receive_contractual_guarantee).
legal_relation_instance(clausula_decima_garantia_contratual, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, return_contractual_guarantee).
legal_relation_instance(clausula_decima_garantia_contratual, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, receive_returned_guarantee).
legal_relation_instance(clausula_decima_caucao_dinheiro, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, deposit_money_in_favor_of_bndes).
legal_relation_instance(clausula_decima_caucao_dinheiro, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, receive_deposit_money).
legal_relation_instance(clausula_decima_seguro_garantia, disability, leadcomm_comercio_importacao_e_exportacao_ltda, be_subject_to_fiscal_direction).
legal_relation_instance(clausula_decima_seguro_garantia, disability, leadcomm_comercio_importacao_e_exportacao_ltda, be_subject_to_judicial_liquidation).
legal_relation_instance(clausula_decima_seguro_garantia, disability, leadcomm_comercio_importacao_e_exportacao_ltda, be_subject_to_special_oversight).
legal_relation_instance(clausula_decima_seguro_garantia, disability, leadcomm_comercio_importacao_e_exportacao_ltda, comply_with_suspension_penalty).
legal_relation_instance(clausula_decima_seguro_garantia_a_1, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, pay_fines).
legal_relation_instance(clausula_decima_seguro_garantia_a_2, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, maintain_validity_throughout_contract_term).
legal_relation_instance(clausula_decima_seguro_garantia_a_2, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, expect_validity_throughout_contract_term).
legal_relation_instance(clausula_decima_seguro_garantia_a_3, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, communicate_claim_expectation).
legal_relation_instance(clausula_decima_seguro_garantia_a_3, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, communicate_claim_expectation).
legal_relation_instance(clausula_decima_fianca_bancaria, disability, leadcomm_comercio_importacao_e_exportacao_ltda, obtain_bank_guarantee_from_institution_in_liquidation).
legal_relation_instance(clausula_decima_fianca_bancaria, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, obtain_bank_guarantee).
legal_relation_instance(clausula_decima_fianca_bancaria_a_1, right_to_omission, banco_nacional_de_desenvolvimento_economico_e_social_bndes, waive_benefit_of_order).
legal_relation_instance(clausula_decima_fianca_bancaria_a_1, no_right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, demand_benefit_of_order).
legal_relation_instance(clausula_decima_fianca_bancaria_a_2, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, maintain_validity_throughout_contract).
legal_relation_instance(clausula_decima_fianca_bancaria_a_2, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, benefit_from_validity_during_contract).
legal_relation_instance(clausula_decima_fianca_bancaria_a_3, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, communicate_inadimplemento).
legal_relation_instance(clausula_decima_fianca_bancaria_a_3, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, determine_inadimplemento).
legal_relation_instance(clausula_decima_paragrafo_primeiro, permission_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, request_guarantee_deadline_extension).
legal_relation_instance(clausula_decima_paragrafo_primeiro, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, accept_guarantee_deadline_extension_request).
legal_relation_instance(clausula_decima_paragrafo_primeiro, duty_to_omit, banco_nacional_de_desenvolvimento_economico_e_social_bndes, omit_rejecting_extension_without_justification).
legal_relation_instance(clausula_decima_paragrafo_segundo, permission_to_omit, leadcomm_comercio_importacao_e_exportacao_ltda, omit_guarantee_update).
legal_relation_instance(clausula_decima_paragrafo_terceiro, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, provide_guarantee).
legal_relation_instance(clausula_decima_paragrafo_terceiro, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, stipulate_guarantee_deadline).
legal_relation_instance(clausula_decima_paragrafo_terceiro, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, demand_guarantee_supplementation).
legal_relation_instance(clausula_decima_paragrafo_quarto, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, obtain_guarantor_approval).
legal_relation_instance(clausula_decima_paragrafo_quarto, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, extend_guarantee_period).
legal_relation_instance(clausula_decima_paragrafo_quarto, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, obtain_new_guarantee).
legal_relation_instance(clausula_decima_paragrafo_quarto, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, decide_extend_guarantee).
legal_relation_instance(clausula_decima_paragrafo_quarto, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, subjection_to_bndes_extension_decision).
legal_relation_instance(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, no_right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, cede_contract).
legal_relation_instance(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, duty_to_omit, leadcomm_comercio_importacao_e_exportacao_ltda, omit_cede_contract).
legal_relation_instance(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, no_right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, issue_credit_title).
legal_relation_instance(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, duty_to_omit, leadcomm_comercio_importacao_e_exportacao_ltda, omit_issue_credit_title).
legal_relation_instance(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, analyze_risks_prejudices).
legal_relation_instance(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, maintain_contractual_conditions).
legal_relation_instance(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, present_confidentiality_terms).
legal_relation_instance(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, bndes_acquiescence).
legal_relation_instance(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, permission_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, subcontract_training_installation).
legal_relation_instance(clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, request_supporting_documents).
legal_relation_instance(clausula_decima_oitava_penalidades, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, be_subject_to_penalties).
legal_relation_instance(clausula_decima_oitava_penalidades, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, apply_penalties).
legal_relation_instance(clausula_decima_oitava_penalidades, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, request_reconsideration_for_warning).
legal_relation_instance(clausula_decima_oitava_penalidades, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, appeal_penalties).
legal_relation_instance(clausula_decima_oitava_penalidades, disability, leadcomm_comercio_importacao_e_exportacao_ltda, contract_with_bndes).
legal_relation_instance(clausula_decima_oitava_penalidades, duty_to_omit, leadcomm_comercio_importacao_e_exportacao_ltda, omit_acts_frustrating_licitation_objectives).
legal_relation_instance(clausula_decima_nona_alteracoes_contratuais, duty_to_omit, banco_nacional_de_desenvolvimento_economico_e_social_bndes, omit_modifying_contract_nature).
legal_relation_instance(clausula_decima_nona_alteracoes_contratuais, permission_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, agree_to_contract_alteration).
legal_relation_instance(clausula_decima_nona_alteracoes_contratuais, subjection, banco_nacional_de_desenvolvimento_economico_e_social_bndes, answer_for_damages).
legal_relation_instance(clausula_decima_nona_alteracoes_contratuais, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, formalize_contract_alteration).
legal_relation_instance(clausula_decima_nona_alteracoes_contratuais, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, promote_contract_alteration).
legal_relation_instance(clausula_decima_nona_alteracoes_contratuais, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, request_contract_alteration).
legal_relation_instance(clausula_vigésima_extincao_contrato, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, authorize_contract_termination).
legal_relation_instance(clausula_vigésima_extincao_contrato, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, notify_of_breach).
legal_relation_instance(clausula_vigésima_extincao_contrato, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, suspend_execution_of_contract).
legal_relation_instance(clausula_vigésima_extincao_contrato, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, terminate_contract).
legal_relation_instance(clausula_vigésima_primeira_disposicoes_finais, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, exercise_rights).
legal_relation_instance(clausula_vigésima_primeira_disposicoes_finais, right_to_omission, banco_nacional_de_desenvolvimento_economico_e_social_bndes, omit_strict_compliance).
legal_relation_instance(clausula_vigésima_primeira_disposicoes_finais, permission_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, exercise_rights).
legal_relation_instance(clausula_vigésima_primeira_disposicoes_finais, permission_to_omit, banco_nacional_de_desenvolvimento_economico_e_social_bndes, omit_strict_compliance).
legal_relation_instance(clausula_setima_pagamento, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, deduct_overpayments).
legal_relation_instance(clausula_setima_pagamento, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, pay_by_bank_transfer).
legal_relation_instance(clausula_setima_pagamento, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, include_information_on_invoice).
legal_relation_instance(clausula_setima_pagamento, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, present_fiscal_document).
legal_relation_instance(clausula_setima_pagamento, right_to_action, leadcomm_comercio_importacao_e_exportacao_ltda, receive_payment_via_bank_transfer).
legal_relation_instance(clausula_setima_pagamento, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, present_required_certificates).
legal_relation_instance(clausula_decima_primeira_obrigacoes_contratado, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, maintain_qualification_conditions).
legal_relation_instance(clausula_decima_primeira_obrigacoes_contratado, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, communicate_penalty_imposition).
legal_relation_instance(clausula_decima_primeira_obrigacoes_contratado, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, repair_or_replace_contract_object).
legal_relation_instance(clausula_decima_primeira_obrigacoes_contratado, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, repair_damages).
legal_relation_instance(clausula_decima_primeira_obrigacoes_contratado, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, pay_charges_and_taxes).
legal_relation_instance(clausula_decima_primeira_obrigacoes_contratado, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, assume_tax_responsibility).
legal_relation_instance(clausula_decima_primeira_obrigacoes_contratado, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, prove_exclusion_from_simples_nacional).
legal_relation_instance(clausula_decima_primeira_obrigacoes_contratado, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, allow_inspections).
legal_relation_instance(clausula_decima_primeira_obrigacoes_contratado, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, obey_bndes_instructions).
legal_relation_instance(clausula_decima_primeira_obrigacoes_contratado, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, designate_representative).
legal_relation_instance(clausula_decima_segunda_conduta_etica, duty_to_omit, leadcomm_comercio_importacao_e_exportacao_ltda, not_offer_undue_advantage).
legal_relation_instance(clausula_decima_segunda_conduta_etica, duty_to_omit, leadcomm_comercio_importacao_e_exportacao_ltda, not_impede_bndes_employee_participation).
legal_relation_instance(clausula_decima_segunda_conduta_etica, duty_to_omit, leadcomm_comercio_importacao_e_exportacao_ltda, not_allocate_bndes_relatives).
legal_relation_instance(clausula_decima_segunda_conduta_etica, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, observe_bndes_ethics_policy).
legal_relation_instance(clausula_decima_segunda_conduta_etica, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, adopt_good_environmental_practices).
legal_relation_instance(clausula_decima_terceira_sigilo_informacoes, duty_to_omit, leadcomm_comercio_importacao_e_exportacao_ltda, not_access_confidential_info).
legal_relation_instance(clausula_decima_terceira_sigilo_informacoes, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, maintain_secrecy).
legal_relation_instance(clausula_decima_terceira_sigilo_informacoes, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, limit_access_to_info).
legal_relation_instance(clausula_decima_terceira_sigilo_informacoes, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, inform_violation_rules_secrecy).
legal_relation_instance(clausula_decima_terceira_sigilo_informacoes, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, deliver_bndes_property_end_contract).
legal_relation_instance(clausula_decima_terceira_sigilo_informacoes, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, present_confidentiality_terms).
legal_relation_instance(clausula_decima_terceira_sigilo_informacoes, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, observe_confidentiality_term).
legal_relation_instance(clausula_decima_terceira_sigilo_informacoes, permission_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, access_confidential_info).
legal_relation_instance(clausula_decima_quarta_acesso_e_protecao_de_dados_pessoais, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, protect_fundamental_rights).
legal_relation_instance(clausula_decima_quarta_acesso_e_protecao_de_dados_pessoais, subjection, leadcomm_comercio_importacao_e_exportacao_ltda, comply_lgpd).
legal_relation_instance(clausula_decima_quinta_obrigações_do_bndes, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, fulfill_obligations).
legal_relation_instance(clausula_decima_sexta_equidade_de_genero_e_valorizacao_da_diversidade, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, suspend_contract_execution).
legal_relation_instance(clausula_decima_sexta_equidade_de_genero_e_valorizacao_da_diversidade, duty_to_act, leadcomm_comercio_importacao_e_exportacao_ltda, prove_absence_of_sanction).
legal_relation_instance(clausula_decima_sexta_equidade_de_genero_e_valorizacao_da_diversidade, right_to_omission, banco_nacional_de_desenvolvimento_economico_e_social_bndes, omit_suspension_of_contract).

% --- Action catalog (local to this contract grounding) ---
action_type(absorb_risk).
action_label(absorb_risk, 'Absorb risk').
action_type(accept_guarantee_deadline_extension_request).
action_label(accept_guarantee_deadline_extension_request, 'Accept deadline extension request').
action_type(accept_reduced_payment).
action_label(accept_reduced_payment, 'Accept reduced payment').
action_type(access_confidential_info).
action_label(access_confidential_info, 'Access confidential info').
action_type(adopt_good_environmental_practices).
action_label(adopt_good_environmental_practices, 'Adopt good environmental practices').
action_type(agree_to_contract_alteration).
action_label(agree_to_contract_alteration, 'Agree to contract alteration').
action_type(allow_inspections).
action_label(allow_inspections, 'Allow inspections').
action_type(analyze_price_adjustment_request).
action_label(analyze_price_adjustment_request, 'Analyze price adjustment request').
action_type(analyze_risks_prejudices).
action_label(analyze_risks_prejudices, 'Analyze risks or prejudices').
action_type(answer_for_damages).
action_label(answer_for_damages, 'Answer for damages').
action_type(appeal_penalties).
action_label(appeal_penalties, 'Appeal penalties').
action_type(apply_penalties).
action_label(apply_penalties, 'Apply penalties').
action_type(apply_penalties_for_non_compliance).
action_label(apply_penalties_for_non_compliance, 'Apply penalties').
action_type(apply_price_reduction_for_non_compliance).
action_label(apply_price_reduction_for_non_compliance, 'Apply price reduction').
action_type(apresentar_informacoes_solicitadas).
action_label(apresentar_informacoes_solicitadas, 'Present requested information').
action_type(apresentar_manifestacao_prorrogacao).
action_label(apresentar_manifestacao_prorrogacao, 'Present manifestation about extension').
action_type(apresentar_planilhas_custos).
action_label(apresentar_planilhas_custos, 'present cost spreadsheets').
action_type(assume_tax_responsibility).
action_label(assume_tax_responsibility, 'Assume tax responsibility').
action_type(authorize_contract_termination).
action_label(authorize_contract_termination, 'Authorize contract termination').
action_type(be_subject_to_fiscal_direction).
action_label(be_subject_to_fiscal_direction, 'Be subject to fiscal direction').
action_type(be_subject_to_judicial_liquidation).
action_label(be_subject_to_judicial_liquidation, 'Be subject to judicial liquidation').
action_type(be_subject_to_penalties).
action_label(be_subject_to_penalties, 'Be subject to penalties').
action_type(be_subject_to_price_adjustment_request).
action_label(be_subject_to_price_adjustment_request, 'Be subject to price adjustment request').
action_type(be_subject_to_special_oversight).
action_label(be_subject_to_special_oversight, 'Be subject to special oversight').
action_type(bear_cost_of_error).
action_label(bear_cost_of_error, 'Bear cost of error').
action_type(benefit_from_validity_during_contract).
action_label(benefit_from_validity_during_contract, 'Benefit from validity during term').
action_type(bndes_acquiescence).
action_label(bndes_acquiescence, 'Subject to BNDES acquiescence').
action_type(cede_contract).
action_label(cede_contract, 'Cede contract').
action_type(claim_indemnification_rescission).
action_label(claim_indemnification_rescission, 'No right to claim indemnification').
action_type(claim_retroactive_price_adjustment).
action_label(claim_retroactive_price_adjustment, 'Cannot claim retroactive price adjustment').
action_type(communicate_claim_expectation).
action_label(communicate_claim_expectation, 'Communicate claim expectation').
action_type(communicate_inadimplemento).
action_label(communicate_inadimplemento, 'Communicate default').
action_type(communicate_penalty_imposition).
action_label(communicate_penalty_imposition, 'Communicate penalty imposition').
action_type(comply_lgpd).
action_label(comply_lgpd, 'Comply with LGPD').
action_type(comply_with_suspension_penalty).
action_label(comply_with_suspension_penalty, 'Comply with suspension penalty').
action_type(comunicar_interesse_prorrogacao).
action_label(comunicar_interesse_prorrogacao, 'Communicate interest in extension').
action_type(condicionar_continuidade_contrato).
action_label(condicionar_continuidade_contrato, 'Condition contract continuity').
action_type(condicionar_continuidade_contrato_power).
action_label(condicionar_continuidade_contrato_power, 'Power to condition continuity').
action_type(contract_with_bndes).
action_label(contract_with_bndes, 'Cannot contract with BNDES').
action_type(convocar_contratado_negociar_reducao_precos).
action_label(convocar_contratado_negociar_reducao_precos, 'Call contractor to negotiate price reduction').
action_type(decide_extend_guarantee).
action_label(decide_extend_guarantee, 'Decide to extend guarantee').
action_type(deduct_overpayments).
action_label(deduct_overpayments, 'Deduct overpayments').
action_type(deliver_bndes_property_end_contract).
action_label(deliver_bndes_property_end_contract, 'Deliver BNDES property end contract').
action_type(deliver_cost_variation_proofs).
action_label(deliver_cost_variation_proofs, 'Deliver cost variation proofs').
action_type(demand_benefit_of_order).
action_label(demand_benefit_of_order, 'Demand benefit of order').
action_type(demand_financial_equilibrium_clause_respect).
action_label(demand_financial_equilibrium_clause_respect, 'Demand financial equilibrium respect').
action_type(demand_guarantee_supplementation).
action_label(demand_guarantee_supplementation, 'Demand guarantee').
action_type(demand_indemnization).
action_label(demand_indemnization, 'Demand indemnization').
action_type(demand_object_execution_according_to_specifications).
action_label(demand_object_execution_according_to_specifications, 'Demand execution per specifications').
action_type(deposit_money_in_favor_of_bndes).
action_label(deposit_money_in_favor_of_bndes, 'Deposit money in favor of BNDES').
action_type(designate_representative).
action_label(designate_representative, 'Designate representative').
action_type(determine_inadimplemento).
action_label(determine_inadimplemento, 'Determine default').
action_type(effect_object_receipt).
action_label(effect_object_receipt, 'Effect object receipt').
action_type(establish_responsibilities).
action_label(establish_responsibilities, 'Establish responsibilities').
action_type(execute_object_according_to_specifications).
action_label(execute_object_according_to_specifications, 'Execute object per specifications').
action_type(execute_services_according_to_quality).
action_label(execute_services_according_to_quality, 'Execute services per quality standards').
action_type(exercise_right_to_economic_financial_balance).
action_label(exercise_right_to_economic_financial_balance, 'Exercise right to economic-financial balance').
action_type(exercise_right_to_economic_financial_balance_contracted).
action_label(exercise_right_to_economic_financial_balance_contracted, 'Exercise right to economic-financial balance').
action_type(exercise_rights).
action_label(exercise_rights, 'Exercise rights').
action_type(expect_validity_throughout_contract_term).
action_label(expect_validity_throughout_contract_term, 'Expect validity during contract term').
action_type(extend_guarantee_period).
action_label(extend_guarantee_period, 'Extend guarantee period').
action_type(formalize_contract_alteration).
action_label(formalize_contract_alteration, 'Formalize contract alteration').
action_type(formulate_bndes_requirement).
action_label(formulate_bndes_requirement, 'Formulate BNDES requirement').
action_type(fulfill_obligations).
action_label(fulfill_obligations, 'Fulfill obligations').
action_type(include_information_on_invoice).
action_label(include_information_on_invoice, 'Include required info on invoice').
action_type(inform_violation_rules_secrecy).
action_label(inform_violation_rules_secrecy, 'Inform violation rules secrecy').
action_type(issue_credit_title).
action_label(issue_credit_title, 'Issue credit title').
action_type(limit_access_to_info).
action_label(limit_access_to_info, 'Limit access to info').
action_type(maintain_contractual_conditions).
action_label(maintain_contractual_conditions, 'Maintain contractual conditions').
action_type(maintain_qualification_conditions).
action_label(maintain_qualification_conditions, 'Maintain qualification conditions').
action_type(maintain_secrecy).
action_label(maintain_secrecy, 'Maintain secrecy').
action_type(maintain_validity_throughout_contract).
action_label(maintain_validity_throughout_contract, 'Maintain validity during contract term').
action_type(maintain_validity_throughout_contract_term).
action_label(maintain_validity_throughout_contract_term, 'Maintain validity during contract term').
action_type(manage_risk).
action_label(manage_risk, 'Manage risk').
action_type(manifestar_interesse_prorrogacao).
action_label(manifestar_interesse_prorrogacao, 'Express interest in extending contract').
action_type(negotiate_prices).
action_label(negotiate_prices, 'Negotiate prices').
action_type(no_right_celebrate_additives).
action_label(no_right_celebrate_additives, 'No right to celebrate addenda').
action_type(not_access_confidential_info).
action_label(not_access_confidential_info, 'Not access confidential info').
action_type(not_allocate_bndes_relatives).
action_label(not_allocate_bndes_relatives, 'Do not allocate BNDES relatives').
action_type(not_impede_bndes_employee_participation).
action_label(not_impede_bndes_employee_participation, 'Do not impede BNDES employee participation').
action_type(not_offer_undue_advantage).
action_label(not_offer_undue_advantage, 'Do not offer undue advantage').
action_type(notify_of_breach).
action_label(notify_of_breach, 'Notify of breach').
action_type(obey_bndes_instructions).
action_label(obey_bndes_instructions, 'Obey BNDES instructions').
action_type(observe_bndes_ethics_policy).
action_label(observe_bndes_ethics_policy, 'Observe BNDES ethics policy').
action_type(observe_confidentiality_term).
action_label(observe_confidentiality_term, 'Observe confidentiality term').
action_type(obtain_bank_guarantee).
action_label(obtain_bank_guarantee, 'Obtain bank guarantee').
action_type(obtain_bank_guarantee_from_institution_in_liquidation).
action_label(obtain_bank_guarantee_from_institution_in_liquidation, 'Cannot get guarantee from institution in liquidation').
action_type(obtain_guarantor_approval).
action_label(obtain_guarantor_approval, 'Obtain guarantor approval').
action_type(obtain_new_guarantee).
action_label(obtain_new_guarantee, 'Obtain new guarantee').
action_type(omit_acts_frustrating_licitation_objectives).
action_label(omit_acts_frustrating_licitation_objectives, 'Omit acts against licitation').
action_type(omit_cede_contract).
action_label(omit_cede_contract, 'Omit ceding contract').
action_type(omit_celebration_additives).
action_label(omit_celebration_additives, 'Omit celebrating addenda').
action_type(omit_guarantee_update).
action_label(omit_guarantee_update, 'Omit guarantee update').
action_type(omit_issue_credit_title).
action_label(omit_issue_credit_title, 'Omit issuing credit title').
action_type(omit_modifying_contract_nature).
action_label(omit_modifying_contract_nature, 'Omit modifying contract nature').
action_type(omit_rejecting_extension_without_justification).
action_label(omit_rejecting_extension_without_justification, 'Not reject extension without justification').
action_type(omit_strict_compliance).
action_label(omit_strict_compliance, 'Omit strict compliance').
action_type(omit_suspension_of_contract).
action_label(omit_suspension_of_contract, 'Omit contract suspension').
action_type(pay_by_bank_transfer).
action_label(pay_by_bank_transfer, 'Pay by bank transfer').
action_type(pay_charges_and_taxes).
action_label(pay_charges_and_taxes, 'Pay charges and taxes').
action_type(pay_contracted_price).
action_label(pay_contracted_price, 'Pay the price').
action_type(pay_fines).
action_label(pay_fines, 'Pay fines').
action_type(present_confidentiality_terms).
action_label(present_confidentiality_terms, 'Present confidentiality terms').
action_type(present_fiscal_document).
action_label(present_fiscal_document, 'Present fiscal document').
action_type(present_information_declaration).
action_label(present_information_declaration, 'Present information declaration').
action_type(present_required_certificates).
action_label(present_required_certificates, 'Present required certificates').
action_type(promote_contract_alteration).
action_label(promote_contract_alteration, 'Promote contract alteration').
action_type(protect_fundamental_rights).
action_label(protect_fundamental_rights, 'Protect fundamental rights').
action_type(prove_absence_of_sanction).
action_label(prove_absence_of_sanction, 'Prove no final sanction').
action_type(prove_exclusion_from_simples_nacional).
action_label(prove_exclusion_from_simples_nacional, 'Prove exclusion from Simples Nacional').
action_type(provide_30_day_notice).
action_label(provide_30_day_notice, 'Provide 30-day notice').
action_type(provide_contractual_guarantee).
action_label(provide_contractual_guarantee, 'Provide contractual guarantee').
action_type(provide_guarantee).
action_label(provide_guarantee, 'Provide guarantee').
action_type(provide_revision_documents).
action_label(provide_revision_documents, 'Provide revision documents').
action_type(provide_siem_solution).
action_label(provide_siem_solution, 'Provide SIEM solution').
action_type(receive_contractual_guarantee).
action_label(receive_contractual_guarantee, 'Receive contractual guarantee').
action_type(receive_deposit_money).
action_label(receive_deposit_money, 'Receive deposit money').
action_type(receive_payment).
action_label(receive_payment, 'Receive payment').
action_type(receive_payment_via_bank_transfer).
action_label(receive_payment_via_bank_transfer, 'Receive payment').
action_type(receive_planilhas_custos).
action_label(receive_planilhas_custos, 'receive cost spreadsheets').
action_type(receive_reajusted_values).
action_label(receive_reajusted_values, 'Right to receive reajusted values').
action_type(receive_rescission_notice).
action_label(receive_rescission_notice, 'Receive rescission notice').
action_type(receive_retroactive_price_adjustment).
action_label(receive_retroactive_price_adjustment, 'Inability to receive retro price adjustment').
action_type(receive_returned_guarantee).
action_label(receive_returned_guarantee, 'Receive returned guarantee').
action_type(receive_revision_documents).
action_label(receive_revision_documents, 'Receive revision documents').
action_type(receive_siem_solution).
action_label(receive_siem_solution, 'Receive SIEM solution').
action_type(repair_damages).
action_label(repair_damages, 'Repair damages').
action_type(repair_or_replace_contract_object).
action_label(repair_or_replace_contract_object, 'Repair/replace object').
action_type(request_contract_alteration).
action_label(request_contract_alteration, 'Request contract alteration').
action_type(request_guarantee_deadline_extension).
action_label(request_guarantee_deadline_extension, 'Request deadline extension').
action_type(request_price_adjustment).
action_label(request_price_adjustment, 'Request price adjustment').
action_type(request_price_readjustment).
action_label(request_price_readjustment, 'Request price readjustment').
action_type(request_price_revision).
action_label(request_price_revision, 'Request price revision').
action_type(request_reconsideration_for_warning).
action_label(request_reconsideration_for_warning, 'Request reconsideration').
action_type(request_supporting_documents).
action_label(request_supporting_documents, 'Request supporting documents').
action_type(require_service_execution_according_to_quality).
action_label(require_service_execution_according_to_quality, 'Require services to be executed per standards').
action_type(rescind_contract).
action_label(rescind_contract, 'Rescind contract').
action_type(respect_financial_equilibrium_clause).
action_label(respect_financial_equilibrium_clause, 'Respect financial equilibrium clause').
action_type(return_contractual_guarantee).
action_label(return_contractual_guarantee, 'Return contractual guarantee').
action_type(return_resources_and_revoke_access).
action_label(return_resources_and_revoke_access, 'Return resources and revoke access').
action_type(revise_prices).
action_label(revise_prices, 'Revise prices').
action_type(revise_prices_to_maintain_balance).
action_label(revise_prices_to_maintain_balance, 'Revise prices for balance').
action_type(revise_prices_to_maintain_balance_contracted).
action_label(revise_prices_to_maintain_balance_contracted, 'Revise prices for balance').
action_type(ser_convocado_para_negociar_reducao_precos).
action_label(ser_convocado_para_negociar_reducao_precos, 'Subject to being called to negotiate price reduction').
action_type(solicitar_informacoes).
action_label(solicitar_informacoes, 'Request information').
action_type(solicitar_reajuste_ou_revisao_de_precos).
action_label(solicitar_reajuste_ou_revisao_de_precos, 'Request price adjustment or review').
action_type(solicitar_reajuste_revisao_precos).
action_label(solicitar_reajuste_revisao_precos, 'Request price adjustment/revision').
action_type(stipulate_guarantee_deadline).
action_label(stipulate_guarantee_deadline, 'Stipulate guarantee deadline').
action_type(subcontract_training_installation).
action_label(subcontract_training_installation, 'Subcontract training & installation').
action_type(subjection_to_bndes_extension_decision).
action_label(subjection_to_bndes_extension_decision, 'Subject to BNDES guarantee extension').
action_type(suffer_penalties_for_non_compliance).
action_label(suffer_penalties_for_non_compliance, 'Suffer penalties').
action_type(suffer_price_reduction_for_non_compliance).
action_label(suffer_price_reduction_for_non_compliance, 'Suffer price reduction').
action_type(sujeicao_as_penalidades).
action_label(sujeicao_as_penalidades, 'Subject to penalties').
action_type(suspend_contract_execution).
action_label(suspend_contract_execution, 'Suspend contract execution').
action_type(suspend_execution_of_contract).
action_label(suspend_execution_of_contract, 'Suspend execution of contract').
action_type(terminate_contract).
action_label(terminate_contract, 'Terminate contract').
action_type(undergo_corporate_operations).
action_label(undergo_corporate_operations, 'Undergo corporate operations').
action_type(waive_benefit_of_order).
action_label(waive_benefit_of_order, 'Waive benefit of order').

% ===== 3) Original Contract ABox =====
contract(contrato_ocs_331_2022).
contract_metadata(contrato_ocs_331_2022, numero_ocs, '331/2022').
contract_metadata(contrato_ocs_331_2022, numero_sap, '4400005300').
contract_metadata(contrato_ocs_331_2022, tipo_contrato, 'CONTRATO DE PRESTAÇÃO DE SERVIÇOS').
contract_metadata(contrato_ocs_331_2022, contratante, 'BANCO NACIONAL DE DESENVOLVIMENTO ECONÔMICO E SOCIAL - BNDES').
contract_metadata(contrato_ocs_331_2022, contratado, 'LEADCOMM COMÉRCIO IMPORTAÇÃO E EXPORTAÇÃO LTDA').
contract_metadata(contrato_ocs_331_2022, cnpj_contratante, '33.657.248/0001-89').
contract_metadata(contrato_ocs_331_2022, cnpj_contratado, '01.549.227/0001  53').
contract_metadata(contrato_ocs_331_2022, procedimento_licitatorio, 'Pregão Eletrônico nº 34/2022 - BNDES').
contract_metadata(contrato_ocs_331_2022, data_autorizacao, '17/10/2022').
contract_metadata_raw(contrato_ocs_331_2022, 'ip_aic_deroc', '08/2022', 'trecho_literal').
contract_metadata(contrato_ocs_331_2022, data_ip_ati_degat, '13/10/2022').
contract_metadata(contrato_ocs_331_2022, rubrica_orcamentaria, '3101700040').
contract_metadata_raw(contrato_ocs_331_2022, 'rubrica_orcamentaria_2', '1800100011', 'trecho_literal').
contract_metadata(contrato_ocs_331_2022, rubrica_orcamentaria, '3101700021').
contract_metadata(contrato_ocs_331_2022, rubrica_orcamentaria, '3101700020').
contract_metadata(contrato_ocs_331_2022, centro_custo, 'BN00004000').
contract_metadata_raw(contrato_ocs_331_2022, 'centro_custo_2', 'BN30006000', 'trecho_literal').
contract_metadata_raw(contrato_ocs_331_2022, 'centro_custo_3', 'BN00004000', 'trecho_literal').
contract_metadata(contrato_ocs_331_2022, lei_aplicavel, 'Lei nº 13.303/2016').
contract_metadata(contrato_ocs_331_2022, regulamento, 'Regulamento Licitações e Contratos do Sistema BNDES').
contract_clause(contrato_ocs_331_2022, clausula_primeira_objeto, 'CLÁUSULA PRIMEIRA - OBJETO', 'O  presente  Contrato  tem  por  objeto  a  contratação  de  SOLUÇÃO  de  SIEM  (Security \nlnformation  and  Event Management) para o BNDES, incluindo os  serviços de implantação, \ntreinamento, assistência e suporte técnicos, conforme especificações constantes do Termo \nde Referência (Anexo I do Edital do Pregão  Eletrônico  nº 34/2022 - BNDES) e da proposta \napresentada pelo CONTRATADO, respectivamente, Anexos I e li deste Contrato.').
contract_clause(contrato_ocs_331_2022, clausula_segunda_vigencia, 'CLÁUSULA SEGUNDA - VIGÊNCIA', 'O presente Contrato terá duração de (i)  até 24 (vinte e quatro) meses, a contar da data de \nsua assinatura, para os serviços de entrega da SOLUÇÃO, implantação e treinamento dos \nMódulos  I e  li, e (ii)  24 (vinte  e quatro) meses, a contar da data do Termo  de  Recebimento \nDefinitivo da SOLUÇÃO, podendo ser prorrogado, mediante aditivo, por períodos sucessivos, \naté o limite total de 60 (sessenta) meses, para os serviços de assistência técnica e de suporte \ne para os pacotes adicionais de uso da SOLUÇÃO de SIEM. \n\n\n~ BNDES  Classlllcação: DQCumemo Osrensivo (Lei n• 13.303/2016) \n\n■.À \n\nUnidade Gestora: AJ1/JUUCIGLIC4 \n\nParágrafo Primeiro \nO  CONTRATADO deverá, no prazo  de até 5  (cinco)  dias úteis, contados da notificação do \nGestor  do  Contrato,  apresentar,  por  intermédio  do  seu  Representante  Legal,  sua \nmanifestação sobre a prorrogação do Contrato. \n\nParágrafo Segundo \nIndependente da notificação do parágrafo anterior, o  CONTRATADO deverá  comunicar ao \nGestor seu interesse quanto à prorrogação do contrato até 90 (noventa) dias antes do término \nde cada período de vigência contratual. \n\nParágrafo Terceiro \nA formalização da prorrogação será efetuada por meio de aditivo epistolar, dispensando-se a \nassinatura do CONTRATADO \n\nParágrafo Quarto \nCaso o CONTRATADO se recuse  a celebrar aditivo contratual de prorrogação, tendo antes \nmanifestado sua intenção de prorrogar o Contrato ou deixado de manifestar seu propósito de \nnão prorrogar, nos termos do Parágrafo Primeiro desta Cláusula, ficará sujeito às penalidades \nprevistas na Cláusula de Penalidades deste Contrato.').
contract_clause(contrato_ocs_331_2022, clausula_terceira_local_prazo_condicoes_execucao_objeto, 'CLÁUSULA TERCEIRA - LOCAL, PRAZO E CONDIÇÕES DE EXECUÇÃO DO OBJETO', 'A  execução  do  objeto  contratado  respeitará  as  especificações  constantes  do  Termo  de \nReferência  (Anexo  I  deste  Contrato)  e  da  proposta  apresentada  pelo  CONTRATADO, \nrespectivamente, Anexos I e li deste Contrato.').
contract_clause(contrato_ocs_331_2022, clausula_quarta_niveis_servico, 'CLÁUSULA QUARTA - NÍVEIS DE SERVIÇO', 'Os serviços contratados deverão ser executados de acordo com  os padrões de qualidade, \ndisponibilidade  e  desempenho  estipulados  pelo  BNDES,  observados  os níveis  de serviço \ndescritos no Anexo 1 (Termo de Referência) deste Contrato. \n\nParágrafo Único \nO descumprimento dos níveis de serviço acarretará a aplicação dos  índices de redução do \npreço previstos no Anexo 1 (Termo de Referência) deste Contrato, sem prejuízo da aplicação \ndas penalidades previstas neste Contrato, quando cabíveis.').
contract_clause(contrato_ocs_331_2022, clausula_quinta_recebimento_objeto, 'CLÁUSULA QUINTA - RECEBIMENTO DO OBJETO', 'O  BNDES  efetuará  o  recebimento  do  objeto,  através  da  Comissão  de  Recebimento, \nmencionada na Cláusula de Obrigações do BNDES deste Contrato, observado o disposto no \nAnexo 1 (Termo de Referência) deste Contrato.').
contract_clause(contrato_ocs_331_2022, clausula_sexta_preco, 'CLÁUSULA SEXTA - PREÇO', 'O BNDES pagará ao CONTRATADO, pela execução do objeto contratado, o valor de até R$ \n669.999,67 (seiscentos e sessenta e nove mil, novecentos e noventa e nove reais e sessenta \n\n2 \n\n~ BNDES  Classlllcação: DQCumemo Osrensivo (Lei n• 13.303/2016) \n\n■.À \n\nUnidade Gestora: AJ1/JUUCIGLIC4 \n\ne sete  centavos),  conforme  proposta apresentada  (Anexo  li  deste  Contrato),  observado  o \ndisposto na Cláusula de Pagamento deste Instrumento. \n\nParágrafo Primeiro \nNo  valor aj ustado  no  caput desta  Cláusula  estão  incluídos  todos  os  insumos,  encargos \ntrabalhistas  e  tributos,  inclusive  contribuições  fiscais  e  parafiscais,  bem  como  quaisquer \noutras despesas necessárias à execução deste Contrato. \n\nParágrafo Segundo \nNa  hipótese de o  objeto  ser, a critério  do  BNDES,  parcialmente executado  e  recebido, os \nvalores  previstos  nesta  Cláusula  serão  proporcionalmente  reduzidos,  sem  prejuízo  da \naplicação das penalidades cabíveis. \n\nParágrafo Terceiro \nCaso  o  BNDES  não  demande  o  total  do  objeto  previsto  neste  Contrato,  não  será  devida \nindenização ao CONTRATADO. \n\nParágrafo Quarto \nO  CONTRATADO  deverá  arcar  com  os  ônus  decorrentes  de  eventual  equívoco  no \ndimensionamento  dos  quantitativos  de  sua  proposta,  devendo  complementá-los,  caso  os \nquantitativos  previstos  inicialmente  em  sua  proposta  não  sejam  satisfatórios  para  o \natendimento ao objeto deste Contrato.').
contract_clause(contrato_ocs_331_2022, clausula_setima_pagamento, 'CLÁUSULA SÉTIMA - PAGAMENTO
contract_clause(contrato_ocs_331_2022, clausula_oitava_equilibrio_economico_financeiro_contrato, 'CLÁUSULA OITAVA- EQUILÍBRIO ECONÔMICO-FINANCEIRO DO CONTRATO \nO BNDES e o CONTRATADO têm direito ao equilíbrio econômico-financeiro do Contrato, em \nconsonância com o inciso XXI , do artigo 37, da Constituição Federal, a ser realizado mediante \nreajuste ou revisão de preços.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_primeiro, 'Parágrafo Primeiro \nO  reajuste  de  preços,  na  forma  prevista  na  legislação,  poderá  ser  requerido  pelo \nCONTRATADO  a  cada  período  de  12  {doze)  meses,  sendo  o  primeiro  contado  do  dia \n03/11/2022,  data  da  sessão  pública  inaugural,  e  os  seguintes,  do  fato  gerador  anterior, \nadotando-se para tanto a aplicação do índice de Custo da Tecnologia da Informação - ICTI, \ndivulgado pelo Instituto de Pesquisa Econômica e Aplicada- lPEA, sobre o preço referido na \nCláusula de Preço deste Instrumento.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_segundo, 'Parágrafo Segundo \nA revisão de preços poderá ser realizada por iniciativa do BNDES ou mediante solicitação do \nCONTRATADO,  quando ocorrer  fato  imprevisível ou  previsível,  porém, de consequências \nincalculáveis, retardador ou impeditivo da execução do Contrato, ou ainda em  caso de força \nmaior,  caso  fortuito  ou  fato  do  príncipe,  configurando  álea  econômica  extraordinária  e \nextracontratual, que onere ou desonere as obrigações pactuadas no presente  Instrumento, \nsendo,  porém, vedada nas  hipóteses em  que o  risco seja alocado ao CONTRATADO  nos \ntermos da Cláusula de Matriz de Riscos,  respeitando-se o seguinte:', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_segundo_i, '1.  o  CONTRATADO deverá formular  ao BNDES requerimento  para a  revisão  do Contrato, \ncomprovando a ocorrência do fato gerador;', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_segundo_ii, 'li. a comprovação será realizada por meio de documentos, tais  como,  atos  normativos que \ncriem ou alterem tributos, lista de preço de fabricantes, notas fiscais de aquisição de matérias \nprimas, de transporte  de mercadorias, alusivas  à época da elaboração da proposta ou  do \núltimo reajuste e do momento do pedido de revisão; e', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_segundo_iii, 'Ili. com o requerimento,  o CONTRATADO deverá apresentar planilhas de custos unitários, \ncomparativas entre a data da formulação da proposta ou do último reajuste e o momento do\n\n6 \n\n\n~ BNDES  Classlllcação: DQCumemo Osrensivo (Lei n• 13.303/2016) \n\n■.À \n\nUnidade Gestora: AJ1/JUUCIGLIC4 \n\npedido de revisão, contemplando os custos unitários envolvidos e evidenciando o quanto o \naumento de preços ocorrido repercute no valor pactuado.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_terceiro, 'Parágrafo Terceiro \nIndependentemente  de  solicitação,  o  BNDES  poderá  convocar  o  CONTRATADO  para \nnegociar a redução dos preços, mantendo o mesmo objeto contratado, na quantidade e nas \nespecificações indicadas na proposta, em virtude da redução dos preços de mercado, ou de \nitens  que  compõem  o  custo,  cabendo  ao  CONTRATADO  apresentar  as  informações \nsolicitadas pelo BNDES.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_quarto, 'Parágrafo Quarto \nO CONTRATADO deverá solicitar o reajuste e/ou  a revisão de preços até a prorrogação ou \no  encerramento  do Contrato,  hipótese em  que os  efeitos financeiros  serão  concedidos  de \nmodo retroativo a partir do fato gerador, observando-se, ainda, que:', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_quarto_i, '1.  caso  o fato gerador do  reajuste  e/ou  da revisão de preços ou  a divulgação do  índice  de \nreajuste  ocorra  com  antecedência  inferior  a  60  (sessenta)  dias  da  prorrogação  ou  do \nencerramento do Contrato, o CONTRATADO terá o prazo de 60 (sessenta) dias, a contar do \nfato gerador ou  da data de divulgação do índice, para solicitar o reaj uste e/ou  a revisão  de \npreços;', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_quarto_ii, 'li.  caso  a  assinatura  do  aditivo  de  prorrogação  torne  superveniente  a  ocorrência  do  fato \ngerador do reajuste, ou a divulgação do índice de reajuste  ocorra após a prorrogação ou o \nencerramento do Contrato, o CONTRATADO terá o prazo de 60 (sessenta) dias, a contar do \nfato gerador ou da data de divulgação do índice, para solicitar o reajuste de preços;', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_quarto_iii, 'Ili.  o  BNDES  deverá  analisar  o  pedido  de  reajuste  e/ou  revisão  de  preços  em  até  60 \n(sessenta) dias, contados da solicitação e da entrega pelo CONTRATADO dos comprovantes \nde  variação  dos  custos,  ficando  este  prazo  suspenso,  a  critério  do  BNDES,  enquanto  o \nCONTRATADO não apresentar a documentação solicitada para a comprovação da variação \nde custos; e', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_quarto_iv, 'IV. caso o CONTRATADO não solicite o reajuste e/ou revisão de preços nos prazos fixados \nacima, não fará jus aos efeitos retroativos ou, caso o Contrato esteja encerrado, operar-se-á \na renúncia a eventual direito ao reajuste e/ou à revisão.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_quinto, 'Parágrafo Quinto \nSe  o  processo de  reajuste  e/ou  revisão  de preços  não for concluído  até o  vencimento  do \nContrato, e este  for prorrogado, sua continuidade após o  reequilíbrio  econômico-financeiro \nficará  condicionada à  manutenção da proposta do  CONTRATADO como  a condição  mais \nvantajosa para o BNDES, podendo este:', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_quinto_i, '1. realizar negociação de preços junto ao CONTRATADO, de forma a viabilizar a continuidade \ndo  ajuste,  quando  os  novos  valores  fixados  após  o  reajuste  e/ou  a  revisão  de  preços \nestiverem acima do patamar apurado no mercado; ou', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_quinto_ii, 'li. rescindir o Contrato,  mediante aviso prévio ao  CONTRATADO, com  antecedência de 30 \n(trinta) dias, quando resultar infrutífera a negociação indicada no inciso anterior.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_oitava_paragrafo_sexto, 'Parágrafo Sexto \nNa ocorrência da hipótese prevista no  inciso li do Parágrafo anterior, o CONTRATADO fará \njus à integralidade dos valores apurados no processo de reajuste e/ou revisão de preços até \no  término do Contrato,  não  podendo, todavia,  reclamar qualquer indenização  em  razão  da \nrescisão do mesmo.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_nona_matriz_riscos, 'CLÁUSULA NONA - MATRIZ DE RISCOS \nO BNDES e o CONTRATADO, tendo como premissa a obtenção do melhor custo contratual \nmediante  a  alocação  do  risco  à  parte  com  maior  capacidade  para  geri-lo  e  absorvê-lo, \nidentificam os  riscos decorrentes da relação contratual e, sem  prejuízo de outras previsões \ncontratuais,  estabelecem  os  respectivos  responsáveis  na  Matriz  de  Riscos  constante  do \nAnexo 111  deste Contrato.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_nona_paragrafo_primeiro, 'Parágrafo Primeiro \nO  reajuste  de preço aludido na Matriz  de Riscos deve  respeitar o disposto  na\n\nCláusula de \nEquilíbrio Econômico-Financeiro deste Contrato.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_nona_paragrafo_segundo, 'Parágrafo Segundo \nÉ  vedada  a  celebração  de  aditivos  decorrentes  de  eventos  supervenientes  alocados,  na \nMatriz de Riscos, como de responsabilidade do CONTRATADO.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_garantia_contratual, 'CLÁUSULA DÉCIMA - GARANTIA CONTRATUAL \nO CONTRATADO prestará, no prazo de até 15 (quinze) dias úteis, contados da convocação, \ngarantia  contratual,  sob  pena  de  aplicação  de  penalidade  nos  termos  deste  Contrato, \nobservadas as condições para sua aceitação estipuladas nos incisos abaixo, no valor de R$ \n33.499,98  (trinta e três mil, quatrocentos e noventa e nove reais e noventa e oito centavos), \nque lhe será devolvida após a verificação do cumprimento fiel, correto e integral dos termos \ncontratuais.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_caucao_dinheiro, '1.  Caução  em  dinheiro:  deverá  ser  depositada  em  favor  do  BNDES,  de  acordo  com  as \norientações que serão fornecidas quando da referida convocação;', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_seguro_garantia, 'li. Seguro Garantia: a  Apólice de Seguro deverá ser emitida por Instituição autorizada pela \nSUSEP a operar no mercado securitário, que não se encontre sob regime de Direção Fiscal, \nIntervenção, Liquidação  Extrajudicial ou  Fiscalização  Especial, e que não esteja cumprindo \npenalidade de suspensão imposta pela SUSEP;', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_seguro_garantia_a, 'a) O Instrumento de Apólice de Seguro deve prever expressamente:', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_seguro_garantia_a_1, 'a.1)  responsabilidade  da seguradora  por todas  e  quaisquer  multas  de  caráter \nsancionatório aplicadas ao CONTRATADO;', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_seguro_garantia_a_2, 'a.2) vigência pelo prazo contratual;', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_seguro_garantia_a_3, 'a.3)  prazo  de  90  (noventa)  dias,  contados  a  partir  do  término  da  vigência \ncontratual,  para  apuração  de  eventual  inadimplemento  do  CONTRATADO  - ocorrido durante a vigência contratual -, e para a comunicação da expectativa de \nsinistro  ou  do  efetivo  aviso  de  sinistro,  observados  os  prazos  prescricionais \npertinentes.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_fianca_bancaria, 'Ili.  Fiança  Bancária:  a  Carta  de  Fiança  deverá  ser  emitida  por  Instituição  Financeira \nautorizada  pelo  Banco  Central  do  Brasil  - BACEN  para funcionar  no  Brasil  e  que não  se \nencontre em processo de liquidação extrajudicial ou de intervenção do BACEN.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_fianca_bancaria_a, 'a) O Instrumento de Fiança deve prever expressamente:', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_fianca_bancaria_a_1, 'a.1) renúncia expressa, pelo fiador, ao benefício de ordem disposto no artigo 827 \ndo Código Civil;', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_fianca_bancaria_a_2, 'a.2) vigência pelo prazo contratual;', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_fianca_bancaria_a_3, 'a.3)  prazo  de  90  (noventa)  dias,  contados  a  partir  do  término  da  vigência \ncontratual,  para  apuração  de  eventual  inadimplemento  do  CONTRATADO  - ocorrido durante a vigência contratual -, e para a comunicação do inadimplemento \nà Instituição Financeira, observados os prazos prescricionais pertinentes.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_paragrafo_primeiro, 'Parágrafo Primeiro \nO prazo previsto para a apresentação da garantia poderá ser prorrogado, por igual período, \nquando solicitado pelo CONTRATADO durante o respectivo transcurso, e desde que ocorra \nmotivo justificado e aceito pelo BNDES.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_paragrafo_segundo, 'Parágrafo Segundo \nHavendo majoração do preço contratado, decorrente de reajuste, repactuação ou revisão de \npreços  causada  por  alterações  na  legislação  tributária,  fica  dispensada  a  atualização  da \ngarantia, salvo se  o  valor da  atualização for igual  ou  superior ao  patamar referenciado  no \ninciso li do artigo 91  do Regulamento de Licitações e Contratos do SISTEMA BNDES.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_paragrafo_terceiro, 'Parágrafo Terceiro \nNos demais casos que demandem a complementação ou  renovação da garantia, tais como \nalteração do objeto (aditivo quantitativo ou qualitativo), prorrogação contratual, dentre outros, \no CONTRATADO deverá providenciá-la no prazo estipulado pelo BNDES.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_paragrafo_quarto, 'Parágrafo Quarto \nSempre  que  o  contrato  for  garantido  por  fiança  bancária  ou  seguro  garantia,  o \nCONTRATADO deve obter do garantidor anuência em relação à manutenção da garantia, no \nprazo de 1 O (dez)  dias  úteis  a contar da assinatura do  aditivo ou recebimento  de carta de \napostilamento ou  aditivo epistolar, conforme o caso.  Recusando-se o garantidor a manter a \ngarantia, cabe ao CONTRATADO obter nova garantia no mesmo prazo, prorrogável por igual \nperíodo a critério do BNDES.', ' ').
contract_clause(contrato_ocs_331_2022, clausula_decima_primeira_obrigacoes_contratado, 'CLÁUSULA DÉCIMA PRIMEIRA-OBRIGAÇÕES DO CONTRATADO
contract_clause(contrato_ocs_331_2022, clausula_decima_segunda_conduta_etica, 'CLÁUSULA DÉCIMA SEGUNDA- CONDUTA ÉTICA DO CONTRATADO E DO BNDES
contract_clause(contrato_ocs_331_2022, clausula_decima_terceira_sigilo_informacoes, 'CLÁUSULA DÉCIMA TERCEIRA - SIGILO DAS INFORMAÇÕES
contract_clause(contrato_ocs_331_2022, clausula_decima_quarta_acesso_e_protecao_de_dados_pessoais, 'CLÁUSULA DÉCIMA QUARTA- ACESSO E PROTEÇÃO DE DADOS PESSOAIS
contract_clause(contrato_ocs_331_2022, clausula_decima_quinta_obrigações_do_bndes, 'CLÁUSULA DÉCIMA QUINTA - OBRIGAÇÕES DO BNDES
contract_clause(contrato_ocs_331_2022, clausula_decima_sexta_equidade_de_genero_e_valorizacao_da_diversidade, 'CLÁUSULA  DÉCIMA  SEXTA  - EQUIDADE  DE  GÊNERO  E  VALORIZAÇÃO  DA
contract_clause(contrato_ocs_331_2022, clausula_decima_setima_cessao_contrato_sucessao_subcontratacao, 'CLÁUSULA DÉCIMA SÉTIMA - CESSÃO DE CONTRATO OU DE CRÉDITO, SUCESSÃO \nCONTRATUAL E SUBCONTRATAÇÃO \nÉ  vedada  a  cessão  deste  Contrato,  total  ou  parcialmente,  ou  de  qualquer  crédito  dele \ndecorrente, bem como a emissão, por parte do CONTRATADO, de qualquer título de crédito \nem razão do mesmo.\n\n16 \n\n\nUnidade Gestora: AJ1/JUUCIGLIC4 \n\nParágrafo Primeiro \nÉ  admitida  a  sucessão  contratual  nas  hipóteses  em  que  o  CONTRATADO  realizar  as \noperações  societárias  de  fusão,  cisão  ou  incorporação,  condicionada  aos  seguintes \nrequisitos: \n\n1.  aquiescência prévia do BNDES, que analisará eventuais  riscos ou prejuízos decorrentes \nde tal alteração contratual; e \nli. manutenção de todas as condições contratuais e requisitos de habilitação originais. \n\nParágrafo Segundo \nCaso  ocorra  a  sucessão  contratual  admitida  no  Parágrafo  anterior,  o  sucessor  assumirá \nintegralmente a posição do sucedido, passando a ser responsável pela execução do presente \nContrato, fazendo,  por conseguinte, jus ao recebimento dos créditos dele decorrentes. \n\nParágrafo Terceiro \nÉ admitida a subcontratação da parcela do objeto deste Contrato referente ao treinamento e \nà instalação, condicionada aos seguintes requisitos: \n\n1.  aquiescência prévia do BNDES, que analisará eventuais riscos ou prejuízos decorrentes \nde tal operação; e \nli.  atendimento  de  todas  as  condições  contratuais  e  requisitos  para  a  subcontratação \nprevistos  no  Termo  de  Referência  (Anexo  I  deste  Contrato),  cabendo  ao  CONTRATADO \napresentar, sempre que solicitado pelo BNDES, os respectivos documentos comprobatórios. \n\nParágrafo Quarto \nA  subcontratação  pode  ser  realizada  com  sociedades  distintas  e  de  forma  simultânea, \ndevendo, em todos os casos, ser relacionada à parcela do objeto autorizada pelo BNDES. \n\nParágrafo Quinto \nCaso o CONTRATADO opte  por subcontratar o objeto deste Contrato, permanecerá como \nresponsável perante o BNDES pela adequada execução do ajuste, sujeitando-se, inclusive, \nàs  penalidades  previstas  neste  Contrato,  na  hipótese  de  não  cumprir  as  obrigações  ora \npactuadas, ainda que por culpa da sociedade subcontratada. \n\nParágrafo Sexto \nAceita, pelo BNDES, a subcontratação, o CONTRATADO deverá apresentar os Termos de \nConfidencialidade,  conforme  minuta  constante  do  Anexo  VI \n(Minuta  de  Termo  de \nConfidencialidade para Subcontratação) deste Contrato, assinados pelo representante legal \ne  pelos  profissionais  da  sociedade  subcontratada  envolvidos  na  execução  dos  serviços \nsubcontratados.', 'É  vedada  a  cessão  deste  Contrato,  total  ou  parcialmente,  ou  de  qualquer  crédito  dele \ndecorrente, bem como a emissão, por parte do CONTRATADO, de qualquer título de crédito \nem razão do mesmo.').
contract_clause(contrato_ocs_331_2022, clausula_decima_oitava_penalidades, 'CLÁUSULA DÉCIMA OITAVA - PENALIDADES \nEm  caso  de  inexecução  total  ou  parcial  do  Contrato,  inclusive  de  descumprimento  de \nexigência expressamente formulada pelo BNDES ou de inobservância de qualquer obrigação \nlegal, bem como em caso de mora, sem motivo justificado, o CONTRATADO ficará sujeito às \nseguintes penalidades: \n\n1.  advertência; \n\n17 \n\n\nUnidade Gestora: AJ1/JUUCIGLIC4 \n\nli. multa, de acordo com o Anexo 1 (Termo de Referência); e \n\nIli.  suspensão temporária de  participação  em  licitação e  impedimento  de contratar  com  o \nBNDES,  por  prazo  não  superior a  2  (dois)  anos,  apurado  de  acordo  com  a  gravidade  da \ninfração. \n\nParágrafo Primeiro \nAs  penalidades  serão  aplicadas  observadas  as  normas  do  Regulamento  de  Licitações  e \nContratos do SISTEMA BNDES. \n\nParágrafo Segundo \nContra  a  decisão  de  aplicação  de  penalidade,  o  CONTRATADO  poderá  requerer  a \nreconsideração para a decisão de advertência, ou  interpor o recurso cabível para as demais \npenalidades,  na forma e no prazo previstos no Regulamento de Licitações e  Contratos do \nSISTEMA BNDES. \n\nParágrafo Terceiro \nA imposição de penalidade prevista nesta Cláusula não impede a extinção do Contrato pelo \nBNDES, nos termos da legislação aplicável e da Cláusula de Extinção do Contrato. \n\nParágrafo Quarto \nA multa poderá ser aplicada juntamente com as demais penalidades. \n\nParágrafo Quinto \nA multa aplicada ao CONTRATADO e os prejuízos causados ao BNDES serão deduzidos de \nquaisquer  créditos  a  ele  devidos,  assim  como  da  garantia  prestada,  ressalvada  a \npossibilidade  de  cobrança  judicial  da  diferença  eventualmente  não  coberta  pelos \nmencionados créditos. \n\nParágrafo Sexto \nNo caso de atos lesivos à Administração Pública, nacional ou estrangeira, observar-se-ão os \ntermos da Lei nº 12.846/2013. \n\nParágrafo Sétimo \nA celebração de Termo de Ajustamento de Conduta prevista no Regulamento de Licitações \ne  Contratos  do  Sistema  BNDES  não  importa  em  renúncia  às  penalidades  prevista  neste \nContrato e no Anexo 1 (Termo de Referência). \n\nParágrafo Oitavo \nA sanção prevista no inciso Ili desta Cláusula também poderá ser aplicada às sociedades ou \nprofissionais que: \n\n1.  tenham sofrido condenação  definitiva por praticarem, por meios dolosos,  fraude fiscal  no \nrecolhimento de quaisquer tributos; \n\nli. tenham praticado atos ilícitos visando frustrar os objetivos da licitação; \n\nIli.  demonstrem  não  possuir  idoneidade  para contratar com  o  BNDES  em  virtude  de atos \nilícitos praticados.', 'Em  caso  de  inexecução  total  ou  parcial  do  Contrato,  inclusive  de  descumprimento  de \nexigência expressamente formulada pelo BNDES ou de inobservância de qualquer obrigação \nlegal, bem como em caso de mora, sem motivo justificado, o CONTRATADO ficará sujeito às \nseguintes penalidades: \n\n1.  advertência; \n\nli. multa, de acordo com o Anexo 1 (Termo de Referência); e \n\nIli.  suspensão temporária de  participação  em  licitação e  impedimento  de contratar  com  o \nBNDES,  por  prazo  não  superior a  2  (dois)  anos,  apurado  de  acordo  com  a  gravidade  da \ninfração.').
contract_clause(contrato_ocs_331_2022, clausula_decima_nona_alteracoes_contratuais, 'CLÁUSULA DÉCIMA NONA - ALTERAÇÕES CONTRATUAIS \nO  presente  Contrato  poderá  ser  alterado,  por  acordo  entre  as  partes,  nas  hipóteses \ndisciplinadas  no  art.  81  da  Lei  nº  13.303/2016,  entre  outras  legal  ou  contratualmente \nprevistas, observando-se que: \n\n1.  as alterações devem preservar o equilíbrio econômico-financeiro do Contrato; e \n\nli.  é  vedada  a  modificação  contratual  que  desnature  o  objeto  da  contratação  ou  afete  as \ncondições essenciais previstas no Termo de Referência (Anexo I deste Contrato). \n\nParágrafo Primeiro \nEm  atenção  aos  princípios  que  regem  as relações  contratuais,  nas  hipóteses  em  que  for \nimprescindível  a  alteração  deste  Contrato  para  viabilizar  sua  plena  execução,  conforme \ndemonstrado  em  processo  administrativo,  não  caberá  a  recusa  das  partes  à  respectiva \nformalização,  salvo  em  caso  de justo  motivo,  devidamente  comprovado  pela  parte  que  o \nalegar. \n\nParágrafo Segundo \nA  parte que,  injustificadamente, se  recusar  a  promover a  alteração contratual  indicada  no \nParágrafo anterior, deverá responder pelos danos eventualmente causados, sem prejuízo das \ndemais consequências previstas neste Instrumento e na legislação vigente. \n\nParágrafo Terceiro \nAs  alterações contratuais  serão  formalizadas  mediante  instrumento aditivo,  ressalvadas as \nhipóteses  legais  que  admitem  a  alteração  por  apostilamento,  os  ajustes  necessários  à \neventual  correção  de  erros  materiais  ou  à  alteração  de dados  acessórios  do  Contrato  e \nalterações de preços decorrentes decorrente de reajuste, repactuação ou  revisão de preços \ncausada  por  alterações  na  legislação  tributária,  que  poderão  ser  celebrados  por  meio \nepistolar.', 'O  presente  Contrato  poderá  ser  alterado,  por  acordo  entre  as  partes,  nas  hipóteses \ndisciplinadas  no  art.  81  da  Lei  nº  13.303/2016,  entre  outras  legal  ou  contratualmente \nprevistas, observando-se que: \n\n1.  as alterações devem preservar o equilíbrio econômico-financeiro do Contrato; e \n\nli.  é  vedada  a  modificação  contratual  que  desnature  o  objeto  da  contratação  ou  afete  as \ncondições essenciais previstas no Termo de Referência (Anexo I deste Contrato).').
contract_clause(contrato_ocs_331_2022, clausula_vigésima_extincao_contrato, 'CLÁUSULA VIGÉSIMA- EXTINÇÃO DO CONTRATO \nO presente Contrato poderá ser extinto de acordo com as hipóteses previstas na legislação, \ne ainda: \n\n1.  Consensualmente,  formalizada  em  autorização  escrita  e  fundamentada  do  BNDES, \nmediante aviso prévio por escrito, com antecedência mínima de 90 (noventa) dias ou de prazo \nmenor a ser negociado pelas partes à época da rescisão; \n\nli. em  razão do inadimplemento total ou parcial de qualquer de suas obrigações, cabendo à \nparte  inocente  notificar  a  outra  por  escrito,  assinalando-lhe  prazo  razoável  para  o \ncumprimento das obrigações, quando o mesmo não for previamente fixado neste instrumento \nou em seus anexos; \n\nIli. na ausência de liberação, por parte do BNDES, de área, local ou objeto necessário para \na sua execução, nos prazos contratuais; \n\nIV.  em  virtude  da suspensão da execução do Contrato, por ordem escrita do BNDES, por \nprazo superior a 120 (cento e vinte) dias ou ainda por repetidas suspensões que totalizem o \nmesmo prazo; \n\nV. quando for decretada a falência do CONTRATADO; \n\n19 \n\n\nUnidade Gestora: AJ1/JUUCIGLIC4 \n\nVI.  caso  o  CONTRATADO  perca  uma  das  condições  de  habilitação  exigidas quando  da \ncontratação; \n\nVII. na hipótese de descumprimento do previsto  na Cláusula de Cessão de  Contrato ou  de \nCrédito, Sucessão Contratual e Subcontratação; \n\nVIII. caso o CONTRATADO seja declarada inidônea pela  União, por Estado ou pelo Distrito \nFederal; \n\nIX. em função da suspensão do direito de o CONTRATADO licitar ou contratar com o BNDES; \n\nX.  na hipótese de caracterização de ato lesivo à Administração Pública, nos termos da Lei nº \n12.846/2013, cometido pelo CONTRATADO no processo de contratação ou por ocasião da \nexecução contratual; \n\nXI. em razão da dissolução do CONTRATADO; \n\nXII.  quando  da ocorrência  de caso  fortuito  ou  de  força  maior,  regularmente  comprovado, \nimpeditivo da execução do Contrato. \n\nParágrafo Primeiro \nCaracteriza inadimplemento das obrigações de pagamento pecuniário do presente Contrato, \na mora superior a 90 (noventa) dias. \n\nParágrafo Segundo \nOs  casos  de  extinção  contratual  convencionados  no  caput  desta  Cláusula  deverão  ser \nprecedidos  de  notificação escrita à  outra parte do Contrato, e  de  oportunidade  de defesa, \ndispensada a necessidade de interpelação judicial.', 'O presente Contrato poderá ser extinto de acordo com as hipóteses previstas na legislação, \ne ainda: \n\n1.  Consensualmente,  formalizada  em  autorização  escrita  e  fundamentada  do  BNDES, \nmediante aviso prévio por escrito, com antecedência mínima de 90 (noventa) dias ou de prazo \nmenor a ser negociado pelas partes à época da rescisão; \n\nli. em  razão do inadimplemento total ou parcial de qualquer de suas obrigações, cabendo à \nparte  inocente  notificar  a  outra  por  escrito,  assinalando-lhe  prazo  razoável  para  o \ncumprimento das obrigações, quando o mesmo não for previamente fixado neste instrumento \nou em seus anexos; \n\nIli. na ausência de liberação, por parte do BNDES, de área, local ou objeto necessário para \na sua execução, nos prazos contratuais; \n\nIV.  em  virtude  da suspensão da execução do Contrato, por ordem escrita do BNDES, por \nprazo superior a 120 (cento e vinte) dias ou ainda por repetidas suspensões que totalizem o \nmesmo prazo; \n\nV. quando for decretada a falência do CONTRATADO; \n\nVI.  caso  o  CONTRATADO  perca  uma  das  condições  de  habilitação  exigidas quando  da \ncontratação; \n\nVII. na hipótese de descumprimento do previsto  na Cláusula de Cessão de  Contrato ou  de \nCrédito, Sucessão Contratual e Subcontratação; \n\nVIII. caso o CONTRATADO seja declarada inidônea pela  União, por Estado ou pelo Distrito \nFederal; \n\nIX. em função da suspensão do direito de o CONTRATADO licitar ou contratar com o BNDES; \n\nX.  na hipótese de caracterização de ato lesivo à Administração Pública, nos termos da Lei nº \n12.846/2013, cometido pelo CONTRATADO no processo de contratação ou por ocasião da \nexecução contratual; \n\nXI. em razão da dissolução do CONTRATADO; \n\nXII.  quando  da ocorrência  de caso  fortuito  ou  de  força  maior,  regularmente  comprovado, \nimpeditivo da execução do Contrato.').
contract_clause(contrato_ocs_331_2022, clausula_vigésima_primeira_disposicoes_finais, 'CLÁUSULA VIGÉSIMA PRIMEIRA - DISPOSIÇÕES FINAIS \nEste Contrato representa todo o acordo entre as partes com  relação ao objeto nele previsto. \n\nParágrafo Primeiro \nIntegram o presente Contrato: \nAnexo 1 - Termo de Referência \nAnexo 11 - Proposta \nAnexo 111 - Matriz de Risco \nAnexo IV - Termo de Confidencialidade para Representante Legal \nAnexo V - Minuta de Termo de Confidencialidade para Profissionais \nAnexo VI - Minuta de Termo de Confidencialidade para Subcontratação \n\nParágrafo Segundo \nA  omissão  ou  tolerância  quanto  à  ex1gencia  do  estrito  cumprimento  das  obrigações \ncontratuais ou ao exercício de prerrogativa decorrente deste Contrato não constituirá renúncia \nou negação nem impedirá as partes de exercerem os seus direitos a qualquer tempo.', 'Este Contrato representa todo o acordo entre as partes com  relação ao objeto nele previsto.').

% ===== END =====
