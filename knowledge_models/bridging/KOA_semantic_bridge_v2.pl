% ===== KOA Semantic Ground (executable SWI-Prolog grounding; contract-independent) =====
% generated_at_utc: 2026-02-25T21:04:10Z
% requirements_file: KOA_semantic_requirements_normalized.pl
% contracts_dir: /content/drive/MyDrive/KOA/onboarding/contratos_COM_UFO
% schema: satisfaction_threshold/1, criterion/1, req_criterion/2, criterion_target/2, criterion_concept/2, question_operationalizes_criterion/2,
%         assessment_dimension/1, dimension_criterion/2, dimension_level/2, level_description/3,
%         level_rule/3, criterion_signature/2, sig_requires/2,
%         kb_*_alias/*, criterion_requires_*/*
% ===========================================================================

satisfaction_threshold(0.70).

% ---- CRITERIA MODEL (from requirements) ----
% METADATA + THRESHOLDS

% SEMANTIC REQUIREMENTS (ORIGINAL CONTENT)
concept(c_7fbcda231b).
concept_label(c_7fbcda231b, "risco operacional").
concept_definition(c_7fbcda231b, "possibilidade de perdas decorrentes de falhas, inadequações ou eventos externos que afetem processos, pessoas, sistemas ou controles internos").
evidence(c_7fbcda231b, "risco operacional é um conceito mais amplo que se refere à possibilidade de perdas decorrentes de falhas, inadequações ou eventos externos que afetem processos, pessoas, sistemas ou controles internos", "chunk:0").

concept(c_5926e8e1c1).
concept_label(c_5926e8e1c1, "Risco à Segurança da Informação").
concept_definition(c_5926e8e1c1, "potencial de violação da integridade, confidencialidade, disponibilidade ou autenticidade da informação de propriedade ou custodiada pelo Sistema BNDES em decorrência da exploração de uma ou mais vulnerabilidades de um ativo de informação ou de um conjunto de tais ativos, por parte de uma ou mais ameaças, com impacto negativo às Empresas do Sistema BNDES.").
evidence(c_5926e8e1c1, "Definição de Risco à Segurança da Informação: potencial de violação da integridade, confidencialidade, disponibilidade ou autenticidade da informação de propriedade ou custodiada pelo Sistema BNDES em decorrência da exploração de uma ou mais vulnerabilidades de um ativo de informação ou de um conjunto de tais ativos, por parte de uma ou mais ameaças, com impacto negativo às Empresas do Sistema BNDES", "chunk:0").

concept(c_02307388c6).
concept_label(c_02307388c6, "risco cibernético").
concept_definition(c_02307388c6, "risco à segurança da informação que envolve ativo de tecnologia da informação").
evidence(c_02307388c6, "que é o risco à segurança da informação que envolve ativo de tecnologia da informação", "chunk:0").

concept(c_bc219a2f81).
concept_label(c_bc219a2f81, "informação sensível").
concept_definition(c_bc219a2f81, "informações classificadas em grau de sigilo como “confidenciais”, dados pessoais sensíveis nos termos da LGPD, dados financeiros de clientes e de empregados, dados de projetos de clientes, estratégias de investimento, classificação de risco de clientes, informações que possam afetar a segurança do Sistema Financeiro Nacional e informações tratadas pelos sistemas principais.").
evidence(c_bc219a2f81, "Resumidamente, informação sensível para o BNDES são informações classificadas em grau de sigilo como “confidenciais”, dados pessoais sensíveis nos termos da LGPD, dados financeiros de clientes e de empregados, dados de projetos de clientes, estratégias de investimento, classificação de risco de clientes, informações que possam afetar a segurança do Sistema Financeiro Nacional e informações tratadas pelos sistemas principais.", "chunk:0").

concept(c_249d13362d).
concept_label(c_249d13362d, "CRITICIDADE BAIXA").
concept_definition(c_249d13362d, "Suporte sem acesso a ativos críticos").
evidence(c_249d13362d, "•	CRITICIDADE BAIXA – Suporte sem acesso a ativos críticos", "chunk:1").

concept(c_e6c1bf29ba).
concept_label(c_e6c1bf29ba, "CRITICIDADE MÉDIA").
concept_definition(c_e6c1bf29ba, "Acesso operacional limitado").
evidence(c_e6c1bf29ba, "•	CRITICIDADE MÉDIA – Acesso operacional limitado", "chunk:1").

concept(c_a6f0952f68).
concept_label(c_a6f0952f68, "CRITICIDADE ALTA").
concept_definition(c_a6f0952f68, "Acesso direto a dados sensíveis ou sistemas críticos").
evidence(c_a6f0952f68, "•	CRITICIDADE ALTA – Acesso direto a dados sensíveis ou sistemas críticos", "chunk:1").

concept(c_65f85ad950).
concept_label(c_65f85ad950, "CRITICIDADE CRÍTICA").
concept_definition(c_65f85ad950, "Herdeiro direto do risco cibernético institucional").
evidence(c_65f85ad950, "•	CRITICIDADE CRÍTICA – Herdeiro direto do risco cibernético institucional", "chunk:1").

