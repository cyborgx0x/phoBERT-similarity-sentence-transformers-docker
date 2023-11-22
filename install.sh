#!/bin/bash

pip install torch==2.1.0+cpu -f https://download.pytorch.org/whl/torch_stable.html

pip install transformers
pip install vncorenlp
pip install fairseq
pip install fastbpe
pip install fastapi
pip install uvicorn
pip install pyngrok
pip install pyyaml
pip install numpy
pip install scipy
pip install "uvicorn[standard]"

mkdir -p /vncorenlp/models/wordsegmenter

wget -q --show-progress https://raw.githubusercontent.com/vncorenlp/VnCoreNLP/master/VnCoreNLP-1.1.1.jar

wget -q --show-progress https://raw.githubusercontent.com/vncorenlp/VnCoreNLP/master/models/wordsegmenter/vi-vocab

wget -q --show-progress https://raw.githubusercontent.com/vncorenlp/VnCoreNLP/master/models/wordsegmenter/wordsegmenter.rdr

mv VnCoreNLP-1.1.1.jar /vncorenlp/

mv vi-vocab /vncorenlp/models/wordsegmenter/

mv wordsegmenter.rdr /vncorenlp/models/wordsegmenter/

git clone https://github.com/DatCanCode/sentence-transformers
cd sentence-transformers
pip install -e .
