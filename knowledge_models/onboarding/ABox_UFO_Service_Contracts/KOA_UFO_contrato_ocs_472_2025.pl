% ===== KOA Combined Output | contract_id: contrato_ocs_472_2025 =====

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
% UFO-only grounding generated from: KOA_Contrato_OCS_472_2025_-_MultConnect.pl
% contract_id: contrato_ocs_472_2025

instance_of(contrato_ocs_472_2025, legal_service_agreement).

instance_of(banco_nacional_de_desenvolvimento_economico_e_social_bndes, agent).
instance_of(mult_connect_comercio_e_servicos_de_informatica_ltda, agent).

plays_role(banco_nacional_de_desenvolvimento_economico_e_social_bndes, service_customer_role, contrato_ocs_472_2025).
plays_role(mult_connect_comercio_e_servicos_de_informatica_ltda, hired_service_provider_role, contrato_ocs_472_2025).

clause_of(clausula_primeira_objeto, contrato_ocs_472_2025).
clause_of(clausula_segunda_preco, contrato_ocs_472_2025).
clause_of(clausula_terceira_vigencia, contrato_ocs_472_2025).
clause_of(clausula_quarta_pagamento, contrato_ocs_472_2025).
clause_of(clausula_quinta_penalidades, contrato_ocs_472_2025).
clause_of(clausula_sexta_extincao, contrato_ocs_472_2025).
clause_of(clausula_setima_obrigacoes_contratada, contrato_ocs_472_2025).
clause_of(clausula_oitava_conduta_etica_contratada_bndes, contrato_ocs_472_2025).
clause_of(clausula_nona_gestao, contrato_ocs_472_2025).
clause_of(clausula_decima_foro, contrato_ocs_472_2025).
clause_of(clausula_decima_primeira_disposições_finais, contrato_ocs_472_2025).
clause_of(3_atribuições_e_responsabilidades, contrato_ocs_472_2025).