category(t_a29b40ee79).
category_label(t_a29b40ee79, "Tipos de contratos de terceirização").
category_type(t_a29b40ee79, nominal).
category_level(t_a29b40ee79, contrato_mao_de_obra_dedicada, 1, "contratos que preveem a alocação de mão-de-obra dedicada ao BNDES que atuam em postos de trabalho definidos no contrato", "contratos que preveem a alocação de mão-de-obra dedicada ao BNDES que atuam em postos de trabalho definidos no contrato").
category_level(t_a29b40ee79, contrato_sem_postos_definidos, 2, "contratos de prestação de serviço que não especificam a quantidade de postos de trabalho, mas são prestados com a alocação de pessoas com acesso ao ambiente físico das instalações do BNDES ou com a alocação de pessoas com acesso remoto (por meio de  VPN ou de canais de comunicação de dados/links dedicados) a sistemas do BNDES", "contratos de prestação de serviço que não especificam a quantidade de postos de trabalho, mas são prestados com a alocação de pessoas com acesso ao ambiente físico das instalações do BNDES ou com a alocação de pessoas com acesso remoto (por meio de  VPN ou de canais de comunicação de dados/links dedicados) a sistemas do BNDES").
evidence(t_a29b40ee79, "contratos que preveem a alocação de mão-de-obra dedicada ao BNDES que atuam em postos de trabalho definidos no contrato", "chunk:0").
evidence(t_a29b40ee79, "contratos de prestação de serviço que não especificam a quantidade de postos de trabalho, mas são prestados com a alocação de pessoas com acesso ao ambiente físico das instalações do BNDES ou com a alocação de pessoas com acesso remoto (por meio de  VPN ou de canais de comunicação de dados/links dedicados) a sistemas do BNDES", "chunk:0").

category(t_70f221d3a6).
category_label(t_70f221d3a6, "Prestadores de serviço críticos para segurança da informação").
category_type(t_70f221d3a6, nominal).
category_level(t_70f221d3a6, cloud, 1, "Cloud (IaaS, PaaS, SaaS)", "Hospeda dados, sistemas e processos críticos; risco direto à soberania, continuidade e sigilo").
category_level(t_70f221d3a6, data_center, 2, "Data Center / Colocation", "Custódia física e lógica de ativos de TI").
category_level(t_70f221d3a6, draas_backup, 3, "DRaaS / Backup / Storage", "Última linha de defesa contra perda de dados e repositório de arquivos e de máquinas virtuais").
category_level(t_70f221d3a6, virtualizacao_containers, 4, "Virtualização e Containers", "Comprometimento afeta múltiplos sistemas").
category_level(t_70f221d3a6, plataformas_identidade, 5, "Plataformas de identidade (IAM, SSO)", "Controle de acesso institucional").
category_level(t_70f221d3a6, dns_email_ad, 6, "DNS, e-mail corporativo, AD como serviço", "Infraestrutura essencial de confiança").
category_level(t_70f221d3a6, fabricas_software, 7, "Fábricas de software / sustentação de sistemas", "Código vulnerável = porta de entrada").
category_level(t_70f221d3a6, noc_soc_mssp_csoc, 8, "NOC / SOC / MSSP / CSOC", "Visibilidade e resposta a incidentes").
category_level(t_70f221d3a6, gestao_servidores_redes, 9, "Gestão de servidores, redes, firewalls", "Poder de interrupção e sabotagem").
category_level(t_70f221d3a6, service_desk, 10, "Service desk com acesso remoto", "Alto risco de abuso de credenciais").
category_level(t_70f221d3a6, administracao_banco_dados, 11, "Administração de banco de dados", "Acesso a dados sensíveis").
category_level(t_70f221d3a6, pentest_red_team, 12, "Pentest / Red Team", "Conhecem suas vulnerabilidades").
category_level(t_70f221d3a6, gestao_vulnerabilidades, 13, "Gestão de vulnerabilidades", "Sabem “onde atacar”").
category_level(t_70f221d3a6, soc_terceirizado, 14, "SOC terceirizado", "Podem ocultar incidentes").
category_level(t_70f221d3a6, mssp, 15, "MSSP", "Operam controles críticos").
category_level(t_70f221d3a6, fornecedores_siem, 16, "Fornecedores de SIEM, EDR, XDR", "Controle da telemetria de segurança").
category_level(t_70f221d3a6, crm_sac, 17, "CRM / SAC / contact center", "Engenharia social").
category_level(t_70f221d3a6, bi_analytics, 18, "BI / Analytics", "Exfiltração silenciosa").
category_level(t_70f221d3a6, fornecedores_software_terceiros, 19, "Fornecedores de software de terceiros", "Backdoors, dependências").
category_level(t_70f221d3a6, sistemas_controles_apis, 20, "Sistemas de controles de APIs e integrações / gateway de API", "Portas abertas permanentes").
category_level(t_70f221d3a6, plataformas_low_code, 21, "Plataformas low-code/no-code", "Superfície invisível de ataque").
category_level(t_70f221d3a6, controle_acesso_fisico, 22, "Controle de acesso físico", "Porta para sabotagem").
category_level(t_70f221d3a6, cftv_iot_predial, 23, "CFTV / IoT predial", "Pivotagem para rede e exposição de dados pessoais").
category_level(t_70f221d3a6, automacao_predial, 24, "Automação predial, como elevadores e controles de água, energia e ar-condicionado", "Indisponibilidade sistêmica / sabotagem por acesso a áreas críticas").
category_level(t_70f221d3a6, provedores_servico_telecom, 25, "Provedores de serviço de telecomunicações e de acesso à RSFN", "Riscos de disponibilidade de serviços críticos e interceptação de dados telemáticos").
evidence(t_70f221d3a6, "Cloud (IaaS, PaaS, SaaS)", "chunk:0").
evidence(t_70f221d3a6, "Data Center / Colocation", "chunk:0").
evidence(t_70f221d3a6, "DRaaS / Backup / Storage", "chunk:0").
evidence(t_70f221d3a6, "Virtualização e Containers", "chunk:0").
evidence(t_70f221d3a6, "Plataformas de identidade (IAM, SSO)", "chunk:0").
evidence(t_70f221d3a6, "DNS, e-mail corporativo, AD como serviço", "chunk:0").
evidence(t_70f221d3a6, "Fábricas de software / sustentação de sistemas", "chunk:0").
evidence(t_70f221d3a6, "NOC / SOC / MSSP / CSOC", "chunk:0").
evidence(t_70f221d3a6, "Gestão de servidores, redes, firewalls", "chunk:0").
evidence(t_70f221d3a6, "Service desk com acesso remoto", "chunk:0").
evidence(t_70f221d3a6, "Administração de banco de dados", "chunk:0").
evidence(t_70f221d3a6, "Pentest / Red Team", "chunk:0").
evidence(t_70f221d3a6, "Gestão de vulnerabilidades", "chunk:0").
evidence(t_70f221d3a6, "SOC terceirizado", "chunk:0").
evidence(t_70f221d3a6, "MSSP", "chunk:0").
evidence(t_70f221d3a6, "Fornecedores de SIEM, EDR, XDR", "chunk:0").
evidence(t_70f221d3a6, "CRM / SAC / contact center", "chunk:0").
evidence(t_70f221d3a6, "BI / Analytics", "chunk:0").
evidence(t_70f221d3a6, "Fornecedores de software de terceiros", "chunk:0").
evidence(t_70f221d3a6, "Sistemas de controles de APIs e integrações / gateway de API", "chunk:0").
evidence(t_70f221d3a6, "Plataformas low-code/no-code", "chunk:0").
evidence(t_70f221d3a6, "Controle de acesso físico", "chunk:0").
evidence(t_70f221d3a6, "CFTV / IoT predial", "chunk:0").
evidence(t_70f221d3a6, "Automação predial, como elevadores e controles de água, energia e ar-condicionado", "chunk:0").
evidence(t_70f221d3a6, "Provedores de serviço de telecomunicações e de acesso à RSFN", "chunk:0").

