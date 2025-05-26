#!/bin/bash

echo "🚀 Iniciando AI Agent Platform..."

# Verificar se GEMINI_API_KEY está configurada
if [ ! -f ai-agent-platform/backend/.env ]; then
    echo "❌ Arquivo .env não encontrado!"
    echo "📝 Criando arquivo .env..."
    cp ai-agent-platform/backend/.env.example ai-agent-platform/backend/.env
    echo ""
    echo "🔑 ATENÇÃO: Você precisa adicionar sua GEMINI_API_KEY no arquivo:"
    echo "   ai-agent-platform/backend/.env"
    echo ""
    echo "Como obter a API key:"
    echo "1. Acesse: https://makersuite.google.com/app/apikey"
    echo "2. Faça login com Google"
    echo "3. Clique 'Create API Key'"
    echo "4. Copie e cole no arquivo .env"
    echo ""
    exit 1
fi

# Verificar se a API key foi configurada
source ai-agent-platform/backend/.env
if [ -z "$GEMINI_API_KEY" ] || [ "$GEMINI_API_KEY" = "your_gemini_api_key_here" ]; then
    echo "❌ GEMINI_API_KEY não configurada!"
    echo "📝 Edite o arquivo: ai-agent-platform/backend/.env"
    echo "   Substitua 'your_gemini_api_key_here' pela sua API key real"
    echo ""
    exit 1
fi

echo "✅ Configuração OK! Iniciando serviços..."

# Iniciar backend
echo "🔧 Iniciando backend (FastAPI)..."
cd ai-agent-platform/backend
python -m uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload &
BACKEND_PID=$!

# Aguardar backend inicializar
echo "⏳ Aguardando backend inicializar..."
sleep 10

# Verificar se backend está funcionando
if curl -s http://localhost:8000/health > /dev/null; then
    echo "✅ Backend rodando em http://localhost:8000"
else
    echo "❌ Erro ao iniciar backend"
    kill $BACKEND_PID 2>/dev/null
    exit 1
fi

# Iniciar frontend
echo "🎨 Iniciando frontend (React)..."
cd ../frontend
npm start &
FRONTEND_PID=$!

echo ""
echo "🎉 SUCESSO! Seu AI Agent Platform está rodando:"
echo ""
echo "🌐 Frontend: http://localhost:3000"
echo "🔧 Backend:  http://localhost:8000"
echo "📖 API Docs: http://localhost:8000/docs"
echo ""
echo "📝 Para testar, use o prompt:"
echo "   'Research AI advancements in 2024 and summarize 3 key points'"
echo ""
echo "⏹️  Para parar: Ctrl+C"

# Aguardar interrupção
wait