-- Script Path: game:GetService("Workspace").ImNotWhyLclc.SPH_Character.CharacterClient
-- Took 2.26s to decompile.
-- Executor: Delta (1.0.686.866)

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-08-24 06:36:39
-- Luau version 6, Types version 3
-- Time taken: 0.076959 seconds

-- KONSTANTERROR: [0] 1. Error Block 79 start (CF ANALYSIS FAILED)
local UserInputService_upvr = game:GetService("UserInputService")
local Debris_upvr = game:GetService("Debris")
local TweenService_upvr = game:GetService("TweenService")
local SPH_Assets_upvr = game:GetService("ReplicatedStorage").SPH_Assets
local Modules_2 = SPH_Assets_upvr.Modules
local LocalPlayer_2_upvr = game:GetService("Players").LocalPlayer
local Parent_upvr = script.Parent.Parent
local Humanoid_upvr = Parent_upvr:WaitForChild("Humanoid")
local HumanoidRootPart_upvr_2 = Parent_upvr:WaitForChild("HumanoidRootPart")
local var367_upvr
if Humanoid_upvr.RigType == Enum.HumanoidRigType.R6 then
else
end
local CurrentCamera_upvr = workspace.CurrentCamera
if CurrentCamera_upvr.CameraSubject ~= Humanoid_upvr then
    CurrentCamera_upvr.CameraSubject = Humanoid_upvr
end
CurrentCamera_upvr.CameraType = Enum.CameraType.Custom
if CurrentCamera_upvr:FindFirstChild("WeaponRig") then
    CurrentCamera_upvr.WeaponRig:Destroy()
end
local BridgeNet = require(Modules_2.BridgeNet)
local SpringModule = require(Modules_2.SpringModule)
local ShellEjection_upvr_2 = require(Modules_2.ShellEjection)
local BulletHandler_upvr = require(Modules_2.BulletHandler)
BulletHandler_upvr.Initialize(LocalPlayer_2_upvr)
local GameConfig_upvr_2 = require(SPH_Assets_upvr.GameConfig)
Humanoid_upvr.WalkSpeed = GameConfig_upvr_2.walkSpeed
local RaycastParams_new_result1_2_upvr = RaycastParams.new()
RaycastParams_new_result1_2_upvr.IgnoreWater = true
RaycastParams_new_result1_2_upvr.RespectCanCollide = true
RaycastParams_new_result1_2_upvr.FilterType = Enum.RaycastFilterType.Exclude
RaycastParams_new_result1_2_upvr.FilterDescendantsInstances = {Parent_upvr, CurrentCamera_upvr, workspace:WaitForChild("SPH_Workspace"):WaitForChild("Shells")}
local walkSpeed_upvw_2 = GameConfig_upvr_2.walkSpeed
var367_upvr = game.Lighting:FindFirstChild("SPH_DoF")
if not var367_upvr then
    var367_upvr = GameConfig_upvr_2.blurEffects
    if var367_upvr then
        var367_upvr = Instance.new("DepthOfFieldEffect", game.Lighting)
    end
end
if var367_upvr then
    var367_upvr.Name = "SPH_DoF"
end
local var377_upvw = false
local var378_upvw = false
local var379_upvw = false
local var380_upvw = false
local var381_upvw = true
local var382_upvw = false
local var383_upvw = false
local var384_upvw = false
local var385_upvw = false
local tbl_43_upvr = {
    Safe = 0;
    Semi = 1;
    Auto = 2;
    Burst = 3;
    Manual = 4;
}
local var387_upvw
local var388_upvw
local var389_upvw
local var390_upvw
local var391_upvw
local var392_upvw
local var393_upvw
local var394_upvw
local var395_upvw
local zero_cframe_upvw_3 = CFrame.new()
local zero_cframe_upvw_2 = CFrame.new()
local cframe_upvr_2 = CFrame.new(1000000, 0, 0)
local var399_upvw = 0
local any_LoadAnimation_result1_6_upvr = Humanoid_upvr.Animator:LoadAnimation(SPH_Assets_upvr.Animations.Crouch_Idle)
any_LoadAnimation_result1_6_upvr.Looped = true
any_LoadAnimation_result1_6_upvr.Priority = Enum.AnimationPriority.Idle
local any_LoadAnimation_result1_upvr_5 = Humanoid_upvr.Animator:LoadAnimation(SPH_Assets_upvr.Animations.Crouch_Move)
any_LoadAnimation_result1_upvr_5.Looped = true
any_LoadAnimation_result1_upvr_5.Priority = Enum.AnimationPriority.Movement
local any_LoadAnimation_result1_upvr = Humanoid_upvr.Animator:LoadAnimation(SPH_Assets_upvr.Animations.Prone_Idle)
any_LoadAnimation_result1_upvr.Looped = true
any_LoadAnimation_result1_upvr.Priority = Enum.AnimationPriority.Idle
local any_LoadAnimation_result1_upvr_3 = Humanoid_upvr.Animator:LoadAnimation(SPH_Assets_upvr.Animations.Prone_Move)
any_LoadAnimation_result1_upvr_3.Looped = true
any_LoadAnimation_result1_upvr_3.Priority = Enum.AnimationPriority.Movement
local tbl_39_upvr = {}
local const_number_upvw_2 = 1
local Mobile_2 = LocalPlayer_2_upvr:WaitForChild("PlayerGui"):WaitForChild("Mobile")
local var407_upvw = 0
local SavedAimSensitivity_upvw_2 = LocalPlayer_2_upvr:GetAttribute("SavedAimSensitivity")
if not SavedAimSensitivity_upvw_2 then
    SavedAimSensitivity_upvw_2 = GameConfig_upvr_2.defaultAimSensitivity
end
local clone_9_upvr = SPH_Assets_upvr.HUD.LaserDotUI:Clone()
local Attachment = Instance.new("Attachment")
Attachment.Parent = workspace.Terrain
clone_9_upvr.Enabled = false
clone_9_upvr.Parent = Attachment
local Beam = Instance.new("Beam")
Beam.Attachment1 = Attachment
Beam.LightInfluence = 0
Beam.Brightness = 3
Beam.Segments = 1
Beam.Width0 = 0.02
Beam.Width1 = 0.02
Beam.FaceCamera = true
Beam.Transparency = NumberSequence.new(0.5)
Beam.Name = "FirstPersonLaser"
Beam.Parent = Attachment
Beam.Enabled = false
local clone_7_upvr = Beam:Clone()
clone_7_upvr.Name = "ThirdPersonLaser"
clone_7_upvr.Parent = Attachment
clone_7_upvr.Enabled = false
if HumanoidRootPart_upvr_2:FindFirstChild("Died") then
    HumanoidRootPart_upvr_2.Died.Volume = 0
end
if GameConfig_upvr_2.lockFirstPerson then
    LocalPlayer_2_upvr.CameraMode = Enum.CameraMode.Classic
end
rig = require(Modules_2.ViewMod).RigModel(LocalPlayer_2_upvr) -- Setting global
local Left_Arm_2_upvr = rig["Left Arm"]
local Right_Arm_2_upvr = rig["Right Arm"]
Left_Arm_2_upvr.Color = Parent_upvr["Left Arm"].Color
Right_Arm_2_upvr.Color = Parent_upvr["Right Arm"].Color
for _, v in ipairs(rig:GetDescendants()) do
    if v.Name == "Skin" then
        if v.Parent.Name == "Left Arm" then
            v.Color = Parent_upvr["Left Arm"].Color
        elseif v.Parent.Name == "Right Arm" then
            v.Color = Parent_upvr["Right Arm"].Color
        end
    end
end
for _, v_2 in ipairs(Enum.HumanoidStateType:GetEnumItems()) do
    if v_2 ~= Enum.HumanoidStateType.None then
        Instance.new("Humanoid", rig):SetStateEnabled(v_2, false)
    end
