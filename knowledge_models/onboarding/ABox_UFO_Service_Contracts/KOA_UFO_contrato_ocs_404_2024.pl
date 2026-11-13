% ===== KOA Combined Output | contract_id: contrato_ocs_404_2024 =====

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
% UFO-only grounding generated from: KOA_Contrato_OCS_404_2024_-_SEK.pl
% contract_id: contrato_ocs_404_2024

instance_of(contrato_ocs_404_2024, legal_service_agreement).

instance_of(banco_nacional_de_desenvolvimento_economico_e_social_bndes, agent).
instance_of(sek_security_ecosystem_knowledge_s_a, agent).

plays_role(banco_nacional_de_desenvolvimento_economico_e_social_bndes, service_customer_role, contrato_ocs_404_2024).
plays_role(sek_security_ecosystem_knowledge_s_a, hired_service_provider_role, contrato_ocs_404_2024).

clause_of(clausula_primeira_objeto, contrato_ocs_404_2024).
clause_of(clausula_segunda_preco, contrato_ocs_404_2024).
clause_of(clausula_terceira_vigencia, contrato_ocs_404_2024).
clause_of(clausula_quarta_pagamento, contrato_ocs_404_2024).
clause_of(clausula_quinta_equilibrio_economico_financeiro_contrato, contrato_ocs_404_2024).
clause_of(clausula_sexta_penalidades, contrato_ocs_404_2024).
clause_of(clausula_decima_primeira_foro, contrato_ocs_404_2024).
clause_of(clausula_decima_segunda_disposições_finais, contrato_ocs_404_2024).
clause_of(anexo_i_especificações_técnicas, contrato_ocs_404_2024).
clause_of(esopo, contrato_ocs_404_2024).
clause_of(condições_execução, contrato_ocs_404_2024).
clause_of(contatos, contrato_ocs_404_2024).
clause_of(apresentacao, contrato_ocs_404_2024).
clause_of(ataques, contrato_ocs_404_2024).
clause_of(informacoes, contrato_ocs_404_2024).
clause_of(prazos_execução, contrato_ocs_404_2024).
clause_of(retificacao, contrato_ocs_404_2024).
clause_of(dados_pessoais, contrato_ocs_404_2024).
clause_of(vigência, contrato_ocs_404_2024).
clause_of(local_prestacao_serviço, contrato_ocs_404_2024).
clause_of(habilitação_técnica, contrato_ocs_404_2024).
clause_of(definicao, contrato_ocs_404_2024).
clause_of(informações, contrato_ocs_404_2024).
clause_of(perfil_mínimo, contrato_ocs_404_2024).
clause_of(comprovantes, contrato_ocs_404_2024).
clause_of(substituição, contrato_ocs_404_2024).
clause_of(clausula_oitava_obrigacoes_contratada, contrato_ocs_404_2024).
clause_of(clausula_decima_gestao, contrato_ocs_404_2024).

