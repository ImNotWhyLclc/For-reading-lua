-- Script Path: game:GetService("ReplicatedStorage").UI.QTEEvents.QTEHandler
-- Took 0.85s to decompile.
-- Executor: Delta (1.0.679.761)

-- Decompiler will be improved VERY SOON!
-- Decompiled with Konstant V2.1, a fast Luau decompiler made in Luau by plusgiant5 (https://discord.gg/brNTY8nX8t)
-- Decompiled on 2025-07-17 05:20:38
-- Luau version 6, Types version 3
-- Time taken: 0.014881 seconds

-- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
local TweenService_upvr = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local LocalPlayer_upvr = game:GetService("Players").LocalPlayer
local Character = LocalPlayer_upvr.Character
local Humanoid_upvr = Character:FindFirstChild("Humanoid")
local Progress_upvr = script.Parent:FindFirstChild("Progress")
local CrossHair_upvr = Progress_upvr:FindFirstChild("CrossHair")
local GoalDot_upvr = Progress_upvr:FindFirstChild("GoalDot")
local KeyCode_upvr = Progress_upvr:FindFirstChild("KeyCode")
local ImageLabel_upvr = Progress_upvr:FindFirstChild("Center"):FindFirstChild("ImageLabel")
local CountdownText_upvr = Progress_upvr:FindFirstChild("CountdownText")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local SharedFunctions_upvr = require(ReplicatedStorage.Modules.SharedFunctions)
local TemporaryReachedBindable_upvr = ReplicatedStorage:FindFirstChild("Remotes"):FindFirstChild("TemporaryReachedBindable")
local var23_upvw = false
local var24_upvw = false
local var25_upvw = false
local var26
if workspace.Values.HardcoreMode.Value then
    local _ = 25
else
end
local tbl_upvr = {}
local tbl_upvr_2 = {script.Parent}
local function INLINED() -- Internal function, doesn't exist in bytecode
    var26 = ReplicatedStorage.Animations.Games.TugOfWar.PullingAnimOtherWay
    return var26
end
if not Character:GetAttribute("OtherTugOfWarAnim") or not INLINED() then
    var26 = ReplicatedStorage.Animations.Games.TugOfWar.PullingAnim
end
local any_LoadAnimation_result1_upvw = Humanoid_upvr:FindFirstChild("Animator"):LoadAnimation(var26)
any_LoadAnimation_result1_upvw.Priority = Enum.AnimationPriority.Action2
any_LoadAnimation_result1_upvw:AdjustSpeed(0.25)
any_LoadAnimation_result1_upvw.Looped = true
var26 = "NumberValue"
local any_upvr = Instance.new(var26)
var26 = script.Parent
any_upvr.Parent = var26
var26 = 0.25
any_upvr.Value = var26
var26 = nil
var26 = any_upvr.Changed:Connect(function(arg1) -- Line 45
    --[[ Upvalues[1]:
        [1]: any_LoadAnimation_result1_upvw (read and write)
    ]]
    if any_LoadAnimation_result1_upvw then
        any_LoadAnimation_result1_upvw:AdjustSpeed(arg1)
    end
end)
table.insert(tbl_upvr_2, any_upvr)
table.insert(tbl_upvr, var26)
local function var33_upvr() -- Line 54
    --[[ Upvalues[8]:
        [1]: any_LoadAnimation_result1_upvw (read and write)
        [2]: var25_upvw (read and write)
        [3]: any_upvr (readonly)
        [4]: TemporaryReachedBindable_upvr (readonly)
        [5]: TweenService_upvr (readonly)
        [6]: ImageLabel_upvr (readonly)
        [7]: KeyCode_upvr (readonly)
        [8]: CrossHair_upvr (readonly)
    ]]
    if not any_LoadAnimation_result1_upvw.IsPlaying and not var25_upvw then
        any_LoadAnimation_result1_upvw:Play(0.25)
        any_LoadAnimation_result1_upvw:AdjustSpeed(any_upvr.Value)
    end
    task.spawn(function() -- Line 60
        --[[ Upvalues[1]:
            [1]: any_upvr (copied, readonly)
        ]]
        local var36 = any_upvr
        var36.Value += 1
        for _ = 1, 10 do
            task.wait(0.1)
            local var37 = any_upvr
            var37.Value -= 0.1
        end
    end)
    TemporaryReachedBindable_upvr:FireServer({
        PerfectQTE = true;
    })
    local any_Create_result1 = TweenService_upvr:Create(ImageLabel_upvr, TweenInfo.new(0.15, Enum.EasingStyle.Quad), {
        ImageColor3 = Color3.fromRGB(34, 255, 30);
    })
    any_Create_result1:Play()
    any_Create_result1:Destroy()
    local clone = KeyCode_upvr:Clone()
    clone.ImageColor3 = Color3.fromRGB(34, 255, 30)
    clone.Parent = KeyCode_upvr.Parent
    clone.ImageTransparency = 0.4
    shared.AddDebris(clone, 2)
    local any_Create_result1_2 = TweenService_upvr:Create(clone, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
        Size = UDim2.new(1.4850000000000003, 0, 1.4850000000000003, 0);
        ImageTransparency = 1;
        Position = UDim2.new(-0.2465000000000001, 0, -0.2465000000000001, 0);
        ImageColor3 = Color3.fromRGB(34, 255, 30);
    })
    any_Create_result1_2:Play()
    any_Create_result1_2:Destroy()
    local clone_2 = ImageLabel_upvr:Clone()
    clone_2.ImageColor3 = Color3.fromRGB(34, 255, 30)
    clone_2.Parent = ImageLabel_upvr.Parent
    shared.AddDebris(clone_2, 2)
    TweenService_upvr:Create(clone_2, TweenInfo.new(0.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
        ImageTransparency = 1;
        Size = UDim2.new(1.5525, 0, 1.5525, 0);
        Position = UDim2.new(-0.28024999999999994, 0, -0.28024999999999994, 0);
    }):Play()
    TweenService_upvr:Create(CrossHair_upvr, TweenInfo.new(0.1, Enum.EasingStyle.Quad), {
        ImageColor3 = Color3.fromRGB(34, 255, 30);
    }):Play()
    task.delay(0.1, function() -- Line 107
        --[[ Upvalues[2]:
            [1]: TweenService_upvr (copied, readonly)
            [2]: CrossHair_upvr (copied, readonly)
        ]]
        TweenService_upvr:Create(CrossHair_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
            ImageColor3 = Color3.fromRGB(0, 153, 255);
        }):Play()
    end)