legal_relation_instance(clausula_primeira_objeto, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, create_implement_tool).
legal_relation_instance(clausula_primeira_objeto, right_to_action, mult_connect_comercio_e_servicos_de_informatica_ltda, create_implement_tool).
legal_relation_instance(clausula_primeira_objeto, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, use_data_provided_by_bndes).
legal_relation_instance(clausula_primeira_objeto, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, provide_data).
legal_relation_instance(clausula_segunda_preco, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, pay_contracted_party).
legal_relation_instance(clausula_segunda_preco, right_to_action, mult_connect_comercio_e_servicos_de_informatica_ltda, receive_payment).
legal_relation_instance(clausula_terceira_vigencia, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, establish_contract_duration).
legal_relation_instance(clausula_quarta_pagamento, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, make_payment).
legal_relation_instance(clausula_quarta_pagamento, subjection, mult_connect_comercio_e_servicos_de_informatica_ltda, present_fiscal_document).
legal_relation_instance(clausula_quarta_pagamento, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, present_fiscal_document).
legal_relation_instance(clausula_quinta_penalidades, right_to_action, mult_connect_comercio_e_servicos_de_informatica_ltda, defend_against_penalty).
legal_relation_instance(clausula_quinta_penalidades, subjection, mult_connect_comercio_e_servicos_de_informatica_ltda, suffer_penalties_for_delay).
legal_relation_instance(clausula_quinta_penalidades, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, deduct_credits_for_penalty).
legal_relation_instance(clausula_quinta_penalidades, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, notify_contracted_party_of_delay).
legal_relation_instance(clausula_quinta_penalidades, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, apply_penalties).
legal_relation_instance(clausula_quinta_penalidades, duty_to_omit, banco_nacional_de_desenvolvimento_economico_e_social_bndes, omit_applying_penalties_without_defense).
legal_relation_instance(clausula_quinta_penalidades, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, judicial_collection).
legal_relation_instance(clausula_sexta_extincao, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, notify_other_party).
legal_relation_instance(clausula_sexta_extincao, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, provide_opportunity_for_defense).
legal_relation_instance(clausula_sexta_extincao, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, suspend_execution).
legal_relation_instance(clausula_sexta_extincao, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, terminate_contract).
legal_relation_instance(clausula_sexta_extincao, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, terminate_contract_non_payment).
legal_relation_instance(clausula_setima_obrigacoes_contratada, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, maintain_qualification_conditions).
legal_relation_instance(clausula_setima_obrigacoes_contratada, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, report_penalties).
legal_relation_instance(clausula_setima_obrigacoes_contratada, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, repair_defects).
legal_relation_instance(clausula_setima_obrigacoes_contratada, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, repair_damages).
legal_relation_instance(clausula_setima_obrigacoes_contratada, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, pay_taxes).
legal_relation_instance(clausula_setima_obrigacoes_contratada, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, exclude_simples_nacional).
legal_relation_instance(clausula_setima_obrigacoes_contratada, subjection, mult_connect_comercio_e_servicos_de_informatica_ltda, permit_inspections).
legal_relation_instance(clausula_setima_obrigacoes_contratada, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, obey_instructions).
legal_relation_instance(clausula_setima_obrigacoes_contratada, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, designate_representative).
legal_relation_instance(clausula_setima_obrigacoes_contratada, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, maintain_confidentiality).
legal_relation_instance(clausula_oitava_conduta_etica_contratada_bndes, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, maintain_integrity_public_private_relations).
legal_relation_instance(clausula_oitava_conduta_etica_contratada_bndes, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, maintain_integrity_public_private_relations).
legal_relation_instance(clausula_oitava_conduta_etica_contratada_bndes, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, act_in_good_faith).
legal_relation_instance(clausula_oitava_conduta_etica_contratada_bndes, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, act_in_good_faith).
legal_relation_instance(clausula_oitava_conduta_etica_contratada_bndes, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, act_accordance_principles_administrative_morality).
legal_relation_instance(clausula_oitava_conduta_etica_contratada_bndes, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, act_accordance_principles_administrative_morality).
legal_relation_instance(clausula_oitava_conduta_etica_contratada_bndes, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, act_accordance_principles_impartiality).
legal_relation_instance(clausula_oitava_conduta_etica_contratada_bndes, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, act_accordance_principles_impartiality).
legal_relation_instance(clausula_oitava_conduta_etica_contratada_bndes, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, follow_ethical_precepts).
legal_relation_instance(clausula_oitava_conduta_etica_contratada_bndes, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, follow_ethical_precepts).
legal_relation_instance(clausula_nona_gestao, duty_to_act, unknown, fiscalizar_execucao_servicos).
legal_relation_instance(clausula_nona_gestao, duty_to_act, unknown, liquidar_despesa).
legal_relation_instance(clausula_nona_gestao, duty_to_act, unknown, atestar_cumprimento_obrigacoes).
legal_relation_instance(clausula_nona_gestao, power, unknown, fiscalizar_execucao_servicos_power).
legal_relation_instance(clausula_nona_gestao, power, unknown, liquidar_despesa_power).
legal_relation_instance(clausula_nona_gestao, power, unknown, atestar_cumprimento_obrigacoes_power).
legal_relation_instance(clausula_decima_foro, power, unknown, establish_forum).
legal_relation_instance(clausula_decima_primeira_disposições_finais, duty_to_act, unknown, comply_with_law).
legal_relation_instance(clausula_decima_primeira_disposições_finais, right_to_action, unknown, invoke_law).
legal_relation_instance(3_atribuições_e_responsabilidades, duty_to_act, mult_connect_comercio_e_servicos_de_informatica_ltda, perform_replacement).
legal_relation_instance(3_atribuições_e_responsabilidades, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, demand_replacement).