legal_relation_instance(clausula_primeira_objeto, duty_to_act, sek_security_ecosystem_knowledge_s_a, perform_pentest_service).
legal_relation_instance(clausula_primeira_objeto, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, receive_pentest_service).
legal_relation_instance(clausula_segunda_preco, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, pay_contracted_party).
legal_relation_instance(clausula_segunda_preco, right_to_action, sek_security_ecosystem_knowledge_s_a, receive_payment).
legal_relation_instance(clausula_terceira_vigencia, duty_to_act, sek_security_ecosystem_knowledge_s_a, perform_up_to_six_penetration_tests).
legal_relation_instance(clausula_terceira_vigencia, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, demand_up_to_six_penetration_tests).
legal_relation_instance(clausula_quarta_pagamento, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, make_payment).
legal_relation_instance(clausula_quarta_pagamento, right_to_action, sek_security_ecosystem_knowledge_s_a, receive_payment).
legal_relation_instance(clausula_quarta_pagamento, duty_to_act, sek_security_ecosystem_knowledge_s_a, present_fiscal_document).
legal_relation_instance(clausula_quarta_pagamento, right_to_action, sek_security_ecosystem_knowledge_s_a, present_fiscal_document).
legal_relation_instance(clausula_quarta_pagamento, duty_to_act, sek_security_ecosystem_knowledge_s_a, present_fiscal_document_by_day_25).
legal_relation_instance(clausula_quinta_equilibrio_economico_financeiro_contrato, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, right_to_economic_financial_balance).
legal_relation_instance(clausula_quinta_equilibrio_economico_financeiro_contrato, right_to_action, sek_security_ecosystem_knowledge_s_a, request_price_adjustment).
legal_relation_instance(clausula_quinta_equilibrio_economico_financeiro_contrato, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, analyze_price_adjustment_request).
legal_relation_instance(clausula_quinta_equilibrio_economico_financeiro_contrato, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, suspend_analysis_of_price_readjustment).
legal_relation_instance(clausula_sexta_penalidades, subjection, sek_security_ecosystem_knowledge_s_a, be_subject_to_penalties).
legal_relation_instance(clausula_sexta_penalidades, right_to_action, sek_security_ecosystem_knowledge_s_a, prior_defense).
legal_relation_instance(clausula_sexta_penalidades, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, terminate_contract).
legal_relation_instance(clausula_sexta_penalidades, right_to_action, sek_security_ecosystem_knowledge_s_a, request_reconsideration).
legal_relation_instance(clausula_sexta_penalidades, right_to_action, sek_security_ecosystem_knowledge_s_a, appeal_decision).
legal_relation_instance(clausula_sexta_penalidades, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, apply_penalties).
legal_relation_instance(clausula_sexta_penalidades, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, notify_contracted_party).
legal_relation_instance(clausula_decima_primeira_foro, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, establish_forum).
legal_relation_instance(clausula_decima_primeira_foro, subjection, banco_nacional_de_desenvolvimento_economico_e_social_bndes, be_subject_to_rio_de_janeiro_forum).
legal_relation_instance(clausula_decima_segunda_disposições_finais, no_right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, renounce_rights).
legal_relation_instance(clausula_decima_segunda_disposições_finais, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, exercise_rights).
legal_relation_instance(clausula_decima_segunda_disposições_finais, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, conclude_contract).
legal_relation_instance(anexo_i_especificações_técnicas, duty_to_act, sek_security_ecosystem_knowledge_s_a, provide_pentest_service).
legal_relation_instance(anexo_i_especificações_técnicas, duty_to_omit, sek_security_ecosystem_knowledge_s_a, not_subcontract).
legal_relation_instance(anexo_i_especificações_técnicas, no_right_to_action, sek_security_ecosystem_knowledge_s_a, subcontract).
legal_relation_instance(anexo_i_especificações_técnicas, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, demand_pentest_service).
legal_relation_instance(esopo, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, communicate_ip_ranges).
legal_relation_instance(esopo, right_to_action, sek_security_ecosystem_knowledge_s_a, receive_ip_ranges).
legal_relation_instance(esopo, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, communicate_ip_changes).
legal_relation_instance(esopo, right_to_action, sek_security_ecosystem_knowledge_s_a, receive_ip_changes).
legal_relation_instance(esopo, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, communicate_system_urls).
legal_relation_instance(esopo, right_to_action, sek_security_ecosystem_knowledge_s_a, receive_system_urls).
legal_relation_instance(esopo, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, choose_systems).
legal_relation_instance(condições_execução, duty_to_act, sek_security_ecosystem_knowledge_s_a, mobilize_teams_and_resources).
legal_relation_instance(condições_execução, duty_to_act, sek_security_ecosystem_knowledge_s_a, provide_necessary_infrastructure).
legal_relation_instance(condições_execução, duty_to_act, sek_security_ecosystem_knowledge_s_a, maintain_updated_software_licenses).
legal_relation_instance(condições_execução, duty_to_act, sek_security_ecosystem_knowledge_s_a, inform_ip_ranges).
legal_relation_instance(condições_execução, duty_to_act, sek_security_ecosystem_knowledge_s_a, inform_new_ip_ranges).
legal_relation_instance(condições_execução, duty_to_act, sek_security_ecosystem_knowledge_s_a, inform_escalation_list).
legal_relation_instance(condições_execução, duty_to_omit, banco_nacional_de_desenvolvimento_economico_e_social_bndes, omit_providing_additional_information).
legal_relation_instance(condições_execução, duty_to_omit, banco_nacional_de_desenvolvimento_economico_e_social_bndes, omit_providing_access_credentials).
legal_relation_instance(condições_execução, duty_to_omit, banco_nacional_de_desenvolvimento_economico_e_social_bndes, omit_disabling_controls).
legal_relation_instance(condições_execução, permission_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, consider_providing_information).
legal_relation_instance(contatos, duty_to_act, sek_security_ecosystem_knowledge_s_a, realize_planning_actions).
legal_relation_instance(contatos, duty_to_act, sek_security_ecosystem_knowledge_s_a, realize_initial_reconnaissance).
legal_relation_instance(contatos, duty_to_act, sek_security_ecosystem_knowledge_s_a, realize_discovery_infrastructure).
legal_relation_instance(contatos, duty_to_act, sek_security_ecosystem_knowledge_s_a, verify_vulnerabilities).
legal_relation_instance(contatos, duty_to_act, sek_security_ecosystem_knowledge_s_a, prepare_presentation).
legal_relation_instance(apresentacao, duty_to_act, sek_security_ecosystem_knowledge_s_a, present_test_report).
legal_relation_instance(apresentacao, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, receive_test_report).
legal_relation_instance(ataques, duty_to_act, sek_security_ecosystem_knowledge_s_a, propose_social_engineering_attack).
legal_relation_instance(ataques, no_right_to_action, sek_security_ecosystem_knowledge_s_a, perform_social_engineering_attack).
legal_relation_instance(ataques, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, grant_consent_to_social_engineering_attacks).
legal_relation_instance(ataques, permission_to_act, sek_security_ecosystem_knowledge_s_a, perform_social_engineering_attacks).
legal_relation_instance(informacoes, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, dispose_of_necessary_information).
legal_relation_instance(informacoes, duty_to_act, sek_security_ecosystem_knowledge_s_a, provide_necessary_information).
legal_relation_instance(prazos_execução, duty_to_act, sek_security_ecosystem_knowledge_s_a, present_invasion_test_plan).
legal_relation_instance(prazos_execução, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, demand_invasion_test).
legal_relation_instance(prazos_execução, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, inform_ip_ranges_and_urls).
legal_relation_instance(prazos_execução, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, evaluate_invasion_test_plan).
legal_relation_instance(prazos_execução, duty_to_act, sek_security_ecosystem_knowledge_s_a, deliberate_over_adjustments).
legal_relation_instance(prazos_execução, duty_to_act, sek_security_ecosystem_knowledge_s_a, perform_invasion_test).
legal_relation_instance(prazos_execução, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, review_report).
legal_relation_instance(retificacao, duty_to_act, sek_security_ecosystem_knowledge_s_a, provide_adjustments_to_report).
legal_relation_instance(retificacao, permission_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, extend_deadlines).
legal_relation_instance(retificacao, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, extend_deadlines_power).
legal_relation_instance(retificacao, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, request_report_adjustments).
legal_relation_instance(retificacao, duty_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, certify_service_acceptance).
legal_relation_instance(dados_pessoais, duty_to_act, sek_security_ecosystem_knowledge_s_a, observe_lgpd).
legal_relation_instance(dados_pessoais, subjection, sek_security_ecosystem_knowledge_s_a, be_subject_to_lgpd).
legal_relation_instance(dados_pessoais, no_right_to_action, sek_security_ecosystem_knowledge_s_a, share_bndes_data).
legal_relation_instance(vigência, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, demand_penetration_tests).
legal_relation_instance(vigência, permission_to_act, banco_nacional_de_desenvolvimento_economico_e_social_bndes, demand_penetration_tests).
legal_relation_instance(local_prestacao_serviço, duty_to_act, sek_security_ecosystem_knowledge_s_a, perform_service_remotely).
legal_relation_instance(local_prestacao_serviço, duty_to_act, sek_security_ecosystem_knowledge_s_a, perform_service_at_dependencies).
legal_relation_instance(local_prestacao_serviço, right_to_action, sek_security_ecosystem_knowledge_s_a, perform_service_remotely).
legal_relation_instance(habilitação_técnica, duty_to_act, sek_security_ecosystem_knowledge_s_a, present_technical_certificate).
legal_relation_instance(habilitação_técnica, right_to_action, sek_security_ecosystem_knowledge_s_a, present_equivalent_document).
legal_relation_instance(definicao, duty_to_act, unknown, describe_attested_object).
legal_relation_instance(definicao, duty_to_act, unknown, provide_identifying_information).
legal_relation_instance(informações, duty_to_act, sek_security_ecosystem_knowledge_s_a, provide_company_info).
legal_relation_instance(informações, duty_to_act, sek_security_ecosystem_knowledge_s_a, provide_representative_info).
legal_relation_instance(informações, duty_to_act, sek_security_ecosystem_knowledge_s_a, provide_service_period).
legal_relation_instance(informações, right_to_action, banco_nacional_de_desenvolvimento_economico_e_social_bndes, contact_representatives).
legal_relation_instance(informações, permission_to_act, sek_security_ecosystem_knowledge_s_a, prove_missing_info).
legal_relation_instance(perfil_mínimo, duty_to_act, sek_security_ecosystem_knowledge_s_a, provide_qualified_professionals).
legal_relation_instance(perfil_mínimo, duty_to_act, sek_security_ecosystem_knowledge_s_a, present_proof_of_legal_link).
legal_relation_instance(perfil_mínimo, duty_to_act, sek_security_ecosystem_knowledge_s_a, present_proof_of_experience).
legal_relation_instance(perfil_mínimo, duty_to_act, sek_security_ecosystem_knowledge_s_a, present_certifications).
legal_relation_instance(comprovantes, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, request_professional_substitution).
legal_relation_instance(comprovantes, duty_to_act, sek_security_ecosystem_knowledge_s_a, provide_proof_of_legal_link).
legal_relation_instance(comprovantes, duty_to_act, sek_security_ecosystem_knowledge_s_a, present_certification).
legal_relation_instance(comprovantes, subjection, sek_security_ecosystem_knowledge_s_a, accept_professional_substitution).
legal_relation_instance(substituição, duty_to_act, sek_security_ecosystem_knowledge_s_a, perform_substitution_within_5_days).
legal_relation_instance(substituição, duty_to_act, sek_security_ecosystem_knowledge_s_a, present_proof_of_legal_link_and_nda).
legal_relation_instance(substituição, power, banco_nacional_de_desenvolvimento_economico_e_social_bndes, approve_or_reject_substitution).
legal_relation_instance(substituição, subjection, sek_security_ecosystem_knowledge_s_a, be_subject_to_bndes_approval).
legal_relation_instance(substituição, duty_to_act, sek_security_ecosystem_knowledge_s_a, ensure_substitute_profile_meets_requirements).
legal_relation_instance(clausula_oitava_obrigacoes_contratada, duty_to_act, sek_security_ecosystem_knowledge_s_a, maintain_conditions_of_qualification).
legal_relation_instance(clausula_oitava_obrigacoes_contratada, duty_to_act, sek_security_ecosystem_knowledge_s_a, communicate_imposition_of_penalty).
legal_relation_instance(clausula_oitava_obrigacoes_contratada, duty_to_act, sek_security_ecosystem_knowledge_s_a, repair_correct_remove_reconstruct_or_replace).
legal_relation_instance(clausula_oitava_obrigacoes_contratada, duty_to_act, sek_security_ecosystem_knowledge_s_a, repair_damages).
legal_relation_instance(clausula_oitava_obrigacoes_contratada, duty_to_act, sek_security_ecosystem_knowledge_s_a, pay_taxes).
legal_relation_instance(clausula_oitava_obrigacoes_contratada, duty_to_act, sek_security_ecosystem_knowledge_s_a, exclude_from_simples_nacional).
legal_relation_instance(clausula_oitava_obrigacoes_contratada, duty_to_act, sek_security_ecosystem_knowledge_s_a, permit_inspections).
legal_relation_instance(clausula_oitava_obrigacoes_contratada, duty_to_act, sek_security_ecosystem_knowledge_s_a, obey_instructions_and_procedures).
legal_relation_instance(clausula_oitava_obrigacoes_contratada, duty_to_act, sek_security_ecosystem_knowledge_s_a, designate_representative).
legal_relation_instance(clausula_oitava_obrigacoes_contratada, duty_to_act, sek_security_ecosystem_knowledge_s_a, maintain_confidentiality).
legal_relation_instance(clausula_decima_gestao, duty_to_act, unknown, monitor_contract_execution).
legal_relation_instance(clausula_decima_gestao, duty_to_act, unknown, settle_expenses).
legal_relation_instance(clausula_decima_gestao, duty_to_act, unknown, certify_obligation_fulfillment).