category(t_ae4e61bcbf).
category_label(t_ae4e61bcbf, "Criticidade dos prestadores").
category_type(t_ae4e61bcbf, nominal).
category_level(t_ae4e61bcbf, criticidade_baixa, 1, "CRITICIDADE BAIXA", "Suporte sem acesso a ativos críticos").
category_level(t_ae4e61bcbf, criticidade_media, 2, "CRITICIDADE MÉDIA", "Acesso operacional limitado").
category_level(t_ae4e61bcbf, criticidade_alta, 3, "CRITICIDADE ALTA", "Acesso direto a dados sensíveis ou sistemas críticos").
category_level(t_ae4e61bcbf, criticidade_critica, 4, "CRITICIDADE CRÍTICA", "Herdeiro direto do risco cibernético institucional").
evidence(t_ae4e61bcbf, "A criticidade dos prestadores pode ser graduada da seguinte forma:", "chunk:1").

question_frame(qf_b322c14246).
frame_question(qf_b322c14246, "O prestador de serviço terá acesso a informações sensíveis (dados pessoais, informações sigilosas)?").
frame_intent(qf_b322c14246, "seguranca_informacao").
evidence(qf_b322c14246, "1.	O prestador de serviço terá acesso a informações sensíveis (dados pessoais, informações sigilosas)?", "chunk:1").

question_frame(qf_0d291cf85f).
frame_question(qf_0d291cf85f, "O serviço a ser prestado suporta algum processo crítico do Banco ou envolve acesso a sistemas principais de TI?").
frame_intent(qf_0d291cf85f, "seguranca_informacao").
evidence(qf_0d291cf85f, "2.	O serviço a ser prestado suporta algum processo crítico do Banco ou envolve acesso a sistemas principais de TI?", "chunk:1").

question_frame(qf_10981fbebf).
frame_question(qf_10981fbebf, "Haverá colaboradores/mão de obra alocada no BNDES com acesso a ativos de TI do Banco? Os ativos de TI acessados são classificados como críticos para segurança da informação?").
frame_intent(qf_10981fbebf, "seguranca_informacao").
evidence(qf_10981fbebf, "3.	Haverá colaboradores/mão de obra alocada no BNDES com acesso a ativos de TI do Banco? Os ativos de TI acessados são classificados como críticos para segurança da informação?", "chunk:1").

question_frame(qf_6f969bf116).
frame_question(qf_6f969bf116, "A contratação envolve acesso administrativo a recursos de TI do Banco?").
frame_intent(qf_6f969bf116, "seguranca_informacao").
evidence(qf_6f969bf116, "4.	A contratação envolve acesso administrativo a recursos de TI do Banco?", "chunk:1").

question_frame(qf_640c0560fb).
frame_question(qf_640c0560fb, "A contratação envolve o acesso físico de colaboradores a instalações do Banco? Há acesso a áreas com ativos críticos de TI (CPD, Shafts, salas de telecom)?").
frame_intent(qf_640c0560fb, "seguranca_informacao").
evidence(qf_640c0560fb, "5.	A contratação envolve o acesso físico de colaboradores a instalações do Banco? Há acesso a áreas com ativos críticos de TI (CPD, Shafts, salas de telecom)?", "chunk:1").

question_frame(qf_b737327789).
frame_question(qf_b737327789, "O prestador de serviço pretende subcontratar os serviços?").
frame_intent(qf_b737327789, "seguranca_informacao").
evidence(qf_b737327789, "6.	O prestador de serviço pretende subcontratar os serviços?", "chunk:1").

