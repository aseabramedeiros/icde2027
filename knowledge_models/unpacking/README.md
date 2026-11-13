# Ontological Unpacking

This directory contains the artifacts produced during the Ontological Unpacking process described in the paper.

Ontological Unpacking starts from a domain-specific specification produced by domain experts and makes explicit the concepts, criteria, and conditions required to evaluate a Decision Objective within a Decision Domain. The process progressively transforms this natural-language specification into a formal and executable Decision Model.

The artifacts in this directory represent the main stages of this process.

## Source Specification
### Contrato360 - Semantica de riscos cibernéticos.pdf

The original decision-domain specification produced by domain experts for the cybersecurity criticality assessment of IT service contracts.

The document describes the relevant concepts, decision criteria, conditions, and information requirements used to characterize cybersecurity criticality. It constitutes the primary input to the Ontological Unpacking process.

### KOA_user_information_needs_gseq.txt

Textual content extracted from the expert-produced specification.

This representation provides the natural-language input processed by the Ontological Unpacking implementation while preserving the decision semantics specified by the domain experts.

## Intermediate Artifacts
### KOA_competency_questions.json

Contains the competency questions derived from the decision specification.

These questions help make explicit the information requirements associated with the Decision Objective and guide the identification of the semantic elements required by the Decision Model.

### KOA_semantic_requirements_extracted.json

Contains the semantic requirements extracted from the natural-language decision specification.

This artifact represents an intermediate stage in which relevant concepts, criteria, conditions, and their relationships are made explicit before formal normalization.

## Decision Model
### KOA_semantic_requirements_normalized.yml

Contains the normalized semantic requirements in a structured, human-readable representation.

The YAML representation preserves the organization of the decision semantics while providing an intermediate representation suitable for inspection and subsequent formalization.

### KOA_semantic_requirements_normalized.pl

Contains the executable Prolog representation of the normalized semantic requirements.

This artifact constitutes the formal Decision Model used by the subsequent Semantic Bridging process. It explicitly represents the decision criteria and conditions required to evaluate the Decision Objective within the cybersecurity criticality Decision Domain.

## Ontological Unpacking Progression

The relationship among the artifacts can be summarized as follows:

1) Domain experts specify the decision problem and its relevant semantics in natural language. 
2) The textual content is extracted from the source document for computational processing. 
3) Competency questions make explicit the information needs associated with the Decision Objective. 
4) Semantic requirements are identified from the expert specification.
5) The extracted requirements are normalized into a structured semantic representation.
6) The normalized requirements are formalized as an executable Prolog Decision Model.

This process can be summarized as:
Decision Specification → Semantic Requirements → Decision Model

The resulting Decision Model is constructed independently from the organizational evidence processed through Semantic Onboarding. The two knowledge-construction paths subsequently converge during Semantic Bridging, where decision conditions are connected to organizational evidence through explicit grounding relationships.

## Representation

The final Decision Model is represented in Prolog, while JSON and YAML are used for intermediate structured representations. This separation preserves intermediate semantic artifacts for inspection and traceability while producing an executable formal model for subsequent symbolic reasoning.

## Relation to the Paper

These artifacts correspond to the Ontological Unpacking implementation documented in Appendix A of the paper and implemented by Notebook 5.
