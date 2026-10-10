# MuRazor | Server Files Season 19

A pedidos de muitos após a apresentação do MuRazor, estou publicando a server files e explicando como funciona a configuração! O Painel Web fica à parte, para quem for criar.

## Download

- **Server files:** https://github.com/l4k-dev/ServerFiles-Mu-Season-19-
- **Cliente (MuRazor Beta):** https://www.mediafire.com/file/1aya8wvb0qdezsg/MuRazor-beta.zip/file (muito grande para o GitHub)
- **VC++ / .NET Framework etc.:** https://www.mediafire.com/file/42rt5ixssaanvnd/vc%252B%252Bnetframeworketc.rar/file


git clone https://github.com/l4k-dev/ServerFiles-Mu-Season-19-.git

## Requisitos

- **Windows Server** (os executáveis só rodam em Windows Server)
- **VC++** instalado (link acima)
- MySQL ou MariaDB
- Acesso de administrador para liberar o firewall

## Componentes e arquivos de configuração

| Componente | Função | Arquivo de configuração |
|---|---|---|
| **ConnectServer** | Porta de entrada: entrega ao cliente a lista de servidores | `ConnectServer/connectserver.conf` |
| **LoginServer (AuthServer)** | Valida login/senha e controla sessões | `LoginServer/loginserver.conf` |
| **ServerLink** | Comunicação entre as instâncias de GameServer | `ServerLink/serverlink.conf` |
| **BattleCore** | Serviço de batalha/eventos (porta 44411) | configurado em `Data/game_common.conf` |
| **GameServers** (Regular, SubServer, ArkaWar, Event, Siege) | Regular e SubServer aparecem na lista; ArkaWar, Event e Siege são ocultos e dedicados a eventos | `Data/game_common.conf` e `Data/ServerMap.xml` |
| **Editor** | Painel interno da VPS para gerenciar servidor e banco | `Editor/Config.xml` |

## Passo a passo

### 1. Banco de dados (MySQL/MariaDB)

1. Instale o MySQL ou MariaDB e deixe o serviço ligado.
2. Crie os bancos **`muonline`** e **`log`** (esses nomes exatos).
3. Importe `database/muonline.sql` no banco `muonline`.
4. Importe `database/log.sql` no banco `log`.

O banco pode ficar em **qualquer máquina** (veja "Arquitetura distribuída").

### 2. Configurar o ConnectServer

Arquivo: **`ConnectServer/connectserver.conf`**

**a) IP dos jogadores** (obrigatório). Troque pelo IP da sua VPS:

```properties
# antes
Network.BindIP = "192.168.0.189"
# depois
Network.BindIP = "SEU_IP"
```

**b) Senha do banco.** Troque `SUA_SENHA_AQUI` pela senha do seu MySQL:

```properties
Login.Database.Info = "127.0.0.1;3306;root;SUA_SENHA_AQUI;muonline"
```

**c) Não alterar:**

```properties
Network.Port = 44405          # porta dos jogadores
CSNetwork.BindIP = "127.0.0.1" # canal interno com os GameServers
CSNetwork.Port = 44419
```

### 3. Configurar o LoginServer

Arquivo: **`LoginServer/loginserver.conf`**

Só a senha do banco:

```properties
Login.Database.Info = "127.0.0.1;3306;root;SUA_SENHA_AQUI;muonline"
```

`LoginNetwork.BindIP = "127.0.0.1"` e `LoginNetwork.Port = 44417` ficam como estão.

### 4. Configurar o ServerLink

Arquivo: **`ServerLink/serverlink.conf`**

Só a senha do banco:

```properties
Mu.Database.Info = "127.0.0.1;3306;root;SUA_SENHA_AQUI;muonline"
```

`Network.BindIP = "127.0.0.1"` e `Network.Port = 55555` ficam como estão.

### 5. Configurar os GameServers