question_frame(qf_3c795d1d58).
frame_question(qf_3c795d1d58, "Haverá previsão contratual de direito de auditoria por parte do Banco?").
frame_intent(qf_3c795d1d58, "seguranca_informacao").
evidence(qf_3c795d1d58, "7.	Haverá previsão contratual de direito de auditoria por parte do Banco?", "chunk:1").

question_frame(qf_31bd1e67cc).
frame_question(qf_31bd1e67cc, "Há algum processo formalmente estabelecido para desativação do prestador de serviço e de garantia de exclusão segura de dados?").
frame_intent(qf_31bd1e67cc, "seguranca_informacao").
evidence(qf_31bd1e67cc, "8.	Há algum processo formalmente estabelecido para desativação do prestador de serviço e de garantia de exclusão segura de dados?", "chunk:1").

question_frame(qf_e9b8de5caf).
frame_question(qf_e9b8de5caf, "Haverá previsão de apólice de seguro de responsabilidade civil pelo prestador de serviço para mitigação de riscos para o Banco?").
frame_intent(qf_e9b8de5caf, "seguranca_informacao").
evidence(qf_e9b8de5caf, "9.	Haverá previsão de apólice de seguro de responsabilidade civil pelo prestador de serviço para mitigação de riscos para o Banco?", "chunk:1").

question_frame(qf_0a61ca294a).
frame_question(qf_0a61ca294a, "Haverá compartilhamento de dados pessoais da contratante com o prestador de serviço?").
frame_intent(qf_0a61ca294a, "lgpd").
evidence(qf_0a61ca294a, "1.	Haverá compartilhamento de dados pessoais da contratante com o prestador de serviço?", "chunk:1").

question_frame(qf_923beb4029).
frame_question(qf_923beb4029, "Haverá subcontratação que envolva a transferência de dados pessoais do terceiro para o subcontratado?").
frame_intent(qf_923beb4029, "lgpd").
evidence(qf_923beb4029, "2.	Haverá subcontratação que envolva a transferência de dados pessoais do terceiro para o subcontratado?", "chunk:1").

% REQUIREMENTS-DERIVED MODEL (THE "REQUIREMENTS MODEL")
criterion(crit_001).
req_criterion(qf_b322c14246, crit_001).
criterion_target(crit_001, informacao_sensivel).
question_operationalizes_criterion(qf_b322c14246, crit_001).
criterion_concept(crit_001, c_bc219a2f81).

criterion(crit_002).
req_criterion(qf_0d291cf85f, crit_002).
criterion_target(crit_002, processo_critico).
question_operationalizes_criterion(qf_0d291cf85f, crit_002).

criterion(crit_003).
req_criterion(qf_10981fbebf, crit_003).
criterion_target(crit_003, acesso_ativo_ti).
question_operationalizes_criterion(qf_10981fbebf, crit_003).

criterion(crit_004).
req_criterion(qf_6f969bf116, crit_004).
criterion_target(crit_004, acesso_administrativo).
question_operationalizes_criterion(qf_6f969bf116, crit_004).

criterion(crit_005).
req_criterion(qf_640c0560fb, crit_005).
criterion_target(crit_005, acesso_fisico).
question_operationalizes_criterion(qf_640c0560fb, crit_005).

criterion(crit_006).
req_criterion(qf_b737327789, crit_006).
criterion_target(crit_006, subcontratacao).
question_operationalizes_criterion(qf_b737327789, crit_006).

criterion(crit_007).
req_criterion(qf_3c795d1d58, crit_007).
criterion_target(crit_007, auditoria).
question_operationalizes_criterion(qf_3c795d1d58, crit_007).

criterion(crit_008).
req_criterion(qf_31bd1e67cc, crit_008).
criterion_target(crit_008, desativacao_segura).
question_operationalizes_criterion(qf_31bd1e67cc, crit_008).

criterion(crit_009).
req_criterion(qf_e9b8de5caf, crit_009).
criterion_target(crit_009, apolice_seguro).
question_operationalizes_criterion(qf_e9b8de5caf, crit_009).

criterion(crit_010).
req_criterion(qf_0a61ca294a, crit_010).
criterion_target(crit_010, dados_pessoais).
question_operationalizes_criterion(qf_0a61ca294a, crit_010).

criterion(crit_011).
req_criterion(qf_923beb4029, crit_011).
criterion_target(crit_011, transferencia_dados).
question_operationalizes_criterion(qf_923beb4029, crit_011).

% ASSESSMENT MODEL (THE "EVALUATION MODEL")
assessment_dimension(criticidade).
dimension_criterion(criticidade, crit_001).
dimension_criterion(criticidade, crit_002).
dimension_criterion(criticidade, crit_003).
dimension_criterion(criticidade, crit_004).
dimension_criterion(criticidade, crit_005).

dimension_level(criticidade, criticidade_baixa).
level_description(criticidade, criticidade_baixa, "Suporte sem acesso a ativos críticos").
level_concept(criticidade, criticidade_baixa, c_249d13362d).
level_rule(criticidade, criticidade_baixa, []).

dimension_level(criticidade, criticidade_media).
level_description(criticidade, criticidade_media, "Acesso operacional limitado").
level_concept(criticidade, criticidade_media, c_e6c1bf29ba).
level_rule(criticidade, criticidade_media, [crit_003]).

dimension_level(criticidade, criticidade_alta).
level_description(criticidade, criticidade_alta, "Acesso direto a dados sensíveis ou sistemas críticos").
level_concept(criticidade, criticidade_alta, c_a6f0952f68).
level_rule(criticidade, criticidade_alta, [crit_001, crit_004]).

dimension_level(criticidade, criticidade_critica).
level_description(criticidade, criticidade_critica, "Herdeiro direto do risco cibernético institucional").
level_concept(criticidade, criticidade_critica, c_65f85ad950).
level_rule(criticidade, criticidade_critica, [crit_002, crit_004, crit_005]).

