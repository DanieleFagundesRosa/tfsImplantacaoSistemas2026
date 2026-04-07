#!/bin/bash
echo "Monitorando saúde dos serviços..."
# Faz uma chamada simples para a sua API e exibe o resultado
curl -s http://localhost:5000/health/status