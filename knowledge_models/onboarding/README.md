# Semantic Onboarding

This directory contains the Formal Knowledge Models generated during the Semantic Onboarding process described in the paper.

Semantic Onboarding progressively transforms heterogeneous organizational artifacts into formal knowledge representations under a controlled vocabulary and subsequently grounds these representations in the adopted ontological foundation.

The artifacts in this directory correspond to the main stages of this process.

## Directory Structure
### TBox/

Contains the controlled semantic vocabulary established during TBox Bootstrapping.

A candidate semantic model generated from a selected service contract (OCS 195/2022) is used as the reference model for bootstrapping the TBox. Its predicates, fact categories, and metadata structures are extracted and consolidated into a frozen vocabulary that constrains the subsequent generation of artifact-specific ABox models.

The directory includes the selected reference semantic model and the resulting bootstrapped TBox represented in Prolog.

Once established, the TBox remains frozen during ABox generation, ensuring that all organizational artifacts are represented using a common controlled vocabulary.

### ABox/

Contains the artifact-specific ABox models generated from the organizational corpus using the frozen TBox.

Each Prolog file represents the semantic content extracted from one service contract while being constrained by the predicates and structures defined in the TBox.

The current corpus contains 68 service-contract models. Together, these models provide a controlled and consistent representation of the organizational knowledge extracted from the contract artifacts.

At this stage, the models are semantically structured but have not yet been projected onto the adopted foundational ontology.

### UFO_Service_Contracts/

Contains the service-contract ontology adopted as the ontological foundation for the subsequent projection stage.

The ontology was derived from the service-contract conceptualization presented by Griffo et al. (2017) and represented as an executable Prolog model for use within the implementation.

This model provides the ontological categories and relations used to interpret the organizational knowledge represented in the ABox models.

### ABox_UFO_Service_Contracts/

Contains the ontology-projected versions of the artifact-specific ABox models.

Each model results from projecting an ABox representation onto the adopted service-contract ontology. The projection associates the artifact-specific knowledge with ontologically grounded concepts and relations, providing an explicit ontological interpretation of the organizational knowledge.

These models constitute the ontologically grounded representations produced by Semantic Onboarding and contribute to the Formal Knowledge Model used by the subsequent stages of the methodology.

## Semantic Onboarding Progression

The relationship among the directories can be summarized as follows:

1) A reference semantic model is selected from the candidate models generated from the organizational artifacts.
2) TBox/ establishes and freezes the controlled vocabulary derived from this reference model.
3) ABox/ contains the artifact-specific semantic models generated under this frozen vocabulary.
4) UFO_Service_Contracts/ provides the ontological foundation adopted for service contracts.
5) ABox_UFO_Service_Contracts/ contains the resulting ontology-grounded artifact models.

This organization reflects the implementation described in the paper:
TBox Bootstrapping → ABox Generation → Ontology Projection

The separation between controlled semantic modeling and ontological projection is intentional. The TBox first establishes representational consistency across the organizational corpus, while the subsequent ontology projection introduces the ontological commitments required to construct the Formal Knowledge Model.

## Representation

All formal knowledge models in this directory are represented in Prolog. This allows the generated knowledge artifacts to remain both human-inspectable and computationally executable, supporting their subsequent use by the symbolic reasoning components of the architecture.

## Relation to the Paper

These artifacts correspond to the Semantic Onboarding implementation documented in Appendix A of the paper. In particular:
TBox Bootstrapping corresponds to Notebook 2;
ABox Generation corresponds to Notebook 3;
Ontology Projection corresponds to Notebook 4.

Notebook 1 precedes these stages by generating the artifact-specific candidate semantic models from which a reference model is selected for TBox Bootstrapping.
