## Notebooks

This directory contains the six Jupyter notebooks implementing the knowledge construction pipeline.

The notebooks operationalize the three main knowledge-construction stages: **Semantic Onboarding**, **Ontological Unpacking**, and **Semantic Bridging**.

### Pipeline Overview

The implementation follows two initially independent paths.

The organizational knowledge path is implemented through Semantic Onboarding:

Organizational Artifacts | 01 — Semantic Model Generation | Candidate Semantic Models | 02 — TBox Bootstrapping | Frozen Vocabulary | 03 — ABox Generation | Artifact-Specific ABoxes | 04 — Ontology Projection | Formal Knowledge Model


In parallel, the decision semantics path is implemented through Ontological Unpacking:

Business Intent Specification | 05 — Ontological Unpacking | Decision Model


The two knowledge spaces are subsequently connected through Semantic Bridging:

Decision Model + Formal Knowledge Model | 06 — Semantic Bridging | Semantic Bridge Model