% ---- SEMANTIC MATCHING RULES (contract-independent) ----
criterion_signature(crit_001, sig_001).
sig_requires(sig_001, requires_topic(informacao_sensivel)).
sig_requires(sig_001, requires_action(acessar)).

criterion_signature(crit_002, sig_002).
sig_requires(sig_002, requires_topic(processo_critico)).
sig_requires(sig_002, requires_action(suportar)).

criterion_signature(crit_003, sig_003).
% crit_003 asks whether the provider interacts with / has operational access
% to an IT asset.  The target remains acesso_ativo_ti, while the executable
% signature decomposes that target into:
%   (i) an IT-asset topic; and
%   (ii) an action that denotes operational interaction with that asset.
sig_requires(sig_003, requires_topic(ativo_ti)).
sig_requires(sig_003, requires_action(interagir_ativo_ti)).

criterion_signature(crit_004, sig_004).
sig_requires(sig_004, requires_topic(acesso_administrativo)).
sig_requires(sig_004, requires_action(ter)).

criterion_signature(crit_005, sig_005).
sig_requires(sig_005, requires_topic(acesso_fisico)).
sig_requires(sig_005, requires_action(acessar_fisicamente)).

criterion_signature(crit_006, sig_006).
sig_requires(sig_006, requires_topic(subcontratacao)).
sig_requires(sig_006, requires_action(subcontratar)).

criterion_signature(crit_007, sig_007).
sig_requires(sig_007, requires_topic(auditoria)).
sig_requires(sig_007, requires_normative_kind(right)).

criterion_signature(crit_008, sig_008).
sig_requires(sig_008, requires_topic(desativacao_segura)).
sig_requires(sig_008, requires_action(garantir)).

criterion_signature(crit_009, sig_009).
sig_requires(sig_009, requires_topic(apolice_seguro)).
sig_requires(sig_009, requires_action(mitigar)).

criterion_signature(crit_010, sig_010).
sig_requires(sig_010, requires_topic(dados_pessoais)).
sig_requires(sig_010, requires_action(compartilhar)).

criterion_signature(crit_011, sig_011).
sig_requires(sig_011, requires_topic(transferencia_dados)).
sig_requires(sig_011, requires_action(envolver)).

kb_topic_alias(informacao_sensivel, ["informações sensíveis", "dados pessoais", "informações sigilosas"]).
kb_action_alias(acessar, ["acessar", "consultar", "visualizar"]).
kb_action_alias(suportar, ["suportar", "apoiar", "auxiliar"]).
kb_action_alias(ter, ["ter", "possuir", "apresentar"]).
kb_action_alias(subcontratar, ["subcontratar", "terceirizar", "delegar"]).
kb_normative_kind_alias(right, ["direito", "permissão", "prerrogativa"]).
kb_action_alias(garantir, ["garantir", "assegurar", "certificar"]).
kb_action_alias(mitigar, ["mitigar", "reduzir", "atenuar"]).
kb_action_alias(compartilhar, ["compartilhar", "dividir", "repartir"]).
kb_action_alias(envolver, ["envolver", "implicar", "compreender"]).


% ===========================================================================
% EXECUTABLE SYMBOLIC GROUNDING LAYER
% Added for the SWI-Prolog-only experiment.
%
% Design principle:
%   - Criteria are NOT pre-materialized in contract FKMs.
%   - criterion_satisfied/2 is derived at runtime.
%   - A truthmaker is an existing legal_relation_instance/4 from the FKM.
%   - All requirements of a criterion signature must be satisfied by the
%     SAME truthmaker (same clause/legal relation/action).
%   - Negative/prohibitive legal moments do not count as positive support.
%   - Matching is deterministic and based only on explicit aliases and
%     textual/semantic fields already represented in the Prolog FKM.
%
% This layer is intentionally conservative. It does not infer domain facts
% such as "database implies critical system" or "installation implies
% administrative access" unless such semantics are explicitly represented.
% ===========================================================================

% ---------------------------------------------------------------------------
% Additional cross-language aliases observed in the generated FKMs.
% They remain contract-independent and express only lexical/semantic variants.
% ---------------------------------------------------------------------------

kb_topic_alias(informacao_sensivel, [
    "informação sensível",
    "informacoes sensiveis",
    "sensitive information",
    "confidential information",
    "confidential info",
    "dados pessoais",
    "personal data",
    "informações confidenciais",
    "informacoes confidenciais",
    "informações sigilosas",
    "informacoes sigilosas"
]).

kb_topic_alias(processo_critico, [
    "processo crítico",
    "processo critico",
    "critical process",
    "critical business process",
    "sistema crítico",
    "sistema critico",
    "critical system",
    "sistema principal",
    "sistemas principais",
    "main system",
    "core system"
]).

% Vocabulary for the IT-asset component of crit_003.
% These aliases identify the asset itself; satisfaction still requires an
% operational-interaction action on the SAME truthmaker.
kb_topic_alias(ativo_ti, [
    "ativo de ti",
    "ativos de ti",
    "ativo de tic",
    "ativos de tic",
    "it asset",
    "it assets",
    "sistema gerenciador de banco de dados",
    "sgbd",
    "database",
    "database management system",
    "dbms",
    "oracle database",
    "servidor",
    "servidores",
    "server",
    "servers",
    "storage",
    "armazenamento",
    "infraestrutura de ti",
    "it infrastructure"
]).