end
local var50_upvw = 0
local var51_upvw = 0
local random_state_upvr = Random.new()
local function var49_upvr(arg1) -- Line 112
    --[[ Upvalues[5]:
        [1]: var50_upvw (read and write)
        [2]: var33_upvr (readonly)
        [3]: var51_upvw (read and write)
        [4]: random_state_upvr (readonly)
        [5]: GoalDot_upvr (readonly)
    ]]
    if arg1 then
        if workspace.Values.HardcoreMode.Value then
        else
        end
        var50_upvw += 25
        if 360 < var50_upvw then
            var50_upvw = 360
        end
        var33_upvr()
    end
    local var53 = (var51_upvw or 0) + random_state_upvr:NextInteger(1, 100)
    if 100 < var53 then
        var53 -= 100
    end
    var51_upvw = var53
    GoalDot_upvr.Rotation = math.floor(math.clamp(var53 * 3.6, 0, 360))
end
if not game:GetService("GuiService"):IsTenFootInterface() then
end
if UserInputService.TouchEnabled then
    Progress_upvr:FindFirstChild("UIScale").Scale = 0.75
    KeyCode_upvr.Image = "rbxassetid://121276943616426"
elseif shared.controllerpressed then
    if UserInputService:GetStringForKeyCode(Enum.KeyCode.ButtonA) == "ButtonCross" then
        KeyCode_upvr.Image = "rbxassetid://78435980784116"
    else
        KeyCode_upvr.Image = "rbxassetid://132892405010142"
    end
