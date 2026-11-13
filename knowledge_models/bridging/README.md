## KOA Semantic Bridge

KOA_semantic_bridge.pl` represents the Semantic Bridge between the Decision Model and the organizational knowledge constructed during Semantic Onboarding.

The bridge specifies the conditions under which organizational knowledge can provide evidence for decision criteria, thereby supporting grounded and executable reasoning.

The file is contract-independent: it defines the semantic structures used to evaluate organizational evidence, rather than containing facts about a specific contract.

### Main Blocks

#### 1. Semantic Requirements

This block preserves the concepts, definitions, categories, and questions extracted from the Business Intent specification.

Main predicates include:

- `concept/1`
- `concept_label/2`
- `concept_definition/2`
- `category/1`
- `category_level/5`
- `question_frame/1`
- `frame_question/2`
- `frame_intent/2`
- `evidence/3`

These predicates preserve the original semantic context from which the decision requirements were derived.

The `evidence/3` predicate maintains provenance by linking formalized elements to the source fragments that motivated their construction.

#### 2. Requirements-Derived Model

This block transforms the original semantic requirements into explicit decision criteria.

Each criterion represents something that must be evaluated in the organizational knowledge.

Main predicates include:

- `criterion/1`
- `req_criterion/2`
- `criterion_target/2`
- `criterion_concept/2`
- `question_operationalizes_criterion/2`

For example, a question concerning access to sensitive information is associated with a criterion whose target is "informacao_sensivel".

This block therefore connects the original Business Intent specification to an operational representation of decision conditions.

#### 3. Assessment Model

The Assessment Model defines how decision criteria contribute to the decision outcome.

Main predicates include:

- `assessment_dimension/1`
- `dimension_criterion/2`
- `dimension_level/2`
- `level_description/3`
- `level_concept/3`
- `level_rule/3`

In the cybersecurity case study, the assessment dimension is "criticidade", with four possible levels:

- criticidade_baixa
- criticidade_media
- criticidade_alta
- criticidade_critica

Each level_rule/3 specifies the criteria required to establish a particular criticality level.

This block makes the decision logic explicit and executable.

#### 4. Semantic Matching Rules

This block defines the semantic signatures used to search for potential evidence in organizational knowledge.

Main predicates include:

- criterion_signature/2
- sig_requires/2

Each decision criterion is associated with a semantic signature describing the semantic elements that organizational knowledge must contain to potentially satisfy that criterion. 

Examples of signature requirements include:

- requires_topic/1
- requires_action/1
- requires_normative_kind/1

For example:

    criterion_signature(crit_001, sig_001).
    sig_requires(sig_001, requires_topic(informacao_sensivel)).
    sig_requires(sig_001, requires_action(acessar)).

This specifies that evidence for `crit_001` must concern sensitive information and an access relation.

Semantic signatures provide the main connection between decision conditions and the organizational knowledge space.

#### 5. Semantic Aliases

The final block defines lexical variations that may express the same semantic elements in organizational knowledge.

Main predicates include:

- kb_topic_alias/2
- kb_action_alias/2
- kb_normative_kind_alias/2

For example:

    kb_action_alias(acessar, ["acessar", "consultar", "visualizar"]).

Aliases support semantic matching without changing the canonical vocabulary of the Decision Model.

They therefore provide lexical flexibility while preserving the semantic commitments established during knowledge construction.

### Semantic Role in the Methodology

The Semantic Bridge connects two independently constructed semantic spaces:

    Decision Model
         |
         | Decision Criteria
         v
    Semantic Bridge
         |
         | Semantic Signatures
         | Matching Requirements
         v
    Organizational Knowledge
         |
         | Grounded Evidence
         v
    Executable Reasoning

The bridge distinguishes semantic correspondence from evidential grounding. Organizational information is not considered evidence merely because it is semantically related to a decision criterion. It must satisfy the semantic requirements associated with that criterion.

### Example

Consider the criterion related to access to sensitive information:

    criterion(crit_001).
    criterion_target(crit_001, informacao_sensivel).

Its semantic signature is:

    criterion_signature(crit_001, sig_001).
    sig_requires(sig_001, requires_topic(informacao_sensivel)).
    sig_requires(sig_001, requires_action(acessar)).

The bridge therefore establishes what must be identified in organizational knowledge before available information can be considered potential evidence for this decision condition.

### Design Principles

The Semantic Bridge follows four main principles:

1. Decision semantics and organizational knowledge are constructed independently.
2. Semantic correspondence alone is not sufficient for evidential grounding.
3. Decision criteria are connected to organizational evidence through explicit semantic requirements.
   
5. The resulting grounding remains inspectable and executable by the
   symbolic reasoning layer.