% Kept for backward compatibility with artifacts that may still refer directly
% to the original criterion target vocabulary.
kb_topic_alias(acesso_ativo_ti, [
    "acesso a ativo de ti",
    "acesso a ativos de ti",
    "acesso a ativo de tic",
    "acesso a ativos de tic",
    "it asset access",
    "access to it asset",
    "access to it assets",
    "ativo crítico de ti",
    "ativo critico de ti",
    "ativos críticos de ti",
    "ativos criticos de ti",
    "critical it asset",
    "critical it assets"
]).

kb_topic_alias(acesso_administrativo, [
    "acesso administrativo",
    "administrative access",
    "acesso privilegiado",
    "privileged access",
    "admin access",
    "administrator access",
    "credencial administrativa",
    "credenciais administrativas",
    "administrative credential",
    "administrative credentials",
    "root access"
]).

kb_topic_alias(acesso_fisico, [
    "acesso físico",
    "acesso fisico",
    "physical access",
    "acesso presencial",
    "presential access",
    "on-site access",
    "onsite access",
    "área crítica",
    "area critica",
    "áreas críticas",
    "areas criticas",
    "critical area",
    "critical areas",
    "cpd",
    "data center",
    "datacenter",
    "shaft",
    "sala de telecom",
    "sala de telecomunicações",
    "sala de telecomunicacoes"
]).

% English and mixed-language action aliases emitted by Semantic Onboarding.

% Operational interaction with an IT asset.  This is intentionally broader
% than literal "access": technical support, maintenance, operation and
% administration can establish crit_003 when they concern an IT asset in the
% SAME truthmaker.
kb_action_alias(interagir_ativo_ti, [
    "acessar",
    "access",
    "technical support",
    "suporte técnico",
    "suporte tecnico",
    "operate",
    "operar",
    "administer",
    "administrar",
    "configure",
    "configurar",
    "upgrade",
    "atualizar versão",
    "atualizar versao"
]).

kb_action_alias(acessar, [
    "acessar", "access", "consultar", "consult", "visualizar", "view",
    "conectar", "connect", "login", "log in"
]).

kb_action_alias(suportar, [
    "suportar", "support", "apoiar", "assist", "auxiliar",
    "technical support", "suporte técnico", "suporte tecnico"
]).

kb_action_alias(ter, [
    "ter", "have", "has", "possuir", "possess",
    "envolver", "involve", "involves",
    "incluir", "include", "includes",
    "acesso", "access"
]).

% Explicit exclusions prevent lexical mentions of access from being interpreted
% as positive evidence of actual access.
kb_action_exclusion(acessar, [
    "not access",
    "do not access",
    "não acessar",
    "nao acessar",
    "limit access",
    "limitar acesso",
    "provide access",
    "fornecer acesso",
    "allow access",
    "permit access"
]).

% ---------------------------------------------------------------------------
% Utility predicates
% ---------------------------------------------------------------------------

koa_text(Value, Text) :-
    string(Value), !,
    string_lower(Value, Text).
koa_text(Value, Text) :-
    atom(Value), !,
    atom_string(Value, S0),
    split_string(S0, "_", "", Parts),
    atomics_to_string(Parts, " ", S1),
    string_lower(S1, Text).
koa_text(Value, Text) :-
    term_string(Value, S0),
    string_lower(S0, Text).

% Token-aware phrase matching.
% This avoids substring false positives such as:
%   manage  -> manager
%   system  -> ecosystem
% Multi-word aliases must occur as a contiguous token sequence.
koa_tokens(Value, Tokens) :-
    koa_text(Value, Text),
    split_string(
        Text,
        " \t\n\r_-/,.;:()[]{}\"'\\",
        " \t\n\r_-/,.;:()[]{}\"'\\",
        RawTokens
    ),
    koa_nonempty_tokens(RawTokens, Tokens).

koa_nonempty_tokens([], []).
koa_nonempty_tokens([""|Rest], Tokens) :-
    !,
    koa_nonempty_tokens(Rest, Tokens).
koa_nonempty_tokens([Token|Rest], [Token|Tokens]) :-
    koa_nonempty_tokens(Rest, Tokens).

koa_prefix_tokens([], _).
koa_prefix_tokens([P|Ps], [P|Ts]) :-
    koa_prefix_tokens(Ps, Ts).

koa_contiguous_tokens(Pattern, Text) :-
    Pattern \= [],
    koa_prefix_tokens(Pattern, Text),
    !.
koa_contiguous_tokens(Pattern, [_|Rest]) :-
    koa_contiguous_tokens(Pattern, Rest).

koa_phrase_match(TextValue, PatternValue) :-
    koa_tokens(TextValue, TextTokens),
    koa_tokens(PatternValue, PatternTokens),
    koa_contiguous_tokens(PatternTokens, TextTokens).

% Retained for backward-compatible uses outside criterion matching.
koa_contains(TextValue, PatternValue) :-
    koa_text(TextValue, Text),
    koa_text(PatternValue, Pattern),
    sub_string(Text, _, _, _, Pattern).

koa_member_alias(Canonical, Alias) :-
    kb_topic_alias(Canonical, Aliases),
    member(Alias, Aliases).
koa_member_action_alias(Canonical, Alias) :-
    kb_action_alias(Canonical, Aliases),
    member(Alias, Aliases).
koa_member_normative_alias(Canonical, Alias) :-
    kb_normative_kind_alias(Canonical, Aliases),
    member(Alias, Aliases).

koa_action_excluded(Canonical, Value) :-
    kb_action_exclusion(Canonical, Exclusions),
    member(Exclusion, Exclusions),
    koa_phrase_match(Value, Exclusion),
    !.


