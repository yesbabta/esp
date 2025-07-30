-- Серверный скрипт для изменения параметров персонажа

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        local humanoid = character:WaitForChild("Humanoid")

        -- Стандартные параметры
        humanoid.WalkSpeed = 16 -- стандартная скорость
        humanoid.JumpPower = 50 -- стандартная сила прыжка

        -- Ждем сигнал от клиента для обновления параметров
        local event = player:WaitForChild("PlayerSettingsEvent")

        event.OnServerEvent:Connect(function(plr, walkSpeed, jumpPower, gravity)
            if plr == player then
                if walkSpeed then humanoid.WalkSpeed = walkSpeed end
                if jumpPower then humanoid.JumpPower = jumpPower end
                if gravity then
                    game.Workspace.Gravity = gravity
                end
            end
        end)
    end)
end)
