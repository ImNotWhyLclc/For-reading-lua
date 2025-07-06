-- Load WindUI
local WindUI = loadstring(game:HttpGet("https://github.com/Footagesus/WindUI/releases/latest/download/main.lua"))()
WindUI:SetTheme("Dark")

-- Services
local Players            = game:GetService("Players")
local RunService         = game:GetService("RunService")
local UserInputService   = game:GetService("UserInputService")
local ReplicatedStorage  = game:GetService("ReplicatedStorage")
local plr = Players.LocalPlayer

-- Version fetching
local version = "Fetching..."
local function fetchVersion()
    pcall(function()
        local txt = game:HttpGet("https://raw.githubusercontent.com/ImNotWhyLclc/Rendex/refs/heads/main/RendexInkGame.Version")
        version = txt:match("(%S+)") or version
    end)
end
fetchVersion()
task.spawn(function()
    while task.wait(30) do fetchVersion() end
end)

-- Changelog text
local changelogText = [[
• Teleport: Safe Position, Piggy Bank, Glass Bridge, RLG End, Injured Player  
• Ultra-Rapid Auto Tug of War  
• Auto Skip Cutscenes, Glass Vision  
• Boost Sliders, Infinite Jump, NoClip, Anti-Fling  
• Strong WalkFling (persistent)  
• Kill Aura (Radius & Damage sliders)  
• Emote Player with fallback anim + audio  
]]

-- Create Window and Tabs
local Window       = WindUI:CreateWindow({
    Title  = "Rendex Ink Game",
    Icon   = "ink-pen",
    Author = "Ren",
    Folder = "RendexInkGame",
    Size   = UDim2.fromOffset(600, 800),
})
local HomeTab     = Window:Tab({ Title = "Home",     Icon = "house" })
local MainTab     = Window:Tab({ Title = "Main",     Icon = "layout-grid" })
local PlayerTab   = Window:Tab({ Title = "Player",   Icon = "user" })
local SettingsTab = Window:Tab({ Title = "Settings", Icon = "settings" })

Window:EditOpenButton({
    Title     = "Toggle UI",
    Icon      = "menu",
    Draggable = true,
    Callback  = function(open) if open then Window:SelectTab(HomeTab) end end,
})
Window:SelectTab(HomeTab)

-- Config manager
local myConfig = Window.ConfigManager:CreateConfig("RendexInkGame")
local function notify(title, content, icon)
    WindUI:Notify({ Title = title, Content = content, Icon = icon or "zap", Duration = 3 })
end

-- ============ HOME TAB ============
local homeSection = HomeTab:Section({ Title = "Welcome" })

homeSection:Paragraph({
    Title = function()
        return "Rendex Ink Game • Version " .. version
    end,
    Desc = "Auto-refreshing every 30 seconds",
})
homeSection:Paragraph({
    Title = changelogText,
    Desc = "",
})

-- ============ MAIN TAB ============
local mainSection = MainTab:Section({ Title = "Teleports & Features" })

-- Teleport Buttons
for _, info in ipairs({
    {"Safe Position",       "shield-check", CFrame.new(197,123,-92)},
    {"Piggy Bank",          "piggy-bank",   CFrame.new(200,90,-94)},
    {"End of Glass Bridge", "flag",         CFrame.new(-209,521,-1533)},
    {"RLG End",             "map-pin",      CFrame.new(-45,1024,105)},
}) do
    mainSection:Button({
        Title    = "Teleport to " .. info[1],
        Icon     = info[2],
        Callback = function()
            local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
            if hrp then hrp.CFrame = info[3] end
        end,
    })
end

-- Teleport to Injured Player
mainSection:Button({
    Title    = "Teleport to Injured Player",
    Icon     = "ambulance",
    Callback = function()
        for _, p in ipairs(Players:GetPlayers()) do
            local model = workspace.Live:FindFirstChild(p.Name)
            if model then
                local inj = model:FindFirstChild("InjuredWalking")
                if inj and inj:GetAttribute("LegName") then
                    local hrp = model:FindFirstChild("HumanoidRootPart")
                    local myHRP = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                    if hrp and myHRP then
                        myHRP.CFrame = hrp.CFrame
                        notify("Teleported", "To injured player: "..p.Name)
                        return
                    end
                end
            end
        end
        notify("No injured found", "", "alert-circle")
    end,
})