% --- Action catalog (local to this contract grounding) ---
action_type(act_accordance_principles_administrative_morality).
action_label(act_accordance_principles_administrative_morality, 'Act with administrative morality').
action_type(act_accordance_principles_impartiality).
action_label(act_accordance_principles_impartiality, 'Act with impartiality').
action_type(act_in_good_faith).
action_label(act_in_good_faith, 'Act in good faith').
action_type(apply_penalties).
action_label(apply_penalties, 'Apply penalties').
action_type(atestar_cumprimento_obrigacoes).
action_label(atestar_cumprimento_obrigacoes, 'Certify obligations fulfillment').
action_type(atestar_cumprimento_obrigacoes_power).
action_label(atestar_cumprimento_obrigacoes_power, 'Power to certify obligations fulfillment').
action_type(comply_with_law).
action_label(comply_with_law, 'Comply with law').
action_type(comply_with_security_norms).
action_label(comply_with_security_norms, 'Comply with security norms').
action_type(create_implement_tool).
action_label(create_implement_tool, 'Create and implement tool').
action_type(deduct_credits_for_penalty).
action_label(deduct_credits_for_penalty, 'Deduct credits for penalty').
action_type(defend_against_penalty).
action_label(defend_against_penalty, 'Defend against penalty').
action_type(demand_replacement).
action_label(demand_replacement, 'Demand replacement').
action_type(designate_representative).
action_label(designate_representative, 'Designate representative').
action_type(establish_contract_duration).
action_label(establish_contract_duration, 'Establish contract duration').
action_type(establish_forum).
action_label(establish_forum, 'Establish forum').
action_type(exclude_simples_nacional).
action_label(exclude_simples_nacional, 'Exclude from Simples Nacional').
action_type(fiscalizar_execucao_servicos).
action_label(fiscalizar_execucao_servicos, 'Oversee service execution').
action_type(fiscalizar_execucao_servicos_power).
action_label(fiscalizar_execucao_servicos_power, 'Power to oversee service execution').
action_type(follow_ethical_precepts).
action_label(follow_ethical_precepts, 'Follow ethical precepts').
action_type(guarantee_ip_rights).
action_label(guarantee_ip_rights, 'Guarantee IP rights').
action_type(inspect).
action_label(inspect, 'Inspect the contracted object').
action_type(invoke_law).
action_label(invoke_law, 'Invoke law').
action_type(judicial_collection).
action_label(judicial_collection, 'Judicial collection').
action_type(liquidar_despesa).
action_label(liquidar_despesa, 'Settle expense').
action_type(liquidar_despesa_power).
action_label(liquidar_despesa_power, 'Power to settle expense').
action_type(maintain_confidentiality).
action_label(maintain_confidentiality, 'Maintain confidentiality').
action_type(maintain_integrity_public_private_relations).
action_label(maintain_integrity_public_private_relations, 'Maintain integrity in relations').
action_type(maintain_qualification_conditions).
action_label(maintain_qualification_conditions, 'Maintain qualification conditions').
action_type(make_payment).
action_label(make_payment, 'Make payment').
action_type(notify_contracted_party_of_delay).
action_label(notify_contracted_party_of_delay, 'Notify party of delay').
action_type(notify_other_party).
action_label(notify_other_party, 'Notify other party').
action_type(obey_instructions).
action_label(obey_instructions, 'Obey instructions').
action_type(observe_data_protection_law).
action_label(observe_data_protection_law, 'Observe data protection law').
action_type(omit_applying_penalties_without_defense).
action_label(omit_applying_penalties_without_defense, 'Omit applying penalties without defense').
action_type(pay_contracted_party).
action_label(pay_contracted_party, 'Pay contracted party').
action_type(pay_taxes).
action_label(pay_taxes, 'Pay taxes').
action_type(perform_replacement).
action_label(perform_replacement, 'Perform replacement in 5 days').
action_type(permit_inspections).
action_label(permit_inspections, 'Permit inspections').
action_type(present_fiscal_document).
action_label(present_fiscal_document, 'Present fiscal document').
action_type(provide_data).
action_label(provide_data, 'Provide data').
action_type(provide_opportunity_for_defense).
action_label(provide_opportunity_for_defense, 'Provide opportunity for defense').
action_type(receive_payment).
action_label(receive_payment, 'Receive payment').
action_type(repair_damages).
action_label(repair_damages, 'Repair damages').
action_type(repair_defects).
action_label(repair_defects, 'Repair defects').
action_type(report_penalties).
action_label(report_penalties, 'Report penalties').
action_type(socioenvironmental_responsibility).
action_label(socioenvironmental_responsibility, 'Socioenvironmental responsibility').
action_type(suffer_penalties_for_delay).
action_label(suffer_penalties_for_delay, 'Suffer penalties for delay').
action_type(suspend_execution).
action_label(suspend_execution, 'Suspend execution').
action_type(terminate_contract).
action_label(terminate_contract, 'Terminate contract').
action_type(terminate_contract_non_payment).
action_label(terminate_contract_non_payment, 'Terminate for non-payment').
action_type(use_data_provided_by_bndes).
action_label(use_data_provided_by_bndes, 'Use data provided by BNDES').

