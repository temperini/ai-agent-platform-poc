# 🚀 AI Agent Platform - GitHub Codespaces

## 📝 Como Publicar Seu Projeto em 5 Passos Simples

### 1️⃣ Criar Repositório no GitHub
```bash
# 1. Acesse: https://github.com/new
# 2. Nome do repositório: ai-agent-platform-poc
# 3. Marque: ✅ Public
# 4. Marque: ✅ Add README
# 5. Clique: "Create repository"
```

### 2️⃣ Fazer Upload dos Arquivos
```bash
# Opção A: Via Interface Web
# 1. Na página do seu repositório
# 2. Clique "uploading an existing file"
# 3. Arraste TODA a pasta "ai-agent-platform" 
# 4. Arraste também os arquivos da raiz:
#    - start_project.sh
#    - check_health.sh  
#    - README_CODESPACES.md
# 5. Clique "Commit changes"

# Opção B: Via Git (se souber usar)
git clone https://github.com/SEU_USUARIO/ai-agent-platform-poc
cd ai-agent-platform-poc
# [copie todos os arquivos aqui]
git add .
git commit -m "Initial commit: AI Agent Platform POC"
git push
```

### 3️⃣ Abrir GitHub Codespaces
```bash
# 1. Na página do seu repositório
# 2. Clique no botão verde "Code"
# 3. Aba "Codespaces"
# 4. Clique "Create codespace on main"
# 5. AGUARDE 3-5 minutos (vai configurar tudo automaticamente!)
```

### 4️⃣ Configurar API Key do Gemini
```bash
# No terminal do Codespaces:

# 1. Obter API Key:
# - Acesse: https://makersuite.google.com/app/apikey
# - Login com Google → Create API Key → Copie

# 2. Configurar no projeto:
cd ai-agent-platform/backend
nano .env

# 3. Substitua "your_gemini_api_key_here" pela sua API key real
# 4. Salve: Ctrl+X → Y → Enter
```

### 5️⃣ Executar o Projeto
```bash
# No terminal:
cd /workspaces/ai-agent-platform-poc
./start_project.sh

# ✅ Pronto! Vai abrir automaticamente no browser
```

---

## 🎯 URLs do Seu Projeto

Após executar, você terá:
- **🌐 Interface Principal**: `https://SEU_CODESPACE-3000.app.github.dev`
- **🔧 API Backend**: `https://SEU_CODESPACE-8000.app.github.dev`  
- **📖 Documentação API**: `https://SEU_CODESPACE-8000.app.github.dev/docs`

---

## 🧪 Testando o Projeto

### Prompt Principal (POC):
```
Research the main advancements in artificial intelligence in 2024 and then provide a summary of the 3 most important points
```

### Outros Prompts para Testar:
```
Research quantum computing developments and summarize 5 key points

Analyze renewable energy trends and highlight the top 2 innovations

Study machine learning frameworks and provide 4 main conclusions
```

---

## 🛠️ Comandos Úteis

### Verificar Status:
```bash
./check_health.sh
```

### Reiniciar Projeto:
```bash
# Ctrl+C para parar
./start_project.sh
```

### Ver Logs:
```bash
# Backend logs
cd ai-agent-platform/backend
tail -f logs/app.log

# Frontend logs
cd ai-agent-platform/frontend  
npm run build
```

---

## 🆘 Solução de Problemas

### ❌ "GEMINI_API_KEY não configurada"
```bash
# Solução:
cd ai-agent-platform/backend
nano .env
# Substitua "your_gemini_api_key_here" pela API key real
```

### ❌ "Backend não conecta"
```bash
# Solução:
# 1. Verifique se porta 8000 está liberada
# 2. Reinicie: Ctrl+C → ./start_project.sh
# 3. Aguarde 30 segundos antes de testar
```

### ❌ "Dependências não instalam"
```bash
# Solução:
cd ai-agent-platform/backend && pip install -e .
cd ../frontend && npm install
```

### ❌ "Página não carrega"
```bash
# Solução:
# 1. Aguarde até ver "compiled successfully"
# 2. Use HTTPS (não HTTP) nas URLs
# 3. Verifique se Codespace está ativo
```

---

## 🎉 Parabéns!

Agora você tem seu **AI Agent Platform** rodando no GitHub Codespaces!

### ✅ O que você consegue fazer:
- **Testar** diferentes prompts de pesquisa
- **Visualizar** fluxos de agentes AI
- **Configurar** parâmetros dos agentes
- **Executar** workflows completos
- **Compartilhar** com amigos e colegas

### 🔗 Próximos Passos:
- Experimente diferentes prompts
- Mostre para outras pessoas
- Explore a documentação da API
- Customize os agentes para suas necessidades

**Seu projeto está ONLINE e funcionando! 🚀**