% KOA Semantic Requirements (generated) - 2026-02-07T10:14:38.213778Z
% source_id: KOA_user_information_needs_gseg.txt

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