-- Auto Tug of War
local tugConn
local tugToggle = mainSection:Toggle({
    Title = "Auto Tug of War",
    Icon = "shuffle",
    Value = false,
    Callback = function(on)
        if tugConn then tugConn:Disconnect() end
        if on then
            tugConn = RunService.Heartbeat:Connect(function()
                for i = 1, 100 do
                    ReplicatedStorage.Remotes.TemporaryReachedBindable:FireServer({{QTEGood = true}})
                end
            end)
        end
    end,
})
myConfig:Register("autoTug", tugToggle)

-- Auto Skip
local skipToggle = mainSection:Toggle({
    Title = "Auto Skip Cutscenes",
    Icon = "skip-forward",
    Value = false,
    Callback = function(v) _G.AutoSkip = v end,
})
myConfig:Register("autoSkip", skipToggle)
RunService.RenderStepped:Connect(function()
    if _G.AutoSkip then
        ReplicatedStorage.Remotes.DialogueRemote:FireServer("Skipped")
    end
end)

-- Glass Vision
mainSection:Button({
    Title = "Glass Vision",
    Icon = "eye",
    Callback = function()
        local count = 0
        local holder = workspace:FindFirstChild("GlassBridge") and workspace.GlassBridge:FindFirstChild("GlassHolder")
        if holder then
            for _, pnl in ipairs(holder:GetChildren()) do
                if pnl.Name:match("Cloned?Panel%d+") then
                    for _, mName in ipairs({"glassmodel1", "glassmodel2"}) do
                        local model = pnl:FindFirstChild(mName)
                        if model then
                            for _, part in ipairs(model:GetDescendants()) do
                                if part:IsA("BasePart") and part.Name == "glasspart"
                                   and (part:GetAttribute("exploitingisevil") or part:GetAttribute("delayedbreak")) then
                                    part.Color = Color3.new(1, 0, 0)
                                    count += 1
                                end
                            end
                        end
                    end
                end
            end
        end
        notify("Glass Vision", "Tinted " .. count .. " parts")
    end,
})

-- ============ PLAYER TAB ============
local playerSection = PlayerTab:Section({ Title = "Player Settings" })

-- Boost Sliders
for _, name in ipairs({"Damage Boost", "Faster Sprint", "Won Boost"}) do
    local def = (plr:FindFirstChild("Boosts") and plr.Boosts:FindFirstChild(name) or {Value=0}).Value
    local slider = playerSection:Slider({
        Title = name,
        Value = {Min = 0, Max = 100, Default = def},
        Callback = function(v)
            local b = plr:FindFirstChild("Boosts") and plr.Boosts:FindFirstChild(name)
            if b then b.Value = v end
        end,
    })
    myConfig:Register("boost_" .. name:gsub(" ", ""), slider)
end