**a) Senha do banco.** Arquivo: **`Data/game_common.conf`**, seção `DATABASE`. A senha aparece **3 vezes**, troque nas três:

```properties
Mu.Database.Info    = "127.0.0.1;3306;root;SUA_SENHA_AQUI;muonline"
Login.Database.Info = "127.0.0.1;3306;root;SUA_SENHA_AQUI;muonline"
MuLog.Database.Info = "127.0.0.1;3306;root;SUA_SENHA_AQUI;log"
```

**b) IPs da seção `SOFTWARES`** (mesmo arquivo). Com tudo na mesma máquina, deixe `127.0.0.1`. Só troque se o serviço estiver em outra máquina:

```properties
ServerLink.BindIP    = "127.0.0.1"   # porta 55555
AuthServer.BindIP    = "127.0.0.1"   # porta 44417
ConnectServer.BindIP = "127.0.0.1"   # porta 44419
BattleCore.BindIP    = "127.0.0.1"   # porta 44411
```

**c) IP da lista de servidores.** Arquivo: **`Data/ServerMap.xml`**. Troque `ServerIP` nas **5 linhas** (Regular, SubServer, ArkaWar, Event, Siege) pelo mesmo `SEU_IP` do ConnectServer. É deste arquivo que o cliente recebe o IP dos GameServers:

```xml
<Server ServerIndex="0" ... ServerPort="55501" ServerIP="SEU_IP" ... />
```

| ServerIndex | Nome | Porta | Na lista (`Display`) |
|---|---|---|---|
| 0 | Regular | 55501 | Sim |
| 1 | SubServer | 55502 | Sim |
| 17 | ArkaWar | 55517 | Não |
| 18 | Event | 55518 | Não |
| 19 | Siege | 55519 | Não |

### 6. Configurar o Editor

Arquivo: **`Editor/Config.xml`**

```xml
<DataFolder>C:\MuServer\Data</DataFolder>   <!-- caminho real da pasta Data na sua VPS -->
<DbPassword>SUA_SENHA_AQUI</DbPassword>     <!-- senha do MySQL -->
```

Não altere `DbUser`, `DbServerIP` (se o banco for local), `DbServerPort`, `LoginDbName` e `CharDbnNme`.

> Não corrija a tag `<CharDbnNme>`: o nome está assim no programa.

O Editor é uma ferramenta interna. Use-o apenas dentro da VPS e não o exponha à internet.

### Resumo: o que alterar em cada arquivo

| Arquivo | IP | Senha do banco |
|---|---|---|
| `ConnectServer/connectserver.conf` | `Network.BindIP` | `Login.Database.Info` (1x) |
| `LoginServer/loginserver.conf` | não | `Login.Database.Info` (1x) |
| `ServerLink/serverlink.conf` | não | `Mu.Database.Info` (1x) |
| `Data/game_common.conf` | não (só se distribuído) | 3x |
| `Data/ServerMap.xml` | `ServerIP` (5 linhas) | não tem |
| `Editor/Config.xml` | não | `DbPassword` (1x) + `DataFolder` |

### 7. Portas e firewall

As portas precisam ser liberadas em **dois lugares**:

1. **Firewall da VPS** (painel do provedor)
2. **Firewall do Windows** (Windows Defender Firewall com Segurança Avançada)

Se liberar só em um, o servidor não fica acessível.

| Portas | Uso |
|---|---|
| `3306` | MySQL |
| `44405-44419` | ConnectServer (44405 jogadores, 44419 interna), AuthServer (44417), BattleCore (44411) |
| `55501-55555` | GameServers (55501, 55502, 55517, 55518, 55519) e ServerLink (55555) |
| `6446`, `6449` | Portas extras do pacote |

Liberar no Windows (PowerShell como administrador):

