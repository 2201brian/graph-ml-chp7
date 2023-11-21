FROM python:3.8
FROM jupyter/minimal-notebook:1aac87eb7fa5
WORKDIR /usr/src/app
COPY requirements.txt ./requirements.txt
COPY 01_nlp_graph_creation.ipynb ./01_nlp_graph_creation.ipynb
COPY 02_supervised_classification-embeddings.ipynb ./02_supervised_classification-embeddings.ipynb
COPY 03_supervised_classsification_graphSAGE-TFIDF.ipynb ./03_supervised_classsification_graphSAGE-TFIDF.ipynb
COPY subject_object_extraction.py ./subject_object_extraction.py
RUN pip3  install -r requirements.txt
RUN pip3 install --upgrade --no-deps --force-reinstall notebook
#
RUN pip3 install jupyterthemes
RUN pip3 install --upgrade jupyterthemes
RUN pip3 install jupyter_contrib_nbextensions
RUN jupyter contrib nbextension install --user
# enable the Nbextensions
RUN jupyter nbextension enable contrib_nbextensions_help_item/main
RUN jupyter nbextension enable autosavetime/main
RUN jupyter nbextension enable codefolding/main
RUN jupyter nbextension enable code_font_size/code_font_size
RUN jupyter nbextension enable code_prettify/code_prettify
RUN jupyter nbextension enable collapsible_headings/main
RUN jupyter nbextension enable comment-uncomment/main
RUN jupyter nbextension enable equation-numbering/main
RUN jupyter nbextension enable execute_time/ExecuteTime
RUN jupyter nbextension enable gist_it/main
RUN jupyter nbextension enable hide_input/main
RUN jupyter nbextension enable spellchecker/main
RUN jupyter nbextension enable toc2/main
RUN jupyter nbextension enable toggle_all_line_numbers/main
# gensim
RUN pip uninstall --yes gensim && pip install gensim==3.8.3