% Physical access must be expressed by an action that explicitly denotes
% entry into or physical presence in a facility / critical area.
kb_action_alias(acessar_fisicamente, [
    "physical access",
    "physically access",
    "access physically",
    "acesso físico",
    "acesso fisico",
    "acessar fisicamente",
    "entrar nas instalações",
    "entrar nas instalacoes",
    "access premises",
    "access the premises",
    "enter premises",
    "enter the premises",
    "access facility",
    "access the facility",
    "enter facility",
    "enter the facility",
    "on-site access",
    "onsite access",
    "acesso presencial"
]).

% ---------------------------------------------------------------------------
% Truthmakers
%
% The unit of grounding is a concrete legal relation already represented in
% the contract FKM. Clause metadata/text may enrich that same truthmaker, but
% requirements are never satisfied by unrelated clauses.
% ---------------------------------------------------------------------------

candidate_truthmaker(
    tm(Agreement, Clause, LegalMoment, Bearer, Action)
) :-
    legal_relation_instance(Clause, LegalMoment, Bearer, Action),
    clause_of(Clause, Agreement),
    instance_of(Agreement, legal_service_agreement).

% Positive support must not be derived from explicit prohibitions or absences.
positive_legal_moment(duty_to_act).
positive_legal_moment(right_to_action).
positive_legal_moment(permission_to_act).
positive_legal_moment(power).

positive_truthmaker(
    tm(_Agreement, _Clause, LegalMoment, _Bearer, _Action)
) :-
    positive_legal_moment(LegalMoment).

% Fields belonging to the SAME truthmaker.
truthmaker_topic_field(
    tm(_Agreement, Clause, _LegalMoment, _Bearer, Action),
    Action
).
truthmaker_topic_field(
    tm(_Agreement, _Clause, _LegalMoment, _Bearer, Action),
    Label
) :-
    current_predicate(action_label/2),
    action_label(Action, Label).
truthmaker_topic_field(
    tm(Agreement, Clause, _LegalMoment, _Bearer, _Action),
    Title
) :-
    current_predicate(contract_clause/4),
    contract_clause(Agreement, Clause, Title, _Body).
truthmaker_topic_field(
    tm(Agreement, Clause, _LegalMoment, _Bearer, _Action),
    Body
) :-
    current_predicate(contract_clause/4),
    contract_clause(Agreement, Clause, _Title, Body).

% Action matching is deliberately narrower than topic matching: only the
% semantic action identifier and its action_label are considered. This avoids
% treating an unrelated verb elsewhere in a long clause as the action of the
% truthmaker.
truthmaker_action_field(
    tm(_Agreement, _Clause, _LegalMoment, _Bearer, Action),
    Action
).
truthmaker_action_field(
    tm(_Agreement, _Clause, _LegalMoment, _Bearer, Action),
    Label
) :-
    current_predicate(action_label/2),
    action_label(Action, Label).

truthmaker_normative_field(
    tm(_Agreement, _Clause, LegalMoment, _Bearer, _Action),
    LegalMoment
).

% ---------------------------------------------------------------------------
% Requirement evaluation
% ---------------------------------------------------------------------------

truthmaker_satisfies(
    Truthmaker,
    requires_topic(Topic)
) :-
    truthmaker_topic_field(Truthmaker, Field),
    koa_member_alias(Topic, Alias),
    koa_phrase_match(Field, Alias),
    !.

truthmaker_satisfies(
    Truthmaker,
    requires_action(ActionCanonical)
) :-
    positive_truthmaker(Truthmaker),
    truthmaker_action_field(Truthmaker, Field),
    \+ koa_action_excluded(ActionCanonical, Field),
    koa_member_action_alias(ActionCanonical, Alias),
    koa_phrase_match(Field, Alias),
    !.

truthmaker_satisfies(
    Truthmaker,
    requires_normative_kind(Kind)
) :-
    truthmaker_normative_field(Truthmaker, LegalMoment),
    (
        LegalMoment = Kind
    ;
        koa_member_normative_alias(Kind, Alias),
        koa_phrase_match(LegalMoment, Alias)
    ),
    !.

% ---------------------------------------------------------------------------
% Criterion satisfaction
%
% All signature requirements must hold for the SAME truthmaker.
% criterion_satisfied/2 is a DERIVED runtime conclusion, not an FKM fact.
% ---------------------------------------------------------------------------

criterion_satisfied(Criterion, Truthmaker) :-
    criterion_signature(Criterion, Signature),
    candidate_truthmaker(Truthmaker),
    positive_truthmaker(Truthmaker),
    findall(
        Requirement,
        sig_requires(Signature, Requirement),
        Requirements
    ),
    Requirements \= [],
    forall(
        member(Requirement, Requirements),
        truthmaker_satisfies(Truthmaker, Requirement)
    ).

criterion_supported(Criterion) :-
    once(criterion_satisfied(Criterion, _Truthmaker)).

criterion_truthmakers(Criterion, Truthmakers) :-
    findall(
        Truthmaker,
        criterion_satisfied(Criterion, Truthmaker),
        Raw
    ),
    sort(Raw, Truthmakers).

criterion_status(Criterion, satisfied) :-
    criterion_supported(Criterion), !.
criterion_status(Criterion, partial) :-
    criterion_partial_supported(Criterion), !.
criterion_status(Criterion, undetermined) :-
    criterion(Criterion).


% ---------------------------------------------------------------------------
% Complementary technical-artifact truthmakers
%
% Some combined FKMs contain a formal model derived from an Especificação
% Técnica / Termo de Referência / Projeto Básico. These predicates are already
% explicit formal statements and should not be reconstructed lexically from
% contract clauses.
% ---------------------------------------------------------------------------

