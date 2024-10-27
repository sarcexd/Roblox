-- Tabla para almacenar los estados del jugador
local checkpoints = {}

-- Función para guardar el estado del jugador
local function saveCheckpoint()
    local player = game.Players.LocalPlayer
    if player and player.Character then
        checkpoints[player.UserId] = {
            position = player.Character.HumanoidRootPart.Position,
            health = player.Character.Humanoid.Health,
            -- Añade más datos según sea necesario
        }
        print("Checkpoint guardado.")
    end
end

-- Función para restaurar el estado del jugador
local function rollback()
    local player = game.Players.LocalPlayer
    if player and player.Character and checkpoints[player.UserId] then
        local checkpoint = checkpoints[player.UserId]
        player.Character.HumanoidRootPart.CFrame = CFrame.new(checkpoint.position)
        player.Character.Humanoid.Health = checkpoint.health
        -- Restaura más datos según sea necesario
        print("Rollback realizado.")
    else
        print("No se encontró un punto de control para este jugador.")
    end
end

-- Ejemplo de uso
saveCheckpoint() -- Guarda el estado actual
wait(10) -- Espera 10 segundos
rollback() -- Restaura el estado guardado
