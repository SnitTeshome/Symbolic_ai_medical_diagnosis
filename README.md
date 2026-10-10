# Symbolic AI Medical Diagnosis

A symbolic AI approach to medical diagnosis, built on the **MeTTa** language and the **Hyperon** framework (TrueAGI). Instead of learning from data, a symbolic system reasons over an explicit knowledge base of facts and rules, so each conclusion can be traced back to the rules that produced it.

> **Disclaimer:** This is an academic project. It is not a medical device and must not be used for real diagnosis or treatment decisions. Always consult a qualified health professional.

---

## About the Project

Many modern medical AI systems are machine-learning models that give an answer without showing how they reached it. In healthcare, that makes them hard to trust, check and correct. This project explores the alternative: **symbolic AI**, where knowledge is written down explicitly and the system reasons over it step by step.

The system represents medical knowledge, such as symptoms, conditions and the relationships between them, as symbolic facts and rules, and reasons over that knowledge to suggest possible diagnoses for a set of reported symptoms. Because every conclusion comes from rules that can be read, each result can be traced back to the facts and rules behind it.

### Why symbolic AI for diagnosis?

- **Transparent:** the reasoning can be read and inspected, not hidden inside model weights.
- **Verifiable:** a clinician or reviewer can check each rule and correct it directly.
- **Data-light:** it does not need a large training dataset, only well-defined medical knowledge.
- **Extensible:** new symptoms, conditions or rules can be added without retraining a model.

### Why MeTTa and Hyperon?

**MeTTa** (Meta Type Talk) is a language for writing and querying knowledge as symbolic expressions, and **Hyperon** is the framework that runs it. Together they make it natural to store facts and rules in a knowledge base and to query them by pattern matching, which suits rule-based diagnostic reasoning.

---

## Requirements

- Python 3.10
- MeTTa / Hyperon (see `requirements.txt`)
- `pandas >= 1.5.3`
- `numpy >= 1.25.0`

## Installation

```bash
git clone https://github.com/SnitTeshome/Symbolic_ai_medical_diagnosis.git
cd Symbolic_ai_medical_diagnosis

python -m venv myenv
source myenv/bin/activate        # Windows: myenv\Scripts\activate

pip install -r requirements.txt
```

---

## Project structure

```
.
├── requirements.txt   # Python dependencies
├── LICENSE            # MIT License
└── README.md
```

## Author

**Snit Kahsay Teshome**
BSc Data Science and Analytics, United States International University – Africa (USIU-Africa)

## License

Released under the [MIT License](LICENSE). Copyright (c) 2025 Snit Kahsay Teshome.
