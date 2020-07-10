#!/bin/bash

echo "Number of alive subdomains:"
echo "$(cat $1 | httprobe | grep https)"
echo "Count:"
echo "$(cat $1 | httprobe | grep https | wc -l )"


