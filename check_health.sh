#!/bin/bash

echo "🔍 Verificando saúde do AI Agent Platform..."

echo ""
echo "📋 CHECKLIST DE CONFIGURAÇÃO:"

# 1. Verificar Python
python_version=$(python --version 2>&1)
if [[ $python_version == *"3.11"* ]] || [[ $python_version == *"3.12"* ]]; then
    echo "✅ Python: $python_version"
else
    echo "❌ Python: $python_version (precisa 3.11+)"
fi

# 2. Verificar Node.js
node_version=$(node --version 2>&1)
if [[ $node_version == *"v18"* ]] || [[ $node_version == *"v19"* ]] || [[ $node_version == *"v20"* ]]; then
    echo "✅ Node.js: $node_version"
else
    echo "❌ Node.js: $node_version (precisa v18+)"
fi

# 3. Verificar dependências Python
echo ""
echo "📦 DEPENDÊNCIAS PYTHON:"
cd ai-agent-platform/backend
if pip list | grep -q "fastapi"; then
    echo "✅ FastAPI instalado"
else
    echo "❌ FastAPI não encontrado"
fi

if pip list | grep -q "uvicorn"; then
    echo "✅ Uvicorn instalado"
else
    echo "❌ Uvicorn não encontrado"
fi

# 4. Verificar dependências Node.js
echo ""
echo "📦 DEPENDÊNCIAS NODE.JS:"
cd ../frontend
if [ -d "node_modules" ]; then
    echo "✅ Node modules instalados"
else
    echo "❌ Node modules não encontrados"
fi

# 5. Verificar arquivo .env
echo ""
echo "🔑 CONFIGURAÇÃO API:"
cd ../backend
if [ -f ".env" ]; then
    source .env
    if [ -n "$GEMINI_API_KEY" ] && [ "$GEMINI_API_KEY" != "your_gemini_api_key_here" ]; then
        echo "✅ GEMINI_API_KEY configurada"
    else
        echo "❌ GEMINI_API_KEY não configurada"
        echo "   📝 Edite: ai-agent-platform/backend/.env"
        echo "   🔗 Obtenha em: https://makersuite.google.com/app/apikey"
    fi
else
    echo "❌ Arquivo .env não encontrado"
    echo "   📝 Copie: cp .env.example .env"
fi

# 6. Verificar serviços (se estiverem rodando)
echo ""
echo "🌐 SERVIÇOS:"
if curl -s http://localhost:8000/health > /dev/null 2>&1; then
    echo "✅ Backend rodando (porta 8000)"
else
    echo "⚪ Backend não está rodando"
fi

if curl -s http://localhost:3000 > /dev/null 2>&1; then
    echo "✅ Frontend rodando (porta 3000)"
else
    echo "⚪ Frontend não está rodando"
fi

echo ""
echo "🚀 PRÓXIMOS PASSOS:"
echo "1. Se algo está ❌, resolva primeiro"
echo "2. Configure GEMINI_API_KEY se necessário"
echo "3. Execute: ./start_project.sh"
echo ""