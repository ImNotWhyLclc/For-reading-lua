-- Script Path: game:GetService("Players").ImNotWhyLclc.PlayerScripts.ClientScript
-- Took 1.29s to decompile.
-- Executor: Delta (1.0.683.774)

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-08-06 07:55:02
-- Luau version 6, Types version 3
-- Time taken: 0.092869 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local ReplicatedStorage_upvr = game:GetService("ReplicatedStorage")
local RunService_upvr = game:GetService("RunService")
local Players_upvr_2 = game:GetService("Players")
local ClientData_upvr_2 = require(ReplicatedStorage_upvr.Modules.ClientData)
local Network_upvr_2 = require(ReplicatedStorage_upvr.Modules.Network)
local Animator_upvr = require(ReplicatedStorage_upvr.Modules.Animator)
local ItemHandler_upvr = require(ReplicatedStorage_upvr.Services.ItemHandler)
local Functions_upvr = require(ReplicatedStorage_upvr.Modules.Functions)
local Animate_upvr_2 = require(ReplicatedStorage_upvr.Modules.Animate)
local PlotHandler_upvr_2 = require(ReplicatedStorage_upvr.Services.PlotHandler)
local ItemUtils_upvr = require(ReplicatedStorage_upvr.Modules.ItemUtils)
local PreloadAnimations_2 = require(ReplicatedStorage_upvr.Modules.PreloadAnimations)
local NotifyHandler_upvr_2 = require(ReplicatedStorage_upvr.Services.NotifyHandler)
local GuiHandler_upvr_2 = require(ReplicatedStorage_upvr.Services.GuiHandler)
local Gizmo_upvr = require(ReplicatedStorage_upvr.Modules.Gizmo)
local Maid_upvr_2 = require(ReplicatedStorage_upvr.Modules.Maid)
local Variables_upvr_2 = require(ReplicatedStorage_upvr.Data.Variables)
local GameFormulas_upvr = require(ReplicatedStorage_upvr.Data.GameFormulas)
local Monetize_upvr = require(ReplicatedStorage_upvr.Modules.Monetize)
local Tween_upvr = Functions_upvr.Tween
local LocalPlayer_upvr = Players_upvr_2.LocalPlayer
local mouse_upvr = LocalPlayer_upvr:GetMouse()
mouse_upvr.TargetFilter = workspace.Map.Boundaries
local var432_upvw
local var433_upvw
xpcall(function() -- Line 46
    game.a = 'b'
end, function() -- Line 48
    --[[ Upvalues[1]:
        [1]: var432_upvw (read and write)
    ]]
    var432_upvw = debug.info(2, 'f')
end)
xpcall(function() -- Line 52
    return game.asd
end, function() -- Line 54
    --[[ Upvalues[1]:
        [1]: var433_upvw (read and write)
    ]]
    var433_upvw = debug.info(2, 'f')
end)
task.spawn(function() -- Line 59
    --[[ Upvalues[1]:
        [1]: ReplicatedStorage_upvr (readonly)
    ]]
    for _, v in ReplicatedStorage_upvr.Behavior.Tools:GetChildren() do
        require(v)
    end
end)
local Tags_upvr_2 = require(ReplicatedStorage_upvr.Data.Tags)
local TagHandler_upvr_2 = require(ReplicatedStorage_upvr.Modules.TagHandler)
local Tools_upvr_2 = require(ReplicatedStorage_upvr.Data.Tools)
local MouseUtils_upvr_2 = require(ReplicatedStorage_upvr.Modules.MouseUtils)
local function OnCharacterAdded(arg1) -- Line 65
    --[[ Upvalues[13]:
        [1]: Maid_upvr_2 (readonly)
        [2]: Tags_upvr_2 (readonly)
        [3]: Animator_upvr (readonly)
        [4]: ClientData_upvr_2 (readonly)
        [5]: GuiHandler_upvr_2 (readonly)
        [6]: TagHandler_upvr_2 (readonly)
        [7]: Tools_upvr_2 (readonly)
        [8]: Functions_upvr (readonly)
        [9]: var433_upvw (read and write)
        [10]: var432_upvw (read and write)
        [11]: RunService_upvr (readonly)
        [12]: Network_upvr_2 (readonly)
        [13]: MouseUtils_upvr_2 (readonly)
    ]]
    local any_new_result1_upvr = Maid_upvr_2.new(arg1)
    local Humanoid_5_upvr = arg1:WaitForChild("Humanoid")
    for _, v_2 in {"FallingDown", "Ragdoll", "GettingUp", "Swimming"} do
        Humanoid_5_upvr:SetStateEnabled(Enum.HumanoidStateType[v_2], false)
    end
    local var455_upvw = 0
    local function TagsChanged_upvr(arg1_19) -- Line 76, Named "TagsChanged"
        --[[ Upvalues[3]:
            [1]: var455_upvw (read and write)
            [2]: Tags_upvr_2 (copied, readonly)
            [3]: Humanoid_5_upvr (readonly)
        ]]
        -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
        local var464
        for _, v_3 in arg1_19 do
            local var465 = Tags_upvr_2[v_3.Name]
            if var465 then
                if var465.WalkSpeed then
                    var464 += var465.WalkSpeed
                end
                if var465.JumpHeight then
                end
                if var465.NoJump then
                end
                if var465.PlatformStand then
                end
            end
        end
        if var464 < 0 then
            var464 = 0
        end
        if 0 < 0 then
            Humanoid_5_upvr.Jump = false
        end
        Humanoid_5_upvr.WalkSpeed = var464
        Humanoid_5_upvr.JumpHeight = 0
        Humanoid_5_upvr.PlatformStand = true
    end
    any_new_result1_upvr:AddBulk(Humanoid_5_upvr.Died:Once(function() -- Line 111
        --[[ Upvalues[5]:
            [1]: Animator_upvr (copied, readonly)
            [2]: arg1 (readonly)
            [3]: ClientData_upvr_2 (copied, readonly)
            [4]: GuiHandler_upvr_2 (copied, readonly)
            [5]: any_new_result1_upvr (readonly)
        ]]
        Animator_upvr.destroy(arg1)
        if 0 < #ClientData_upvr_2.CurrentlyCarrying then
            table.clear(ClientData_upvr_2.CurrentlyCarrying)
            ClientData_upvr_2.CarryingItem:Fire(false)
        end
        GuiHandler_upvr_2.ShowToolAmount(nil)
        any_new_result1_upvr:Destroy()
    end), TagHandler_upvr_2:GetChangedSignal(arg1):Connect(TagsChanged_upvr), TagHandler_upvr_2:GetTagAddedSignal(arg1, "Dancing"):Connect(function() -- Line 126
        --[[ Upvalues[1]:
            [1]: arg1 (readonly)
        ]]
        arg1:SetAttribute("ToolsHidden", true)
    end), TagHandler_upvr_2:GetTagRemovedSignal(arg1, "Dancing"):Connect(function() -- Line 129
        --[[ Upvalues[1]:
            [1]: arg1 (readonly)
        ]]
        arg1:SetAttribute("ToolsHidden", false)
    end), TagHandler_upvr_2:GetTagAddedSignal(arg1, "Ragdolled"):Connect(function() -- Line 133
        --[[ Upvalues[1]:
            [1]: Humanoid_5_upvr (readonly)
        ]]
        Humanoid_5_upvr:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
        Humanoid_5_upvr:ChangeState(Enum.HumanoidStateType.Physics)
        Humanoid_5_upvr.Jump = false
    end), TagHandler_upvr_2:GetTagRemovedSignal(arg1, "Ragdolled"):Connect(function() -- Line 138
        --[[ Upvalues[1]:
            [1]: Humanoid_5_upvr (readonly)
        ]]
        Humanoid_5_upvr:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
        Humanoid_5_upvr:ChangeState(Enum.HumanoidStateType.Running)
    end), arg1.ChildAdded:Connect(function(arg1_20) -- Line 143
        --[[ Upvalues[5]:
            [1]: Tools_upvr_2 (copied, readonly)
            [2]: var455_upvw (read and write)
            [3]: TagsChanged_upvr (readonly)
            [4]: TagHandler_upvr_2 (copied, readonly)
            [5]: arg1 (readonly)
        ]]
        if arg1_20:IsA("Tool") then
            local var472 = Tools_upvr_2.fromName[arg1_20.Name]
            if var472 then
                local WeaponInfo_3 = var472.WeaponInfo
                if WeaponInfo_3 and WeaponInfo_3.Speed then
                    var455_upvw = WeaponInfo_3.Speed
                    TagsChanged_upvr(TagHandler_upvr_2.getTags(arg1))
                end
            end
        end
    end), arg1.ChildRemoved:Connect(function(arg1_21) -- Line 155
        --[[ Upvalues[5]:
            [1]: Tools_upvr_2 (copied, readonly)
            [2]: var455_upvw (read and write)
            [3]: TagsChanged_upvr (readonly)
            [4]: TagHandler_upvr_2 (copied, readonly)
            [5]: arg1 (readonly)
        ]]
        if arg1_21:IsA("Tool") then
            local var475 = Tools_upvr_2.fromName[arg1_21.Name]
            if var475 then
                local WeaponInfo = var475.WeaponInfo
                if WeaponInfo and WeaponInfo.Speed and var455_upvw == WeaponInfo.Speed then
                    var455_upvw = 0
                    TagsChanged_upvr(TagHandler_upvr_2.getTags(arg1))
                end
            end
        end
    end), task.spawn(function() -- Line 168
        --[[ Upvalues[10]:
            [1]: Functions_upvr (copied, readonly)
            [2]: var433_upvw (copied, read and write)
            [3]: Humanoid_5_upvr (readonly)
            [4]: var432_upvw (copied, read and write)
            [5]: TagHandler_upvr_2 (copied, readonly)
            [6]: arg1 (readonly)
            [7]: var455_upvw (read and write)
            [8]: Tags_upvr_2 (copied, readonly)
            [9]: RunService_upvr (copied, readonly)
            [10]: Network_upvr_2 (copied, readonly)
        ]]
        local var478_upvw = 100
        local function TestProperty_upvr(arg1_22) -- Line 174, Named "TestProperty"
            --[[ Upvalues[4]:
                [1]: var433_upvw (copied, read and write)
                [2]: Humanoid_5_upvr (copied, readonly)
                [3]: var432_upvw (copied, read and write)
                [4]: var478_upvw (read and write)
            ]]
            var432_upvw(Humanoid_5_upvr, arg1_22, var478_upvw)
            if var433_upvw(Humanoid_5_upvr, arg1_22) ~= var478_upvw then
                var432_upvw(Humanoid_5_upvr, "Hea".."lth", 0)
            end
            var432_upvw(Humanoid_5_upvr, arg1_22, var433_upvw(Humanoid_5_upvr, arg1_22))
        end
        local function Update() -- Line 185
            --[[ Upvalues[8]:
                [1]: TagHandler_upvr_2 (copied, readonly)
                [2]: arg1 (copied, readonly)
                [3]: var455_upvw (copied, read and write)
                [4]: Tags_upvr_2 (copied, readonly)
                [5]: var433_upvw (copied, read and write)
                [6]: Humanoid_5_upvr (copied, readonly)
                [7]: var478_upvw (read and write)
                [8]: var432_upvw (copied, read and write)
            ]]
            -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
            local var487
            for _, v_4 in TagHandler_upvr_2.getTags(arg1), nil do
                local var488 = Tags_upvr_2[v_4.Name]
                if var488 then
                    if var488.WalkSpeed then
                        var487 += var488.WalkSpeed
                    end
                    if var488.JumpHeight then
                    end
                    if var488.NoJump then
                        local const_number_2 = 0
                    end
                end
            end
            local var433_upvw_result1_2 = var433_upvw(Humanoid_5_upvr, "Walk".."Speed")
            if not rawequal(var433_upvw_result1_2, var478_upvw) then
                if var487 < var433_upvw_result1_2 and var433_upvw_result1_2 ~= 0 then
                    var432_upvw(Humanoid_5_upvr, "He".."alth", 0)
                end
            end
            local var433_upvw_result1 = var433_upvw(Humanoid_5_upvr, "Jum".."pHei".."ght")
            if not rawequal(var433_upvw_result1, var478_upvw) and const_number_2 < var433_upvw_result1 and const_number_2 ~= 0 then
                var432_upvw(Humanoid_5_upvr, "Heal".."th", 0)
            end
            if not rawequal(var433_upvw(Humanoid_5_upvr, "Use".."Jum".."pPower"), false) then
                var432_upvw(Humanoid_5_upvr, "Heal".."th", 0)
            end
        end
        local tbl_17_upvr = {Humanoid_5_upvr:GetPropertyChangedSignal("WalkSpeed"):Connect(Update), Humanoid_5_upvr:GetPropertyChangedSignal("JumpHeight"):Connect(Update), Humanoid_5_upvr:GetPropertyChangedSignal("JumpPower"):Connect(Update)}
        local new_upvr_2 = Random.new
        local any_GetDevice_result1_upvr_2 = Functions_upvr.GetDevice()
        local var496_upvw = 0
        local any_Connect_result1_upvw_2 = RunService_upvr.Heartbeat:Connect(function(arg1_23) -- Line 230
            --[[ Upvalues[9]:
                [1]: var478_upvw (read and write)
                [2]: new_upvr_2 (readonly)
                [3]: TestProperty_upvr (readonly)
                [4]: any_GetDevice_result1_upvr_2 (readonly)
                [5]: tbl_17_upvr (readonly)
                [6]: var432_upvw (copied, read and write)
                [7]: Humanoid_5_upvr (copied, readonly)
                [8]: var496_upvw (read and write)
                [9]: Network_upvr_2 (copied, readonly)
            ]]
            var478_upvw = 100 + new_upvr_2(arg1_23):NextInteger(1, 200)
            TestProperty_upvr("WalkSpeed", var478_upvw)
            if any_GetDevice_result1_upvr_2 ~= "Mobile" then
                TestProperty_upvr("JumpPower", var478_upvw)
                TestProperty_upvr("JumpHeight", var478_upvw)
            end
            for _, v_5 in tbl_17_upvr do
                if not v_5.Connected then
                    var432_upvw(Humanoid_5_upvr, 'H'.."ealt"..'h', 0)
                end
            end
            var496_upvw += arg1_23
            if 4 <= var496_upvw then
                var496_upvw = 0
                Network_upvr_2.Channel("Player"):FireServer("Handshake")
            end
        end)
        Humanoid_5_upvr.Died:Once(function() -- Line 254
            --[[ Upvalues[2]:
                [1]: any_Connect_result1_upvw_2 (read and write)
                [2]: tbl_17_upvr (readonly)
            ]]
            any_Connect_result1_upvw_2:Disconnect()
            any_Connect_result1_upvw_2 = nil
            for _, v_6 in tbl_17_upvr do
                v_6:Disconnect()
                v_6 = nil
            end
        end)
    end), (function() -- Line 265
        --[[ Upvalues[2]:
            [1]: Humanoid_5_upvr (readonly)
            [2]: var432_upvw (copied, read and write)
        ]]
        local Freefall_upvr_2 = Enum.HumanoidStateType.Freefall
        local Jumping_upvr_2 = Enum.HumanoidStateType.Jumping
        local var507_upvw
        local var508_upvw = 0
        return Humanoid_5_upvr.StateChanged:Connect(function(arg1_24, arg2) -- Line 272
            --[[ Upvalues[6]:
                [1]: Freefall_upvr_2 (readonly)
                [2]: Jumping_upvr_2 (readonly)
                [3]: var507_upvw (read and write)
                [4]: var432_upvw (copied, read and write)
                [5]: Humanoid_5_upvr (copied, readonly)
                [6]: var508_upvw (read and write)
            ]]
            if arg1_24 == Freefall_upvr_2 and arg2 == Jumping_upvr_2 then
                if var507_upvw and tick() - var507_upvw < 0.6 then
                    var432_upvw(Humanoid_5_upvr, "Health", 0)
                else
                    var508_upvw += 1
                    if 3 <= var508_upvw then
                        var432_upvw(Humanoid_5_upvr, "Health", 0)
                    end
                end
                var507_upvw = tick()
            end
        end)
    end)())
    MouseUtils_upvr_2.SetCharacter(arg1)
