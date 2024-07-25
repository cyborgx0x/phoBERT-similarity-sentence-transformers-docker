# Vietnamese Keyword Extraction

This project implements an advanced method for extracting keywords from Vietnamese text using a combination of natural language processing techniques, statistical measures, and semantic analysis.

## Features

- Extracts explicit keywords from Vietnamese text using multiple techniques
- Identifies implicit keywords not present in the original text but semantically related
- Uses semantic similarity to rank and filter keywords
- Adapts to various text types and domains in Vietnamese
- Combines explicit and implicit keywords for comprehensive representation

## Key Components

1. **Text Preprocessing**:
   - Cleans and normalizes the input Vietnamese text
   - Handles special characters and formatting issues
   - Performs text segmentation specific to Vietnamese language

2. **Explicit Keyword Extraction**: 
   - Applies part-of-speech tagging to identify nouns, adjectives, and verbs
   - Implements TF-IDF (Term Frequency-Inverse Document Frequency) to identify important words regardless of their part of speech
   - Utilizes n-gram analysis to capture multi-word phrases and collocations
   - Considers named entity recognition to identify proper nouns, organizations, and locations
   - Applies stop word removal to filter out common, less meaningful words
   - Implements lemmatization or stemming to group word variations
   - Uses frequency analysis to identify recurring terms
   - Removes duplicates and irrelevant characters

3. **Semantic Similarity Calculation**:
   - Generates embeddings for the original text and extracted keywords using pre-trained multilingual sentence transformers
   - Computes cosine similarity between text and keyword embeddings

4. **Keyword Filtering and Ranking**:
   - Sorts keywords based on their similarity scores and other relevance metrics
   - Filters out keywords below specified thresholds for similarity and importance

5. **Implicit Keyword Discovery**:
   - Identifies semantically related words not present in the original text
   - Utilizes a comprehensive Vietnamese vocabulary or word embedding model
   - Applies semantic similarity measures to find related concepts

6. **Keyword Consolidation**:
   - Combines explicit and implicit keywords
   - Produces a final ranked list of relevant keywords
   - Removes any remaining duplicates or near-duplicates

## Advantages

- Captures both explicit and implicit semantic content of the text
- Improves keyword relevance through multiple extraction techniques and semantic similarity scoring
- Enhances keyword diversity by including related concepts
- Adapts to various text types and domains in Vietnamese
- Captures a wider range of meaningful words and phrases beyond traditional part-of-speech categories
- Improves keyword extraction accuracy by combining multiple techniques
- Better handles domain-specific terminology and unique linguistic features of Vietnamese text

## Dependencies

- numpy
- scipy
- scikit-learn
- sentence_transformers
- underthesea
- pyvi

## Future Improvements

- Integration with domain-specific Vietnamese vocabularies
- Fine-tuning of pre-trained models on Vietnamese corpora
- Implementation of more advanced keyword extraction algorithms
- User interface for easy interaction and visualization of results
- Implementation of domain-specific keyword extraction rules
- Integration of machine learning models for keyword importance prediction
- Development of a Vietnamese-specific keyphrase extraction algorithm
- Expansion of the implicit keyword discovery process
- Integration with a larger Vietnamese language model for improved semantic understanding
- Development of a feedback mechanism to continually improve extraction accuracy

## Usage


## Contributing


## License


This project aims to provide a robust and comprehensive keyword extraction solution for Vietnamese text, capturing both explicit and implicit semantic content. By combining multiple extraction techniques with semantic analysis, it offers a powerful tool for understanding and summarizing Vietnamese documents across various domains.