end
local AnimBase_upvr = rig.AnimBase
AnimBase_upvr.CFrame = cframe_upvr_2
rig.Parent = CurrentCamera_upvr
-- KONSTANTERROR: [0] 1. Error Block 79 end (CF ANALYSIS FAILED)
-- KONSTANTERROR: [684] 451. Error Block 33 start (CF ANALYSIS FAILED)
local WeaponRig_upvr_2 = Parent_upvr:WaitForChild("WeaponRig")
-- KONSTANTERROR: [684] 451. Error Block 33 end (CF ANALYSIS FAILED)
-- KONSTANTERROR: [688] 454. Error Block 80 start (CF ANALYSIS FAILED)
local regularUi_upvr = Mobile_2:WaitForChild("regularUi")
local gunUi_upvr = Mobile_2:WaitForChild("gunUi")
;(function() -- Line 249, Named "SetupGUIConnections"
    --[[ Upvalues[4]:
        [1]: regularUi_upvr (readonly)
        [2]: LocalPlayer_2_upvr (readonly)
        [3]: gunUi_upvr (readonly)
        [4]: GameConfig_upvr_2 (readonly)
    ]]
    regularUi_upvr.leanleft.MouseButton1Click:Connect(function() -- Line 250
        HandleInput("SPH_LeanLeft", Enum.UserInputState.Begin, nil)
    end)
    regularUi_upvr.leanright.MouseButton1Click:Connect(function() -- Line 254
        HandleInput("SPH_LeanRight", Enum.UserInputState.Begin, nil)
    end)
    regularUi_upvr.crouch.MouseButton1Click:Connect(function() -- Line 258
        HandleInput("SPH_StanceLower", Enum.UserInputState.Begin, nil)
    end)
    regularUi_upvr.stand.MouseButton1Click:Connect(function() -- Line 262
        HandleInput("SPH_StanceRaise", Enum.UserInputState.Begin, nil)
    end)
    local function var429() -- Line 266
        game.ReplicatedStorage.remotes.push:FireServer()
    end
    regularUi_upvr.push.MouseButton1Click:Connect(var429)
    local push_upvr_2 = regularUi_upvr.push
    if LocalPlayer_2_upvr:GetAttribute("push") ~= true then
        var429 = false
    else
        var429 = true
    end
    push_upvr_2.Visible = var429
    LocalPlayer_2_upvr:GetAttributeChangedSignal("push"):Connect(function() -- Line 272, Named "updateGUI"
        --[[ Upvalues[2]:
            [1]: push_upvr_2 (readonly)
            [2]: LocalPlayer_2_upvr (copied, readonly)
        ]]
        local var431
        if LocalPlayer_2_upvr:GetAttribute("push") ~= true then
            var431 = false
        else
            var431 = true
        end
        push_upvr_2.Visible = var431
    end)
    regularUi_upvr.sprint.MouseButton1Down:Connect(function() -- Line 280
        HandleInput("SPH_Sprint", Enum.UserInputState.Begin, nil)
    end)
    regularUi_upvr.sprint.MouseButton1Up:Connect(function() -- Line 284
        HandleInput("SPH_Sprint", Enum.UserInputState.End, nil)
    end)
    gunUi_upvr.fire.MouseButton1Down:Connect(function() -- Line 290
        HandleInput("SPH_Trigger", Enum.UserInputState.Begin, nil)
    end)
    gunUi_upvr.fire.MouseButton1Up:Connect(function() -- Line 294
        HandleInput("SPH_Trigger", Enum.UserInputState.End, nil)
    end)
    gunUi_upvr.reload.MouseButton1Click:Connect(function() -- Line 298
        HandleInput("SPH_Reload", Enum.UserInputState.Begin, nil)
    end)
    gunUi_upvr.chamber.MouseButton1Click:Connect(function() -- Line 303
        HandleInput("SPH_Chamber", Enum.UserInputState.Begin, nil)
    end)
    if GameConfig_upvr_2.toggleAiming then
        gunUi_upvr.aim.MouseButton1Click:Connect(function() -- Line 309
            HandleInput("SPH_HoldAim", Enum.UserInputState.Begin, nil)
        end)
    else
        gunUi_upvr.aim.MouseButton1Down:Connect(function() -- Line 313
            HandleInput("SPH_HoldAim", Enum.UserInputState.Begin, nil)
        end)
        gunUi_upvr.aim.MouseButton1Up:Connect(function() -- Line 316
            HandleInput("SPH_HoldAim", Enum.UserInputState.End, nil)
        end)
    end
end)()
if UserInputService_upvr.TouchEnabled == true then
    game.ReplicatedStorage.remotes.device:FireServer("mobile")
else
    game.ReplicatedStorage.remotes.device:FireServer("neutral")
end
local var441_upvw = false
local any_CreateBridge_result1_upvr_3 = BridgeNet.CreateBridge("PlaySound")
local function PlayRepSound_upvr(arg1) -- Line 330, Named "PlayRepSound"
    --[[ Upvalues[7]:
        [1]: var441_upvw (read and write)
        [2]: var390_upvw (read and write)
        [3]: var387_upvw (read and write)
        [4]: var378_upvw (read and write)
        [5]: HumanoidRootPart_upvr_2 (readonly)
        [6]: Debris_upvr (readonly)
        [7]: any_CreateBridge_result1_upvr_3 (readonly)
    ]]
    if not var441_upvw then
        local SOME_10 = var390_upvw.Grip:FindFirstChild(arg1)
        if SOME_10 and var387_upvw then
            if var378_upvw then
                SOME_10:Play()
            else
                local clone_5 = SOME_10:Clone()
                clone_5.Parent = HumanoidRootPart_upvr_2
                clone_5:Play()
                Debris_upvr:AddItem(clone_5, clone_5.TimeLength)
            end
            any_CreateBridge_result1_upvr_3:Fire(arg1, var378_upvw)
        end
    end
end
local function _() -- Line 347, Named "IsLoaded"
    --[[ Upvalues[3]:
        [1]: var388_upvw (read and write)
        [2]: var387_upvw (read and write)
        [3]: var391_upvw (read and write)
    ]]
    local var445
    local function INLINED_5() -- Internal function, doesn't exist in bytecode
        var445 = var387_upvw.Chambered.Value
        return var445
    end
    local function INLINED_6() -- Internal function, doesn't exist in bytecode
        var445 = var388_upvw.openBolt
        return var445
    end
    if var388_upvw.openBolt or not INLINED_5() or INLINED_6() then
        if 0 >= var391_upvw.MagAmmo.Value then
            var445 = false
        else
            var445 = true
        end
    end
    return var445
