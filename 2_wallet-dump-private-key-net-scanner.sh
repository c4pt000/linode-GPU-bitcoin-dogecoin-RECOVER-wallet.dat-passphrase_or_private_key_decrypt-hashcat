#!/bin/bash

./bitcoin-tool \
    --network bitcoin \
    --input-type private-key \
    --input-format raw \
    --input-file key.bin \
    --output-type private-key-wif \
    --output-format base58check \
    --public-key-compression compressed