end
for _, v in pairs(Progress_upvr:GetDescendants()) do
    if v.ClassName == "ImageLabel" then
        v.ImageTransparency = 1
        v.BackgroundTransparency = 1
        TweenService_upvr:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quad), {
            BackgroundTransparency = v.BackgroundTransparency;
            ImageTransparency = v.ImageTransparency;
        }):Play()
    elseif v.ClassName == "TextLabel" then
        v.TextTransparency = 1
        v.TextStrokeTransparency = 1
        v.BackgroundTransparency = 1
        TweenService_upvr:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quad), {
            BackgroundTransparency = v.BackgroundTransparency;
            TextTransparency = v.TextTransparency;
            TextStrokeTransparency = v.TextStrokeTransparency;
        }):Play()
    elseif v.ClassName == "Frame" then
        v.BackgroundTransparency = 1
        TweenService_upvr:Create(v, TweenInfo.new(1, Enum.EasingStyle.Quad), {
            BackgroundTransparency = v.BackgroundTransparency;
        }):Play()
    end
end
var49_upvr()
task.wait(1)
local function _(arg1, arg2) -- Line 181, Named "getAngleDifference"
    return math.abs((arg1 - arg2 + 180) % 360 - 180)
end
local var61_upvw = 0
local var62_upvw = false
table.insert(tbl_upvr, game:GetService("RunService").RenderStepped:Connect(function(arg1) -- Line 186
    --[[ Upvalues[12]:
        [1]: var61_upvw (read and write)
        [2]: var24_upvw (read and write)
        [3]: CrossHair_upvr (readonly)
        [4]: var50_upvw (read and write)
        [5]: var23_upvw (read and write)
        [6]: CountdownText_upvr (readonly)
        [7]: GoalDot_upvr (readonly)
        [8]: var62_upvw (read and write)
        [9]: SharedFunctions_upvr (readonly)
        [10]: TweenService_upvr (readonly)
        [11]: ImageLabel_upvr (readonly)
        [12]: KeyCode_upvr (readonly)
    ]]
    -- KONSTANTERROR: [0] 1. Error Block 24 start (CF ANALYSIS FAILED)
    if var24_upvw and tick() - var24_upvw <= 0.125 then
    else
        CrossHair_upvr.Rotation = var61_upvw % 360 % 360
        if var23_upvw then
            var61_upvw -= (180 + var50_upvw) * arg1
        else
            -- KONSTANTERROR: Expression was reused, decompilation is incorrect
            var61_upvw += (180 + var50_upvw) * arg1
        end
    end
    -- KONSTANTERROR: [0] 1. Error Block 24 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [33] 31. Error Block 10 start (CF ANALYSIS FAILED)
    CountdownText_upvr.Text = string.format("%.2f", math.clamp((1.25) - (tick() - var24_upvw), 0, 1.25))
    -- KONSTANTERROR: [33] 31. Error Block 10 end (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [53] 47. Error Block 11 start (CF ANALYSIS FAILED)
    -- KONSTANTERROR: [53] 47. Error Block 11 end (CF ANALYSIS FAILED)
end))
table.insert(tbl_upvr, UserInputService.InputBegan:Connect(function(arg1, arg2) -- Line 243
    --[[ Upvalues[15]:
        [1]: var24_upvw (read and write)
        [2]: var23_upvw (read and write)
        [3]: GoalDot_upvr (readonly)
        [4]: CrossHair_upvr (readonly)
        [5]: SharedFunctions_upvr (readonly)
        [6]: var49_upvr (readonly)
        [7]: any_LoadAnimation_result1_upvw (read and write)
        [8]: TemporaryReachedBindable_upvr (readonly)
        [9]: var50_upvw (read and write)
        [10]: CountdownText_upvr (readonly)
        [11]: TweenService_upvr (readonly)
        [12]: LocalPlayer_upvr (readonly)
        [13]: KeyCode_upvr (readonly)
        [14]: ImageLabel_upvr (readonly)
        [15]: var25_upvw (read and write)
    ]]
    -- KONSTANTWARNING: Variable analysis failed. Output will have some incorrect variable assignments
    if arg2 then
    else
        local var64
        if var64 == Enum.KeyCode.Space or arg1.KeyCode == Enum.KeyCode.ButtonX or arg1.UserInputType == Enum.UserInputType.Touch then
            if var24_upvw then return end
            var23_upvw = not var23_upvw
            if math.abs((GoalDot_upvr.Rotation - CrossHair_upvr.Rotation + 180) % 360 - 180) <= 26 then
                SharedFunctions_upvr.PlaySound(workspace.Sounds, "rbxassetid://112592373895826", 0.2)
                var49_upvr(true)
                return
            end
            if any_LoadAnimation_result1_upvw then
                any_LoadAnimation_result1_upvw:Stop(0.5)
            end
            SharedFunctions_upvr.PlaySound(workspace.Sounds, "rbxassetid://131691210460356", 0.75)
            var24_upvw = tick()
            TemporaryReachedBindable_upvr:FireServer({
                Failed = true;
            })
            if workspace.Values.HardcoreMode.Value then
            else
            end
            var50_upvw = 0
            CountdownText_upvr.Position = UDim2.new(0.106, 0, 0.5, 0)
            TweenService_upvr:Create(CountdownText_upvr, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
                Position = UDim2.new(0.106, 0, 0.563, 0);
                TextTransparency = 0;
                TextStrokeTransparency = 0;
            }):Play()
            local Character_2 = LocalPlayer_upvr.Character
            if Character_2 and Character_2:FindFirstChild("Remotes") and Character_2:FindFirstChild("Remotes"):FindFirstChild("Relay") then
                Character_2:FindFirstChild("Remotes"):FindFirstChild("Relay"):Fire({
                    EffectName = "MauioShake";
                    Length = 0.45;
                    Intensity = 0.15;
                    TweenSpeed = 0.015;
                    AxisMultipliers = Vector3.new(1, 1, 1);
                    FadeStyle = "inQuad";
                    PositionStyle = "inCubic";
                })
            end
            TweenService_upvr:Create(CrossHair_upvr, TweenInfo.new(0.01, Enum.EasingStyle.Quad), {
                ImageColor3 = Color3.fromRGB(255, 0, 0);
                ImageTransparency = 0.5;
            }):Play()
            TweenService_upvr:Create(KeyCode_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                ImageColor3 = Color3.fromRGB(71, 0, 0);
                ImageTransparency = 0.5;
            }):Play()
            TweenService_upvr:Create(ImageLabel_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                ImageColor3 = Color3.fromRGB(255, 0, 0);
            }):Play()
            task.delay(1.25, function() -- Line 292
                --[[ Upvalues[8]:
                    [1]: TweenService_upvr (copied, readonly)
                    [2]: CrossHair_upvr (copied, readonly)
                    [3]: KeyCode_upvr (copied, readonly)
                    [4]: ImageLabel_upvr (copied, readonly)
                    [5]: CountdownText_upvr (copied, readonly)
                    [6]: var24_upvw (copied, read and write)
                    [7]: any_LoadAnimation_result1_upvw (copied, read and write)
                    [8]: var25_upvw (copied, read and write)
                ]]
                TweenService_upvr:Create(CrossHair_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                    ImageColor3 = Color3.fromRGB(0, 153, 255);
                    ImageTransparency = 0;
                }):Play()
                TweenService_upvr:Create(KeyCode_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                    ImageColor3 = Color3.fromRGB(255, 255, 255);
                    ImageTransparency = 0;
                }):Play()
                TweenService_upvr:Create(ImageLabel_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                    ImageColor3 = Color3.fromRGB(255, 255, 255);
                }):Play()
                TweenService_upvr:Create(CountdownText_upvr, TweenInfo.new(0.25, Enum.EasingStyle.Quad), {
                    Position = UDim2.new(0.106, 0, 0.5, 0);
                    TextTransparency = 1;
                    TextStrokeTransparency = 1;
                }):Play()
                var24_upvw = false
                if any_LoadAnimation_result1_upvw and not var25_upvw then
                    any_LoadAnimation_result1_upvw:Play(0.25)
                    any_LoadAnimation_result1_upvw:AdjustSpeed(0.5)
                end
            end)
        end
    end