end
local ToolUtils_upvr_2 = require(ReplicatedStorage_upvr.Modules.ToolUtils)
ClientData_upvr_2.ToolUpdated:Connect(function(arg1) -- Line 292
    --[[ Upvalues[1]:
        [1]: ToolUtils_upvr_2 (readonly)
    ]]
    if arg1.Tool then
        ToolUtils_upvr_2.Bind(arg1.Tool)
    end
end)
ClientData_upvr_2.ItemUpdated:Connect(function(arg1, arg2) -- Line 298
    --[[ Upvalues[2]:
        [1]: ClientData_upvr_2 (readonly)
        [2]: ItemHandler_upvr (readonly)
    ]]
    if arg2.VaultTime then
        arg2.Vaulted = true
    end
    if arg2.Bag ~= nil then
        ClientData_upvr_2.ItemStored:Fire(arg1)
    end
    ItemHandler_upvr.Update(arg1, arg2)
end)
local tbl_19_upvr = {}
local Animations_2 = ReplicatedStorage_upvr.Assets.Animations
for _, v_7 in Animations_2.Carry.R15:GetChildren() do
    tbl_19_upvr[v_7.Name] = v_7
end
PreloadAnimations_2.Preload(tbl_19_upvr)
PreloadAnimations_2.Preload(Animations_2.Weapons:GetChildren())
Network_upvr_2.Channel("Items"):On("Carry", function(arg1) -- Line 321
    --[[ Upvalues[3]:
        [1]: ItemHandler_upvr (readonly)
        [2]: ClientData_upvr_2 (readonly)
        [3]: Maid_upvr_2 (readonly)
    ]]
    local var518_upvr = ItemHandler_upvr.Items[arg1]
    if var518_upvr then
        local Instance = var518_upvr.Instance
        if Instance then
            table.insert(ClientData_upvr_2.CurrentlyCarrying, var518_upvr)
            ClientData_upvr_2.CarryingItem:Fire(true)
            local any_new_result1_upvw_4 = Maid_upvr_2.new(Instance)
            local function Cleanup() -- Line 331
                --[[ Upvalues[3]:
                    [1]: ClientData_upvr_2 (copied, readonly)
                    [2]: var518_upvr (readonly)
                    [3]: any_new_result1_upvw_4 (read and write)
                ]]
                table.remove(ClientData_upvr_2.CurrentlyCarrying, table.find(ClientData_upvr_2.CurrentlyCarrying, var518_upvr))
                ClientData_upvr_2.CarryingItem:Fire(false)
                if any_new_result1_upvw_4 then
                    any_new_result1_upvw_4:Destroy()
                    any_new_result1_upvw_4 = nil
                end
            end
            any_new_result1_upvw_4:AddBulk(Instance:GetAttributeChangedSignal("Carrying"):Once(Cleanup), Instance.Destroying:Once(Cleanup))
        end
    end
end)
ClientData_upvr_2.CarryingItem:Connect(function(arg1) -- Line 349
    --[[ Upvalues[5]:
        [1]: LocalPlayer_upvr (readonly)
        [2]: ClientData_upvr_2 (readonly)
        [3]: tbl_19_upvr (readonly)
        [4]: ItemUtils_upvr (readonly)
        [5]: Animator_upvr (readonly)
    ]]
    -- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [4] 4. Error Block 2 start (CF ANALYSIS FAILED)
    do
        return
    end
    -- KONSTANTERROR: [4] 4. Error Block 2 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [5] 5. Error Block 3 start (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [5] 5. Error Block 3 end (CF ANALYSIS FAILED)
end)
LocalPlayer_upvr.CharacterAdded:Connect(OnCharacterAdded)
if LocalPlayer_upvr.Character then
    task.spawn(OnCharacterAdded, LocalPlayer_upvr.Character)
end
LocalPlayer_upvr.CharacterRemoving:Connect(function() -- Line 389
    --[[ Upvalues[1]:
        [1]: PlotHandler_upvr_2 (readonly)
    ]]
    PlotHandler_upvr_2.SetSegmentPromptsEnabled(false)
end)
local any_Channel_result1_upvw_2 = Network_upvr_2.Channel("Player")
task.spawn(function() -- Line 395
    --[[ Upvalues[3]:
        [1]: ClientData_upvr_2 (readonly)
        [2]: LocalPlayer_upvr (readonly)
        [3]: any_Channel_result1_upvw_2 (readonly)
    ]]
    while not LocalPlayer_upvr:GetAttribute("EffectsReady") do
        LocalPlayer_upvr:GetAttributeChangedSignal("EffectsReady"):Wait()
    end
    LocalPlayer_upvr:SetAttribute("EffectsReady", nil)
    any_Channel_result1_upvw_2:FireServer("Ready")
end)
any_Channel_result1_upvw_2 = nil
Gizmo_upvr.Init()
local var526_upvw
local var527_upvw
local var528_upvw
local var529_upvw
RunService_upvr.Heartbeat:Connect(function() -- Line 416
    --[[ Upvalues[7]:
        [1]: var526_upvw (read and write)
        [2]: mouse_upvr (readonly)
        [3]: var527_upvw (read and write)
        [4]: Gizmo_upvr (readonly)
        [5]: any_Channel_result1_upvw_2 (read and write)
        [6]: var528_upvw (read and write)
        [7]: var529_upvw (read and write)
    ]]
    if not shared.NPCDebug then
    else
        var526_upvw = mouse_upvr.Target
        local var530 = var526_upvw
        if var530 then
            var530 = var526_upvw.Parent
        end
        var527_upvw = var530
        if not var527_upvw then return end
        if var527_upvw:IsA("Model") then
            local var531
            if var527_upvw:HasTag("NPC") then
                var531 = Gizmo_upvr
                var531 = "Color3"
                var531.PushProperty(var531, Color3.fromRGB(54, 18, 232))
                local any_GetBoundingBox_result1_2, any_GetBoundingBox_result2_4 = var527_upvw:GetBoundingBox()
                any_Channel_result1_upvw_2 = any_GetBoundingBox_result1_2
                var528_upvw = any_GetBoundingBox_result2_4
                any_GetBoundingBox_result2_4 = Gizmo_upvr
                any_GetBoundingBox_result2_4.Box:Draw(any_Channel_result1_upvw_2, var528_upvw)
                local Pointer_2 = var527_upvw:FindFirstChild("Pointer")
                any_GetBoundingBox_result2_4 = Pointer_2
                if any_GetBoundingBox_result2_4 then
                    any_GetBoundingBox_result2_4 = Pointer_2.Value
                end
                if any_GetBoundingBox_result2_4 then
                    local any_GetBoundingBox_result1_3, any_GetBoundingBox_result2 = any_GetBoundingBox_result2_4:GetBoundingBox()
                    var529_upvw = any_GetBoundingBox_result1_3
                    var528_upvw = any_GetBoundingBox_result2
                    Gizmo_upvr.Box:Draw(var529_upvw, var528_upvw)
                    local var537 = var529_upvw.Position - any_Channel_result1_upvw_2.Position
                    Gizmo_upvr.Line:Draw(CFrame.lookAlong(any_Channel_result1_upvw_2.Position, var537) * CFrame.new(0, 0, -var537.Magnitude / 2), var537.Magnitude)
                end
                local IntervalTime = var527_upvw:GetAttribute("IntervalTime")
                local Interval_3 = var527_upvw:GetAttribute("Interval")
                if IntervalTime and Interval_3 then
                    local var540 = (Interval_3) - (workspace:GetServerTimeNow() - IntervalTime)
                    if var540 < 0 then
                        var540 = 0
                    end
                    Gizmo_upvr.Text:Draw(any_Channel_result1_upvw_2.Position + Vector3.new(0, 4, 0), string.format("[%i]: %s\n%.2f", var527_upvw:GetAttribute("Id"), var527_upvw:GetAttribute("State") or "None", var540), 18)
                end
            end
        end
    end
end)
for _, v_8 in {"SimulationScriptTesting", "GameAssets"} do
    local SOME = workspace:FindFirstChild(v_8)
    if SOME then
        SOME:Destroy()
    end
end
for i_9_upvr, v_9_upvr in NotifyHandler_upvr_2 do
    if type(v_9_upvr) == "function" then
        local any_Channel_result1_upvr_2 = Network_upvr_2.Channel("Notify")
        task.spawn(function() -- Line 485
            --[[ Upvalues[3]:
                [1]: any_Channel_result1_upvr_2 (readonly)
                [2]: i_9_upvr (readonly)
                [3]: v_9_upvr (readonly)
            ]]
            any_Channel_result1_upvr_2:On(i_9_upvr, v_9_upvr)
        end)
    end
end
any_Channel_result1_upvr_2 = workspace.Map.Pads
local var545_upvr = any_Channel_result1_upvr_2
local Animations_upvr = ReplicatedStorage_upvr.Assets.Animations
local function LoadAvatar_upvr(arg1, arg2, arg3) -- Line 497, Named "LoadAvatar"
    --[[ Upvalues[2]:
        [1]: Players_upvr_2 (readonly)
        [2]: Functions_upvr (readonly)
    ]]
    -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
    local var555
    if var555 < 0 then
        var555 = 1
    end
    local NPC = arg1:WaitForChild("NPC")
    local HumanoidRootPart_5 = NPC:WaitForChild("HumanoidRootPart")
    if not arg3 or not (CFrame.new(arg1.PrimaryPart.Position + Vector3.new(0, 2, 0)) * HumanoidRootPart_5.CFrame.Rotation) then
    end
    NPC:Destroy()
    local any_CreateHumanoidModelFromDescription_result1 = Players_upvr_2:CreateHumanoidModelFromDescription(Players_upvr_2:GetHumanoidDescriptionFromUserId(var555), Enum.HumanoidRigType.R15)
    any_CreateHumanoidModelFromDescription_result1.Parent = arg1
    if arg3 then
        any_CreateHumanoidModelFromDescription_result1:PivotTo(HumanoidRootPart_5.CFrame * CFrame.new(0, Functions_upvr.GetHH(any_CreateHumanoidModelFromDescription_result1.Humanoid), 0))
    else
        -- KONSTANTERROR: Expression was reused, decompilation is incorrect
        any_CreateHumanoidModelFromDescription_result1.PrimaryPart.CFrame = HumanoidRootPart_5.CFrame
    end
    for _, v_10 in any_CreateHumanoidModelFromDescription_result1:GetDescendants() do
        if v_10:IsA("BasePart") then
            v_10.CollisionGroup = "Ragdoll"
        end
    end
    any_CreateHumanoidModelFromDescription_result1.Name = "NPC"
    any_CreateHumanoidModelFromDescription_result1:ScaleTo(NPC:GetScale())
    any_CreateHumanoidModelFromDescription_result1.Humanoid.DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None
    any_CreateHumanoidModelFromDescription_result1.PrimaryPart.Anchored = true
    return any_CreateHumanoidModelFromDescription_result1
end
local function LoadNPC_upvr(arg1, arg2, arg3) -- Line 529, Named "LoadNPC"
    local Humanoid_4 = arg1:WaitForChild("Humanoid", 1)
    if not Humanoid_4 then
    else
        local Animator_2 = Humanoid_4:FindFirstChild("Animator")
        if not Animator_2 then
            Animator_2 = Instance.new("Animator", Humanoid_4)
        end
        local any_LoadAnimation_result1_upvr_2 = Animator_2:LoadAnimation(arg2)
        any_LoadAnimation_result1_upvr_2:Play()
        if arg3 then
            task.defer(function() -- Line 538
                --[[ Upvalues[3]:
                    [1]: arg3 (readonly)
                    [2]: arg1 (readonly)
                    [3]: any_LoadAnimation_result1_upvr_2 (readonly)
                ]]
                while task.wait(arg3) and arg1.Parent do
                    any_LoadAnimation_result1_upvr_2:Play()
                end
            end)
        end
    end
end
local function _(arg1) -- Line 546, Named "HandlePadTouch"
    --[[ Upvalues[3]:
        [1]: Monetize_upvr (readonly)
        [2]: Functions_upvr (readonly)
        [3]: LocalPlayer_upvr (readonly)
    ]]
    local Name_upvr_8 = arg1.Name
    Functions_upvr.Hit.HandleTouch(arg1:WaitForChild("Hitbox"), function() -- Line 550, Named "Touched"
        --[[ Upvalues[2]:
            [1]: Monetize_upvr (copied, readonly)
            [2]: Name_upvr_8 (readonly)
        ]]
        Monetize_upvr.Prompt(Name_upvr_8)
        return true
    end, function() -- Line 555, Named "TouchEnded"
        return true
    end, function(arg1_25) -- Line 556, Named "Check"
        --[[ Upvalues[2]:
            [1]: Functions_upvr (copied, readonly)
            [2]: LocalPlayer_upvr (copied, readonly)
        ]]
        return Functions_upvr.Hit.Check.Player(LocalPlayer_upvr, arg1_25)
    end)
end
local tbl_22_upvr = {
    VoidSlapHand = "Void Slap";
    LaserGun = "Laser Gun";
    BanHammer = "Ban Hammer";
}
local function HandlePadPrompt_upvr(arg1, arg2, arg3) -- Line 567, Named "HandlePadPrompt"
    --[[ Upvalues[3]:
        [1]: Variables_upvr_2 (readonly)
        [2]: Monetize_upvr (readonly)
        [3]: tbl_22_upvr (readonly)
    ]]
    local Name_upvr_5 = arg1.Name
    local clone_5 = Variables_upvr_2.GuiAssets.Billboard.GamepassPad:Clone()
    local var571 = arg3
    if not var571 then
        function var571() -- Line 573
            --[[ Upvalues[2]:
                [1]: Monetize_upvr (copied, readonly)
                [2]: Name_upvr_5 (readonly)
            ]]
            Monetize_upvr.Prompt(Name_upvr_5)
        end
    end
    clone_5.ObjectText = tbl_22_upvr[Name_upvr_5] or Name_upvr_5
    clone_5.ActionText = arg2 or "Purchase"
    clone_5.Parent = arg1:WaitForChild("Hitbox")
    clone_5.Triggered:Connect(var571)
end
local function HandlePad_upvr(arg1) -- Line 584, Named "HandlePad"
    --[[ Upvalues[2]:
        [1]: GuiHandler_upvr_2 (readonly)
        [2]: HandlePadPrompt_upvr (readonly)
    ]]
    local Billboard = arg1:WaitForChild("Billboard")
    local NPC_2 = arg1:FindFirstChild("NPC")
    if NPC_2 then
        local HumanoidRootPart_4 = NPC_2:WaitForChild("HumanoidRootPart")
        Billboard.Parent = HumanoidRootPart_4
        Billboard.Adornee = HumanoidRootPart_4
    else
        local PrimaryPart_2 = arg1:WaitForChild("Model").PrimaryPart
        Billboard.Parent = PrimaryPart_2
        Billboard.Adornee = PrimaryPart_2
    end
    Billboard:AddTag("BillboardAnimated")
    task.defer(GuiHandler_upvr_2.LoadPrice, Billboard:WaitForChild("Price"), arg1.Name)
    HandlePadPrompt_upvr(arg1)
end
local function Orient_upvr(arg1, arg2, arg3) -- Line 604, Named "Orient"
    --[[ Upvalues[5]:
        [1]: RunService_upvr (readonly)
        [2]: Animate_upvr_2 (readonly)
        [3]: LocalPlayer_upvr (readonly)
        [4]: Tween_upvr (readonly)
        [5]: Functions_upvr (readonly)
    ]]
    local HumanoidRootPart_3_upvr = arg1:WaitForChild("HumanoidRootPart")
    local CFrame_upvr = HumanoidRootPart_3_upvr.CFrame
    local var579_upvw = 0
    local Position_upvr = CFrame_upvr.Position
    local any_Connect_result1_upvr_2 = RunService_upvr.Heartbeat:Connect(function(arg1_26) -- Line 612
        --[[ Upvalues[9]:
            [1]: var579_upvw (read and write)
            [2]: Animate_upvr_2 (copied, readonly)
            [3]: LocalPlayer_upvr (copied, readonly)
            [4]: Position_upvr (readonly)
            [5]: arg3 (readonly)
            [6]: arg2 (readonly)
            [7]: CFrame_upvr (readonly)
            [8]: Tween_upvr (copied, readonly)
            [9]: HumanoidRootPart_3_upvr (readonly)
        ]]
        -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
        var579_upvw += arg1_26
        local var581 = Animate_upvr_2.IndexPool[LocalPlayer_upvr.Character]
        local var582
        if not var581 then
        else
            var582 = Position_upvr - var581.CFrame.Position
            local function INLINED_6() -- Internal function, doesn't exist in bytecode
                var582 = math.sin(var579_upvw * 1)
                return var582
            end
            if not arg3 or not INLINED_6() then
                var582 = 0
            end
            if var582.Magnitude <= 55 then
                local _, _, _ = CFrame.lookAt(Position_upvr, var581.CFrame.Position):ToEulerAnglesYXZ()
            else
            end
            Tween_upvr(HumanoidRootPart_3_upvr, 4, "Exponential", "Out", {
                CFrame = CFrame_upvr * CFrame.new(0, var582, 0);
            }):Play()
        end
    end)
    Functions_upvr.BindNil(HumanoidRootPart_3_upvr, function() -- Line 633
        --[[ Upvalues[1]:
            [1]: any_Connect_result1_upvr_2 (readonly)
        ]]
        any_Connect_result1_upvr_2:Disconnect()
    end)
end
local tbl_27_upvr = {
    VoidSlapHand = "BanHammer";
    BanHammer = "LaserGun";
}
local function _(arg1) -- Line 643, Named "HandlePurchased"
    --[[ Upvalues[4]:
        [1]: tbl_27_upvr (readonly)
        [2]: ReplicatedStorage_upvr (readonly)
        [3]: var545_upvr (readonly)
        [4]: ClientData_upvr_2 (readonly)
    ]]
    local Name_upvr_2 = arg1.Name
    local var592_upvw
    local function UpdateOwned(arg1_27) -- Line 648
        --[[ Upvalues[6]:
            [1]: Name_upvr_2 (readonly)
            [2]: arg1 (readonly)
            [3]: var592_upvw (read and write)
            [4]: tbl_27_upvr (copied, readonly)
            [5]: ReplicatedStorage_upvr (copied, readonly)
            [6]: var545_upvr (copied, readonly)
        ]]
        if arg1_27 == Name_upvr_2 then
            arg1:Destroy()
            var592_upvw:Disconnect()
            local var593 = tbl_27_upvr[Name_upvr_2]
            if not var593 then return end
            ReplicatedStorage_upvr.Assets.Pads[var593]:Clone().Parent = var545_upvr
        end
    end
    var592_upvw = ClientData_upvr_2.GamepassPurchased:Connect(UpdateOwned)
    local var594
    local function INLINED_7() -- Internal function, doesn't exist in bytecode
        var594 = Name_upvr_2
        return var594
    end
    if not ClientData_upvr_2.Gamepasses[Name_upvr_2] or not INLINED_7() then
        var594 = nil
    end
    if var594 == Name_upvr_2 then
        arg1:Destroy()
        var592_upvw:Disconnect()
        local var595 = tbl_27_upvr[Name_upvr_2]
        if not var595 then
        else
            ReplicatedStorage_upvr.Assets.Pads[var595]:Clone().Parent = var545_upvr
        end
    end
end
local tbl_upvr_2 = {}
local tbl_2 = {}
local function AnimFunction(arg1) -- Line 667
    --[[ Upvalues[2]:
        [1]: LoadNPC_upvr (readonly)
        [2]: Animations_upvr (readonly)
    ]]
    LoadNPC_upvr(arg1, Animations_upvr.Weapons.Slap, 10)
end
tbl_2.AnimFunction = AnimFunction
tbl_upvr_2.VoidSlapHand = tbl_2
tbl_upvr_2.BanHammer = {
    AnimFunction = function(arg1) -- Line 672, Named "AnimFunction"
        --[[ Upvalues[1]:
            [1]: Animations_upvr (readonly)
        ]]
        local Humanoid = arg1:WaitForChild("Humanoid", 1)
        if not Humanoid then
        else
            local Animator_3 = Humanoid:FindFirstChild("Animator")
            if not Animator_3 then
                Animator_3 = Instance.new("Animator", Humanoid)
            end
            Animator_3:LoadAnimation(Animations_upvr.Weapons["Hammer Idle"]):Play()
            while arg1.Parent do
                Animator_3:LoadAnimation(Animations_upvr.Weapons["Hammer Smash"]):Play()
                task.wait(10)
            end
        end
    end;
}
local function HandleSlapPad(arg1) -- Line 689
    --[[ Upvalues[9]:
        [1]: LoadAvatar_upvr (readonly)
        [2]: LocalPlayer_upvr (readonly)
        [3]: tbl_upvr_2 (readonly)
        [4]: HandlePad_upvr (readonly)
        [5]: Orient_upvr (readonly)
        [6]: tbl_27_upvr (readonly)
        [7]: ReplicatedStorage_upvr (readonly)
        [8]: var545_upvr (readonly)
        [9]: ClientData_upvr_2 (readonly)
    ]]
    local LoadAvatar_result1 = LoadAvatar_upvr(arg1, LocalPlayer_upvr.UserId, true)
    local ToolModel = arg1:WaitForChild("ToolModel")
    local Handle_2 = ToolModel:WaitForChild("Handle")
    local Motor6D = Instance.new("Motor6D", Handle_2)
    Handle_2.Anchored = false
    ToolModel.Parent = LoadAvatar_result1
    Motor6D.Name = "EquipWeld"
    Motor6D.Part0 = LoadAvatar_result1.RightHand
    Motor6D.Part1 = Handle_2
    LoadAvatar_result1:AddTag("NPCIdle")
    task.defer(tbl_upvr_2[arg1.Name].AnimFunction, LoadAvatar_result1)
    HandlePad_upvr(arg1)
    Orient_upvr(LoadAvatar_result1, function(arg1_28, arg2, arg3) -- Line 713
        return CFrame.new(arg1_28) * CFrame.Angles(0, arg3 + -0.08726646259971647, 0)
    end)
    local Name_upvr_7 = arg1.Name
    local var607_upvw
    local function UpdateOwned(arg1_29) -- Line 648
        --[[ Upvalues[6]:
            [1]: Name_upvr_7 (readonly)
            [2]: arg1 (readonly)
            [3]: var607_upvw (read and write)
            [4]: tbl_27_upvr (copied, readonly)
            [5]: ReplicatedStorage_upvr (copied, readonly)
            [6]: var545_upvr (copied, readonly)
        ]]
        if arg1_29 == Name_upvr_7 then
            arg1:Destroy()
            var607_upvw:Disconnect()
            local var608 = tbl_27_upvr[Name_upvr_7]
            if not var608 then return end
            ReplicatedStorage_upvr.Assets.Pads[var608]:Clone().Parent = var545_upvr
        end
    end
    var607_upvw = ClientData_upvr_2.GamepassPurchased:Connect(UpdateOwned)
    local var609
    local function INLINED_8() -- Internal function, doesn't exist in bytecode
        var609 = Name_upvr_7
        return var609
    end
    if not ClientData_upvr_2.Gamepasses[Name_upvr_7] or not INLINED_8() then
        var609 = nil
    end
    if var609 == Name_upvr_7 then
        arg1:Destroy()
        var607_upvw:Disconnect()
        local var610 = tbl_27_upvr[Name_upvr_7]
        if not var610 then
        else
            ReplicatedStorage_upvr.Assets.Pads[var610]:Clone().Parent = var545_upvr
        end
    end
end
local tbl_26_upvr = {
    VoidSlapHand = HandleSlapPad;
    BanHammer = HandleSlapPad;
    LaserGun = function(arg1) -- Line 720, Named "HandleLevitatePad"
        --[[ Upvalues[6]:
            [1]: HandlePad_upvr (readonly)
            [2]: Animate_upvr_2 (readonly)
            [3]: tbl_27_upvr (readonly)
            [4]: ReplicatedStorage_upvr (readonly)
            [5]: var545_upvr (readonly)
            [6]: ClientData_upvr_2 (readonly)
        ]]
        HandlePad_upvr(arg1)
        Animate_upvr_2.Levitate(arg1:WaitForChild("Model"), 1, 0.3, 45, "Sine")
        local Name_upvr_11 = arg1.Name
        local var612_upvw
        local function UpdateOwned(arg1_30) -- Line 648
            --[[ Upvalues[6]:
                [1]: Name_upvr_11 (readonly)
                [2]: arg1 (readonly)
                [3]: var612_upvw (read and write)
                [4]: tbl_27_upvr (copied, readonly)
                [5]: ReplicatedStorage_upvr (copied, readonly)
                [6]: var545_upvr (copied, readonly)
            ]]
            if arg1_30 == Name_upvr_11 then
                arg1:Destroy()
                var612_upvw:Disconnect()
                local var613 = tbl_27_upvr[Name_upvr_11]
                if not var613 then return end
                ReplicatedStorage_upvr.Assets.Pads[var613]:Clone().Parent = var545_upvr
            end
        end
        var612_upvw = ClientData_upvr_2.GamepassPurchased:Connect(UpdateOwned)
        local var614
        local function INLINED_9() -- Internal function, doesn't exist in bytecode
            var614 = Name_upvr_11
            return var614
        end
        if not ClientData_upvr_2.Gamepasses[Name_upvr_11] or not INLINED_9() then
            var614 = nil
        end
        if var614 == Name_upvr_11 then
            arg1:Destroy()
            var612_upvw:Disconnect()
            local var615 = tbl_27_upvr[Name_upvr_11]
            if not var615 then
            else
                ReplicatedStorage_upvr.Assets.Pads[var615]:Clone().Parent = var545_upvr
            end
        end
    end;
    Jetpack = function(arg1) -- Line 733, Named "Jetpack"
        --[[ Upvalues[11]:
            [1]: LoadAvatar_upvr (readonly)
            [2]: LocalPlayer_upvr (readonly)
            [3]: Functions_upvr (readonly)
            [4]: LoadNPC_upvr (readonly)
            [5]: Animations_upvr (readonly)
            [6]: HandlePad_upvr (readonly)
            [7]: Orient_upvr (readonly)
            [8]: tbl_27_upvr (readonly)
            [9]: ReplicatedStorage_upvr (readonly)
            [10]: var545_upvr (readonly)
            [11]: ClientData_upvr_2 (readonly)
        ]]
        local LoadAvatar_result1_2 = LoadAvatar_upvr(arg1, LocalPlayer_upvr.UserId)
        local Jetpack_3 = arg1:WaitForChild("Jetpack")
        Jetpack_3.Parent = LoadAvatar_result1_2
        Functions_upvr.WeldModel(Jetpack_3)
        Functions_upvr.Weld(Jetpack_3.PrimaryPart, LoadAvatar_result1_2.UpperTorso)
        LoadNPC_upvr(LoadAvatar_result1_2, Animations_upvr.Weapons["Jetpack Flying"])
        HandlePad_upvr(arg1)
        Orient_upvr(LoadAvatar_result1_2, function(arg1_31, arg2, arg3) -- Line 745
            return CFrame.new(arg1_31) * CFrame.new(0, arg2, 0) * CFrame.Angles(0, arg3, 0) * CFrame.Angles(-0.5235987755982988, 0, 0)
        end, true)
        local Name_upvr_6 = arg1.Name
        local var621_upvw
        var621_upvw = ClientData_upvr_2.GamepassPurchased:Connect(function(arg1_32) -- Line 648, Named "UpdateOwned"
            --[[ Upvalues[6]:
                [1]: Name_upvr_6 (readonly)
                [2]: arg1 (readonly)
                [3]: var621_upvw (read and write)
                [4]: tbl_27_upvr (copied, readonly)
                [5]: ReplicatedStorage_upvr (copied, readonly)
                [6]: var545_upvr (copied, readonly)
            ]]
            if arg1_32 == Name_upvr_6 then
                arg1:Destroy()
                var621_upvw:Disconnect()
                local var622 = tbl_27_upvr[Name_upvr_6]
                if not var622 then return end
                ReplicatedStorage_upvr.Assets.Pads[var622]:Clone().Parent = var545_upvr
            end
        end)
        local var623
        local function INLINED_10() -- Internal function, doesn't exist in bytecode
            var623 = Name_upvr_6
            return var623
        end
        if not ClientData_upvr_2.Gamepasses[Name_upvr_6] or not INLINED_10() then
            var623 = nil
        end
        if var623 == Name_upvr_6 then
            arg1:Destroy()
            var621_upvw:Disconnect()
            local var624 = tbl_27_upvr[Name_upvr_6]
            if not var624 then
            else
                ReplicatedStorage_upvr.Assets.Pads[var624]:Clone().Parent = var545_upvr
            end
        end
    end;
    Group = function(arg1) -- Line 752, Named "Group"
        --[[ Upvalues[4]:
            [1]: HandlePadPrompt_upvr (readonly)
            [2]: Network_upvr_2 (readonly)
            [3]: Animate_upvr_2 (readonly)
            [4]: ClientData_upvr_2 (readonly)
        ]]
        HandlePadPrompt_upvr(arg1, "Claim", function() -- Line 756
            --[[ Upvalues[1]:
                [1]: Network_upvr_2 (copied, readonly)
            ]]
            Network_upvr_2.Channel("Group"):FireServer("Claim")
        end)
        Animate_upvr_2.Levitate(arg1:WaitForChild("Model"), 1, 0.3, 45, "Sine")
        local var626_upvw
        local function Update(arg1_33) -- Line 764
            --[[ Upvalues[2]:
                [1]: var626_upvw (read and write)
                [2]: arg1 (readonly)
            ]]
            if arg1_33 then
                var626_upvw:Disconnect()
                arg1:Destroy()
            end
        end
        var626_upvw = ClientData_upvr_2.Replica:OnSet({"GroupClaimed"}, Update)
        if ClientData_upvr_2.WaitForValue().GroupClaimed then
            var626_upvw:Disconnect()
            arg1:Destroy()
        end
    end;
}
local tbl_18_upvr = {"VoidSlapHand", "Jetpack", "Group"}
task.spawn(function() -- Line 782
    --[[ Upvalues[5]:
        [1]: ReplicatedStorage_upvr (readonly)
        [2]: ClientData_upvr_2 (readonly)
        [3]: tbl_18_upvr (readonly)
        [4]: var545_upvr (readonly)
        [5]: tbl_26_upvr (readonly)
    ]]
    -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
    local Pads_2 = ReplicatedStorage_upvr.Assets:FindFirstChild("Pads")
    if not Pads_2 then
    else
        while ClientData_upvr_2.WaitForValue().Tutorial do
            task.wait(1)
        end
        for _, v_11 in tbl_18_upvr do
            Pads_2[v_11]:Clone().Parent = var545_upvr
        end
        for _, v_12 in var545_upvr:GetChildren() do
            task.defer(function(arg1) -- Line 796, Named "HandleChild"
                --[[ Upvalues[1]:
                    [1]: tbl_26_upvr (copied, readonly)
                ]]
                local var647 = tbl_26_upvr[arg1.Name]
                if var647 then
                    var647(arg1)
                end
            end, v_12)
            local var651
        end
        var545_upvr.ChildAdded:Connect(var651)
    end
end)
var545_upvr = {}
local var652_upvr = var545_upvr
Animations_upvr = {}
local Remind_upvr = Animations_upvr
LoadAvatar_upvr = 0
Remind_upvr.Rebirth = LoadAvatar_upvr
tbl_22_upvr = GameFormulas_upvr.Prices
LoadNPC_upvr = tbl_22_upvr.Plot.Upgrade
LoadAvatar_upvr = LoadNPC_upvr[3]
Remind_upvr.Cash = LoadAvatar_upvr
LoadAvatar_upvr = 2
Remind_upvr.Plot = LoadAvatar_upvr
LoadAvatar_upvr = "You can now upgrade to Advanced Plot"
Remind_upvr.Text = LoadAvatar_upvr
LoadAvatar_upvr = {}
local var654 = LoadAvatar_upvr
LoadNPC_upvr = 2
var654.Rebirth = LoadNPC_upvr
HandlePadPrompt_upvr = GameFormulas_upvr.Prices
tbl_22_upvr = HandlePadPrompt_upvr.Plot
LoadNPC_upvr = tbl_22_upvr.Upgrade[4]
var654.Cash = LoadNPC_upvr
LoadNPC_upvr = 3
var654.Plot = LoadNPC_upvr
LoadNPC_upvr = "You can now upgrade to Pro Plot"
var654.Text = LoadNPC_upvr
LoadNPC_upvr = {}
local var656 = LoadNPC_upvr
var656.Rebirth = 0
HandlePadPrompt_upvr = GameFormulas_upvr.Rebirth
tbl_22_upvr = HandlePadPrompt_upvr.Required
tbl_22_upvr = 1
var656.Cash = tbl_22_upvr.Cash(tbl_22_upvr)
var656.Plot = 3
var656.Text = "You can now rebirth!"
var652_upvr[1] = Remind_upvr
var652_upvr[2] = var654
var652_upvr[3] = var656
function Remind_upvr(arg1, arg2) -- Line 832, Named "Remind"
    --[[ Upvalues[3]:
        [1]: var652_upvr (readonly)
        [2]: NotifyHandler_upvr_2 (readonly)
        [3]: Variables_upvr_2 (readonly)
    ]]
    table.remove(var652_upvr, table.find(var652_upvr, arg1))
    if arg2 then
    else
        NotifyHandler_upvr_2.Message(arg1.Text, Variables_upvr_2.Colors.Notify)
        NotifyHandler_upvr_2.Sound(Variables_upvr_2.Sounds.Notify.Notify3)
    end
end
var654 = task.spawn
function var656() -- Line 840
    --[[ Upvalues[3]:
        [1]: ClientData_upvr_2 (readonly)
        [2]: var652_upvr (readonly)
        [3]: Remind_upvr (readonly)
    ]]
    local any_WaitForValue_result1_upvr_2 = ClientData_upvr_2.WaitForValue()
    local var658_upvw = 0
    local function Update(arg1) -- Line 847
        --[[ Upvalues[4]:
            [1]: any_WaitForValue_result1_upvr_2 (readonly)
            [2]: var658_upvw (read and write)
            [3]: var652_upvr (copied, readonly)
            [4]: Remind_upvr (copied, readonly)
        ]]
        -- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
        local Cash_2 = any_WaitForValue_result1_upvr_2.Cash
        -- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [53] 37. Error Block 16 start (CF ANALYSIS FAILED)
        var658_upvw = Cash_2
        -- KONSTANTERROR: [53] 37. Error Block 16 end (CF ANALYSIS FAILED)
    end
    task.wait(5)
    ClientData_upvr_2.CashChanged:Connect(Update)
    ClientData_upvr_2.Replica:OnSet({"Rebirth"}, Update)
    Update()
end
var654(var656)
var652_upvr = ClientData_upvr_2.WaitForValue()
local var661_upvr = var652_upvr
Remind_upvr = var661_upvr.Tutorial
local var662_upvw = Remind_upvr
if not var662_upvw then
else
    local any_Get_result1_3_upvr = Functions_upvr.Yield.Table.Get(PlotHandler_upvr_2, "Local")
    local var664_upvw
    local any_GetGui_result1_upvr = Functions_upvr.GetGui()
    local tbl_25_upvr = {}
    local function ShowArrow_upvr(arg1, arg2) -- Line 892, Named "ShowArrow"
        --[[ Upvalues[3]:
            [1]: tbl_25_upvr (readonly)
            [2]: Tween_upvr (readonly)
            [3]: Functions_upvr (readonly)
        ]]
        -- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
        local Arrow_upvr_2 = arg1:WaitForChild("Arrow")
        Arrow_upvr_2.Visible = arg2
        -- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [10] 9. Error Block 11 start (CF ANALYSIS FAILED)
        local OGPosition_upvw = Arrow_upvr_2:GetAttribute("OGPosition")
        if not OGPosition_upvw then
            OGPosition_upvw = Arrow_upvr_2.Position
            Arrow_upvr_2:SetAttribute("OGPosition", OGPosition_upvw)
        end
        local var670_upvr = OGPosition_upvw + Arrow_upvr_2:GetAttribute("ArrowOffset")
        tbl_25_upvr[Arrow_upvr_2] = task.defer(function() -- Line 908
            --[[ Upvalues[4]:
                [1]: Tween_upvr (copied, readonly)
                [2]: Arrow_upvr_2 (readonly)
                [3]: var670_upvr (readonly)
                [4]: OGPosition_upvw (read and write)
            ]]
            while true do
                local var429_result1_2 = Tween_upvr(Arrow_upvr_2, 0.6, "Sine", "InOut", {
                    Position = var670_upvr;
                })
                var429_result1_2:Play()
                var429_result1_2.Completed:Wait()
                local var429_result1 = Tween_upvr(Arrow_upvr_2, 0.6, "Sine", "InOut", {
                    Position = OGPosition_upvw;
                })
                var429_result1:Play()
                var429_result1.Completed:Wait()
            end
        end)
        Functions_upvr.BindNil(Arrow_upvr_2, function() -- Line 920
            --[[ Upvalues[2]:
                [1]: tbl_25_upvr (copied, readonly)
                [2]: Arrow_upvr_2 (readonly)
            ]]
            if tbl_25_upvr[Arrow_upvr_2] then
                task.cancel(tbl_25_upvr[Arrow_upvr_2])
                tbl_25_upvr[Arrow_upvr_2] = nil
            end
        end)
        do
            return
        end
        -- KONSTANTERROR: [10] 9. Error Block 11 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [47] 40. Error Block 9 start (CF ANALYSIS FAILED)
        if tbl_25_upvr[Arrow_upvr_2] then
            task.cancel(tbl_25_upvr[Arrow_upvr_2])
            tbl_25_upvr[Arrow_upvr_2] = nil
        end
        -- KONSTANTERROR: [47] 40. Error Block 9 end (CF ANALYSIS FAILED)
    end
    local tbl_5_upvr = {}
    local Signal_upvr_2 = require(ReplicatedStorage_upvr.Modules.Signal)
    local function ButtonArrow_upvr(arg1, arg2, arg3) -- Line 929, Named "ButtonArrow"
        --[[ Upvalues[4]:
            [1]: tbl_5_upvr (readonly)
            [2]: Signal_upvr_2 (readonly)
            [3]: Functions_upvr (readonly)
            [4]: ShowArrow_upvr (readonly)
        ]]
        -- KONSTANTERROR: [0] 1. Error Block 9 start (CF ANALYSIS FAILED)
        if arg2 then
            if not tbl_5_upvr[arg1] then
                local any_new_result1_upvw_2 = Signal_upvr_2.new()
                tbl_5_upvr[arg1] = any_new_result1_upvw_2
                local var680_upvw = 0
                ShowArrow_upvr(arg1, true)
                any_new_result1_upvw_2:Wait()
                arg1.TextButton.Activated:Connect(function() -- Line 939, Named "Click"
                    --[[ Upvalues[4]:
                        [1]: arg3 (readonly)
                        [2]: var680_upvw (read and write)
                        [3]: arg2 (readonly)
                        [4]: any_new_result1_upvw_2 (read and write)
                    ]]
                    if arg3 and not arg3() then
                    else
                        var680_upvw += 1
                        if arg2 <= var680_upvw then
                            any_new_result1_upvw_2:Fire()
                        end
                    end
                end):Disconnect()
                Functions_upvr.Attribute.GetSignal(arg1, "Pressed"):Connect(function(arg1_34) -- Line 946
                    --[[ Upvalues[4]:
                        [1]: arg3 (readonly)
                        [2]: var680_upvw (read and write)
                        [3]: arg2 (readonly)
                        [4]: any_new_result1_upvw_2 (read and write)
                    ]]
                    if arg1_34 then
                        if arg3 and not arg3() then return end
                        var680_upvw += 1
                        if arg2 <= var680_upvw then
                            any_new_result1_upvw_2:Fire()
                        end
                    end
                end):Disconnect()
                ShowArrow_upvr(arg1, false)
                -- KONSTANTWARNING: GOTO [67] #57
            end
        elseif any_new_result1_upvw_2 then
            any_new_result1_upvw_2:Fire()
            tbl_5_upvr[arg1] = nil
        end
        -- KONSTANTERROR: [0] 1. Error Block 9 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [67] 57. Error Block 6 start (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [67] 57. Error Block 6 end (CF ANALYSIS FAILED)
    end
    local Tutorial_upvr = any_GetGui_result1_upvr.Game.Tutorial
    local function UpdateText_upvr(arg1, arg2) -- Line 961, Named "UpdateText"
        --[[ Upvalues[2]:
            [1]: Tutorial_upvr (readonly)
            [2]: Animate_upvr_2 (readonly)
        ]]
        if not arg2 or not UDim2.new(0.5, 0, 0.95, -60) then
            local udim2 = UDim2.fromScale(0.5, 0.2)
        end
        if not arg2 or not UDim2.new(0.5, 0, 0.85, -60) then
        end
        if arg1 then
            Tutorial_upvr.Text = arg1
            Animate_upvr_2.FrameTweens.Tweens.Glide.Appear(Tutorial_upvr, udim2, UDim2.fromScale(0.5, 0.1))
        else
            Animate_upvr_2.FrameTweens.Tweens.Glide.Hide(Tutorial_upvr, udim2)
        end
    end
    local var684_upvw
    local Tutorial_upvr_2 = workspace.Debris.Game.Tutorial
    local function UpdateTarget_upvr(arg1) -- Line 973, Named "UpdateTarget"
        --[[ Upvalues[5]:
            [1]: var664_upvw (read and write)
            [2]: var684_upvw (read and write)
            [3]: Tutorial_upvr_2 (readonly)
            [4]: LocalPlayer_upvr (readonly)
            [5]: Tween_upvr (readonly)
        ]]
        -- KONSTANTERROR: [0] 1. Error Block 20 start (CF ANALYSIS FAILED)
        var664_upvw = arg1
        if var684_upvw then
            var684_upvw:Destroy()
        end
        var684_upvw = Instance.new("Attachment")
        if typeof(arg1) == "Instance" then
            var684_upvw.Parent = arg1
            -- KONSTANTWARNING: GOTO [49] #39
        end
        -- KONSTANTERROR: [0] 1. Error Block 20 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [23] 19. Error Block 21 start (CF ANALYSIS FAILED)
        if typeof(arg1) == "Vector3" then
            var684_upvw.Parent = Tutorial_upvr_2
            Tutorial_upvr_2.CFrame = CFrame.new(arg1)
        else
            var684_upvw:Destroy()
            var684_upvw = nil
            return
        end
        local Character = LocalPlayer_upvr.Character
        if Character then
            local Beam_2 = Character.Beam
            Beam_2.Attachment0 = var684_upvw
            Tween_upvr(Beam_2, 1, "Exponential", "Out", {
                Width0 = 2.5;
                Width1 = 2.5;
            }):Play()
        end
        -- KONSTANTERROR: [23] 19. Error Block 21 end (CF ANALYSIS FAILED)
    end
    local Character_2 = LocalPlayer_upvr.Character
    local var691
    if not var662_upvw then
    elseif not Character_2 then
    else
        local clone = Variables_upvr_2.Assets.Tutorial.Beam:Clone()
        clone.Parent = Character_2
        clone.Attachment1 = Instance.new("Attachment", Character_2.PrimaryPart)
        if var664_upvw then
            UpdateTarget_upvr(var664_upvw)
        end
    end
    LocalPlayer_upvr.CharacterAdded:Connect(function(arg1) -- Line 1000, Named "HandleCharacter"
        --[[ Upvalues[4]:
            [1]: var662_upvw (read and write)
            [2]: Variables_upvr_2 (readonly)
            [3]: var664_upvw (read and write)
            [4]: UpdateTarget_upvr (readonly)
        ]]
        if not var662_upvw then
        else
            if not arg1 then return end
            local clone_3 = Variables_upvr_2.Assets.Tutorial.Beam:Clone()
            clone_3.Parent = arg1
            clone_3.Attachment1 = Instance.new("Attachment", arg1.PrimaryPart)
            if var664_upvw then
                UpdateTarget_upvr(var664_upvw)
            end
        end
    end)
    local function _(arg1) -- Line 1016, Named "Progress"
        --[[ Upvalues[1]:
            [1]: Network_upvr_2 (readonly)
        ]]
        Network_upvr_2.Channel("Funnels"):FireServer("Progression", arg1)
    end
    local function YieldBought_upvr(arg1) -- Line 1020, Named "YieldBought"
        --[[ Upvalues[6]:
            [1]: ClientData_upvr_2 (readonly)
            [2]: ItemHandler_upvr (readonly)
            [3]: ItemUtils_upvr (readonly)
            [4]: Functions_upvr (readonly)
            [5]: UpdateTarget_upvr (readonly)
            [6]: UpdateText_upvr (readonly)
        ]]
        -- KONSTANTERROR: [0] 1. Error Block 49 start (CF ANALYSIS FAILED)
        local var693
        if 1 <= #ClientData_upvr_2.CurrentlyCarrying then
            var693 = ClientData_upvr_2.CurrentlyCarrying[1]
            return var693
        end
        local var694
        -- KONSTANTERROR: [0] 1. Error Block 49 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [68] 53. Error Block 16 start (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [68] 53. Error Block 16 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [23] 20. Error Block 51 start (CF ANALYSIS FAILED)
        -- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [68.11]
        if nil == nil then
            -- KONSTANTERROR: Expression was reused, decompilation is incorrect (x3)
            if not nil and nil and nil then
                if not var693 then
                    -- KONSTANTERROR: Expression was reused, decompilation is incorrect
                    if nil < arg1 then
                        -- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [68.13]
                        if nil then
                            -- KONSTANTERROR: Expression was reused, decompilation is incorrect
                            if 0 < nil then
                                -- KONSTANTWARNING: GOTO [68] #53
                            end
                            -- KONSTANTWARNING: GOTO [68] #53
                        end
                        -- KONSTANTWARNING: GOTO [68] #53
                    end
                else
                    -- KONSTANTERROR: Expression was reused, decompilation is incorrect
                    -- KONSTANTWARNING: Failed to evaluate expression, replaced with nil [68.10]
                    if var693 == nil then
                        if var694 then
                            var693 = var694
                        end
                        -- KONSTANTERROR: Expression was reused, decompilation is incorrect
                        if not false then
                            var693 = nil
                            UpdateTarget_upvr(nil)
                        elseif var693 ~= var693 then
                            UpdateText_upvr(`Purchase {var693.Name}!`)
                            while not var693.Instance do
                                task.wait()
                            end
                            UpdateTarget_upvr(var693.Root)
                        end
                        task.wait(0.2)
                        -- KONSTANTWARNING: GOTO [1] #2
                    end
                end
                -- KONSTANTWARNING: GOTO [68] #53
            end
            -- KONSTANTWARNING: GOTO [68] #53
        end
        -- KONSTANTERROR: [23] 20. Error Block 51 end (CF ANALYSIS FAILED)
    end
    local function _(arg1) -- Line 1079, Named "FindItem"
        --[[ Upvalues[1]:
            [1]: ClientData_upvr_2 (readonly)
        ]]
        for _, v_13 in ClientData_upvr_2.Items do
            if v_13.Vaulted == arg1 then
                return v_13
            end
        end
    end
    local function _(arg1, arg2, arg3, arg4) -- Line 1087, Named "HandleItemPickup"
        --[[ Upvalues[6]:
            [1]: any_GetGui_result1_upvr (readonly)
            [2]: ClientData_upvr_2 (readonly)
            [3]: UpdateText_upvr (readonly)
            [4]: ButtonArrow_upvr (readonly)
            [5]: UpdateTarget_upvr (readonly)
            [6]: any_Get_result1_3_upvr (readonly)
        ]]
        local var697_upvw
        local var698_upvw
        local var699_upvw
        local Drop_upvr_3 = any_GetGui_result1_upvr.Bottom.BottomButtons.Bar1.Drop
        local function SelectNewItem() -- Line 1093
            --[[ Upvalues[13]:
                [1]: var699_upvw (read and write)
                [2]: ClientData_upvr_2 (copied, readonly)
                [3]: UpdateText_upvr (copied, readonly)
                [4]: arg1 (readonly)
                [5]: ButtonArrow_upvr (copied, readonly)
                [6]: Drop_upvr_3 (readonly)
                [7]: UpdateTarget_upvr (copied, readonly)
                [8]: arg4 (readonly)
                [9]: var698_upvw (read and write)
                [10]: var697_upvw (read and write)
                [11]: SelectNewItem (readonly)
                [12]: any_Get_result1_3_upvr (copied, readonly)
                [13]: arg3 (readonly)
            ]]
            -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
            while true do
                local var701
                if var699_upvw then break end
                var701 = ClientData_upvr_2
                var699_upvw = var701.Items[1]
                task.wait(0.1)
            end
            if not var699_upvw.Carrying then
                var701 = `Pick up {var699_upvw.Name}!`
                UpdateText_upvr(var701)
                while true do
                    var701 = ClientData_upvr_2
                    if #var701.CurrentlyCarrying ~= 0 then break end
                    task.wait(0.1)
                end
                var701 = ClientData_upvr_2
                var699_upvw = var701.CurrentlyCarrying[1]
            end
            var701 = var699_upvw.Name
            UpdateText_upvr(arg1(var701))
            local function Update(arg1_35) -- Line 1107
                --[[ Upvalues[4]:
                    [1]: ButtonArrow_upvr (copied, readonly)
                    [2]: Drop_upvr_3 (copied, readonly)
                    [3]: UpdateTarget_upvr (copied, readonly)
                    [4]: arg4 (copied, readonly)
                ]]
                if arg1_35 then
                else
                end
                task.spawn(ButtonArrow_upvr, Drop_upvr_3, nil)
                Drop_upvr_3:SetAttribute("Locked", not arg1_35)
                if arg1_35 or not arg4 then
                end
                UpdateTarget_upvr(nil)
            end
            var701 = var699_upvw.Instance
            var698_upvw = var701.Destroying:Once(function() -- Line 1114
                --[[ Upvalues[3]:
                    [1]: var697_upvw (copied, read and write)
                    [2]: var698_upvw (copied, read and write)
                    [3]: SelectNewItem (copied, readonly)
                ]]
                var697_upvw:Disconnect()
                var698_upvw:Disconnect()
                SelectNewItem()
            end)
            var701 = any_Get_result1_3_upvr.Inside[arg3]
            var697_upvw = var701.Fired:Connect(Update)
            var701 = any_Get_result1_3_upvr.Inside
            local any_Get_result1_2 = var701[arg3]:Get()
            if any_Get_result1_2 then
                var701 = 1
            else
                var701 = nil
            end
            task.spawn(ButtonArrow_upvr, Drop_upvr_3, var701)
            Drop_upvr_3:SetAttribute("Locked", not any_Get_result1_2)
            if any_Get_result1_2 or not arg4 then
            end
            UpdateTarget_upvr(nil)
        end
        SelectNewItem()
        return var697_upvw, var698_upvw
    end
    GuiHandler_upvr_2.Sides.Appear("Right", false)
    GuiHandler_upvr_2.Sides.Appear("Left", false)
    for i_14, v_14 in {function() -- Line 1131
        --[[ Upvalues[9]:
            [1]: Network_upvr_2 (readonly)
            [2]: var661_upvr (readonly)
            [3]: YieldBought_upvr (readonly)
            [4]: any_GetGui_result1_upvr (readonly)
            [5]: any_Get_result1_3_upvr (readonly)
            [6]: ClientData_upvr_2 (readonly)
            [7]: UpdateText_upvr (readonly)
            [8]: ButtonArrow_upvr (readonly)
            [9]: UpdateTarget_upvr (readonly)
        ]]
        -- KONSTANTERROR: [0] 1. Error Block 14 start (CF ANALYSIS FAILED)
        Network_upvr_2.Channel("Funnels"):FireServer("Progression", 1)
        if 150 < var661_upvr.Cash then
            YieldBought_upvr(150)
        end
        Network_upvr_2.Channel("Funnels"):FireServer("Progression", 2)
        local function var706_upvr(arg1) -- Line 1146
            return `Drop {arg1} on your plot!`
        end
        local var707_upvw
        local var708_upvw
        local var709_upvw
        local Drop_upvr_2 = any_GetGui_result1_upvr.Bottom.BottomButtons.Bar1.Drop
        local Position_upvr_3 = (any_Get_result1_3_upvr.Floor.CFrame * CFrame.new(0, 1, 0)).Position
        local var712_upvr = "Plot"
        local function SelectNewItem() -- Line 1093
            --[[ Upvalues[13]:
                [1]: var709_upvw (read and write)
                [2]: ClientData_upvr_2 (copied, readonly)
                [3]: UpdateText_upvr (copied, readonly)
                [4]: var706_upvr (readonly)
                [5]: ButtonArrow_upvr (copied, readonly)
                [6]: Drop_upvr_2 (readonly)
                [7]: UpdateTarget_upvr (copied, readonly)
                [8]: Position_upvr_3 (readonly)
                [9]: var708_upvw (read and write)
                [10]: var707_upvw (read and write)
                [11]: SelectNewItem (readonly)
                [12]: any_Get_result1_3_upvr (copied, readonly)
                [13]: var712_upvr (readonly)
            ]]
            -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
            while true do
                local var713
                if var709_upvw then break end
                var713 = ClientData_upvr_2
                var709_upvw = var713.Items[1]
                task.wait(0.1)
            end
            if not var709_upvw.Carrying then
                var713 = `Pick up {var709_upvw.Name}!`
                UpdateText_upvr(var713)
                while true do
                    var713 = ClientData_upvr_2
                    if #var713.CurrentlyCarrying ~= 0 then break end
                    task.wait(0.1)
                end
                var713 = ClientData_upvr_2
                var709_upvw = var713.CurrentlyCarrying[1]
            end
            var713 = var709_upvw.Name
            UpdateText_upvr(var706_upvr(var713))
            local function Update(arg1) -- Line 1107
                --[[ Upvalues[4]:
                    [1]: ButtonArrow_upvr (copied, readonly)
                    [2]: Drop_upvr_2 (copied, readonly)
                    [3]: UpdateTarget_upvr (copied, readonly)
                    [4]: Position_upvr_3 (copied, readonly)
                ]]
                if arg1 then
                else
                end
                task.spawn(ButtonArrow_upvr, Drop_upvr_2, nil)
                Drop_upvr_2:SetAttribute("Locked", not arg1)
                if arg1 or not Position_upvr_3 then
                end
                UpdateTarget_upvr(nil)
            end
            var713 = var709_upvw.Instance
            var708_upvw = var713.Destroying:Once(function() -- Line 1114
                --[[ Upvalues[3]:
                    [1]: var707_upvw (copied, read and write)
                    [2]: var708_upvw (copied, read and write)
                    [3]: SelectNewItem (copied, readonly)
                ]]
                var707_upvw:Disconnect()
                var708_upvw:Disconnect()
                SelectNewItem()
            end)
            var713 = any_Get_result1_3_upvr.Inside[var712_upvr]
            var707_upvw = var713.Fired:Connect(Update)
            var713 = any_Get_result1_3_upvr.Inside
            local any_Get_result1 = var713[var712_upvr]:Get()
            if any_Get_result1 then
                var713 = 1
            else
                var713 = nil
            end
            task.spawn(ButtonArrow_upvr, Drop_upvr_2, var713)
            Drop_upvr_2:SetAttribute("Locked", not any_Get_result1)
            if any_Get_result1 or not Position_upvr_3 then
            end
            UpdateTarget_upvr(nil)
        end
        var712_upvr = SelectNewItem
        var712_upvr()
        var706_upvr = false
        -- KONSTANTERROR: [0] 1. Error Block 14 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [113] 87. Error Block 10 start (CF ANALYSIS FAILED)
        Drop_upvr_2 = task.wait
        Drop_upvr_2(0.1)
        -- KONSTANTERROR: [113] 87. Error Block 10 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [97] 75. Error Block 4 start (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [97] 75. Error Block 4 end (CF ANALYSIS FAILED)
    end, function() -- Line 1166
        --[[ Upvalues[8]:
            [1]: any_GetGui_result1_upvr (readonly)
            [2]: var661_upvr (readonly)
            [3]: ClientData_upvr_2 (readonly)
            [4]: UpdateText_upvr (readonly)
            [5]: UpdateTarget_upvr (readonly)
            [6]: ButtonArrow_upvr (readonly)
            [7]: Network_upvr_2 (readonly)
            [8]: any_Get_result1_3_upvr (readonly)
        ]]
        -- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
        local Buttons = any_GetGui_result1_upvr.Parent.Billboards.Manage.Buttons
        local _ = any_GetGui_result1_upvr.Game.Sell.Main
        local Sales_2 = var661_upvr.Plot.Claims.Sales
        -- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [207] 145. Error Block 27 start (CF ANALYSIS FAILED)
        Network_upvr_2.Channel("Funnels"):FireServer("Progression", 4)
        UpdateTarget_upvr(nil)
        UpdateText_upvr(`Wait for {Sales_2.Name} to sell!`)
        ClientData_upvr_2.ItemRemoved:Wait()
        Buttons.Delist:SetAttribute("Locked", nil)
        Buttons.Move:SetAttribute("Locked", nil)
        -- KONSTANTERROR: [207] 145. Error Block 27 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [249] 177. Error Block 35 start (CF ANALYSIS FAILED)
        Network_upvr_2.Channel("Funnels"):FireServer("Progression", 5)
        UpdateText_upvr("Claim your cash!")
        UpdateTarget_upvr(any_Get_result1_3_upvr.Folder:WaitForChild("CurrentUpgrade"):WaitForChild("Buttons"):WaitForChild("ClaimSales"):WaitForChild("Press"))
        while var661_upvr.Cash == var661_upvr.Cash do
            task.wait()
        end
        Network_upvr_2.Channel("Funnels"):FireServer("Progression", 6)
        UpdateTarget_upvr(nil)
        UpdateText_upvr(nil)
        -- KONSTANTERROR: [249] 177. Error Block 35 end (CF ANALYSIS FAILED)
    end, function() -- Line 1247
        --[[ Upvalues[6]:
            [1]: var661_upvr (readonly)
            [2]: GameFormulas_upvr (readonly)
            [3]: UpdateText_upvr (readonly)
            [4]: UpdateTarget_upvr (readonly)
            [5]: any_Get_result1_3_upvr (readonly)
            [6]: Network_upvr_2 (readonly)
        ]]
        while var661_upvr.Cash < GameFormulas_upvr.Prices.Plot.Upgrade[2] do
            task.wait()
        end
        UpdateText_upvr("Upgrade your plot!")
        UpdateTarget_upvr(any_Get_result1_3_upvr.Folder.CurrentUpgrade.Buttons.PlotUpgrade.Press)
        print(any_Get_result1_3_upvr.Upgrade)
        while not (not any_Get_result1_3_upvr.Upgrade or any_Get_result1_3_upvr.Upgrade ~= 1) do
            task.wait()
        end
        Network_upvr_2.Channel("Funnels"):FireServer("Progression", 7)
        UpdateText_upvr(nil)
        UpdateTarget_upvr(nil)
    end, function() -- Line 1264
        --[[ Upvalues[9]:
            [1]: any_GetGui_result1_upvr (readonly)
            [2]: ClientData_upvr_2 (readonly)
            [3]: var661_upvr (readonly)
            [4]: YieldBought_upvr (readonly)
            [5]: UpdateText_upvr (readonly)
            [6]: UpdateTarget_upvr (readonly)
            [7]: any_Get_result1_3_upvr (readonly)
            [8]: ButtonArrow_upvr (readonly)
            [9]: Network_upvr_2 (readonly)
        ]]
        -- KONSTANTERROR: [0] 1. Error Block 22 start (CF ANALYSIS FAILED)
        if 150 <= var661_upvr.Cash then
            YieldBought_upvr(150)
        end
        local _1_upvw = ClientData_upvr_2.Items[1]
        local Buttons_upvr = any_GetGui_result1_upvr.Parent.Billboards.Manage.Buttons
        local Drop_upvr = any_GetGui_result1_upvr.Bottom.BottomButtons.Bar1.Drop
        local var725_upvw
        local var726_upvw
        local function SelectNewItem_upvr() -- Line 1275, Named "SelectNewItem"
            --[[ Upvalues[12]:
                [1]: _1_upvw (read and write)
                [2]: ClientData_upvr_2 (copied, readonly)
                [3]: Buttons_upvr (readonly)
                [4]: UpdateText_upvr (copied, readonly)
                [5]: UpdateTarget_upvr (copied, readonly)
                [6]: any_Get_result1_3_upvr (copied, readonly)
                [7]: ButtonArrow_upvr (copied, readonly)
                [8]: any_GetGui_result1_upvr (copied, readonly)
                [9]: Drop_upvr (readonly)
                [10]: var725_upvw (read and write)
                [11]: var726_upvw (read and write)
                [12]: SelectNewItem_upvr (readonly)
            ]]
            while true do
                local var727
                if _1_upvw then break end
                var727 = ClientData_upvr_2
                _1_upvw = var727.Items[1]
                task.wait(0.1)
            end
            var727 = "Locked"
            Buttons_upvr.Sell:SetAttribute(var727, true)
            if not _1_upvw.Carrying then
                var727 = `Pick up {_1_upvw.Name}!`
                UpdateText_upvr(var727)
                while true do
                    var727 = ClientData_upvr_2
                    if #var727.CurrentlyCarrying ~= 0 then break end
                    task.wait(0.1)
                end
                var727 = ClientData_upvr_2
                _1_upvw = var727.CurrentlyCarrying[1]
            end
            var727 = `Drop {_1_upvw.Name} inside of vault!`
            UpdateText_upvr(var727)
            var727 = any_Get_result1_3_upvr.Folder.CurrentUpgrade.Vault.Floor.CFrame * CFrame.new(0, -5, 0)
            UpdateTarget_upvr(var727.Position)
            var727 = _1_upvw.Instance
            var725_upvw = var727.Destroying:Once(function() -- Line 1298
                --[[ Upvalues[3]:
                    [1]: var726_upvw (copied, read and write)
                    [2]: var725_upvw (copied, read and write)
                    [3]: SelectNewItem_upvr (copied, readonly)
                ]]
                var726_upvw:Disconnect()
                var725_upvw:Disconnect()
                SelectNewItem_upvr()
            end)
            var727 = any_Get_result1_3_upvr.Inside.Vault
            var726_upvw = var727.Fired:Connect(function(arg1) -- Line 1292, Named "Update"
                --[[ Upvalues[3]:
                    [1]: ButtonArrow_upvr (copied, readonly)
                    [2]: any_GetGui_result1_upvr (copied, readonly)
                    [3]: Drop_upvr (copied, readonly)
                ]]
                if arg1 then
                else
                end
                task.spawn(ButtonArrow_upvr, any_GetGui_result1_upvr.Bottom.BottomButtons.Bar1.Drop, nil)
                Drop_upvr:SetAttribute("Locked", not arg1)
            end)
            var727 = any_Get_result1_3_upvr.Inside
            local any_Get_result1_7 = var727.Vault:Get()
            if any_Get_result1_7 then
                var727 = 1
            else
                var727 = nil
            end
            task.spawn(ButtonArrow_upvr, any_GetGui_result1_upvr.Bottom.BottomButtons.Bar1.Drop, var727)
            Drop_upvr:SetAttribute("Locked", not any_Get_result1_7)
        end
        SelectNewItem_upvr()
        -- KONSTANTERROR: [0] 1. Error Block 22 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [65] 51. Error Block 10 start (CF ANALYSIS FAILED)
        task.wait(0.1)
        -- KONSTANTERROR: [65] 51. Error Block 10 end (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [49] 39. Error Block 4 start (CF ANALYSIS FAILED)
        -- KONSTANTERROR: [49] 39. Error Block 4 end (CF ANALYSIS FAILED)
    end} do
        if i_14 >= var661_upvr.TutorialStage then
            local _ = {v_14(unpack({}))}
            Network_upvr_2.Channel("Tutorial"):FireServer("Stage")
        end
    end
    var662_upvw = false
    GuiHandler_upvr_2.Sides.Appear("Right", true)
    GuiHandler_upvr_2.Sides.Appear("Left", true)
    if not var661_upvr.TutorialSlapped then
        while not nil do
            v_14 = ItemHandler_upvr.Signals
            i_14 = v_14.Stolen:Wait()
            local any_Wait_result1, any_Wait_result2 = v_14.Stolen:Wait()
        end
        any_Wait_result1 = any_Wait_result1.Character
        if any_Wait_result1 then
            any_Wait_result2 = any_Wait_result1:FindFirstChild("HumanoidRootPart")
            if any_Wait_result2 then
                UpdateText_upvr("Use your \"Slap Hand\" tool to stop the stealer!", "Bottom")
                UpdateTarget_upvr(any_Wait_result2)
                local ToolSample_upvr = any_GetGui_result1_upvr.Game.ToolSample
                task.spawn(function() -- Line 1372
                    --[[ Upvalues[3]:
                        [1]: LocalPlayer_upvr (readonly)
                        [2]: ToolSample_upvr (readonly)
                        [3]: ButtonArrow_upvr (readonly)
                    ]]
                    local Slap_Hand_2 = LocalPlayer_upvr.Backpack:FindFirstChild("Slap Hand")
                    if Slap_Hand_2 and game.StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.Backpack) then
                        ToolSample_upvr.Visible = true
                        task.defer(ButtonArrow_upvr, ToolSample_upvr, 1)
                        Slap_Hand_2.Equipped:Wait()
                        ButtonArrow_upvr(ToolSample_upvr, nil)
                    end
                end)
            end
        end
        any_Wait_result2 = ItemHandler_upvr.Signals.Stolen:Wait()
        local any_Wait_result1_2, _ = ItemHandler_upvr.Signals.Stolen:Wait()
        any_Wait_result1_2 = UpdateText_upvr
        any_Wait_result1_2(nil)
        any_Wait_result1_2 = UpdateTarget_upvr
        any_Wait_result1_2(nil)
    end
end