% ===== 3) Original Contract ABox =====
contract(contrato_ocs_472_2025).
contract_metadata(contrato_ocs_472_2025, numero_ocs, '472/2025').
contract_metadata(contrato_ocs_472_2025, numero_sap, '4400006805').
contract_metadata(contrato_ocs_472_2025, contratante, 'BANCO NACIONAL DE DESENVOLVIMENTO ECONÔMICO E SOCIAL – BNDES').
contract_metadata(contrato_ocs_472_2025, contratado, 'MULT CONNECT COMERCIO E SERVICOS DE INFORMATICA LTDA').
contract_metadata(contrato_ocs_472_2025, cnpj_contratante, '33.657.248/0001-89').
contract_metadata(contrato_ocs_472_2025, cnpj_contratado, '00.452.461/0001-03').
contract_metadata(contrato_ocs_472_2025, data_autorizacao, '18/12/2025').
contract_metadata_raw(contrato_ocs_472_2025, 'ip_asi_depis', '21/2025', 'preamble').
contract_metadata_raw(contrato_ocs_472_2025, 'data_ip_asi_depis', '28/11/2025', 'preamble').
contract_metadata(contrato_ocs_472_2025, rubrica_orcamentaria, '3102200020').
contract_metadata(contrato_ocs_472_2025, centro_custo, 'BN50007000').
contract_metadata(contrato_ocs_472_2025, lei_aplicavel, 'Lei nº 13.303/2016').
contract_metadata(contrato_ocs_472_2025, regulamento, 'Regulamento de Licitações e Contratos do Sistema BNDES').
contract_clause(contrato_ocs_472_2025, clausula_primeira_objeto, 'CLÁUSULA PRIMEIRA - OBJETO', 'Prestação  de  serviços  de  criação  e  implementação  de  ferramenta  com \nbase  de  dados  saneada/higienizada  e  automatizada,  a  partir  de  diversas  fontes  de \ndados  públicas  e  outras  fornecidas  pelo  BNDES,  para  consumo  de  informações \nestruturadas demandadas pelas equipes do Departamento de Projetos e Soluções de \nInfraestrutura  Social  do  BNDES  (cerca  de  15  pessoas),  em  âmbito  nacional  (União, \nEstados  e  Municípios),  relacionados  a:  (1)  saúde,  (2) \ninfraestrutura  urbana \ncompartilhada para redes aéreas e subterrâneas para distribuição de energia elétrica, \niluminação  pública  e  telecomunicações  e  (3)  segurança  pública,  nas  condições \n\ndiscriminadas  no  Termo  de  Referência  e  na  proposta  apresentada  pela \nCONTRATADA (ANEXOS I e II deste CONTRATO).').
contract_clause(contrato_ocs_472_2025, clausula_segunda_preco, 'CLÁUSULA SEGUNDA - PREÇO', 'O BNDES pagará à CONTRATADA, pela execução do objeto contratado, \no  valor  global  de  até  R$  31.900,00  (trinta  e  um  mil  e  novecentos  reais).  Neste  valor, \nestão incluídas todas as despesas necessárias para execução do objeto, assim como \nos tributos, inclusive contribuições fiscais e parafiscais.').
contract_clause(contrato_ocs_472_2025, clausula_terceira_vigencia, 'CLÁUSULA TERCEIRA - VIGÊNCIA', 'O  presente  Contrato  terá  duração  de  12  (doze)  meses,  a  contar  da  data  de  sua \nassinatura.').
contract_clause(contrato_ocs_472_2025, clausula_quarta_pagamento, 'CLÁUSULA QUARTA - PAGAMENTO', 'O BNDES efetuará o pagamento referente ao objeto deste CONTRATO, será efetuado \nem parcela única, por meio de crédito em conta bancária, em até 10 (dez) dias úteis a \ncontar da data de apresentação do documento fiscal ou equivalente legal (como nota \nfiscal,  fatura,  boleto  bancário  com  código  de  barras,  recibo  de  pagamento  a \nautônomo),  desde  que  tenha  sido  efetuado  ateste  pelo  Gestor  do  Contrato  das \nobrigações  contratuais  assumidas  pela  CONTRATADA,  observado  o  disposto  no \nAnexo I (Termo de Referência) deste Instrumento. \n\n4.1 Em se tratando de contratação de serviço, o documento fiscal ou equivalente legal \ndeverá  ser  apresentado  ao  BNDES  no  mês  de  sua  emissão  e  até  o  dia  25  (vinte  e \ncinco) do mesmo – ou data anterior que viabilize o tempestivo recolhimento de ISS, se \na legislação tributária municipal incidente assim exigir – possibilitando o cumprimento, \npelo  BNDES,  das  obrigações  fiscais  principais  e  acessórias  decorrentes  desse \nCONTRATO.  Havendo  impedimento  legal  para  o  cumprimento  desse  prazo,  o \ndocumento fiscal ou equivalente legal deverá ser apresentado até o primeiro dia útil do \nmês seguinte, mediante prévia autorização do BNDES. \n\n4.2.  Para  toda  efetivação  de  pagamento,  a  CONTRATADA  deverá  encaminhar  o \ndocumento  fiscal  ou  equivalente  em  meio  digital  para  caixa  postal  eletrônica  ou \nprotocolar em sistema eletrônico próprio do BNDES, considerando as orientações do \nContratante  vigentes  na  ocasião  do  pagamento.  No  caso  de  emissão  de  documento \nfiscal  exclusivamente  em  meio  físico  o  mesmo deverá  ser  encaminhado  ao  protocolo \ndo BNDES para devido registro de recebimento.').
contract_clause(contrato_ocs_472_2025, clausula_quinta_penalidades, 'CLÁUSULA QUINTA - PENALIDADES', 'Em  caso  de  atraso  injustificado  no  fornecimento  ou  de  inexecução  total  ou  parcial,  a \nCONTRATADA ficará sujeita às seguintes penalidades, garantida a prévia defesa no \n\nprazo  de  10  (dez)  dias  úteis  contados  da  notificação  do  BNDES,  sem  prejuízo  da \naplicação do disposto nos artigos 82, 83 e 84 da Lei 13.303/2016: \n\nI. \nII. \n\nIII. \n\nadvertência; \nMulta  de  até  10%  (dez  por  cento)  sobre  a  parcela  do  CONTRATO \ndescumprida,  até  o  limite  de  30%  (trinta  por  cento)  do  valor  total  do \nCONTRATO, apurada de acordo com a gravidade da infração; e \nsuspensão  temporária  de  participação  em  licitação  e  impedimento  de \ncontratar com o BNDES, por prazo não superior a 2 (dois) anos, apurado de \nacordo com a gravidade da infração. \n\n5.1.  As  penalidades  serão  aplicadas  observadas  as  normas  do  Regulamento  de \nLicitações e Contratos do SISTEMA BNDES.  \n\n5.2. Contra a decisão de aplicação de penalidade, o CONTRATADO poderá interpor o \npedido de reconsideração para a decisão de advertência e o recurso cabível para as \ndemais  penalidades,  na  forma  e  no  prazo  previstos  no  Regulamento  de  Licitações  e \nContratos do SISTEMA BNDES. \n\n5.3. A imposição de penalidade prevista nesta Cláusula não impede a extinção deste \nCONTRATO pelo BNDES, nos termos da legislação aplicável e deste CONTRATO.  \n\n5.4.  A  multa  prevista  nesta  Cláusula  poderá  ser  aplicada  juntamente  com  as  demais \npenalidades. \n\n5.5.  A  multa  aplicada  à  CONTRATADA  e  os  prejuízos  causados  ao  BNDES  serão \ndeduzidos de quaisquer créditos a ele devidos, ressalvada a possibilidade de cobrança \njudicial da diferença eventualmente não coberta pelos mencionados créditos. \n\n5.6. No caso de uso indevido de informações sigilosas, observar-se-ão, no que couber, \nos termos da Lei nº 12.527/2011 e do Decreto nº 7.724/2012. \n\n5.7.  No  caso  de  atos  lesivos  à  Administração  Pública,  nacional  ou  estrangeira, \nobservar-se-ão os termos da Lei nº 12.846/2013. \n\n5.8.  A  sanção  prevista  no  inciso  III  desta  Cláusula  também  poderá  ser  aplicada  às \nsociedades ou profissionais que: \n\nI.  tenham  sofrido  condenação  definitiva  por  praticarem,  por  meios  dolosos,  fraude \nfiscal no recolhimento de quaisquer tributos; \n\nII. tenham praticado atos ilícitos visando frustrar os objetivos da licitação; \n\nIII.  demonstrem  não  possuir  idoneidade  para  contratar  com  o  BNDES  em  virtude  de \natos ilícitos praticados.').
contract_clause(contrato_ocs_472_2025, clausula_sexta_extincao, 'CLÁUSULA SEXTA - EXTINÇÃO', 'O presente CONTRATO poderá ser extinto de acordo com as hipóteses previstas na \nlegislação, convencionando-se, ainda, que é cabível a sua resolução: \n\nI. \n\nem  razão  do  inadimplemento  total  ou  parcial  de  qualquer  de  suas \nobrigações,  cabendo  à  parte \ninocente  notificar  a  outra  por  escrito, \nassinalando-lhe prazo razoável para o cumprimento das obrigações, quando \no mesmo não for previamente fixado neste instrumento ou em seus anexos; \nII. \nna  ausência  de  liberação,  por  parte  do  BNDES,  de  área,  local  ou  objeto \nnecessário para a sua execução, nos prazos contratuais; \nIII. \nem  virtude  da  suspensão  da  execução  do  CONTRATO,  por  ordem  escrita \ndo  BNDES,  por  prazo  superior  a  120  (cento  e  vinte)  dias  ou  ainda  por \nrepetidas suspensões que totalizem o mesmo prazo;  \nIV. \nquando for decretada a falência da CONTRATADA; \nV. \ncaso  a  CONTRATADA  perca  uma  das  condições  de  habilitação  exigidas \nquando da contratação; \nVI. \ncaso  a  CONTRATADA  seja  declarada  inidônea  pela  União,  por  Estado  ou \npelo Distrito Federal;  \nVII. \nem função da suspensão do direito de a CONTRATADA licitar ou contratar \ncom o BNDES; \nVIII. \nna  hipótese  de  caracterização  de  ato  lesivo  à  Administração  Pública,  nos \ntermos  da  Lei  nº  12.846/2013,  cometido  pela  CONTRATADA  no  processo \nde contratação ou por ocasião da execução contratual; \nIX. \nem razão [da dissolução / do falecimento] da CONTRATADA;  \nX. \nquando  da  ocorrência  de  caso  fortuito  ou  de  força  maior,  regularmente \ncomprovado, impeditivo da execução do CONTRATO; e \nXI. \nem  decorrência  de  atraso,  lentidão  ou  paralisação  injustificáveis  da \nexecução  do  objeto  do  CONTRATO,  que  caracterize  a  impossibilidade  de \nsua conclusão no prazo pactuado. \n\n6.1. Caracteriza inadimplemento das obrigações de pagamento pecuniário do presente \nContrato, a mora superior a 90 (noventa) dias. \n\n6.2. Os casos de extinção contratual convencionados no caput desta Cláusula deverão \nser precedidos de notificação escrita à outra parte do CONTRATO, e de oportunidade \nde defesa, dispensada a necessidade de interpelação judicial.').
contract_clause(contrato_ocs_472_2025, clausula_setima_obrigacoes_contratada, 'CLÁUSULA SÉTIMA - OBRIGAÇÕES DA CONTRATADA: \nA  CONTRATADA,  além  das  obrigações  estipuladas  neste  instrumento  ou  definidas \nem Lei, obriga-se a: \n\n4 \n\n \n \n \n \n \n \n \n \n \n \nClassificação: Documento Ostensivo (Lei nº 13.303/2016) \nUnidade Gestora: ASN/DECOMP \n\nI.  manter  durante  a  vigência  deste  CONTRATO  todas  as  condições  de  habilitação \nexigidas quando da contratação, comprovando-as sempre que solicitado pelo BNDES; \n\nII. comunicar a imposição de penalidade que acarrete o impedimento de contratar com \no BNDES, bem como a eventual perda dos pressupostos para a licitação; \n\nIII.  reparar,  corrigir,  remover,  reconstruir  ou  substituir,  às  suas  expensas,  no  total  ou \nem  parte,  o  objeto  deste  CONTRATO  em  que  se  verificarem  vícios,  defeitos  ou \nincorreções decorrentes da execução ou de materiais empregados; \n\nIV.  reparar  todos  os  danos  e  prejuízos  causados  ao  BNDES  ou  a  terceiros,  não \nrestando excluída ou reduzida esta responsabilidade pela presença de fiscalização ou \npelo acompanhamento da execução por parte do Gestor do CONTRATO; \n\nV.  pagar  todos  os  encargos  e  tributos,  que  incidam  ou  venham  a  incidir,  direta  ou \nindiretamente,  sobre  o  objeto  deste  CONTRATO,  podendo  o  BNDES,  a  qualquer \nmomento, exigir da CONTRATADA a comprovação de sua regularidade; \n\nVI. providenciar, perante a Receita Federal do Brasil - RFB, comprovando ao BNDES, \nsua  exclusão  obrigatória  do  Simples  Nacional,  no  prazo  estipulado  pelo  artigo  30  da \nLei Complementar nº 123/2006, se a CONTRATADA, quando optante: \n\na)  extrapolar  o  limite  de  receita  bruta  anual  previsto  no  artigo  3º  da  Lei \nComplementar nº 123/2006, ao longo da vigência deste CONTRATO; ou \n\nb)  enquadrar-se  em  alguma  das  situações  previstas  no  artigo  17  da  Lei \nComplementar nº 123/2006. \n\nVII.  permitir  vistorias  e  acompanhamento  da  execução  do  objeto  pelo  Gestor  do \nCONTRATO; \n\nVIII. obedecer às instruções e aos procedimentos, estabelecidos pelo BNDES, para a \nadequada execução do CONTRATO; \n\nIX. designar 01 (um) preposto como responsável pelo Contrato firmado com o BNDES, \npara participar de eventuais reuniões e ser o interlocutor da CONTRATADA, zelando \npelo fiel cumprimento das obrigações previstas neste Instrumento; \n\nX.  Caso  a  CONTRATADA  venha  a  ter  acesso  a  dados,  materiais,  documentos  e \ninformações  de  natureza  sigilosa,  direta  ou  indiretamente,  em  decorrência  da \nexecução do objeto contratual, deverá manter o sigilo dos mesmos, bem como orientar \nos  profissionais  envolvidos  a  cumprir  esta  obrigação,  respeitando-se  as  diretrizes  e \nnormas da Política Corporativa de Segurança da Informação do BNDES. Neste caso, \nassim que solicitado pelo Gestor do Contrato, a CONTRATADA deverá providenciar a \nassinatura,  por  seu  representante  legal  e  pelos  profissionais  que  tiverem  acesso  a \ninformações sigilosas, dos Termos de Confidencialidade a serem disponibilizados pelo \nBNDES. \n\n5 \n\n \n \n \n \nClassificação: Documento Ostensivo (Lei nº 13.303/2016) \nUnidade Gestora: ASN/DECOMP \n\nXI. Observar os ditames fixados na Lei n° 13.709/2018, se, para a execução do objeto \nda  contratação,  for  necessário  o  tratamento  de  dados  pessoais,  devendo  a \nCONTRATADA  realizar  todas  as  ações  que  sejam  de  sua  responsabilidade  para  a \npreservação  dos  respectivos  dados  e  o  atendimento  dos  direitos  de  seus  titulares  e \ndas demais obrigações legais.   \n\nregistros, \ninclusive  marcas,  know-how  ou \n\nXII.  garantir  que  o  objeto  deste  CONTRATO  não  infringe  quaisquer  direitos  autorais, \ntrade-secrets,  sendo \npatentes  ou \nresponsável  pelos  prejuízos,  inclusive  honorários  de  advogado,  custas  e  despesas \ndecorrentes  de  qualquer  medida  ou  processo  judicial  ou  administrativo  iniciado  em \nface  do  BNDES,  por  acusação  da  espécie,  podendo  a  CONTRATADA  ser  instado  a \nintervir no processo; e \n\nXIII. responsabilizar-se pelo cumprimento das normas de segurança das dependências \ndo BNDES por parte dos profissionais alocados na execução dos serviços, quanto ao \nporte de identificação e à utilização dos acessos indicados pelo BNDES.', 'trecho_literal').
contract_clause(contrato_ocs_472_2025, clausula_oitava_conduta_etica_contratada_bndes, 'CLÁUSULA OITAVA - CONDUTA  ÉTICA  DA  CONTRATADA  E  DO  BNDES:  A  CONTRATADA  e  o \nBNDES  comprometem-se  a  manter  a  integridade  nas  relações  público-privadas, \nagindo  de  boa-fé  e  de  acordo  com  os  princípios  da  moralidade  administrativa  e  da \nimpessoalidade, além de pautar sua conduta por preceitos éticos e, em especial, por \nsua responsabilidade socioambiental.', 'trecho_literal').
contract_clause(contrato_ocs_472_2025, clausula_nona_gestao, 'CLÁUSULA NONA - GESTÃO:  Fica  designado  Gestor  o  Sr.  Paulo  Cesar  de  Araujo  Barcellos,  que \natualmente  exerce  a  função  de  Gerente  da  ASI/DEPIS/GEPIS3,  a  quem  caberá  o \nacompanhamento,  a  fiscalização  e  a  avaliação  da  execução  dos  serviços  e/ou  do \nobjeto  contratado,  bem  como  a  liquidação  da  despesa  e  o  atestado  de  cumprimento \nfica \ndas  obrigações  assumidas.  E,  para  atuar  em  sua  eventual  ausência, \ndesignado  como  substituto  do  Gestor  o  Sr.  Leonardo  Gomes  Alves,  que \natualmente exerce a função de Administrador na ASI/DEPIS/GEPIS3.', 'trecho_literal').
contract_clause(contrato_ocs_472_2025, clausula_decima_foro, 'CLÁUSULA DÉCIMA - FORO: Cidade do Rio de Janeiro.', 'trecho_literal').
contract_clause(contrato_ocs_472_2025, clausula_decima_primeira_disposições_finais, 'CLÁUSULA DÉCIMA PRIMEIRA - DISPOSIÇÕES FINAIS', 'O presente CONTRATO é emitido em conformidade com
contract_clause(contrato_ocs_472_2025, termo_de_referência_para_contrataçao_de_ferramenta_de_suporte_as_novas_frentes_de_trabalho_do_departamento_de_projetos_e_soluções_de_infraestrutura_social_do_bndes_, 'Termo de Referência para contrataçao de ferramenta de suporte as novas
contract_clause(contrato_ocs_472_2025, 1_objeto, '1) OBJETO', 'Contratação de serviço de criação e implementação de ferramenta com base de
contract_clause(contrato_ocs_472_2025, 2_especificações_gerais_das_entregas, '2) ESPECIFICAÇÕES GERAIS DAS ENTREGAS', 'Tais profissionais seriam responsáveis pelo desenvolvimento de produtos sob a
contract_clause(contrato_ocs_472_2025, 3_atribuições_e_responsabilidades, '3) ATRIBUIÇÕES E RESPONSABILIDADES:', '3.1. Modelagem de dados: o BNDES proverá documento de mapeamento das tabelas / views / arquivos e modelo de dados para construção
contract_clause(contrato_ocs_472_2025, 4_prazo_de_entrega, '4) PRAZO DE ENTREGA', '4.1. Entrega da versão de aceite (após emissão pelo Gestor do Contrato): As entregas serão pagas após a emissão do aceite pelo Gestor do Contrato, e em

% ===== END =====
