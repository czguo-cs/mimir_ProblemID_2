#!/bin/bash

version=table1
ngram=13
export MIMIR_CACHE_PATH=/share/home/czguo/research/data_dectection/mimir/local/cache_data
export MIMIR_DATA_SOURCE=/share/home/czguo/research/data_dectection/mimir/local/cache_data
# for model in "pythia-160m" "pythia-1.4b" "pythia-2.8b" "pythia-6.9b" "pythia-12b"
for model in "pythia-160m"
do
    # for subset in "wikipedia_(en)" "github" "pile_cc" "pubmed_central" "arxiv" "dm_mathematics" "hackernews"
    for subset in "github"
    do
        python run.py \
            --config configs/test_config.json \
            --revision step99000 \
            --base_model "/share/home/czguo/model/EleutherAI/${model}-deduped" \
            --specific_source ${subset}_ngram_${ngram}_0.8\
            --output_name $version
    done 
    
    # /local/cache_data/cache_100_200_1000_512/test/wikipedia_(en)_ngram_13_0.8.jsonl
    # # full_pile specifically
    # python run.py \
    #         --config configs/mi.json \
    #         --revision step99000 \
    #         --base_model "EleutherAI/${model}-deduped" \
    #         --specific_source "full_pile" \
    #         --output_name $version
    #         --n_samples 10000
done