criterion_et_predicate(crit_001, envolve_informacoes_sensiveis).
criterion_et_predicate(crit_002, suporta_processo_critico).
criterion_et_predicate(crit_003, acesso_ativos_ti_criticos).
criterion_et_predicate(crit_004, envolve_acesso_administrativo).

% crit_005 is intentionally stricter than generic physical presence.
% A full truthmaker must explicitly establish access to a critical physical area.
criterion_et_predicate(crit_005, acesso_fisico_area_critica).

% Generic on-site / physical presence is relevant evidence, but it is not
% sufficient to establish access to a critical area. It therefore supports P.
criterion_et_partial_predicate(crit_005, envolve_acesso_fisico).
criterion_et_partial_predicate(crit_005, envolve_atendimento_presencial).

et_direct_truthmaker(
    Criterion,
    tm_et(Agreement, Criterion, Item, Predicate, Justification)
) :-
    criterion_et_predicate(Criterion, Predicate),
    current_predicate(Predicate/2),
    Goal =.. [Predicate, Item, sim],
    call(Goal),
    once(instance_of(Agreement, legal_service_agreement)),
    (
        current_predicate(justificativa/2),
        once(justificativa(Criterion, Justification))
    ->
        true
    ;
        Justification = sem_justificativa_explicita
    ).

et_partial_truthmaker(
    Criterion,
    tm_et_partial(Agreement, Criterion, Item, Predicate, Justification)
) :-
    criterion_et_partial_predicate(Criterion, Predicate),
    current_predicate(Predicate/2),
    Goal =.. [Predicate, Item, sim],
    call(Goal),
    once(instance_of(Agreement, legal_service_agreement)),
    (
        current_predicate(justificativa/2),
        once(justificativa(Criterion, Justification))
    ->
        true
    ;
        Justification = sem_justificativa_explicita
    ).

% A criterion may be fully grounded either by a contract legal-relation
% truthmaker or by a formal truthmaker from a complementary technical artifact.
criterion_satisfied(Criterion, Truthmaker) :-
    et_direct_truthmaker(Criterion, Truthmaker).

criterion_partial_supported(Criterion) :-
    \+ criterion_supported(Criterion),
    once(et_partial_truthmaker(Criterion, _Truthmaker)).

criterion_partial_truthmakers(Criterion, Truthmakers) :-
    findall(
        Truthmaker,
        et_partial_truthmaker(Criterion, Truthmaker),
        Raw
    ),
    sort(Raw, Truthmakers).

% ---------------------------------------------------------------------------
% Symbolic criticality inference
% ---------------------------------------------------------------------------

koa_level_rank(criticidade_baixa, 1).
koa_level_rank(criticidade_media, 2).
koa_level_rank(criticidade_alta, 3).
koa_level_rank(criticidade_critica, 4).

koa_all_criteria_supported([]).
koa_all_criteria_supported([Criterion|Rest]) :-
    criterion_supported(Criterion),
    koa_all_criteria_supported(Rest).

criticality_rule_holds(Level, RequiredCriteria) :-
    level_rule(criticidade, Level, RequiredCriteria),
    koa_all_criteria_supported(RequiredCriteria).

symbolic_criticality(Level) :-
    findall(
        Rank-Candidate,
        (
            criticality_rule_holds(Candidate, _Required),
            koa_level_rank(Candidate, Rank)
        ),
        Matches
    ),
    sort(Matches, Sorted),
    last(Sorted, _-Level),
    !.

% Defensive default; normally criticidade_baixa already holds through [].
symbolic_criticality(criticidade_baixa).

symbolic_criticality_label(criticidade_baixa, "Baixa").
symbolic_criticality_label(criticidade_media, "Média").
symbolic_criticality_label(criticidade_alta, "Alta").
symbolic_criticality_label(criticidade_critica, "Crítica").

symbolic_criticality_result(Label) :-
    symbolic_criticality(Level),
    symbolic_criticality_label(Level, Label).

% ---------------------------------------------------------------------------
% EGS for the five cybersecurity criticality criteria
% ---------------------------------------------------------------------------

criticality_criterion(crit_001).
criticality_criterion(crit_002).
criticality_criterion(crit_003).
criticality_criterion(crit_004).
criticality_criterion(crit_005).

symbolic_grounded_criteria(Criteria) :-
    findall(
        Criterion,
        (
            criticality_criterion(Criterion),
            criterion_supported(Criterion)
        ),
        Criteria
    ).

symbolic_egs(EGS) :-
    symbolic_grounded_criteria(Criteria),
    length(Criteria, N),
    EGS is N / 5.

% ---------------------------------------------------------------------------
% Useful diagnostic queries
%
% Regression tests for executable crit_003:
%   OCS 004/2023 should NOT be promoted to Medium merely because generic
%   words such as "system", "manager" or "maintain" occur in unrelated facts.
%   Expected: crit_003 = undetermined unless a genuine IT-asset interaction
%   truthmaker is present.
%
% Reference test for OCS 278/2023:
%   ?- criterion_status(crit_003, Status).
%   Expected: Status = satisfied.
%   ?- criterion_truthmakers(crit_003, TMs).
%   Expected: at least one truthmaker rooted in clausula_primeira_objeto,
%             whose action is provide_technical_support and whose clause text
%             identifies the Oracle Database / SGBD asset.
%
% ?- criterion_status(crit_001, Status).
% ?- criterion_truthmakers(crit_001, TMs).
% ?- symbolic_grounded_criteria(Cs).
% ?- symbolic_egs(EGS).
% ?- symbolic_criticality_result(Label).
% ===========================================================================