% --- Action catalog (local to this contract grounding) ---
action_type(accept_professional_substitution).
action_label(accept_professional_substitution, 'Accept professional substitution').
action_type(administer_bndes_environment).
action_label(administer_bndes_environment, 'Administer BNDES environment').
action_type(analyze_price_adjustment_request).
action_label(analyze_price_adjustment_request, 'Duty to analyze adjustment request').
action_type(appeal_decision).
action_label(appeal_decision, 'Appeal decision').
action_type(apply_penalties).
action_label(apply_penalties, 'Apply penalties').
action_type(approve_or_reject_substitution).
action_label(approve_or_reject_substitution, 'Approve/reject substitution').
action_type(be_subject_to_bndes_approval).
action_label(be_subject_to_bndes_approval, 'Subject to BNDES approval').
action_type(be_subject_to_lgpd).
action_label(be_subject_to_lgpd, 'Subject to LGPD').
action_type(be_subject_to_penalties).
action_label(be_subject_to_penalties, 'Be subject to penalties').
action_type(be_subject_to_rio_de_janeiro_forum).
action_label(be_subject_to_rio_de_janeiro_forum, 'Subject to Rio de Janeiro forum').
action_type(certify_obligation_fulfillment).
action_label(certify_obligation_fulfillment, 'Certify obligation fulfillment').
action_type(certify_service_acceptance).
action_label(certify_service_acceptance, 'Certify service acceptance').
action_type(choose_systems).
action_label(choose_systems, 'Choose systems to test').
action_type(communicate_imposition_of_penalty).
action_label(communicate_imposition_of_penalty, 'Communicate penalty').
action_type(communicate_ip_changes).
action_label(communicate_ip_changes, 'Communicate IP changes').
action_type(communicate_ip_ranges).
action_label(communicate_ip_ranges, 'Communicate IP ranges').
action_type(communicate_system_urls).
action_label(communicate_system_urls, 'Communicate system URLs').
action_type(comply_with_security_norms).
action_label(comply_with_security_norms, 'Comply with security norms').
action_type(conclude_contract).
action_label(conclude_contract, 'Conclude the contract').
action_type(conduct_inspections).
action_label(conduct_inspections, 'Conduct inspections').
action_type(consider_deactivating_controls).
action_label(consider_deactivating_controls, 'Consider deactivating controls').
action_type(consider_providing_access_credentials).
action_label(consider_providing_access_credentials, 'Consider providing credentials').
action_type(consider_providing_information).
action_label(consider_providing_information, 'Consider providing information').
action_type(contact_representatives).
action_label(contact_representatives, 'Contact representatives').
action_type(deliberate_over_adjustments).
action_label(deliberate_over_adjustments, 'Deliberate over adjustments').
action_type(demand_invasion_test).
action_label(demand_invasion_test, 'Demand invasion test').
action_type(demand_penetration_tests).
action_label(demand_penetration_tests, 'Demand penetration tests').
action_type(demand_pentest_service).
action_label(demand_pentest_service, 'Demand pentest service').
action_type(demand_up_to_six_penetration_tests).
action_label(demand_up_to_six_penetration_tests, 'Demand up to six penetration tests').
action_type(describe_attested_object).
action_label(describe_attested_object, 'Describe attested object').
action_type(designate_representative).
action_label(designate_representative, 'Designate representative').
action_type(dispose_of_necessary_information).
action_label(dispose_of_necessary_information, 'Dispose of information').
action_type(ensure_substitute_profile_meets_requirements).
action_label(ensure_substitute_profile_meets_requirements, 'Ensure substitute meets requirements').
action_type(establish_forum).
action_label(establish_forum, 'Establish forum').
action_type(evaluate_invasion_test_plan).
action_label(evaluate_invasion_test_plan, 'Evaluate invasion test plan').
action_type(exclude_from_simples_nacional).
action_label(exclude_from_simples_nacional, 'Exclude from Simples Nacional').
action_type(exercise_rights).
action_label(exercise_rights, 'Right to exercise rights at any time').
action_type(extend_deadlines).
action_label(extend_deadlines, 'Extend deadlines').
action_type(extend_deadlines_power).
action_label(extend_deadlines_power, 'Power to extend deadlines').
action_type(grant_consent_to_social_engineering_attacks).
action_label(grant_consent_to_social_engineering_attacks, 'Grant consent to social engineering attacks').
action_type(guarantee_non_infringement).
action_label(guarantee_non_infringement, 'Guarantee non-infringement').
action_type(guarantee_vulnerability_free_environment).
action_label(guarantee_vulnerability_free_environment, 'Guarantee vuln-free environment').
action_type(inform_escalation_list).
action_label(inform_escalation_list, 'Inform escalation list').
action_type(inform_ip_ranges).
action_label(inform_ip_ranges, 'Inform IP ranges').
action_type(inform_ip_ranges_and_urls).
action_label(inform_ip_ranges_and_urls, 'Inform IP ranges and URLs').
action_type(inform_new_ip_ranges).
action_label(inform_new_ip_ranges, 'Inform new IP ranges').
action_type(maintain_conditions_of_qualification).
action_label(maintain_conditions_of_qualification, 'Maintain qualification conditions').
action_type(maintain_confidentiality).
action_label(maintain_confidentiality, 'Maintain confidentiality').
action_type(maintain_updated_software_licenses).
action_label(maintain_updated_software_licenses, 'Maintain updated software licenses').
action_type(make_payment).
action_label(make_payment, 'Make payment').
action_type(mobilize_teams_and_resources).
action_label(mobilize_teams_and_resources, 'Mobilize teams and resources').
action_type(monitor_contract_execution).
action_label(monitor_contract_execution, 'Monitor contract execution').
action_type(not_subcontract).
action_label(not_subcontract, 'Not subcontract').
action_type(notify_contracted_party).
action_label(notify_contracted_party, 'Notify contracted party').
action_type(obey_instructions_and_procedures).
action_label(obey_instructions_and_procedures, 'Obey instructions').
action_type(observe_data_protection_law).
action_label(observe_data_protection_law, 'Observe data protection law').
action_type(observe_lgpd).
action_label(observe_lgpd, 'Observe LGPD').
action_type(omit_disabling_controls).
action_label(omit_disabling_controls, 'Omit disabling controls').
action_type(omit_providing_access_credentials).
action_label(omit_providing_access_credentials, 'Omit providing access credentials').
action_type(omit_providing_additional_information).
action_label(omit_providing_additional_information, 'Omit providing information').
action_type(pay_contracted_party).
action_label(pay_contracted_party, 'Pay the contracted party').
action_type(pay_taxes).
action_label(pay_taxes, 'Pay taxes').
action_type(perform_invasion_test).
action_label(perform_invasion_test, 'Perform invasion test').
action_type(perform_pentest_service).
action_label(perform_pentest_service, 'Perform pentest service').
action_type(perform_service_at_dependencies).
action_label(perform_service_at_dependencies, 'Perform service at dependencies').
action_type(perform_service_remotely).
action_label(perform_service_remotely, 'Perform service remotely').
action_type(perform_social_engineering_attack).
action_label(perform_social_engineering_attack, 'No right to perform social engineering attacks').
action_type(perform_social_engineering_attacks).
action_label(perform_social_engineering_attacks, 'Perform social engineering attacks').
action_type(perform_substitution_within_5_days).
action_label(perform_substitution_within_5_days, 'Perform substitution within 5 days').
action_type(perform_up_to_six_penetration_tests).
action_label(perform_up_to_six_penetration_tests, 'Perform up to six penetration tests').
action_type(permit_inspections).
action_label(permit_inspections, 'Permit inspections').
action_type(prepare_presentation).
action_label(prepare_presentation, 'Prepare presentation').
action_type(present_certification).
action_label(present_certification, 'Present certification').
action_type(present_certifications).
action_label(present_certifications, 'Present certifications').
action_type(present_equivalent_document).
action_label(present_equivalent_document, 'Present equivalent document').
action_type(present_fiscal_document).
action_label(present_fiscal_document, 'Present fiscal document').
action_type(present_fiscal_document_by_day_25).
action_label(present_fiscal_document_by_day_25, 'Present fiscal document by day 25').
action_type(present_invasion_test_plan).
action_label(present_invasion_test_plan, 'Present invasion test plan').
action_type(present_proof_of_experience).
action_label(present_proof_of_experience, 'Present proof of experience').
action_type(present_proof_of_legal_link).
action_label(present_proof_of_legal_link, 'Present proof of legal link').
action_type(present_proof_of_legal_link_and_nda).
action_label(present_proof_of_legal_link_and_nda, 'Present proof and NDA').
action_type(present_technical_certificate).
action_label(present_technical_certificate, 'Present technical certificate').
action_type(present_test_report).
action_label(present_test_report, 'Present test report').
action_type(prior_defense).
action_label(prior_defense, 'Right to prior defense').
action_type(propose_social_engineering_attack).
action_label(propose_social_engineering_attack, 'Propose social engineering attack').
action_type(prove_missing_info).
action_label(prove_missing_info, 'Prove missing info').
action_type(provide_adjustments_to_report).
action_label(provide_adjustments_to_report, 'Provide report adjustments').
action_type(provide_company_info).
action_label(provide_company_info, 'Provide company info').
action_type(provide_identifying_information).
action_label(provide_identifying_information, 'Provide identifying information').
action_type(provide_necessary_information).
action_label(provide_necessary_information, 'Provide necessary information').
action_type(provide_necessary_infrastructure).
action_label(provide_necessary_infrastructure, 'Provide necessary infrastructure').
action_type(provide_pentest_service).
action_label(provide_pentest_service, 'Provide pentest service').
action_type(provide_proof_of_legal_link).
action_label(provide_proof_of_legal_link, 'Provide proof of legal link').
action_type(provide_qualified_professionals).
action_label(provide_qualified_professionals, 'Provide qualified professionals').
action_type(provide_representative_info).
action_label(provide_representative_info, 'Provide representative info').
action_type(provide_service_period).
action_label(provide_service_period, 'Provide service period').
action_type(realize_discovery_infrastructure).
action_label(realize_discovery_infrastructure, 'Realize discovery of infrastructure').
action_type(realize_initial_reconnaissance).
action_label(realize_initial_reconnaissance, 'Realize initial reconnaissance').
action_type(realize_planning_actions).
action_label(realize_planning_actions, 'Realize planning actions').
action_type(receive_ip_changes).
action_label(receive_ip_changes, 'Receive IP changes').
action_type(receive_ip_ranges).
action_label(receive_ip_ranges, 'Receive IP ranges').
action_type(receive_payment).
action_label(receive_payment, 'Receive payment').
action_type(receive_pentest_service).
action_label(receive_pentest_service, 'Receive pentest service').
action_type(receive_system_urls).
action_label(receive_system_urls, 'Receive system URLs').
action_type(receive_test_report).
action_label(receive_test_report, 'Receive test report').
action_type(renounce_rights).
action_label(renounce_rights, 'Cannot renounce rights by omission').
action_type(repair_correct_remove_reconstruct_or_replace).
action_label(repair_correct_remove_reconstruct_or_replace, 'Repair defects').
action_type(repair_damages).
action_label(repair_damages, 'Repair damages').
action_type(request_price_adjustment).
action_label(request_price_adjustment, 'Right to request price adjustment').
action_type(request_professional_substitution).
action_label(request_professional_substitution, 'Request professional substitution').
action_type(request_reconsideration).
action_label(request_reconsideration, 'Request reconsideration').
action_type(request_report_adjustments).
action_label(request_report_adjustments, 'Request report adjustments').
action_type(review_report).
action_label(review_report, 'Review report').
action_type(right_to_economic_financial_balance).
action_label(right_to_economic_financial_balance, 'Right to economic-financial balance').
action_type(settle_expenses).
action_label(settle_expenses, 'Settle expenses').
action_type(share_bndes_data).
action_label(share_bndes_data, 'No right to share BNDES data').
action_type(subcontract).
action_label(subcontract, 'No right to subcontract').
action_type(suspend_analysis_of_price_readjustment).
action_label(suspend_analysis_of_price_readjustment, 'Suspend price adjustment analysis').
action_type(terminate_contract).
action_label(terminate_contract, 'Terminate contract').
action_type(verify_vulnerabilities).
action_label(verify_vulnerabilities, 'Verify vulnerabilities').

