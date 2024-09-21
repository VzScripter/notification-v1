Download: https://github.com/VzScripter/notification-v1/releases

# 📧 Sistema de Notificação

- Um sistema simples para e efetivo para criar notificações aos jogadores.

# Funções Exportáveis:

### Função "add"
Essa função irá adicionar uma notificação na tela de um jogador específico.

## Server
```lua
exports['notification-v1']:add(element, message, type, [time, priority, tickSended])
```
## Client
```lua
exports['notification-v1']:add(message, type, [time, priority, tickSended])
```

### Função "addToAllPlayers"
Essa função irá adicionar uma notificação na tela de todos os jogadores do servidor (Recomendado usar pois sincroniza a notificação com todos os jogadores, tanto antes quanto depois de entrar no server).

## Server
```lua
exports['notification-v1']:addToAllPlayers(message, type, [time])
```

# Créditos

Código: `vzscr`
Design: `araujox7`