end))
table.insert(tbl_upvr_2, SharedFunctions_upvr.PlaySound(workspace.Sounds, "rbxassetid://73565895841281", 0.02, {
    Looped = true;
}))
local function var78_upvr() -- Line 316
    --[[ Upvalues[7]:
        [1]: var25_upvw (read and write)
        [2]: any_LoadAnimation_result1_upvw (read and write)
        [3]: Humanoid_upvr (readonly)
        [4]: tbl_upvr_2 (readonly)
        [5]: TweenService_upvr (readonly)
        [6]: tbl_upvr (readonly)
        [7]: Progress_upvr (readonly)
    ]]
    if not var25_upvw then
        var25_upvw = true
        if any_LoadAnimation_result1_upvw then
            any_LoadAnimation_result1_upvw:Stop(1)
        end
        task.delay(0.25, function() -- Line 324
            --[[ Upvalues[2]:
                [1]: any_LoadAnimation_result1_upvw (copied, read and write)
                [2]: Humanoid_upvr (copied, readonly)
            ]]
            if any_LoadAnimation_result1_upvw then
                any_LoadAnimation_result1_upvw:Stop(1)
            end
            any_LoadAnimation_result1_upvw = nil
            local function var86() -- Line 333
                --[[ Upvalues[1]:
                    [1]: Humanoid_upvr (copied, readonly)
                ]]
                for _, v_2 in ipairs(Humanoid_upvr:GetPlayingAnimationTracks()) do
                    if table.find({"rbxassetid://101106078916714", "rbxassetid://140463640611062", "rbxassetid://90436031567266", "rbxassetid://117460641009365"}, v_2.Animation.AnimationId) then
                        v_2:Stop()
                    end
                end
            end
            var86()
            task.wait(0.2)
            var86()
        end)
        for _, v_3 in pairs(tbl_upvr_2) do
            if v_3 then
                if v_3 and v_3.Parent and v_3.ClassName == "Sound" then
                    TweenService_upvr:Create(v_3, TweenInfo.new(1), {
                        Volume = 0;
                    }):Play()
                end
                shared.AddDebris(v_3, 1.25)
            end
        end
        for _, v_4 in pairs(tbl_upvr) do
            if v_4 then
                v_4:Disconnect()
            end
        end
        for _, v_5 in pairs(Progress_upvr:GetDescendants()) do
            if v_5.ClassName == "ImageLabel" then
                TweenService_upvr:Create(v_5, TweenInfo.new(1, Enum.EasingStyle.Quad), {
                    BackgroundTransparency = 1;
                    ImageTransparency = 1;
                }):Play()
            elseif v_5.ClassName == "TextLabel" then
                TweenService_upvr:Create(v_5, TweenInfo.new(1, Enum.EasingStyle.Quad), {
                    BackgroundTransparency = 1;
                    TextTransparency = 1;
                    TextStrokeTransparency = 1;
                }):Play()
            elseif v_5.ClassName == "Frame" then
                TweenService_upvr:Create(v_5, TweenInfo.new(1, Enum.EasingStyle.Quad), {
                    BackgroundTransparency = 1;
                }):Play()
            end
        end
    end
end
table.insert(tbl_upvr, LocalPlayer_upvr.ChildAdded:Connect(function(arg1) -- Line 378
    --[[ Upvalues[1]:
        [1]: var78_upvr (readonly)
    ]]
    if arg1.Name == "QTEOver" then
        var78_upvr()
    end
end))