% ===== 3) Original Contract ABox =====
contract(contrato_ocs_404_2024).
contract_metadata_raw(contrato_ocs_404_2024, 'Classificação', 'Documento Ostensivo (Lei nº 13.303/2016)', 'preambulo').
contract_metadata_raw(contrato_ocs_404_2024, 'Unidade Gestora', 'AIC/DEROP', 'preambulo').
contract_metadata(contrato_ocs_404_2024, numero_ocs, '404/2024', 'preambulo').
contract_metadata(contrato_ocs_404_2024, numero_sap, '4400006190', 'preambulo').
contract_metadata(contrato_ocs_404_2024, partes, ['BANCO NACIONAL DE DESENVOLVIMENTO ECONÔMICO E SOCIAL – BNDES', 'SEK – SECURITY ECOSYSTEM KNOWLEDGE S.A.'], 'preambulo').
contract_metadata(contrato_ocs_404_2024, contratante, 'BANCO NACIONAL DE DESENVOLVIMENTO ECONÔMICO E SOCIAL – BNDES', 'preambulo').
contract_metadata(contrato_ocs_404_2024, contratado, 'SEK – SECURITY ECOSYSTEM KNOWLEDGE S.A.', 'preambulo').
contract_metadata(contrato_ocs_404_2024, cnpj_contratante, '33.657.248/0001-89', 'preambulo').
contract_metadata(contrato_ocs_404_2024, cnpj_contratado, '34.163.686/0001-53', 'preambulo').
contract_metadata(contrato_ocs_404_2024, procedimento_licitatorio, 'Dispensa de Licitação nº 174/2024 - BNDES', 'preambulo').
contract_metadata(contrato_ocs_404_2024, data_autorizacao, '01/11/2024', 'preambulo').
contract_metadata_raw(contrato_ocs_404_2024, 'IP AIC/DEROP', '005/2024', 'preambulo').
contract_metadata(contrato_ocs_404_2024, data_ip_ati_degat, '31/10/2024', 'preambulo').
contract_metadata(contrato_ocs_404_2024, rubrica_orcamentaria, '3101700040', 'preambulo').
contract_metadata(contrato_ocs_404_2024, centro_custo, 'BN00004000', 'preambulo').
contract_metadata(contrato_ocs_404_2024, lei_aplicavel, 'Lei nº 13.303/2016', 'preambulo').
contract_metadata(contrato_ocs_404_2024, regulamento, 'Regulamento de Licitações e Contratos do Sistema BNDES', 'preambulo').
contract_clause(contrato_ocs_404_2024, clausula_primeira_objeto, 'CLÁUSULA PRIMEIRA - OBJETO', 'Prestação  do  serviço  de  teste  de  invasão  externo  (pentest),  sob \ndemanda,  do  tipo  caixa  preta  (blackbox),  para  identificar  vulnerabilidades  na \ninfraestrutura  e  em  sistemas  de  Tecnologia  da  Informação  (TI)  das  empresas  do \nSistema  BNDES  expostos  à  Internet,  bem  como  propor  correções  para  mitigar  os \nriscos  associados  à  exploração  das  vulnerabilidades  identificadas,  nas  condições \ndiscriminadas  nas  Especificações  Técnicas  e  do  Item  5  –  Investimento  da  Proposta \napresentada pela CONTRATADA (ANEXOS I e II deste CONTRATO).').
contract_clause(contrato_ocs_404_2024, clausula_segunda_preco, 'CLÁUSULA SEGUNDA - PREÇO', 'O BNDES pagará à CONTRATADA, pela execução do objeto contratado, \no valor de até R$ 175.259,24 (cento e setenta e cinco mil reais, duzentos e cinquenta \n\n1 \n\n \n \n \n \n \n \n \n \n \n \n \n \n \nClassificação: Documento Ostensivo (Lei nº 13.303/2016) \nUnidade Gestora: AIC/DEROP \n\ne  nove  reais  e  vinte  e  quatro  centavos),  em  até  6  (seis)  parcelas  de  R$  29.209,87 \n(vinte e nove mil, duzentos e nove reais e oitenta e sete centavos), referentes a cada \nteste  de  invasão  demandado  de  acordo  com  a necessidade  do  BNDES.  Neste  valor, \nestão incluídas todas as despesas necessárias para execução do objeto, assim como \nos tributos, inclusive contribuições fiscais e parafiscais.').
contract_clause(contrato_ocs_404_2024, clausula_terceira_vigencia, 'CLÁUSULA TERCEIRA - VIGÊNCIA', 'A  vigência  será  de  36  (trinta  e  seis)  meses  consecutivos,  a  contar  da  assinatura  do \ninstrumento contratual, durante os quais poderão ser demandados até 6 (seis) testes \nde invasão.').
contract_clause(contrato_ocs_404_2024, clausula_quarta_pagamento, 'CLÁUSULA QUARTA - PAGAMENTO', 'O  BNDES  efetuará  o  pagamento  referente  ao  objeto  deste  CONTRATO,  ao  fim  de \ncada  execução  de  teste  de  invasão  demandado  por  meio  de  Ordem  de  Serviço,  por \nmeio  de  crédito  em  conta  bancária,  em  até  10  (dez)  dias  úteis  a  contar  da  data  de \napresentação do documento fiscal ou equivalente legal (como nota fiscal, fatura, boleto \nbancário com código de barras, recibo de pagamento a autônomo), desde que tenha \nsido  efetuado  ateste  pelo  Gestor  do  Contrato  das  obrigações  contratuais  assumidas \npela  CONTRATADA,  observado  o  disposto  no  Anexo  I  (Especificações  Técnicas) \ndeste Instrumento. \n\n4.1 Em se tratando de contratação de serviço, o documento fiscal ou equivalente legal \ndeverá  ser  apresentado  ao  BNDES  no  mês  de  sua  emissão  e  até  o  dia  25  (vinte  e \ncinco) do mesmo – ou data anterior que viabilize o tempestivo recolhimento de ISS, se \na legislação tributária municipal incidente assim exigir – possibilitando o cumprimento, \npelo  BNDES,  das  obrigações  fiscais  principais  e  acessórias  decorrentes  desse \nCONTRATO.  Havendo  impedimento  legal  para  o  cumprimento  desse  prazo,  o \ndocumento fiscal ou equivalente legal deverá ser apresentado até o primeiro dia útil do \nmês seguinte, mediante prévia autorização do BNDES. \n\n4.2.  Para  toda  efetivação  de  pagamento,  a  CONTRATADA  deverá  encaminhar  o \ndocumento  fiscal  ou  equivalente  em  meio  digital  para  caixa  postal  eletrônica  ou \nprotocolar  em  sistema  eletrônico  próprio  do  BNDES,  considerando  as  orientações  do \nContratante  vigentes  na  ocasião  do  pagamento.  No  caso  de  emissão  de  documento \nfiscal  exclusivamente  em meio físico  o  mesmo deverá ser  encaminhado  ao  protocolo \ndo BNDES para devido registro de recebimento.').
contract_clause(contrato_ocs_404_2024, clausula_quinta_equilibrio_economico_financeiro_contrato, 'CLÁUSULA QUINTA - EQUILÍBRIO ECONÔMICO-FINANCEIRO DO CONTRATO', 'O  BNDES  e  o  CONTRATADO  têm  direito  ao  equilíbrio  econômico-financeiro  do \nContrato,  em consonância  com  o  inciso  XXI,  do artigo  37,  da  Constituição  Federal,  a \nser realizado mediante reajuste de preços. \n\n2 \n\n \n \n \n \n \n \n \n \n \n \n \nClassificação: Documento Ostensivo (Lei nº 13.303/2016) \nUnidade Gestora: AIC/DEROP \n\nParágrafo Primeiro \nO  reajuste  de  preços,  na  forma  prevista  na  legislação,  poderá  ser  requerido  pelo \nCONTRATADO a cada período de 12 (doze) meses, sendo o primeiro contado do dia \n08/11/2024,  data  de  apresentação  da  proposta  (Anexo  II  deste  Contrato),  e  os \nseguintes, do fato gerador anterior, adotando-se para tanto a aplicação da variação do \nÍndice  de  Custo  da  Tecnologia  da  Informação  -  ICTI,  divulgado  pelo  Instituto  de \nPesquisa  Econômica  Aplicada  –  IPEA,  ou  outro  índice  que  vier  a  substituí-lo, \nacumulada  durante  o  respectivo  período  de  apuração,  sobre  o  preço  referido  na \nCláusula de Preço deste Instrumento. \n\nParágrafo Segundo \nO CONTRATADO deverá solicitar o reajuste até o encerramento do Contrato, hipótese \nem  que  os  efeitos  financeiros  serão  concedidos  de  modo  retroativo  a  partir  do  fato \ngerador, observando-se, ainda, que: \nI.  caso  o  fato  gerador  do  reajuste  ou  a  divulgação  do  índice  de  reajuste  ocorra  com \nantecedência  inferior  a  60  (sessenta)  dias  do  encerramento  do  Contrato,  o \nCONTRATADO  terá  o  prazo  de  60  (sessenta)  dias,  a  contar  do  fato  gerador  ou  da \ndata de divulgação do índice, para solicitar o reajuste de preços; \nII. caso a divulgação do índice de reajuste ocorra após o encerramento do Contrato, o \nCONTRATADO  terá  o  prazo  de  60  (sessenta)  dias,  a  contar  do  fato  gerador  ou  da \ndata de divulgação do índice, para solicitar o reajuste de preços; \nIII.  o  BNDES  deverá  analisar  o  pedido  de  reajuste  de  preços  em  até  60  (sessenta) \ndias, contados da solicitação e da entrega pelo CONTRATADO dos comprovantes de \nvariação  dos  custos,  ficando  este  prazo  suspenso,  a  critério  do  BNDES,  enquanto  o \nCONTRATADO  não  apresentar  a  documentação  solicitada  para  a  comprovação  da \nvariação de custos; e \nIV. caso o CONTRATADO não solicite o reajuste nos prazos fixados acima, não fará \njus  aos  efeitos  retroativos  ou,  caso  o  Contrato  esteja  encerrado,  operar-se-á  a \nrenúncia a eventual direito ao reajuste.').
contract_clause(contrato_ocs_404_2024, clausula_sexta_penalidades, 'CLÁUSULA SEXTA - PENALIDADES', 'Em  caso  de  atraso  injustificado  no  fornecimento  ou  de  inexecução  total  ou  parcial,  a \nCONTRATADA ficará  sujeita  às  seguintes  penalidades,  garantida a  prévia  defesa  no \nprazo  de  10  (dez)  dias  úteis  contados  da  notificação  do  BNDES,  sem  prejuízo  da \naplicação do disposto nos artigos 82, 83 e 84 da Lei 13.303/2016: \n\nI. \nII. \n\nIII. \n\nIV. \n\nV. \n\nadvertência; \nmulta  de  até  10%  (dez por  cento),  apurada  de acordo  com  a  gravidade  da \ninfração, incidente sobre o valor global do contrato; \nmulta  de  até  10%  (dez  por  cento)  sobre  o  preço  previsto,  por  qualquer \ndescumprimento das demais obrigações previstas neste instrumento; \nsuspensão  temporária  de  participação  em  licitação  e  impedimento  de \ncontratar com o BNDES, por prazo não superior a 2 (dois) anos, apurado de \nacordo com a gravidade da infração; e \no total das multas aplicadas não poderá exceder o montante de 30% (trinta \npor cento) do valor global do Contrato durante a vigência contratual. \n\n3 \n\n \n \n \n \n \n \n \nClassificação: Documento Ostensivo (Lei nº 13.303/2016) \nUnidade Gestora: AIC/DEROP \n\n6.1.  As  penalidades  serão  aplicadas  observadas  as  normas  do  Regulamento  de \nLicitações e Contratos do SISTEMA BNDES. \n\n6.2. Contra a decisão de aplicação de penalidade, o CONTRATADO poderá interpor o \npedido de reconsideração para a decisão de advertência e o recurso cabível para as \ndemais  penalidades,  na  forma  e  no  prazo  previstos  no  Regulamento  de  Licitações  e \nContratos do SISTEMA BNDES. \n\n6.3. A imposição de penalidade prevista nesta Cláusula não impede a extinção deste \nCONTRATO pelo BNDES, nos termos da legislação aplicável e deste CONTRATO. \n\n6.4.  A  multa  prevista  nesta  Cláusula  poderá  ser  aplicada  juntamente  com  as  demais \npenalidades. \n\n6.5.  A  multa  aplicada  à  CONTRATADA  e  os  prejuízos  causados  ao  BNDES  serão \ndeduzidos de quaisquer créditos a ele devidos, ressalvada a possibilidade de cobrança \njudicial da diferença eventualmente não coberta pelos mencionados créditos. \n\n6.6. No caso de uso indevido de informações sigilosas, observar-se-ão, no que couber, \nos termos da Lei nº 12.527/2011 e do Decreto nº 7.724/2012. \n\n6.7.  No  caso  de  atos  lesivos  à  Administração  Pública,  nacional  ou  estrangeira, \nobservar-se-ão os termos da Lei nº 12.846/2013. \n\n6.8.  A  sanção  prevista  no  inciso  III  desta  Cláusula  também  poderá  ser  aplicada  às \nsociedades ou profissionais que: \n\nI.  tenham  sofrido  condenação  definitiva  por  praticarem,  por  meios  dolosos,  fraude \nfiscal no recolhimento de quaisquer tributos; \n\nII. tenham praticado atos ilícitos visando frustrar os objetivos da licitação; \n\nIII.  demonstrem  não  possuir  idoneidade  para  contratar  com  o  BNDES  em  virtude  de \natos ilícitos praticados.').
contract_clause(contrato_ocs_404_2024, clausula_setima_extincao, 'CLÁUSULA SÉTIMA - EXTINÇÃO', 'O presente CONTRATO poderá ser extinto de acordo com as hipóteses previstas na \nlegislação, convencionando-se, ainda, que é cabível a sua resolução: \n\nI. \nII. \nIII. \n\nIV. \nV. \n\nVI. \n\nVII. \n\nVIII. \n\nIX. \nX. \n\nXI. \n\nem  razão  do  inadimplemento  total  ou  parcial  de  qualquer  de  suas \nobrigações,  cabendo  à  parte \ninocente  notificar  a  outra  por  escrito, \nassinalando-lhe prazo razoável para o cumprimento das obrigações, quando \no mesmo não for previamente fixado neste instrumento ou em seus anexos; \nna  ausência  de  liberação,  por  parte  do  BNDES,  de  área,  local  ou  objeto \nnecessário para a sua execução, nos prazos contratuais; \nem  virtude  da  suspensão  da  execução  do  CONTRATO,  por  ordem  escrita \ndo  BNDES,  por  prazo  superior  a  120  (cento  e  vinte)  dias  ou  ainda  por \nrepetidas suspensões que totalizem o mesmo prazo; \nquando for decretada a falência da CONTRATADA; \ncaso  a  CONTRATADA  perca  uma  das  condições  de  habilitação  exigidas \nquando da contratação; \ncaso  a  CONTRATADA  seja  declarada  inidônea  pela  União,  por  Estado  ou \npelo Distrito Federal; \nem função da suspensão do direito de a CONTRATADA licitar ou contratar \ncom o BNDES; \nna  hipótese  de  caracterização  de  ato  lesivo  à  Administração  Pública,  nos \ntermos  da  Lei  nº  12.846/2013,  cometido  pela  CONTRATADA  no  processo \nde contratação ou por ocasião da execução contratual; \nem razão da dissolução da CONTRATADA; \nquando  da  ocorrência  de  caso  fortuito  ou  de  força  maior,  regularmente \ncomprovado, impeditivo da execução do CONTRATO; e \nem  decorrência  de  atraso,  lentidão  ou  paralisação  injustificáveis  da \ne
contract_clause(contrato_ocs_404_2024, clausula_oitava_obrigacoes_contratada, 'CLÁUSULA OITAVA - OBRIGAÇÕES DA CONTRATADA:
contract_clause(contrato_ocs_404_2024, clausula_nona_conduta_etica_contratada_bndes, 'CLÁUSULA NONA - CONDUTA ÉTICA DA CONTRATADA E DO BNDES: A CONTRATADA e o
contract_clause(contrato_ocs_404_2024, clausula_decima_gestao, 'CLÁUSULA DÉCIMA - GESTÃO: Fica designado Gestor o Sr. Mario Roberto Ginglass, atual Gerente da
contract_clause(contrato_ocs_404_2024, clausula_decima_primeira_foro, 'CLÁUSULA DÉCIMA PRIMEIRA - FORO: Cidade do Rio de Janeiro.', 'CLÁUSULA DÉCIMA PRIMEIRA - FORO: Cidade do Rio de Janeiro.').
contract_metadata_raw(contrato_ocs_404_2024, unidade_gestora, 'AIC/DEROP', 'rodape').
contract_clause(contrato_ocs_404_2024, clausula_decima_segunda_disposições_finais, 'CLÁUSULA DÉCIMA SEGUNDA - DISPOSIÇÕES FINAIS', 'O presente CONTRATO é emitido em conformidade com \no  art.  68  da  Lei  nº  13.303/2016,  estando  sujeito  às  disposições  desse  diploma  legal. \nIntegram  o  presente  CONTRATO  as  Especificações  Técnicas  e  a  Proposta \nII  a  este \napresentada  pela  CONTRATADA,  respectivamente,  ANEXOS \ninstrumento. \n\n8 \n\n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \nClassificação: Documento Ostensivo (Lei nº 13.303/2016) \nUnidade Gestora: AIC/DEROP \n\n12.1.  A  omissão  ou  tolerância  quanto  às  obrigações  contratuais  ou  ao  exercício  de \nprerrogativa  do  CONTRATO  não  constituirá  renúncia  ou  novação,  nem  impedirá  a \nparte de exercer seu direito a qualquer tempo. \n\n12.2. Reputa-se celebrado o presente contrato na data em que for registrada a última \nassinatura dos representantes do BNDES.').
contract_clause(contrato_ocs_404_2024, anexo_i_especificações_técnicas, 'ANEXO I – ESPECIFICAÇÕES TÉCNICAS', '10 \n\n \n \n \n \n \n \n \n \n \n \n \n \n \n \nClassificação: Documento Ostensivo (Lei nº 13.303/2016) \nUnidade Gestora: AIC/DEROP \n\nANEXO I – ESPECIFICAÇÕES TÉCNICAS DO SERVIÇO DE TESTE DE \nINVASÃO (PENTEST) \n\n1.  OBJETO \n\n1.1.  Contratação  de  empresa  para  prestação  do  serviço  de  teste  de  invasão  externo \nidentificar \n(pentest),  sob  demanda,  do \nvulnerabilidades na infraestrutura e em sistemas de Tecnologia da Informação (TI) das \nempresas do Sistema BNDES expostos à Internet, bem como propor correções para \nmitigar  os  riscos  associados  à  exploração  das  vulnerabilidades  identificadas,  nos \ntermos destas especificações técnicas. \n\ntipo  caixa  preta \n\n(blackbox),  para \n\n1.2.  O  objeto  será  contratado  pelo  prazo  de  vigência  de  36  (trinta  e  seis)  meses \nconsecutivos,  a  contar  da  assinatura  do  instrumento  contratual,  durante  os  quais \npoderão ser demandados até 6 (seis) testes de invasão, ou seja, em média um teste a \n\ncada 6 (seis) meses. \n\n1.3.  É vedada a subcontratação dos serviços objeto desta contratação.').
contract_clause(contrato_ocs_404_2024, esopo, '2.  ESCOPO', '2.1.  Cada teste de invasão deve contemplar a análise de toda e qualquer infraestrutura de \nTI exposta à Internet através das faixas de endereço IP alocadas para uso do BNDES \na fim de identificar vulnerabilidades. \n\n2.1.1. As  faixas  de  endereço  IP  alocados  para  uso  do  BNDES  serão  oportuna  e \n\ntempestivamente  comunicadas  à  CONTRATADA  no  decorrer  da  execução \n\ncontratual. \n\n2.1.1.1. O  BNDES  comunicará  à  CONTRATADA  eventuais  alterações  na \n\nalocação das suas faixas de endereços IP. \n\n2.2.  Cada  teste  de  invasão  deve  contemplar  a  análise  de  até  5  (cinco)  sistemas \n\ncorporativos do BNDES expostos à Internet por meio dos protocolos HTTP e HTTPS. \n\n2.2.1. Os sistemas serão escolhidos, a critério do BNDES, a cada teste de invasão e \nos  seus  respectivos  endereços  (Uniform  Resource  Locators  -  URLs)  serão \noportuna e tempestivamente comunicados à CONTRATADA.').
contract_clause(contrato_ocs_404_2024, condições_execução, '3.  CONDIÇÕES DE EXECUÇÃO', '3.1.  O serviço deverá ser prestado mediante abertura de Ordem de Serviço pelo BNDES. \nNeste  momento  a  CONTRATADA  deverá  mobilizar  suas  equipes  pré-definidas  e \nrecursos  necessários,  tais  como  softwares  especializados,  para  a  prestação  do \nserviço de acordo com os prazos definidos nestas especificações. \n\n3.2.  Os testes  de  invasão  devem  ser realizados  em  regime  de  caixa-preta (blackbox),  ou \nseja, devem ser realizados por equipes da CONTRATADA sem conhecimento prévio \nda infraestrutura e dos sistemas de TI do BNDES. \n\n3.3.  O  BNDES  não  fornecerá,  à  CONTRATADA,  informações  adicionais  além  daquelas \nconstantes  no  escopo  referido  no  item  2  destas  especificações  técnicas,  tampouco \nfornecerá  credenciais  de  acesso  a  qualquer  um  dos  sistemas  listados  ou  mesmo \ndesabilitará  qualquer  um  dos  controles  vigentes  em  seu  ambiente  de  TI  durante  a \nrealização do teste de invasão. \n\n3.3.1. Excepcionalmente,  se  for  do  interesse  do  BNDES  e  da  CONTRATADA,  o \n\nBNDES  poderá  considerar  o  fornecimento,  para  a  CONTRATADA,  de \ninformações  adicionais  ou  credenciais  de  acesso  a  sistemas,  bem  como  a \ndesativação  interina  e  pontual  de  controles  vigentes,  a  fim  de  confirmar  a \n\nexistência ou o potencial de exploração de vulnerabilidades, como também de \nampliar seletivamente a superfície de ataque. \n\n3.4.  A CONTRATADA deve fornecer às equipes responsáveis pela execução dos testes de \ninvasão  toda  a  infraestrutura  necessária  à  realização  dos  testes,  incluindo  qualquer \nsoftware especializado que por ventura venha a ser utilizado. A CONTRATADA deve \nmanter  sempre  atualizadas  as  licenças  dos  softwares  utilizados  para  a  execução  do \nobjeto deste contrato. \n\n3.5.  Antes  do  início  efetivo  da  realização  das  ações  ofensivas  associadas  aos  testes  de \n\ninvasão, a CONTRATADA deve informar ao BNDES as faixas de endereço IP a partir \ndas quais realizará essas ações. \n\n3.5.1. Se,  por  ventura,  no  decorrer  da  realização  dos  testes  de  invasão,  houver \nqualquer  mudança  nas  faixas  de  endereço  IP  utilizadas,  a  CONTRATADA \n\ndeverá prontamente informar ao BNDES as novas faixas de endereço IP. \n\n3.6.  Antes  do  início  efetivo  da  realização  das  ações  ofensivas  associadas  aos  testes  de \ninvasão, a CONTRATADA deve informar ao BNDES uma lista hierárquica de contatos \n(escalation  list),  incluindo  pelo  menos  nome,  telefone  (preferencialmente  celular)  e \nendereço  de  correio  eletrônico,  que  podem  ser  acionados  caso  haja  suspeita  de \nimpactos  ao  ambiente  de  TI  do  BNDES  em  decorrência  da  execução  dos  testes  ou \ncaso').
contract_clause(contrato_ocs_404_2024, contatos, 'seja  necessário  apurar  se  eventos  potencialmente  relevantes  observados  pelas \nequipes do BNDES têm (ou não) relação com os testes de invasão. \n\n3.6.1. \n\n3.7.  A  cada  teste  de  invasão,  a  CONTRATADA  deve  realizar  o  planejamento  das  ações \n\nnecessárias  à  execução  do  teste  de  invasão,  incluindo  a  definição  da  metodologia  e \ndas  ferramentas  que  serão  utilizadas,  bem  como  o  reconhecimento  inicial,  mediante \ncoleta  de \ninformações  publicamente  disponíveis  e  potencialmente  úteis  para \ndirecionar as ações ofensivas realizadas como parte do teste. \n\n3.8.  Após  o  planejamento  e  o  reconhecimento  inicial,  a  CONTRATADA  deve  realizar  a \n\ndescoberta  dos  serviços  de  infraestrutura  e  da  estrutura  dos  sistemas  expostos, \nmediante varreduras automáticas ou manuais, mapeando a superfície de ataque e as \nvulnerabilidades com potencial de exploração. \n\n3.9.  Após  a  descoberta,  a  CONTRATADA  deve  verificar  se  as  vulnerabilidades \nidentificadas  podem  efetivamente  ser  exploradas,  bem  como  quais  seriam  as \nconsequências potenciais da exploração. \n\n3.10. Por fim, após a exploração, a CONTRATADA deve preparar uma apresentação, a ser \nministrada para o BNDES em reunião a ser realizada após a conclusão do respectivo \nteste de invasão.').
contract_clause(contrato_ocs_404_2024, apresentacao, 'bem como um relatório descritivo com os resultados do teste. \n\n3.10.1.A  apresentação  deve  conter  uma  visão  geral  da  execução  do  teste  (escopo, \n\nmetodologia, ferramentas) e destacar quaisquer resultados considerados mais \nrelevantes pela CONTRATADA. \n\n3.10.2. O relatório deve conter, minimamente, as informações listadas a seguir. \n\n3.10.2.1. Descrição  de  quando  e  como  o  teste  foi  executado  (datas  do  teste,  o \n\nque foi testado e como foi testado). \n\n3.10.2.2. \n\nincluindo \nvulnerabilidades \nevidências  que  comprovem  a  sua existência  ou instruções sobre  como a \n\nsua existência pode ser comprovada pelas equipes do BNDES. \n\n3.10.2.3. \n\nPara  cada  vulnerabilidade,  quando  houver,  referências  para \ncatálogos  públicos  de  vulnerabilidades  (como,  por  exemplo,  o  Common \nVulnerabilities and Exposures – CVE) e classificação da severidade (como \ndefinido,  por  exemplo,  pelo  Common  Vulnerability  Scoring  System  – \nCVSS). \n\n3.10.2.4. \n\nPara cada vulnerabilidade, propostas de correção para mitigar o \n\nrisco da exploração. \n\n3.10.2.5. \n\nSe  houver,  propostas  de  aprimoramentos  de  controles  que \n\nporventura possam reduzir a exposição da infraestrutura ou dos sistemas \nde TI do').
contract_clause(contrato_ocs_404_2024, seguranca, 'BNDES, bem como fortalecer os controles de Segurança da Informação \nadotados pelo BNDES. \n\n3.10.3. Tanto  a  apresentação,  quanto  o  relatório,  devem  ser  entregues,  pela \n\nCONTRATADA, para o BNDES, em formato digital. \n\n3.11. A CONTRATADA deve informar ao BNDES imediatamente caso, durante a execução \ndos testes de invasão, identifique vulnerabilidade crítica, ou seja, vulnerabilidade cuja \n\nprobabilidade  de  exploração  seja  muito  alta  ou,  principalmente,  vulnerabilidade  cujo \n\nimpacto resultante da exploração seja muito alto. \n\n3.12. Durante  a  execução  dos  testes  de  invasão,  a  CONTRATADA  não  deve  realizar, \n\ndeliberadamente,  nenhuma  ação  que  possa  resultar  no  comprometimento  da \ndisponibilidade  da  infraestrutura  ou  dos  sistemas  de  TI  do  BNDES,  tampouco  no \ncomprometimento  da  disponibilidade  e  da  integridade  de  informações  às  quais \nporventura venham a ter acesso. \n\n3.12.1. É  terminantemente  vedado  à  CONTRATADA realizar  ataques  de  negação  de \n\nserviço de qualquer natureza à infraestrutura e aos sistemas de TI do BNDES. \n\n3.12.2. É  terminantemente  vedado  à  CONTRATADA  remover  ou  alterar  informações \n\narmazenadas na infraestrutura e nos sistemas de TI do BNDES. \n\n3.12.3. A  CONTRATADA  deve  informar  o  BNDES  imediatamente  caso  observem  ou \n\nsuspeitem  que  alguma  das  ações,  executadas  como  parte  dos  testes  de \nà \ninvasão,
contract_clause(contrato_ocs_404_2024, ataques, '3.13. Ataques  de  engenharia  social  no  âmbito  dos  testes  de  invasão  são  facultativos  e \npodem  ser  realizados  pela  CONTRATADA  desde  que  não  impliquem  em  nenhum \nônus adicional para o BNDES e tenham caráter complementar às ações que integram \nas fases comuns dos testes (planejamento, reconhecimento, descoberta e exploração) \ne sejam do interesse do BNDES e da CONTRATADA. \n\n3.13.1.O  envio  de  mensagens  de  phishing  de  correio  eletrônico,  direcionadas  aos \ncolaboradores (empregados, estagiários e terceiros) do BNDES, a fim de tentar \nobter acessos indevidos ou informações de conhecimento restrito que possam \napoiar ações ofensivas é considerado um ataque de engenharia social. \n\n3.13.2.A realização de qualquer ataque de engenharia social deve ser proposta para o \n\nBNDES,  pela  CONTRATADA,  como  parte  do  planejamento  dos  testes  de \n\ninvasão. \n\n3.13.3.A realização de qualquer ataque de engenharia social somente poderá ocorrer \n\nquando houver anuência prévia e explícita do BNDES, bem como quando o').
contract_clause(contrato_ocs_404_2024, informacoes, 'BNDES  dispuser  de  todas  as  informações  necessárias  (a  serem  fornecidas \npela  CONTRATADA)  à  identificação  do  ataque  e,  se  necessário,  à  execução \ndas ações de tratamento.').
contract_clause(contrato_ocs_404_2024, prazos_execução, '4.  PRAZOS DE EXECUÇÃO', '4.1.  Os testes de invasão serão realizados exclusivamente sob demanda do BNDES. \n\n4.2.  A  CONTRATADA  terá  até  20  (vinte)  dias  corridos,  após  ser  demanda  pelo  BNDES, \n\npara apresentar o planejamento do teste de invasão para o BNDES. \n\n4.2.1. Ao  demandar  à  CONTRATADA,  o  BNDES  informará  tanto  as  faixas  de \nendereço  IP  alocadas  para  uso  do  BNDES,  quanto  os  endereços  (Uniform \nResource Locators - URLs) dos sistemas corporativos a serem avaliados. \n\n4.3.  O BNDES, por sua vez, terá até 5 (cinco) dias corridos para avaliar o planejamento do \nteste de invasão apresentado pela CONTRATADA e, se necessário, propor ajustes. \n\n4.4.  Na  sequência,  a  CONTRATADA  terá  até  5 (cinco) dias  corridos  para  deliberar  sobre \nos ajustes propostos pelo BNDES e, se for o caso, incorporá-los ao planejamento do \nteste de invasão. \n\n4.5.  Em  seguida,  a  CONTRATADA  terá  até  60  (sessenta)  dias  corridos  para  realizar  o \n\nteste  de  invasão  (reconhecimento,  descoberta  e  exploração),  agendar  e  realizar  a \nreunião  na  qual  apresentará  os  resultados  do  teste,  bem  como  entregar  a \napresentação (ministrada na reunião) e o relatório com os resultados do teste. \n\n4.6.  Após  a  conclusão  do  teste  de  invasão,  o  que  inclui  a  realização  da  reunião  para \napresentação  dos  resultados  do  teste,  bem  como  a  entrega  da  apresentação \n\n(ministrada na reunião) e do relatório com os resultados do teste, o BNDES terá até 5 \n(cinco) dias corridos para revisar o relatório e, se for o caso, solicitar eventuais ajustes \nà CONTRATADA.').
contract_clause(contrato_ocs_404_2024, retificacao, '4.7.  Por fim, a CONTRATADA terá até 5 (cinco) dias corridos para providenciar os ajustes \nsolicitados pelo BNDES, quando houver, e entregar uma versão retificada do relatório. \n\n4.8.  Após  a  revisão  do  relatório,  bem  como,  quando  houver,  a  eventual  incorporação  de \najustes pela CONTRATADA, o Gestor do contrato atestará o aceite do serviço, o que \npermitirá o subsequente faturamento pela CONTRATADA. \n\n4.9.  Os  prazos  previstos  neste  item  poderão  ser  prorrogados  pelo  gestor  do  contrato,  no \ninteresse do BNDES.').
contract_clause(contrato_ocs_404_2024, dados_pessoais, '5.  DADOS PESSOAIS', '5.1.  Não  há  a  previsão  do  compartilhamento  com  a  CONTRATADA  de  quaisquer  dados \npessoais armazenados pelo BNDES. \n\n5.2.  Invariavelmente,  se  porventura  a  CONTRATADA  inadvertidamente  obtiverem  acesso \n\na  dados  pessoais  durante  a  realização  dos  testes  de  invasão,  deverá  observar  o \ndisposto na Lei Geral de Proteção de Dados Pessoais (LGPD) - Lei nº 13.709, de 14 \nde agosto de 2018.').
contract_clause(contrato_ocs_404_2024, vigência, '6.  VIGÊNCIA', '6.1.  A  vigência  será  de  36  (trinta  e  seis)  meses  consecutivos,  a  contar  da  assinatura  do \ninstrumento contratual, durante os quais poderão ser demandados até 6 (seis) testes \nde invasão.').
contract_clause(contrato_ocs_404_2024, local_prestacao_serviço, '7.  LOCAL DA PRESTAÇÃO DE SERVIÇO', '7.1.  A prestação de serviço deve ser realizada de forma remota, a partir das dependências \nda CONTRATADA.').
contract_clause(contrato_ocs_404_2024, habilitação_técnica, '8.  HABILITAÇÃO TÉCNICA', '8.1.  Por  se  tratar  de  serviço  técnico  altamente  especializado,  deve  ser  apresentado \natestado  de  capacidade  técnica  ou  outro  documento  idôneo  expedido  por  pessoas \njurídicas de direito público ou privado, que comprove a execução de objeto de mesma \nnatureza ou similar ao presente. \n\n8.2.  A  comprovação  da  execução  de  objeto  de  mesma  natureza  ou  similar  ao  presente \ndeve  ser  realizada  mediante  apresentação  de  pelo  menos  1  (um)  atestado  de \ncapacidade  técnica  ou  outro  documento  idôneo  que  comprove  a  realização  de,  no \nmínimo, 1 (um) teste de invasão feito para Instituição Financeira que atue no Brasil;').
contract_clause(contrato_ocs_404_2024, definicao, '8.2.1.  A definição de Instituição Financeira considerada neste Termo de Referência é \na  constante  no  Art.  17  da  Lei  nº  4.595,  de  31  de  dezembro  de  1964.  As \nreferidas  instituições  devem  ser  autorizadas,  reguladas  ou  supervisionadas \npelo  Banco  Central,  sendo  que  a  relação  das  mesmas  está  disponível  para \neletrônicos: \nendereços \nconsulta nos seguintes \nhttps://www.bcb.gov.br/estabilidadefinanceira/relacao_instituicoes_funcio \nn amento ou https://www.bcb.gov.br/estabilidadefinanceira/encontreinstituicao. \n\n8.2.2. O(s)  documento(s)  de  atestação  apresentado(s) para fins  de comprovação  da \n\ncapacidade  técnica  deverá(ão)  descrever  o  objeto  atestado,  contendo  dados \nque permitam a aferição de sua similaridade com o presente objeto. \n\n8.3.  A  fim  de  permitir  a  identificação  da  pessoa  jurídica  atestante,  deverão  constar  nos \n\ndocumentos de atestação de capacidade técnica ou ser apresentados juntamente com \nestas informações tais como:').
contract_clause(contrato_ocs_404_2024, informações, '8.3.1. CNPJ (se a empresa for brasileira), nome comercial, endereço e telefone da(s) \n\nsociedade(s) atestante(s). \n\n8.3.2. Nome,  cargo/função,  endereço,  telefone  e  e-mail  do(s)  representante(s)  da(s) \n\nsociedade(s) atestante(s) que vier(em) a assinar o(s) atestado(s), a fim de que \no BNDES possa contactá-lo(s), se entender necessário. \n\n8.3.3. O período de execução do serviço. \n\n8.4.  As \ninformações  mínimas  que  não  estejam  expressamente \nindicadas  no(s) \ndocumento(s)  apresentado(s)  pela  Licitante  deverão  ser  comprovadas  por  meio  de \ndocumentação complementar. \n\n8.5.  Não  restará  comprovada  a  qualificação  técnica  da  Licitante  se  o  objeto  ou  parcela \ndele  tiver  sido  executada  por  sociedade(s)  subcontratada(s)  ou  que  tenha  sido \nexecutado por entidade pertencente ao mesmo grupo econômico da Licitante. \n\n8.6.  Será  admitido  atestado  concedido  por  outra(s)  sociedade(s)  do  mesmo  grupo \neconômico da licitante, em que esta conste como executora dos serviços.').
contract_clause(contrato_ocs_404_2024, perfil_mínimo, '9.  PERFIL MÍNIMO DOS PROFISSIONAIS DA CONTRATADA', '9.1.  A  CONTRATADA  deve  dispor  de  pelo  menos  um  profissional,  atuante  nos  testes  de \ninvasão do BNDES, que tenha experiência prévia na realização de ao menos 1 (um) \nteste  de  invasão  (pentest)  em  sistemas  e  que  possua  pelo  menos  uma  das \ncertificações de Segurança da Informação voltadas à realização de testes de invasão \nlistadas a seguir: \n\n9.1.1. Offensive Security Experienced Penetration Tester (OSEP) \n\n9.1.2. Offensive Security Certified Professional (OSCP) \n\n9.1.3. Offensive Security Web Expert (OSWE) \n\n9.1.4. Offensive Security Web Assessor (OSWA) \n\n9.1.5. Offensive Security Certified Expert 3 (OSCE3) \n\n9.1.6. EC-Council - Certified Penetration Tester (CPENT) \n\n9.1.7. EC-Council - Certified Ethical Hacker (CEH) \n\n9.1.8. CompTIA PenTest+ \n\n9.1.9. SANS - GIAC Penetration Tester (GPEN) \n\n9.1.10. \n\n- GIAC Web Application Penetration Tester (GWAPT) \n\n9.1.11. \n\n- GIAC Exploit Researcher and Advanced Penetration Tester (GXPN) \n\n9.2.  A  CONTRATADA  deverá  apresentar,  em  até  30  dias  corridos,  a  partir  da  assinatura \ndo  contrato,  o  comprovante  da  existência  de  vínculo  jurídico  entre  elas  e  os \nprofissionais  indicados  para  atender  ao  disposto  no  item  9.1,  a  comprovação  da \nexperiência do profissional e as certificações dos profissionais que atuarão nos testes \nde invasão do BNDES.').
contract_clause(contrato_ocs_404_2024, comprovantes, '9.2.1.  A comprovação de vínculo jurídico se dará mediante a apresentação de cópia \ndo  contrato  de  prestação  de  serviços,  cópia  da  carteira  de  trabalho  e \nprevidência social (CTPS) ou cópia do ato constitutivo da sociedade, conforme \no caso, ou qualquer outro documento idôneo. \n\n9.2.2. Em \nrelação  à  certificação,  conforme \nindicadas  acima,  deverão  ser \napresentados  o(s)  certificado(s)  ou  informações  suficientes  à  sua  validação \neletrônica. \n\n9.3.  O  BNDES  poderá  solicitar,  de  forma  fundamentada  e  por  escrito,  ao  preposto,  a \nsubstituição  de  profissionais  da  CONTRATADA  que  não  estejam  executando  os \nserviços de forma satisfatória, que estejam obstruindo a realização dos contratos, que \napresentem  conduta  inadequada,  ou  que  estejam  atentando  contra  o  patrimônio \ninstitucional ou material do BNDES. A eventual substituição do profissional alocado na \nexecução do serviço deverá observar o disposto a seguir:').
contract_clause(contrato_ocs_404_2024, substituição, '9.3.1. a substituição deverá ser realizada em até 5 (cinco) dias corridos; \n\n9.3.2. o substituto deverá possuir perfil igual ou superior ao do profissional substituído \nou,  em  caso  de  substituição  do  profissional  de  que  trata  o  item  9.1,  deverá \natender as exigências estabelecidas no referido item; \n\n9.3.3. a substituição somente poderá ser realizada após a aprovação pelo BNDES; e \n\n9.3.4. aprovada  a  substituição,  a  Contratada  deverá  apresentar  o  comprovante  do \n\nvínculo  jurídico  existente  entre  ela  e  o  substituto,  bem  como  o  Termo  de \nConfidencialidade assinado pelo referido profissional, nos termos deste Termo \nde Referência.').
contract_clause(contrato_ocs

% ===== END =====