```powershell
New-NetFirewallRule -DisplayName "MU ConnectLogin" -Direction Inbound -Protocol TCP -LocalPort 44405-44419 -Action Allow
New-NetFirewallRule -DisplayName "MU GameServers"  -Direction Inbound -Protocol TCP -LocalPort 55501-55555 -Action Allow
New-NetFirewallRule -DisplayName "MU Extras"       -Direction Inbound -Protocol TCP -LocalPort 6446,6449   -Action Allow
New-NetFirewallRule -DisplayName "MU MySQL"        -Direction Inbound -Protocol TCP -LocalPort 3306        -Action Allow
```

> **Banco na mesma máquina:** a porta 3306 não precisa ser aberta.
> **Banco em outra máquina:** abra a 3306 somente para o IP do servidor de jogo (`-RemoteAddress IP_DO_JOGO`). Nunca deixe o MySQL aberto para toda a internet.

### 8. Iniciar os serviços

Ligue o banco primeiro e depois abra cada executável (todos precisam estar rodando):

1. MySQL/MariaDB (serviço do Windows ligado)
2. LoginServer
3. ServerLink
4. `ConnectServer.exe`
5. BattleCore
6. GameServer principal (Regular e SubServer)
7. ArkaWar, Event e Siege

Todos os GameServers precisam estar ligados para o servidor funcionar por completo.

### 9. Configurar o cliente

1. Baixe e extraia o cliente (link acima).
2. Abra o `Config.ini` do cliente.
3. Altere o IP para o **IP do ConnectServer**, o mesmo valor de `Network.BindIP` em `ConnectServer/connectserver.conf` (porta 44405).

### 10. Testar

1. Crie uma conta (pelo painel web ou direto no banco).
2. Abra o cliente, faça login e escolha o servidor.
3. Confirme que o personagem entra no mapa.

## Integração com painel web

O hash de senha **não é MD5 nem texto puro**. O servidor usa **SHA-256 de `conta:senha`**, em hexadecimal minúsculo (64 caracteres). Essa informação não vem documentada na base e foi descoberta descompactando a server files.

```csharp
using System.Security.Cryptography;
using System.Text;

namespace MuSite.Services
{
    public static class MuPasswordHasher
    {
        public static string Hash(string account, string password)
        {
            using var sha = SHA256.Create();
            string combo = $"{account}:{password}";

            byte[] bytes = Encoding.UTF8.GetBytes(combo);
            byte[] hash = sha.ComputeHash(bytes);

            var sb = new StringBuilder();
            foreach (byte b in hash)
                sb.Append(b.ToString("x2"));

            return sb.ToString();
        }
    }
}
```

Use esse mesmo formato no cadastro e no login do site, caso contrário o jogador não consegue entrar no jogo.

## Arquitetura distribuída (avançado)

O banco pode ficar em qualquer lugar, o que permite uma arquitetura distribuída:

1. Troque `127.0.0.1` pelo IP do banco nestes arquivos:
   - `ConnectServer/connectserver.conf` → `Login.Database.Info`
   - `LoginServer/loginserver.conf` → `Login.Database.Info`
   - `ServerLink/serverlink.conf` → `Mu.Database.Info`
   - `Data/game_common.conf` → as 3 strings da seção `DATABASE`
   - `Editor/Config.xml` → `<DbServerIP>`
2. No MySQL, permita conexões remotas (`bind-address`).
3. Crie um usuário próprio, liberado só para o IP do servidor de jogo, em vez de usar `root`.
4. Libere a porta 3306 apenas para esse IP (ou use VPN/rede privada).
5. Mantenha o banco na mesma região do servidor de jogo, para evitar latência.

O painel web também usa o mesmo banco e pode ficar em uma terceira máquina, com o mesmo cuidado.

## Segurança

- Nunca publique senhas reais nem caminhos pessoais no repositório.
- Não exponha o MySQL nem o Editor à internet.
- No site: HTTPS, limite de tentativas de login e consultas parametrizadas.
- O SHA-256 com o nome da conta como único "salt" é fraco se o banco vazar. Proteja o banco.
- Prefira um usuário MySQL dedicado em vez de `root`.