-- Infinite Jump
local ijToggle = playerSection:Toggle({
    Title = "Infinite Jump",
    Icon = "arrow-up-right",
    Value = false,
    Callback = function(v) _G.InfJump = v end,
})
myConfig:Register("infJump", ijToggle)
UserInputService.JumpRequest:Connect(function()
    if _G.InfJump and plr.Character then
        plr.Character:FindFirstChildOfClass("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
    end
end)

-- NoClip
local ncToggle = playerSection:Toggle({
    Title = "NoClip",
    Icon = "slash",
    Value = false,
    Callback = function(v) _G.NoClip = v end,
})
myConfig:Register("noClip", ncToggle)
RunService.Stepped:Connect(function()
    if _G.NoClip and plr.Character then
        for _, part in ipairs(plr.Character:GetDescendants()) do
            if part:IsA("BasePart") then part.CanCollide = false end
        end
    end
end)

-- Anti-Fling
local afToggle = playerSection:Toggle({
    Title = "Anti Fling",
    Icon = "shield-off",
    Value = false,
    Callback = function(v) _G.AntiFling = v end,
})
myConfig:Register("antiFling", afToggle)
RunService.Stepped:Connect(function()
    if _G.AntiFling then
        for _, p in ipairs(Players:GetPlayers()) do
            if p ~= plr and p.Character then
                for _, part in ipairs(p.Character:GetDescendants()) do
                    if part:IsA("BasePart") then part.CanCollide = false end
                end
            end
        end
    end
end)

-- WalkFling (Strong)
local wfConn
local wfToggle = playerSection:Toggle({
    Title = "WalkFling",
    Icon  = "move",
    Value = false,
    Callback = function(on)
        if wfConn then wfConn:Disconnect() end
        if on then
            wfConn = RunService.Heartbeat:Connect(function()
                local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if hrp then
                    local v = hrp.Velocity
                    hrp.Velocity = v * 300000 + Vector3.new(0, 300000, 0)
                    RunService.RenderStepped:Wait()
                    hrp.Velocity = v
                end
            end)
        end
    end,
})
myConfig:Register("walkFling", wfToggle)
plr.CharacterAdded:Connect(function()
    task.wait(1)
    if wfToggle.Value then wfToggle:Toggle(true) end
end)

-- Kill Aura
local kaRad, kaDmg = 10, 25
local sliderR = playerSection:Slider({
    Title = "Kill Aura Radius",
    Value = {Min = 1, Max = 50, Default = kaRad},
    Callback = function(v) kaRad = v end,
})
myConfig:Register("kaRadius", sliderR)
local sliderD = playerSection:Slider({
    Title = "Kill Aura Damage",
    Value = {Min = 1, Max = 100, Default = kaDmg},
    Callback = function(v) kaDmg = v end,
})
myConfig:Register("kaDamage", sliderD)
playerSection:Toggle({
    Title = "Kill Aura",
    Icon = "zap",
    Value = false,
    Callback = function(on)
        _G.KillAura = on
        if on then
            RunService.Heartbeat:Connect(function()
                local hrp = plr.Character and plr.Character:FindFirstChild("HumanoidRootPart")
                if not hrp then return end
                for _, p in ipairs(Players:GetPlayers()) do
                    if p ~= plr and p.Character then
                        local oth = p.Character and p.Character:FindFirstChild("HumanoidRootPart")
                        if oth and (oth.Position - hrp.Position).Magnitude <= kaRad then
                            ReplicatedStorage.Remotes.DealDamage:FireServer(p, kaDmg)
                        end
                    end
                end
            end)
        end
    end
})

-- Emote Player
local emotes = {"RAT SPOTTED", "Laugh"}
local selected = emotes[1]
playerSection:Dropdown({
    Title = "Select Emote",
    Values = emotes,
    Value = selected,
    Callback = function(v) selected = v end,
})
playerSection:Button({
    Title = "Play Emote",
    Icon  = "smile",
    Callback = function()
        -- Fire server attempt
        ReplicatedStorage.Replication.Event:FireServer({
            event = "playEmote",
            emoteName = selected
        })
        -- Fallback for RAT SPOTTED
        if selected == "RAT SPOTTED" then
            local anim = Instance.new("Animation")
            anim.AnimationId = "rbxassetid://129390844140095"
            local hum = plr.Character and plr.Character:FindFirstChildOfClass("Humanoid")
            if hum then hum:LoadAnimation(anim):Play() end

            local sound = Instance.new("Sound")
            sound.SoundId = "rbxassetid://110121545610542"
            sound.Volume = 1
            sound.Parent = plr.Character:FindFirstChild("Head") or plr.Character
            sound:Play()
            game.Debris:AddItem(sound, 5)
        end
    end,
})

-- ============ SETTINGS TAB ============
local settingsSection = SettingsTab:Section({ Title = "Settings" })

settingsSection:Dropdown({
    Title = "Anti-Mod Action",
    Values = {"Off", "Warn", "Kick"},
    Value = "Off",
    Multi = false,
    Callback = function(v) _G.AntiModAction = v end
})
settingsSection:Button({
    Title = "Save Config",
    Icon  = "save",
    Callback = function()
        local ok, err = pcall(myConfig.Save, myConfig)
        notify("Config", ok and "Saved" or err)
    end
})
settingsSection:Button({
    Title = "Load Config",
    Icon  = "download",
    Callback = function()
        local ok, err = pcall(myConfig.Load, myConfig)
        notify("Config", ok and "Loaded" or err)
    end
})
settingsSection:Button({
    Title = "Reset Config",
    Icon  = "refresh-ccw",
    Callback = function()
        local ok, err = pcall(myConfig.Reset, myConfig)
        notify("Config", ok and "Reset" or err)
    end
})

-- Load saved config (auto-load)
pcall(function() myConfig:Load() end)