end
local any_CreateBridge_result1_upvr_15 = BridgeNet.CreateBridge("PlayCharacterSound")
local function PlayCharSound_upvr(arg1) -- Line 351, Named "PlayCharSound"
    --[[ Upvalues[4]:
        [1]: SPH_Assets_upvr (readonly)
        [2]: HumanoidRootPart_upvr_2 (readonly)
        [3]: Debris_upvr (readonly)
        [4]: any_CreateBridge_result1_upvr_15 (readonly)
    ]]
    local SOME_9 = SPH_Assets_upvr.Sounds:FindFirstChild(arg1)
    if SOME_9 then
        local children_2 = SOME_9:GetChildren()
        local clone_8 = children_2[math.random(#children_2)]:Clone()
        clone_8.Parent = HumanoidRootPart_upvr_2
        clone_8:Play()
        Debris_upvr:AddItem(clone_8, clone_8.TimeLength)
        any_CreateBridge_result1_upvr_15:Fire(arg1)
    end
end
local function IsPartClipping_upvr(arg1) -- Line 363, Named "IsPartClipping"
    --[[ Upvalues[1]:
        [1]: Parent_upvr (readonly)
    ]]
    if not arg1 or not arg1:IsA("BasePart") then
        return false
    end
    local OverlapParams_new_result1_2 = OverlapParams.new()
    OverlapParams_new_result1_2.FilterType = Enum.RaycastFilterType.Exclude
    OverlapParams_new_result1_2.FilterDescendantsInstances = {Parent_upvr}
    for _, v_3 in ipairs(workspace:GetPartBoundsInBox(arg1.CFrame, arg1.Size * 0.9, OverlapParams_new_result1_2)) do
        if v_3.CanCollide and not v_3:IsDescendantOf(Parent_upvr) and v_3.Position.Y - arg1.Position.Y >= -0.3 then
            return true
        end
    end
    return false
end
local function IsCharacterClipping_upvr() -- Line 390, Named "IsCharacterClipping"
    --[[ Upvalues[2]:
        [1]: Parent_upvr (readonly)
        [2]: IsPartClipping_upvr (readonly)
    ]]
    local tbl_30 = {}
    local Right_Arm_3 = Parent_upvr:FindFirstChild("Right Arm")
    local Left_Arm_3 = Parent_upvr:FindFirstChild("Left Arm")
    local Torso_2 = Parent_upvr:FindFirstChild("Torso")
    local HumanoidRootPart = Parent_upvr:FindFirstChild("HumanoidRootPart")
    if Right_Arm_3 then
        table.insert(tbl_30, Right_Arm_3)
    end
    if Left_Arm_3 then
        table.insert(tbl_30, Left_Arm_3)
    end
    if Torso_2 then
        table.insert(tbl_30, Torso_2)
    end
    if HumanoidRootPart then
        table.insert(tbl_30, HumanoidRootPart)
    end
    for _, v_4 in ipairs(tbl_30) do
        if IsPartClipping_upvr(v_4) then
            return true
        end
    end
    return false
end
leanBlocked = false -- Setting global
local any_CreateBridge_result1_upvr_14 = BridgeNet.CreateBridge("PlayerLean")
local function ChangeLean_upvr(arg1) -- Line 414, Named "ChangeLean"
    --[[ Upvalues[6]:
        [1]: GameConfig_upvr_2 (readonly)
        [2]: var399_upvw (read and write)
        [3]: IsCharacterClipping_upvr (readonly)
        [4]: PlayCharSound_upvr (readonly)
        [5]: var407_upvw (read and write)
        [6]: any_CreateBridge_result1_upvr_14 (readonly)
    ]]
    local var468
    if not GameConfig_upvr_2.canLean then
    else
        if var399_upvw == 2 or script.Parent.MovementLeaning:GetAttribute("DisableLean") then
            var468 = 0
        end
        if leanBlocked then
            var468 = 0
        end
        if var468 ~= 0 and IsCharacterClipping_upvr() then
            var468 = 0
            leanBlocked = true -- Setting global
            PlayCharSound_upvr("Bump")
        end
        if var468 ~= var407_upvw then
            PlayCharSound_upvr("Lean")
        end
        var407_upvw = var468
        if any_CreateBridge_result1_upvr_14 then
            any_CreateBridge_result1_upvr_14:Fire(var468)
        end
    end
end
game["Run Service"].RenderStepped:Connect(function() -- Line 442
    --[[ Upvalues[4]:
        [1]: var407_upvw (read and write)
        [2]: IsCharacterClipping_upvr (readonly)
        [3]: ChangeLean_upvr (readonly)
        [4]: PlayCharSound_upvr (readonly)
    ]]
    -- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [6] 6. Error Block 3 start (CF ANALYSIS FAILED)
    ChangeLean_upvr(0)
    leanBlocked = true -- Setting global
    PlayCharSound_upvr("Bump")
    do
        return
    end
    -- KONSTANTERROR: [6] 6. Error Block 3 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [16] 15. Error Block 8 start (CF ANALYSIS FAILED)
    if leanBlocked and not IsCharacterClipping_upvr() then
        leanBlocked = false -- Setting global
    end
    -- KONSTANTERROR: [16] 15. Error Block 8 end (CF ANALYSIS FAILED)
end)
local any_CreateBridge_result1_upvr_2 = BridgeNet.CreateBridge("MoveBolt")
local function MoveBolt_upvr(arg1, arg2) -- Line 456, Named "MoveBolt"
    --[[ Upvalues[7]:
        [1]: BulletHandler_upvr (readonly)
        [2]: var390_upvw (read and write)
        [3]: var388_upvw (read and write)
        [4]: var391_upvw (read and write)
        [5]: WeaponRig_upvr_2 (readonly)
        [6]: PlayRepSound_upvr (readonly)
        [7]: any_CreateBridge_result1_upvr_2 (readonly)
    ]]
    BulletHandler_upvr.MoveBolt(var390_upvw, var388_upvw, arg1, var391_upvw.MagAmmo.Value)
    BulletHandler_upvr.MoveBolt(WeaponRig_upvr_2.Weapon:FindFirstChildWhichIsA("Model"), var388_upvw, arg1, var391_upvw.MagAmmo.Value)
    if var391_upvw.MagAmmo.Value <= 0 and not arg2 then
        PlayRepSound_upvr("Empty")
    end
    any_CreateBridge_result1_upvr_2:Fire(arg1, var391_upvw.MagAmmo.Value)
end
local function ToggleADS_upvr(arg1) -- Line 465, Named "ToggleADS"
    --[[ Upvalues[3]:
        [1]: var388_upvw (read and write)
        [2]: var390_upvw (read and write)
        [3]: TweenService_upvr (readonly)
    ]]
    if var388_upvw then
        local var479
        if var479 then
            var479 = nil
            if var388_upvw.aimTime then
                var479 = TweenInfo.new(var388_upvw.aimTime / 20, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, var388_upvw.aimTime / 20)
            else
                var479 = TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0.2)
            end
            if not arg1 then
                for _, v_5 in pairs(var390_upvw:GetChildren()) do
                    if v_5.Name == "REG" then
                        TweenService_upvr:Create(v_5, var479, {
                            Transparency = 0;
                        }):Play()
                    elseif v_5.Name == "ADS" then
                        TweenService_upvr:Create(v_5, var479, {
                            Transparency = 1;
                        }):Play()
                    end
                end
                return
            end
            if arg1 then
                for _, v_6 in pairs(var390_upvw:GetChildren()) do
                    if v_6.Name == "REG" then
                        TweenService_upvr:Create(v_6, var479, {
                            Transparency = 1;
                        }):Play()
                    elseif v_6.Name == "ADS" then
                        TweenService_upvr:Create(v_6, var479, {
                            Transparency = 0;
                        }):Play()
                    end
                end
            end
        end
    end
end
local function _() -- Line 493, Named "EjectShell"
    --[[ Upvalues[8]:
        [1]: var381_upvw (read and write)
        [2]: var388_upvw (read and write)
        [3]: var378_upvw (read and write)
        [4]: ShellEjection_upvr_2 (readonly)
        [5]: LocalPlayer_2_upvr (readonly)
        [6]: var387_upvw (read and write)
        [7]: var390_upvw (read and write)
        [8]: WeaponRig_upvr_2 (readonly)
    ]]
    var381_upvw = true
    if var388_upvw.shellEject then
        if var378_upvw then
            ShellEjection_upvr_2.ejectShell(LocalPlayer_2_upvr, var387_upvw, var390_upvw)
            return
        end
        ShellEjection_upvr_2.ejectShell(LocalPlayer_2_upvr, var387_upvw, WeaponRig_upvr_2.Weapon:FindFirstChildWhichIsA("Model"))
    end
end
local function _() -- Line 504, Named "GetThirdPersonGunModel"
    --[[ Upvalues[1]:
        [1]: WeaponRig_upvr_2 (readonly)
    ]]
    return WeaponRig_upvr_2.Weapon:FindFirstChildWhichIsA("Model")
end
local function StopAnimation_upvr(arg1, arg2) -- Line 509, Named "StopAnimation"
    --[[ Upvalues[1]:
        [1]: tbl_39_upvr (readonly)
    ]]
    if tbl_39_upvr[arg1] then
        if arg2 then
            tbl_39_upvr[arg1]:Stop(arg2)
            tbl_39_upvr[arg1.."ThirdPerson"]:Stop(arg2)
        else
            tbl_39_upvr[arg1]:Stop()
            tbl_39_upvr[arg1.."ThirdPerson"]:Stop()
        end
    end
end
local function _() -- Line 523, Named "SwitchFireMode"
    print("hi")
end
local Animations_upvr_2 = SPH_Assets_upvr.Animations
local Animator_upvr_4 = Instance.new("Animator", Instance.new("Humanoid", rig))
local Animator_upvr_2 = WeaponRig_upvr_2:WaitForChild("AnimationController").Animator
local any_CreateBridge_result1_upvr = BridgeNet.CreateBridge("Reload")
local any_CreateBridge_result1_upvr_20 = BridgeNet.CreateBridge("PlayerChamber")
local any_CreateBridge_result1_upvr_13 = BridgeNet.CreateBridge("MagGrab")
local any_CreateBridge_result1_upvr_12 = BridgeNet.CreateBridge("RepBoltOpen")
local function PlayAnimation_upvr(arg1, arg2, arg3, arg4) -- Line 528, Named "PlayAnimation"
    --[[ Upvalues[23]:
        [1]: tbl_39_upvr (readonly)
        [2]: Animations_upvr_2 (readonly)
        [3]: Animator_upvr_4 (readonly)
        [4]: Animator_upvr_2 (readonly)
        [5]: var390_upvw (read and write)
        [6]: PlayRepSound_upvr (readonly)
        [7]: var387_upvw (read and write)
        [8]: var388_upvw (read and write)
        [9]: var392_upvw (read and write)
        [10]: StopAnimation_upvr (readonly)
        [11]: PlayAnimation_upvr (readonly)
        [12]: any_CreateBridge_result1_upvr (readonly)
        [13]: var382_upvw (read and write)
        [14]: var391_upvw (read and write)
        [15]: any_CreateBridge_result1_upvr_20 (readonly)
        [16]: MoveBolt_upvr (readonly)
        [17]: var381_upvw (read and write)
        [18]: var378_upvw (read and write)
        [19]: ShellEjection_upvr_2 (readonly)
        [20]: LocalPlayer_2_upvr (readonly)
        [21]: WeaponRig_upvr_2 (readonly)
        [22]: any_CreateBridge_result1_upvr_13 (readonly)
        [23]: any_CreateBridge_result1_upvr_12 (readonly)
    ]]
    -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
    local var497
    if not arg2 then
    end
    local tbl_19 = {}
    var497 = nil
    if tbl_39_upvr[arg1] then
        local _ = tbl_39_upvr[arg1]
        var497 = tbl_39_upvr[arg1.."ThirdPerson"]
    elseif arg1 and Animations_upvr_2:FindFirstChild(arg1) then
        local any_LoadAnimation_result1_3_upvr = Animator_upvr_4:LoadAnimation(Animations_upvr_2[arg1])
        any_LoadAnimation_result1_3_upvr.Looped = tbl_19.looped or false
        local priority_2 = tbl_19.priority
        if not priority_2 then
            priority_2 = Enum.AnimationPriority.Action
        end
        any_LoadAnimation_result1_3_upvr.Priority = priority_2
        tbl_39_upvr[arg1] = any_LoadAnimation_result1_3_upvr
        local any_LoadAnimation_result1_5 = Animator_upvr_2:LoadAnimation(Animations_upvr_2[arg1])
        any_LoadAnimation_result1_5.Looped = tbl_19.looped or false
        local priority_3 = tbl_19.priority
        if not priority_3 then
            priority_3 = Enum.AnimationPriority.Action
        end
        any_LoadAnimation_result1_5.Priority = priority_3
        tbl_39_upvr[arg1.."ThirdPerson"] = any_LoadAnimation_result1_5
        any_LoadAnimation_result1_3_upvr.KeyframeReached:Connect(function(arg1_4) -- Line 546
            --[[ Upvalues[21]:
                [1]: var390_upvw (copied, read and write)
                [2]: PlayRepSound_upvr (copied, readonly)
                [3]: var387_upvw (copied, read and write)
                [4]: var388_upvw (copied, read and write)
                [5]: var392_upvw (copied, read and write)
                [6]: StopAnimation_upvr (copied, readonly)
                [7]: arg1 (readonly)
                [8]: PlayAnimation_upvr (copied, readonly)
                [9]: any_CreateBridge_result1_upvr (copied, readonly)
                [10]: any_LoadAnimation_result1_3_upvr (readonly)
                [11]: var382_upvw (copied, read and write)
                [12]: var391_upvw (copied, read and write)
                [13]: any_CreateBridge_result1_upvr_20 (copied, readonly)
                [14]: MoveBolt_upvr (copied, readonly)
                [15]: var381_upvw (copied, read and write)
                [16]: var378_upvw (copied, read and write)
                [17]: ShellEjection_upvr_2 (copied, readonly)
                [18]: LocalPlayer_2_upvr (copied, readonly)
                [19]: WeaponRig_upvr_2 (copied, readonly)
                [20]: any_CreateBridge_result1_upvr_13 (copied, readonly)
                [21]: any_CreateBridge_result1_upvr_12 (copied, readonly)
            ]]
            -- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
            -- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
            -- KONSTANTERROR: [8] 7. Error Block 2 start (CF ANALYSIS FAILED)
            PlayRepSound_upvr(arg1_4)
            -- KONSTANTERROR: [8] 7. Error Block 2 end (CF ANALYSIS FAILED)
            -- KONSTANTERROR: [11] 10. Error Block 3 start (CF ANALYSIS FAILED)
            -- KONSTANTERROR: [11] 10. Error Block 3 end (CF ANALYSIS FAILED)
        end)
        any_LoadAnimation_result1_3_upvr.Stopped:Connect(function() -- Line 690
            --[[ Upvalues[5]:
                [1]: arg3 (readonly)
                [2]: var392_upvw (copied, read and write)
                [3]: var388_upvw (copied, read and write)
                [4]: var390_upvw (copied, read and write)
                [5]: var387_upvw (copied, read and write)
            ]]
            if arg3 == "Equip" then
            elseif arg3 == "Reload" then
                var392_upvw = false
                if var388_upvw and var390_upvw and var390_upvw:FindFirstChild(var388_upvw.projectile) and var387_upvw.Chambered.Value then
                    local SOME_5 = var390_upvw:FindFirstChild(var388_upvw.projectile)
                    SOME_5.LocalTransparencyModifier = 0
                    for _, v_12 in ipairs(SOME_5:GetDescendants()) do
                        if v_12:IsA("BasePart") then
                            v_12.LocalTransparencyModifier = 0
                        end
                    end
                end
            end
        end)
        var497 = any_LoadAnimation_result1_5
    end
    if any_LoadAnimation_result1_3_upvr and not arg4 then
        any_LoadAnimation_result1_3_upvr = any_LoadAnimation_result1_3_upvr:Play
        any_LoadAnimation_result1_3_upvr(tbl_19.transSpeed or 0)
        any_LoadAnimation_result1_3_upvr = any_LoadAnimation_result1_3_upvr:AdjustSpeed
        any_LoadAnimation_result1_3_upvr(tbl_19.speed or 1)
        any_LoadAnimation_result1_3_upvr = var497:Play
        any_LoadAnimation_result1_3_upvr(tbl_19.transSpeed or 0)
        any_LoadAnimation_result1_3_upvr = var497:AdjustSpeed
        any_LoadAnimation_result1_3_upvr(tbl_19.speed or 1)
    end
    -- KONSTANTERROR: Expression was reused, decompilation is incorrect
    return any_LoadAnimation_result1_3_upvr
end
local var512_upvw = 0
local var513_upvw
local function ChangeHoldStance_upvr(arg1) -- Line 729, Named "ChangeHoldStance"
    --[[ Upvalues[6]:
        [1]: var393_upvw (read and write)
        [2]: var512_upvw (read and write)
        [3]: var513_upvw (read and write)
        [4]: StopAnimation_upvr (readonly)
        [5]: var388_upvw (read and write)
        [6]: PlayAnimation_upvr (readonly)
    ]]
    if var393_upvw then
    else
        if var512_upvw == arg1 then
            if var513_upvw then
                StopAnimation_upvr(var513_upvw.Name, 0.3)
                var513_upvw = nil
                var512_upvw = 0
                return
            end
        end
        var512_upvw = arg1
        if var513_upvw then
            StopAnimation_upvr(var513_upvw.Name, 0.3)
        end
        local var514
        if var512_upvw == 1 and var388_upvw.holdUpAnim then
            var514 = var388_upvw.holdUpAnim
        elseif var512_upvw == 2 and var388_upvw.patrolAnim then
            var514 = var388_upvw.patrolAnim
        elseif var512_upvw == 3 and var388_upvw.holdDownAnim then
            var514 = var388_upvw.holdDownAnim
        end
        if var514 then
            var513_upvw = PlayAnimation_upvr(var514, {
                looped = true;
                priority = Enum.AnimationPriority.Action;
                transSpeed = 0.3;
            })
            var513_upvw:Play()
            return
        end
        if var513_upvw then
            var513_upvw = nil
        end
    end
end
local var516_upvw
local var517_upvw = false
local function ChamberAnim_upvr() -- Line 760, Named "ChamberAnim"
    --[[ Upvalues[8]:
        [1]: var387_upvw (read and write)
        [2]: var516_upvw (read and write)
        [3]: tbl_43_upvr (readonly)
        [4]: var388_upvw (read and write)
        [5]: var392_upvw (read and write)
        [6]: var517_upvw (read and write)
        [7]: ChangeHoldStance_upvr (readonly)
        [8]: PlayAnimation_upvr (readonly)
    ]]
    -- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
    local var518
    -- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [7] 6. Error Block 15 start (CF ANALYSIS FAILED)
    if var516_upvw == tbl_43_upvr.Manual then
        -- KONSTANTERROR: [13] 10. Error Block 13 start (CF ANALYSIS FAILED)
        var518 = var388_upvw.boltChamber
        -- KONSTANTERROR: [13] 10. Error Block 13 end (CF ANALYSIS FAILED)
    else
        var518 = var388_upvw.boltClose
    end
    if var518 then
        var392_upvw = true
        var517_upvw = true
        ChangeHoldStance_upvr(0)
        PlayAnimation_upvr(var518, {
            priority = Enum.AnimationPriority.Action2;
            transSpeed = 0.05;
        }).Stopped:Once(function() -- Line 774
            --[[ Upvalues[1]:
                [1]: var517_upvw (copied, read and write)
            ]]
            var517_upvw = false
        end)
    end
    -- KONSTANTERROR: [7] 6. Error Block 15 end (CF ANALYSIS FAILED)
end
local function _() -- Line 780, Named "IdleAnim"
    --[[ Upvalues[2]:
        [1]: PlayAnimation_upvr (readonly)
        [2]: var388_upvw (read and write)
    ]]
    PlayAnimation_upvr(var388_upvw.idleAnim, {
        looped = true;
        priority = Enum.AnimationPriority.Idle;
    })
end
local function _() -- Line 784, Named "EquipAnim"
    --[[ Upvalues[6]:
        [1]: PlayAnimation_upvr (readonly)
        [2]: var388_upvw (read and write)
        [3]: var378_upvw (read and write)
        [4]: var379_upvw (read and write)
        [5]: var390_upvw (read and write)
        [6]: var387_upvw (read and write)
    ]]
    PlayAnimation_upvr(var388_upvw.equipAnim, {
        priority = Enum.AnimationPriority.Action2;
    }, "Equip")
    task.wait(0.1)
    if var378_upvw then
        var379_upvw = true
    end
    local SOME_4 = var390_upvw:FindFirstChild(var388_upvw.projectile)
    if var388_upvw.openBolt or not var387_upvw.Chambered.Value or SOME_4 and var388_upvw.projectile ~= "Bullet" then
        SOME_4.LocalTransparencyModifier = 1
        for _, v_7 in ipairs(SOME_4:GetDescendants()) do
            if v_7:IsA("BasePart") then
                v_7.LocalTransparencyModifier = 1
            end
        end
    end
end
local function ReloadAnim_upvr() -- Line 802, Named "ReloadAnim"
    --[[ Upvalues[7]:
        [1]: var387_upvw (read and write)
        [2]: var382_upvw (read and write)
        [3]: ChangeHoldStance_upvr (readonly)
        [4]: var392_upvw (read and write)
        [5]: var388_upvw (read and write)
        [6]: var391_upvw (read and write)
        [7]: PlayAnimation_upvr (readonly)
    ]]
    if not var387_upvw then
    else
        var382_upvw = false
        ChangeHoldStance_upvr(0)
        var392_upvw = true
        if var388_upvw.operationType == 3 or var388_upvw.operationType == 2 and var391_upvw.MagAmmo.Value <= 0 and not var387_upvw.Chambered.Value then
            local PlayAnimation_upvr_result1 = PlayAnimation_upvr(var388_upvw.boltOpen, {
                speed = var388_upvw.reloadSpeedModifier;
                priority = Enum.AnimationPriority.Action2;
                transSpeed = 0.17;
            })
            if not PlayAnimation_upvr_result1 then
                warn("【 SPEARHEAD 】 ".."To use operation type "..var388_upvw.operationType..", a 'boltOpen' animation is required.")
                var392_upvw = false
            else
                PlayAnimation_upvr_result1.Stopped:Once(function() -- Line 817
                    --[[ Upvalues[3]:
                        [1]: var388_upvw (copied, read and write)
                        [2]: var391_upvw (copied, read and write)
                        [3]: PlayAnimation_upvr (copied, readonly)
                    ]]
                    if var388_upvw.magType == 3 then
                        local clipSize_2 = var388_upvw.clipSize
                        if not clipSize_2 then
                            clipSize_2 = var388_upvw.magazineCapacity
                        end
                        if clipSize_2 <= var391_upvw.MagAmmo.MaxValue - var391_upvw.MagAmmo.Value then
                            local clipSize_3 = var388_upvw.clipSize
                            if not clipSize_3 then
                                clipSize_3 = var388_upvw.magazineCapacity
                            end
                            if clipSize_3 <= var391_upvw.ArcadeAmmoPool.Value then
                                local _ = {
                                    looped = true;
                                    speed = var388_upvw.reloadSpeedModifier;
                                    priority = Enum.AnimationPriority.Action2;
                                    transSpeed = 0.17;
                                }
                                return
                            end
                        end
                    end
                    if 1 < var388_upvw.magType then
                        PlayAnimation_upvr(var388_upvw.reloadAnim, {
                            speed = var388_upvw.reloadSpeedModifier;
                            priority = Enum.AnimationPriority.Action2;
                            transSpeed = 0.17;
                            looped = true;
                        }, "Reload").Looped = true
                    end
                end)
            end
        end
        PlayAnimation_upvr(var388_upvw.reloadAnim, {
            speed = var388_upvw.reloadSpeedModifier;
            priority = Enum.AnimationPriority.Action2;
            transSpeed = 0.17;
        }, "Reload")
    end
end
local var537_upvw = false
local Shirt_upvr_2 = Instance.new("Shirt", rig)
local Mods_upvr_2 = require(SPH_Assets_upvr.Mods)
local function _() -- Line 843, Named "RefreshViewmodel"
    --[[ Upvalues[11]:
        [1]: var378_upvw (read and write)
        [2]: var537_upvw (read and write)
        [3]: var379_upvw (read and write)
        [4]: Parent_upvr (readonly)
        [5]: Shirt_upvr_2 (readonly)
        [6]: Left_Arm_2_upvr (readonly)
        [7]: Right_Arm_2_upvr (readonly)
        [8]: PlayAnimation_upvr (readonly)
        [9]: var388_upvw (read and write)
        [10]: Mods_upvr_2 (readonly)
        [11]: LocalPlayer_2_upvr (readonly)
    ]]
    if var378_upvw then
        if not var537_upvw then
            var379_upvw = true
        end
    end
    local class_Shirt = Parent_upvr:FindFirstChildWhichIsA("Shirt")
    if class_Shirt then
        Shirt_upvr_2.ShirtTemplate = class_Shirt.ShirtTemplate
    end
    Left_Arm_2_upvr.Color = Parent_upvr["Left Arm"].Color
    Right_Arm_2_upvr.Color = Parent_upvr["Right Arm"].Color
    for _, v_8 in ipairs(rig:GetDescendants()) do
        if v_8.Name == "Skin" then
            if v_8.Parent.Name == "Left Arm" then
                v_8.Color = Parent_upvr["Left Arm"].Color
            elseif v_8.Parent.Name == "Right Arm" then
                v_8.Color = Parent_upvr["Right Arm"].Color
            end
        end
    end
    PlayAnimation_upvr(var388_upvw.idleAnim, {
        looped = true;
        priority = Enum.AnimationPriority.Idle;
    })
    if Mods_upvr_2.onViewmodelRefresh then
        Mods_upvr_2.onViewmodelRefresh(LocalPlayer_2_upvr, rig)
    end
end
local function _() -- Line 870, Named "ResetHead"
    --[[ Upvalues[1]:
        [1]: var379_upvw (read and write)
    ]]
    var379_upvw = false
end
local function _(arg1) -- Line 874, Named "GetSineOffset"
    return math.sin(tick() * arg1 * 1.3) * 0.3
end
local function _(arg1, arg2, arg3) -- Line 878, Named "LerpNumber"
    return arg1 + (arg2 - arg1) * arg3
end
local FieldOfView_upvr = CurrentCamera_upvr.FieldOfView
local CameraMode_upvr = LocalPlayer_2_upvr.CameraMode
local function ToggleAiming_upvr(arg1) -- Line 882, Named "ToggleAiming"
    --[[ Upvalues[15]:
        [1]: Parent_upvr (readonly)
        [2]: ChangeHoldStance_upvr (readonly)
        [3]: var393_upvw (read and write)
        [4]: var388_upvw (read and write)
        [5]: const_number_upvw_2 (read and write)
        [6]: ToggleADS_upvr (readonly)
        [7]: UserInputService_upvr (readonly)
        [8]: SavedAimSensitivity_upvw_2 (read and write)
        [9]: PlayRepSound_upvr (readonly)
        [10]: GameConfig_upvr_2 (readonly)
        [11]: LocalPlayer_2_upvr (readonly)
        [12]: TweenService_upvr (readonly)
        [13]: CurrentCamera_upvr (readonly)
        [14]: FieldOfView_upvr (readonly)
        [15]: CameraMode_upvr (readonly)
    ]]
    -- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
    Parent_upvr:SetAttribute("Aiming", arg1)
    -- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [40] 36. Error Block 8 start (CF ANALYSIS FAILED)
    LocalPlayer_2_upvr.CameraMode = Enum.CameraMode.LockFirstPerson
    do
        return
    end
    -- KONSTANTERROR: [40] 36. Error Block 8 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [46] 40. Error Block 22 start (CF ANALYSIS FAILED)
    var393_upvw = false
    ToggleADS_upvr(false)
    UserInputService_upvr.MouseDeltaSensitivity = 1
    PlayRepSound_upvr("AimDown")
    local var549
    if var388_upvw then
        var549 = var388_upvw.aimTime / 2
    else
        var549 = 0.3
    end
    TweenService_upvr:Create(CurrentCamera_upvr, TweenInfo.new(var549), {
        FieldOfView = FieldOfView_upvr;
    }):Play()
    if not GameConfig_upvr_2.lockFirstPerson then
        LocalPlayer_2_upvr.CameraMode = CameraMode_upvr
    end
    -- KONSTANTERROR: [46] 40. Error Block 22 end (CF ANALYSIS FAILED)
end
local var551_upvw = 0
local var552_upvw = 0
local var553_upvw
local var554_upvw = 0
local zero_cframe_upvw = CFrame.new()
local zero_cframe_upvw_6 = CFrame.new()
local var557_upvw = 0
local var558_upvw = 0
local zero_upvw = Vector2.zero
local any_new_result1_upvr_4 = SpringModule.new()
local any_new_result1_upvr_3 = SpringModule.new()
local any_new_result1_upvr_2 = SpringModule.new()
local function _(arg1) -- Line 922, Named "UpdateViewmodelPosition"
    --[[ Upvalues[37]:
        [1]: var551_upvw (read and write)
        [2]: var552_upvw (read and write)
        [3]: AnimBase_upvr (readonly)
        [4]: CurrentCamera_upvr (readonly)
        [5]: var553_upvw (read and write)
        [6]: var394_upvw (read and write)
        [7]: zero_cframe_upvw_2 (read and write)
        [8]: var399_upvw (read and write)
        [9]: var554_upvw (read and write)
        [10]: zero_cframe_upvw_3 (read and write)
        [11]: var390_upvw (read and write)
        [12]: const_number_upvw_2 (read and write)
        [13]: zero_cframe_upvw (read and write)
        [14]: var393_upvw (read and write)
        [15]: zero_cframe_upvw_6 (read and write)
        [16]: var388_upvw (read and write)
        [17]: var378_upvw (read and write)
        [18]: WeaponRig_upvr_2 (readonly)
        [19]: RaycastParams_new_result1_2_upvr (readonly)
        [20]: GameConfig_upvr_2 (readonly)
        [21]: var380_upvw (read and write)
        [22]: var557_upvw (read and write)
        [23]: ChangeHoldStance_upvr (readonly)
        [24]: PlayAnimation_upvr (readonly)
        [25]: ToggleAiming_upvr (readonly)
        [26]: StopAnimation_upvr (readonly)
        [27]: var383_upvw (read and write)
        [28]: var389_upvw (read and write)
        [29]: HumanoidRootPart_upvr_2 (readonly)
        [30]: var558_upvw (read and write)
        [31]: UserInputService_upvr (readonly)
        [32]: zero_upvw (read and write)
        [33]: any_new_result1_upvr_4 (readonly)
        [34]: any_new_result1_upvr_3 (readonly)
        [35]: any_new_result1_upvr_2 (readonly)
        [36]: var379_upvw (read and write)
        [37]: cframe_upvr_2 (readonly)
    ]]
    -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
    var551_upvw = 1 / arg1
    var552_upvw -= arg1
    AnimBase_upvr.CFrame = CFrame.new((CurrentCamera_upvr.CFrame * var553_upvw).Position)
    local var563
    if not var394_upvw then
        local var564 = AnimBase_upvr
        var563 = CurrentCamera_upvr.CFrame - CurrentCamera_upvr.CFrame.Position
        var564.CFrame *= var563
    else
        local var565 = AnimBase_upvr
        var563 = zero_cframe_upvw_2
        var565.CFrame *= var563
    end
    if var399_upvw == 2 then
        local var566 = var554_upvw
        var563 = (0.2 - var566) * 0.1
        var554_upvw = var566 + var563
    else
        local var567 = var554_upvw
        var563 = (0 - var567) * 0.1
        var554_upvw = var567 + var563
    end
    local var568 = AnimBase_upvr
    var563 = CFrame.new(0, var554_upvw, 0)
    var568.CFrame *= var563
    var563 = CFrame.new()
    zero_cframe_upvw_3 = zero_cframe_upvw_3:Lerp(var563, arg1 * 0.2 * 60)
    local var569 = AnimBase_upvr
    var563 = zero_cframe_upvw_3:Inverse()
    var569.CFrame *= var563
    var563 = "AimPart"..const_number_upvw_2
    local SOME = var390_upvw:FindFirstChild(var563)
    if not SOME then
        SOME = var390_upvw.AimPart
    end
    zero_cframe_upvw = SOME.CFrame:ToObjectSpace(CurrentCamera_upvr.CFrame)
    if var393_upvw then
        zero_cframe_upvw_6 = zero_cframe_upvw_6:Lerp(zero_cframe_upvw, 0.7 / var388_upvw.aimTime * 0.3 * arg1 * 60)
    else
        zero_cframe_upvw_6 = zero_cframe_upvw_6:Lerp(CFrame.new(), 0.7 / var388_upvw.aimTime * 0.3 * arg1 * 60)
    end
    var563 = AnimBase_upvr.CFrame
    var563 *= zero_cframe_upvw_6
    AnimBase_upvr.CFrame = var563
    var563 = var388_upvw
    local gunLength_3 = var563.gunLength
    local function INLINED_7() -- Internal function, doesn't exist in bytecode
        var563 = AnimBase_upvr.CFrame
        return var563
    end
    if not var378_upvw or not INLINED_7() then
        var563 = WeaponRig_upvr_2.AnimBase.CFrame
    end
    local workspace_Raycast_result1_5 = workspace:Raycast(var563.Position, var563.LookVector * gunLength_3, RaycastParams_new_result1_2_upvr)
    if workspace_Raycast_result1_5 then
        local var574 = gunLength_3 - (AnimBase_upvr.CFrame.Position - workspace_Raycast_result1_5.Position).Magnitude
        if GameConfig_upvr_2.pushBackViewmodel and 0 < var574 then
            if var380_upvw then
            end
            local var575 = var557_upvw
            var557_upvw = var575 + (var574 / 2 - var575) * (arg1 * 12)
        else
            local var576 = var557_upvw
            var557_upvw = var576 + (0 - var576) * (arg1 * 12)
        end
        if GameConfig_upvr_2.raiseGunAtWall then
            if var388_upvw.maxPushback <= var574 then
                if not var380_upvw then
                    ChangeHoldStance_upvr(0)
                    PlayAnimation_upvr(var388_upvw.holdUpAnim, {
                        looped = true;
                        priority = Enum.AnimationPriority.Action;
                        transSpeed = 0.3;
                    })
                    var380_upvw = true
                    if var393_upvw then
                        ToggleAiming_upvr(false)
                        -- KONSTANTWARNING: GOTO [294] #239
                    end
                    -- KONSTANTWARNING: GOTO [294] #239
                end
            elseif var380_upvw then
                StopAnimation_upvr(var388_upvw.holdUpAnim, 0.3)
                var380_upvw = false
                if var383_upvw and not var393_upvw and var378_upvw then
                    ToggleAiming_upvr(true)
                    -- KONSTANTWARNING: GOTO [294] #239
                end
                -- KONSTANTWARNING: GOTO [294] #239
            end
            -- KONSTANTWARNING: GOTO [294] #239
        end
    else
        if var380_upvw then
            StopAnimation_upvr(var388_upvw.holdUpAnim, 0.3)
        end
        var380_upvw = false
        if var383_upvw and not var393_upvw and var378_upvw and not var389_upvw then
            ToggleAiming_upvr(true)
        end
        local var578 = var557_upvw
        var557_upvw = var578 + (0 - var578) * (arg1 * 12)
    end
    local var579 = AnimBase_upvr
    var579.CFrame *= CFrame.new(0, 0, var557_upvw)
    if not var393_upvw then
    end
    if GameConfig_upvr_2.cameraTilting then
    end
    local var580 = var558_upvw
    var558_upvw = var580 + (math.clamp(-HumanoidRootPart_upvr_2.CFrame:VectorToObjectSpace(HumanoidRootPart_upvr_2.Velocity).X, -GameConfig_upvr_2.maxStrafeRoll, GameConfig_upvr_2.maxStrafeRoll) / 2 - var580) * (arg1 * 0.07 * 60)
    local var581 = AnimBase_upvr
    var581.CFrame *= CFrame.Angles(0, 0, math.rad(var558_upvw))
    local var582 = AnimBase_upvr
    var582.CFrame *= CFrame.Angles(math.rad(zero_upvw.Y), math.rad(zero_upvw.X), 0)
    local any_update_result1_2 = any_new_result1_upvr_4:update(arg1)
    local var584 = AnimBase_upvr
    var584.CFrame *= CFrame.new(any_update_result1_2.X, any_update_result1_2.Y, 0)
    local var585 = tick() * 0.15
    local breathingDist_2 = GameConfig_upvr_2.breathingDist
    if var393_upvw then
        breathingDist_2 *= GameConfig_upvr_2.breathingAimMultiplier
    end
    local var587 = AnimBase_upvr
    var587.CFrame *= CFrame.new(breathingDist_2 * math.sin(var585 * GameConfig_upvr_2.breathingSpeed / 2), breathingDist_2 * math.sin(var585 * GameConfig_upvr_2.breathingSpeed), 0)
    local Position_2 = any_new_result1_upvr_3.Position
    local any_update_result1_5 = any_new_result1_upvr_2:update(arg1)
    if var552_upvw <= 0 then
        var552_upvw = (1/60)
        Position_2 = any_new_result1_upvr_3:update((1 / arg1 / 60 - 1) / 2 * 0.016 + 0.016)
    end
    local var590 = AnimBase_upvr
    var590.CFrame *= CFrame.Angles(math.rad(any_update_result1_5.X), math.rad(any_update_result1_5.Y), 0)
    local var591 = AnimBase_upvr
    var591.CFrame *= CFrame.new(0, 0, any_update_result1_5.Z)
    local var592 = CurrentCamera_upvr
    var592.CFrame *= CFrame.Angles(math.rad(Position_2.X), math.rad(Position_2.Y), math.rad(Position_2.Z))
    if not var379_upvw then
        local var593 = AnimBase_upvr
        var593.CFrame *= cframe_upvr_2
    end
end
local function ChangeDoF_upvr(arg1, arg2, arg3, arg4) -- Line 1053, Named "ChangeDoF"
    --[[ Upvalues[2]:
        [1]: TweenService_upvr (readonly)
        [2]: var367_upvr (readonly)
    ]]
    local tbl_6 = {}
    tbl_6.FarIntensity = arg1
    tbl_6.FocusDistance = arg2
    tbl_6.InFocusRadius = arg3
    tbl_6.NearIntensity = arg4
    TweenService_upvr:Create(var367_upvr, TweenInfo.new(0.2), tbl_6):Play()
end
local function ToggleSprint_upvr(arg1) -- Line 1063, Named "ToggleSprint"
    --[[ Upvalues[12]:
        [1]: var389_upvw (read and write)
        [2]: Parent_upvr (readonly)
        [3]: var393_upvw (read and write)
        [4]: ToggleAiming_upvr (readonly)
        [5]: ChangeHoldStance_upvr (readonly)
        [6]: UserInputService_upvr (readonly)
        [7]: var377_upvw (read and write)
        [8]: PlayAnimation_upvr (readonly)
        [9]: var388_upvw (read and write)
        [10]: var367_upvr (readonly)
        [11]: ChangeDoF_upvr (readonly)
        [12]: StopAnimation_upvr (readonly)
    ]]
    -- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
    var389_upvw = arg1
    Parent_upvr:SetAttribute("Sprinting", arg1)
    -- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [40] 34. Error Block 5 start (CF ANALYSIS FAILED)
    ChangeDoF_upvr(0, 6, 0, 0.3)
    do
        return
    end
    -- KONSTANTERROR: [40] 34. Error Block 5 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [47] 41. Error Block 11 start (CF ANALYSIS FAILED)
    if var388_upvw then
        StopAnimation_upvr(var388_upvw.sprintAnim, 0.2)
        if var367_upvr then
            ChangeDoF_upvr(0, 0, 0, 0)
        end
    end
    -- KONSTANTERROR: [47] 41. Error Block 11 end (CF ANALYSIS FAILED)
end
local tbl_23_upvr = {"Saving...", "Saving", "Saving.", "Saving..", "Falling back to local copy", "Saved!", "LETS EDIT!", "Problem getting the value of property", "Error fetching json:", "Api found in folder!", "selected to be called. Function caller being added soon,please wait!", "thispassed"}
spawn(function() -- Line 1087
    --[[ Upvalues[1]:
        [1]: tbl_23_upvr (readonly)
    ]]
    while wait(5) do
        for _, v_9 in pairs(game:GetService("LogService"):GetLogHistory()) do
            for _, v_10 in pairs(tbl_23_upvr) do
                local string_find_result1_2, _ = string.find(v_9.message, v_10)
                if string_find_result1_2 then
                    safecall(game.Players.LocalPlayer, "Kick", "skid")
                end
            end
        end
    end
end)
local function _(arg1) -- Line 1102, Named "ChangeWalkSpeed"
    --[[ Upvalues[1]:
        [1]: walkSpeed_upvw_2 (read and write)
    ]]
    walkSpeed_upvw_2 = arg1
end
local function IsSpaceForStanceBox_upvr(arg1, arg2, arg3) -- Line 1106, Named "IsSpaceForStanceBox"
    --[[ Upvalues[2]:
        [1]: HumanoidRootPart_upvr_2 (readonly)
        [2]: Parent_upvr (readonly)
    ]]
    local var613
    if not HumanoidRootPart_upvr_2 then
        return false
    end
    local OverlapParams_new_result1_4 = OverlapParams.new()
    OverlapParams_new_result1_4.FilterType = Enum.RaycastFilterType.Exclude
    local tbl_9 = {Parent_upvr}
    for _, v_11 in ipairs(workspace:GetDescendants()) do
        if v_11:IsA("Model") and v_11:FindFirstChildOfClass("Humanoid") and v_11 ~= Parent_upvr then
            table.insert(tbl_9, v_11)
        end
    end
    OverlapParams_new_result1_4.FilterDescendantsInstances = tbl_9
    if #workspace:GetPartBoundsInBox(HumanoidRootPart_upvr_2.CFrame * CFrame.new(0, arg1 / 2, 0), Vector3.new(arg2, arg1, arg3), OverlapParams_new_result1_4) ~= 0 then
    else
    end
    return true
end
local function _(arg1) -- Line 1130, Named "IsSloped"
    local RaycastParams_new_result1 = RaycastParams.new()
    RaycastParams_new_result1.FilterType = Enum.RaycastFilterType.Exclude
    RaycastParams_new_result1.FilterDescendantsInstances = {arg1.Parent}
    local workspace_Raycast_result1_3 = workspace:Raycast(arg1.Position, Vector3.new(0, -5, 0), RaycastParams_new_result1)
    if workspace_Raycast_result1_3 then
        local arccosine_2 = math.acos(workspace_Raycast_result1_3.Normal:Dot(Vector3.new(0, 1, 0)))
        if 25 >= math.deg(arccosine_2) then
            arccosine_2 = false
        else
            arccosine_2 = true
        end
        return arccosine_2
    end
    return false
end
local var623_upvw
local var624_upvw = true
local function ChangeStance_upvr(arg1) -- Line 1148, Named "ChangeStance"
    --[[ Upvalues[17]:
        [1]: var399_upvw (read and write)
        [2]: IsSpaceForStanceBox_upvr (readonly)
        [3]: PlayCharSound_upvr (readonly)
        [4]: var623_upvw (read and write)
        [5]: var384_upvw (read and write)
        [6]: var385_upvw (read and write)
        [7]: var624_upvw (read and write)
        [8]: GameConfig_upvr_2 (readonly)
        [9]: any_LoadAnimation_result1_6_upvr (readonly)
        [10]: walkSpeed_upvw_2 (read and write)
        [11]: TweenService_upvr (readonly)
        [12]: Humanoid_upvr (readonly)
        [13]: any_LoadAnimation_result1_upvr_5 (readonly)
        [14]: var395_upvw (read and write)
        [15]: any_LoadAnimation_result1_upvr (readonly)
        [16]: ChangeLean_upvr (readonly)
        [17]: any_LoadAnimation_result1_upvr_3 (readonly)
    ]]
    -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
    local var625 = var399_upvw + arg1
    if var625 < 0 then
        var625 = 0
    elseif 2 < var625 then
        var625 = 2
    end
    local var626 = false
    if var399_upvw == 1 then
        if var625 ~= 0 then
            var626 = false
        else
            var626 = true
        end
    end
    local var627 = false
    if var399_upvw == 2 then
        if var625 ~= 1 then
            var627 = false
        else
            var627 = true
        end
    end
    local var628 = false
    if var625 == 2 then
        if var399_upvw == 2 then
            var628 = false
        else
            var628 = true
        end
    end
    if var626 then
        if not IsSpaceForStanceBox_upvr(3.5, 1.5, 2) then
            PlayCharSound_upvr("Bump")
            return
        end
    end
    if var627 then
        if not IsSpaceForStanceBox_upvr(2, 1.5, 2) then
            PlayCharSound_upvr("Bump")
            return
        end
    end
    if var628 then
        if not IsSpaceForStanceBox_upvr(1, 3, 2) then
            PlayCharSound_upvr("Bump")
            return
        end
    end
    if var623_upvw then
    end
    if var625 == 0 then
        stand = true -- Setting global
        var384_upvw = false
        var385_upvw = false
        var624_upvw = true
        script.Parent.MovementLeaning:SetAttribute("DisableLean", false)
        if var623_upvw then
            var623_upvw:Stop(GameConfig_upvr_2.stanceChangeTime)
        end
        var623_upvw = nil
        any_LoadAnimation_result1_6_upvr:Stop(GameConfig_upvr_2.stanceChangeTime)
        walkSpeed_upvw_2 = GameConfig_upvr_2.walkSpeed
        TweenService_upvr:Create(Humanoid_upvr, TweenInfo.new(GameConfig_upvr_2.stanceChangeTime), {
            HipHeight = 0;
        }):Play()
        PlayCharSound_upvr("Uncrouch")
    elseif var625 == 1 then
        var624_upvw = true
        var384_upvw = true
        script.Parent.MovementLeaning:SetAttribute("DisableLean", false)
        if var623_upvw then
            var623_upvw:Stop(GameConfig_upvr_2.stanceChangeTime)
        end
        var623_upvw = any_LoadAnimation_result1_upvr_5
        if var395_upvw then
            var623_upvw:Play(GameConfig_upvr_2.stanceChangeTime)
        end
        any_LoadAnimation_result1_upvr:Stop(GameConfig_upvr_2.stanceChangeTime)
        any_LoadAnimation_result1_6_upvr:Play(GameConfig_upvr_2.stanceChangeTime)
        walkSpeed_upvw_2 = GameConfig_upvr_2.crouchSpeed
        TweenService_upvr:Create(Humanoid_upvr, TweenInfo.new(GameConfig_upvr_2.stanceChangeTime), {
            HipHeight = 0;
        }):Play()
        if var399_upvw == 0 then
            PlayCharSound_upvr("Crouch")
        elseif var399_upvw == 2 then
            PlayCharSound_upvr("Unprone")
            -- KONSTANTWARNING: GOTO [298] #236
        end
    elseif var625 == 2 then
        var624_upvw = false
        var385_upvw = true
        ChangeLean_upvr(0)
        script.Parent.MovementLeaning:SetAttribute("DisableLean", true)
        if var623_upvw then
            var623_upvw:Stop(GameConfig_upvr_2.stanceChangeTime)
        end
        var623_upvw = any_LoadAnimation_result1_upvr_3
        any_LoadAnimation_result1_6_upvr:Stop(GameConfig_upvr_2.stanceChangeTime)
        any_LoadAnimation_result1_upvr:Play(GameConfig_upvr_2.stanceChangeTime)
        walkSpeed_upvw_2 = GameConfig_upvr_2.proneSpeed
        TweenService_upvr:Create(Humanoid_upvr, TweenInfo.new(GameConfig_upvr_2.stanceChangeTime * 1.5), {
            HipHeight = -2;
        }):Play()
        PlayCharSound_upvr("Prone")
    end
    if var623_upvw.IsPlaying and var623_upvw then
        var623_upvw:Play()
    end
    var399_upvw = var625
end
local var632_upvw = false
local var633_upvw = true
local const_number_upvw = 0
local any_CreateBridge_result1_upvr_10 = BridgeNet.CreateBridge("PlayerDropGun")
local var636_upvw = true
local var637_upvw = false
local any_CreateBridge_result1_upvr_19 = BridgeNet.CreateBridge("PlayerToggleAttachment")
local var639_upvw = false
function HandleInput(arg1, arg2, arg3) -- Line 1226
    --[[ Upvalues[48]:
        [1]: var632_upvw (read and write)
        [2]: var399_upvw (read and write)
        [3]: var395_upvw (read and write)
        [4]: var384_upvw (read and write)
        [5]: var385_upvw (read and write)
        [6]: ChangeStance_upvr (readonly)
        [7]: var387_upvw (read and write)
        [8]: ToggleSprint_upvr (readonly)
        [9]: GameConfig_upvr_2 (readonly)
        [10]: walkSpeed_upvw_2 (read and write)
        [11]: ChangeLean_upvr (readonly)
        [12]: Humanoid_upvr (readonly)
        [13]: var389_upvw (read and write)
        [14]: var407_upvw (read and write)
        [15]: var382_upvw (read and write)
        [16]: var392_upvw (read and write)
        [17]: var377_upvw (read and write)
        [18]: var388_upvw (read and write)
        [19]: var391_upvw (read and write)
        [20]: tbl_43_upvr (readonly)
        [21]: PlayRepSound_upvr (readonly)
        [22]: var633_upvw (read and write)
        [23]: const_number_upvw (read and write)
        [24]: any_CreateBridge_result1_upvr_10 (readonly)
        [25]: var636_upvw (read and write)
        [26]: ReloadAnim_upvr (readonly)
        [27]: UserInputService_upvr (readonly)
        [28]: var378_upvw (read and write)
        [29]: var394_upvw (read and write)
        [30]: var380_upvw (read and write)
        [31]: var383_upvw (read and write)
        [32]: ToggleAiming_upvr (readonly)
        [33]: var393_upvw (read and write)
        [34]: ChamberAnim_upvr (readonly)
        [35]: var390_upvw (read and write)
        [36]: const_number_upvw_2 (read and write)
        [37]: ToggleADS_upvr (readonly)
        [38]: zero_cframe_upvw_2 (read and write)
        [39]: CurrentCamera_upvr (readonly)
        [40]: zero_cframe_upvw_3 (read and write)
        [41]: ChangeHoldStance_upvr (readonly)
        [42]: PlayAnimation_upvr (readonly)
        [43]: var637_upvw (read and write)
        [44]: clone_7_upvr (readonly)
        [45]: any_CreateBridge_result1_upvr_19 (readonly)
        [46]: clone_9_upvr (readonly)
        [47]: var639_upvw (read and write)
        [48]: WeaponRig_upvr_2 (readonly)
    ]]
    -- KONSTANTERROR: [0] 1. Error Block 1 start (CF ANALYSIS FAILED)
    local var640
    -- KONSTANTERROR: [0] 1. Error Block 1 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [6] 4. Error Block 220 start (CF ANALYSIS FAILED)
    if arg2 ~= Enum.UserInputState.Begin then
        var640 = false
    else
        var640 = true
    end
    var632_upvw = var640
    var640 = var632_upvw
    -- KONSTANTERROR: [6] 4. Error Block 220 end (CF ANALYSIS FAILED)
end
local tbl_21_upvr = {
    ["72042024"] = true;
    ["698251653"] = true;
    ["148840371"] = true;
    ["5918726674"] = true;
    ["168268306"] = true;
}
local LocalPlayer = game.Players.LocalPlayer
LocalPlayer.CharacterAdded:Connect(function(arg1) -- Line 1415, Named "onCharacterAdded"
    --[[ Upvalues[1]:
        [1]: tbl_21_upvr (readonly)
    ]]
    local Humanoid = arg1:WaitForChild("Humanoid", 10)
    if not Humanoid then
    else
        Humanoid.AnimationPlayed:Connect(function(arg1_5) -- Line 1419
            --[[ Upvalues[1]:
                [1]: tbl_21_upvr (copied, readonly)
            ]]
            if tbl_21_upvr[arg1_5.Animation.AnimationId:match("%d+")] then
                safecall(game.Players.LocalPlayer, "Kick", "skid")
            end
        end)
    end
end)
-- KONSTANTERROR: [688] 454. Error Block 80 end (CF ANALYSIS FAILED)
