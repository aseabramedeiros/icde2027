## Evaluation

This directory contains the notebooks, reference artifacts, and generated outputs.

The evaluation focuses on the construction and exploration of decision-supporting knowledge in the cybersecurity criticality assessment of IT service contracts. In particular, it examines how decision conditions can be grounded in organizational evidence through symbolic reasoning and how neural interpretation can complement cases that remain inconclusive after explicit grounding.

The primary evaluation is conducted over the contract corpus described in the paper and considers both symbolic and neuro-symbolic grounding behavior.

### Evaluation Scope

The evaluation addresses three main aspects:

1. **Evidence Grounding**  
   Determines whether the organizational knowledge available for each contract provides sufficient evidence to establish the decision conditions represented in the Decision Model.

2. **Symbolic Grounding Coverage**  
   Measures the extent to which contract--criterion pairs can be conclusively determined using the Formal Knowledge Model, Semantic Bridge Model, and symbolic reasoning.

3. **Neuro-Symbolic Complementation**  
   Examines whether neural semantic interpretation can increase the coverage of conclusive assessments when explicit symbolic grounding remains inconclusive, while preserving the distinction between symbolic and neural results.

These analyses support the quantitative measures reported in the paper, including the **Symbolic Grounding Score (SGS)** and the **Neuro-Symbolic Grounding Score (NSGS)**.

### Directory Contents

#### KOA_evidence_grounding_evaluation.ipynb

Main notebook for the evidence-grounding evaluation.

It applies the constructed Decision Model, Formal Knowledge Model, and Semantic Bridge Model to the contract corpus and evaluates grounding at the contract--criterion level.

The notebook provides the basis for determining whether each decision condition can be:

- established through explicit symbolic grounding;
- left inconclusive by the available formal evidence; or
- subsequently considered for neural complementation.

#### KOA_evidence_grounding_evaluation_results_v1.ipynb

First analysis notebook for consolidating and inspecting the outputs produced by the evidence-grounding evaluation.

It supports the aggregation of contract-level results and the calculation of evaluation statistics used in the paper.

#### KOA_evidence_grounding_evaluation_results_v2.ipynb

Second-generation evaluation analysis based on a less conservative neural assessment behavior.

This version is useful for analyzing the sensitivity of neuro-symbolic grounding coverage to the behavior of the neural subsystem.

#### KOA_neuro_symbolic_evaluation.txt

Contains the neuro-symbolic evaluation material used to analyze cases in which explicit symbolic grounding remains inconclusive.

This artifact supports the constrained neural complementation stage evaluated in the paper. Neural interpretation is applied only after symbolic grounding has failed to reach a conclusive result, preserving the epistemic distinction between formally established and neurally complemented assessments.

#### Oracle_Contract_Security_Criticality_Assessment.pdf

Reference assessment associated with the running contract example used throughout the paper.

The document provides a human-readable representation of the cybersecurity criticality assessment and supports inspection of the grounding and explanation behavior discussed in the evaluation chapter.

#### evaluation_outputs/

Contains the generated artifacts produced during the evaluation process.

Depending on the execution, these outputs may include contract-level results, criterion-level assessments, grounding summaries, aggregated statistics, and other intermediate or final evaluation artifacts.
