-- Decompiled by Krnl

local v_u_1 = game.Players.LocalPlayer
local v_u_2 = script.Parent
repeat
	task.wait()
until v_u_2.Parent == workspace.Live
local v_u_3 = v_u_2:WaitForChild("Humanoid")
local v_u_4 = v_u_2:WaitForChild("HumanoidRootPart")
v_u_2:WaitForChild("Head")
local v_u_5 = v_u_2:WaitForChild("Torso")
v_u_5:WaitForChild("Neck")
local v_u_6 = v_u_1:WaitForChild("DebrisBD", 20)
local v_u_7 = v_u_1.PlayerGui
local _ = v_u_4:WaitForChild("RootJoint").C0
local _ = CFrame.Angles
local v_u_8 = workspace.CurrentCamera
local v_u_9 = game:GetService("UserInputService")
local v_u_10 = game:GetService("TweenService")
local v_u_11 = game:GetService("RunService")
local v_u_12 = game:GetService("ReplicatedStorage")
local v_u_13 = v_u_12:WaitForChild("Animations")
local v_u_14 = v_u_12:FindFirstChild("Modules")
local v_u_15 = require(script:WaitForChild("MoreFunctionsClient"))
local v_u_16 = require(v_u_14.SharedFunctions)
v_u_12:FindFirstChild("UI")
local v_u_17 = v_u_3:FindFirstChild("Animator")
local v_u_18 = v_u_2:WaitForChild("SwingSpeed")
local v19 = script:WaitForChild("Info")
local v_u_20 = v_u_1:WaitForChild("OtherBD")
local _ = v_u_12.Animations.Walk.AnimationId
local v_u_21 = v_u_12.Replication.Event
local v_u_22 = v_u_12:FindFirstChild("Remotes"):FindFirstChild("UsedTool")
local v_u_23 = workspace:FindFirstChild("Values")
local v_u_24 = require(v_u_12.Modules.VelocityFunctions)
local v_u_25 = require(v_u_12.Modules.Effects)
local v_u_26 = v_u_23:FindFirstChild("LowerJumpPowerOnJump")
local v_u_27 = v_u_2:WaitForChild("JumpPowerAmount")
local v_u_28 = v_u_16.ReturnHoldableAbilities()
local v_u_29 = {
	"Head",
	"Right Arm",
	"Left Arm",
	"Left Leg",
	"Right Leg",
	"Torso"
}
local v_u_30 = { Enum.KeyCode.S, Enum.KeyCode.A, Enum.KeyCode.D }
shared.SavedCFDead = nil
v_u_27.Changed:Connect(function(p31)
	-- upvalues: (copy) v_u_2, (copy) v_u_3
	if not (v_u_2:FindFirstChild("Stun") or (v_u_2:FindFirstChild("Ragdoll") or (v_u_2:FindFirstChild("Dead") or v_u_2:FindFirstChild("InjuredWalking")))) then
		v_u_3.JumpPower = p31
	end
end)
local v_u_32 = nil
Random.new()
local v_u_33 = v_u_9.TouchEnabled
local v_u_34 = tick()
if shared.DestroyOnDeath then
	for _, v35 in pairs(shared.DestroyOnDeath) do
		if v35 then
			v35:Destroy()
		end
	end
end
game.Chat:SetBubbleChatSettings({
	["AdorneeName"] = "ChatAttachment"
})
shared.MaxPrizeFromWin = 456000000
local v_u_36 = {
	["StopCounter"] = 0,
	["PlayCounter"] = 0,
	["CDDASHSTACKS"] = 0
}
local v_u_37 = {
	"InjuredWalking",
	"RotateDisabled",
	"Anchor",
	"CantRun",
	"InCutscene",
	"DisableHeadLookAt"
}
local v38 = ("UZI_CLIENTUPDATE_%*"):format((math.random(1, 99999)))
local v39 = require(v_u_12.Modules.EffectHandler)
require(v_u_12.Modules.GeneralFunctions)
local v_u_40 = require(v_u_12.Modules.Ragdoll)
local v_u_41 = Enum.HumanoidStateType.Freefall
local v_u_42 = Enum.HumanoidStateType.Landed
v39.new(v_u_2)
v_u_11:IsStudio()
local v43 = workspace:FindFirstChild("Effects")
local v_u_44 = Enum.CameraType.Scriptable
if v43 and (v43:FindFirstChild("QueuePart") and v43:FindFirstChild("QueuePart"):FindFirstChild("InvisWall")) then
	v43:FindFirstChild("QueuePart"):FindFirstChild("InvisWall").CanCollide = true
end
if v43 and v43:FindFirstChild("InvisWallGame") then
	v43:FindFirstChild("InvisWallGame").CanCollide = true
end
v_u_3:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
v_u_3:SetStateEnabled(Enum.HumanoidStateType.Swimming, false)
shared.BaseFOV = 70
v_u_8.CameraSubject = v_u_3
v_u_10:Create(v_u_8, TweenInfo.new(0.25), {
	["FieldOfView"] = shared.BaseFOV
}):Play()
shared.BaseJumpPower = 50
v_u_27.Value = shared.BaseJumpPower * v_u_18.Value
local v_u_45 = 14
local v_u_46 = 28
local v_u_47 = v_u_16.GetBoosts(v_u_1, "Faster Sprint")
v_u_3.WalkSpeed = (v_u_45 + v_u_47) * v_u_18.Value
v_u_3.JumpPower = v_u_27.Value
v_u_1.CameraMaxZoomDistance = 14
local function v_u_49()
	-- upvalues: (copy) v_u_9, (copy) v_u_1, (copy) v_u_7, (copy) v_u_25, (copy) v_u_13
	if v_u_9.TouchEnabled then
		v_u_1.PlayerGui.MobileSupport.Enabled = true
		v_u_1.PlayerGui.MobileSupport.RollButton.Visible = true
	else
		local v48 = v_u_7:FindFirstChild("ConsoleSupport"):FindFirstChild("GamepadControlsGui")
		if v48 and v48:FindFirstChild("Dash") then
			v48:FindFirstChild("Dash").Visible = true
		end
	end
	if not v_u_1:GetAttribute("PreloadedDash") then
		v_u_1:SetAttribute("PreloadedDash", true)
		task.spawn(function()
			-- upvalues: (ref) v_u_25, (ref) v_u_13
			v_u_25.PreloadAnim({
				["EffectName"] = "PreloadAnim",
				["TblOfAnims"] = {
					v_u_13.Dashing.Forward,
					v_u_13.Dashing.Backwards,
					v_u_13.Dashing.Left,
					v_u_13.Dashing.Right
				}
			})
			v_u_25.PreloadSounds({
				["EffectName"] = "PreloadSounds",
				["SoundIds"] = {
					"rbxassetid://88725936982152",
					"rbxassetid://134552572582241",
					"rbxassetid://98397849734585",
					"rbxassetid://104349024070999"
				}
			})
		end)
	end
end
local function v_u_54(p50, p51)
	-- upvalues: (copy) v_u_49, (copy) v_u_16, (copy) v_u_2
	local v52 = p50.Value
	if p50.Name == "Faster Sprint" then
		if v52 >= 5 then
			v_u_49()
		end
		if not p51 then
			local v53 = {
				["Attributes"] = {
					["Speed"] = 14
				}
			}
			v_u_16.CreateFolder(v_u_2, "Stun", 0.01, v53)
		end
	end
end
v_u_11:BindToRenderStep(v38, Enum.RenderPriority.Camera.Value - 1, v_u_15.Step)
SteppedCon = v_u_11.Stepped:Connect(function(_, p55)
	-- upvalues: (copy) v_u_15
	v_u_15.Step(p55, true)
end)
if v_u_33 then
	task.spawn(function()
		-- upvalues: (copy) v_u_14, (copy) v_u_1
		require(v_u_14.MobileSupport)(v_u_1)
	end)
end
local function v_u_64(p56, p57)
	-- upvalues: (copy) v_u_16, (copy) v_u_1, (copy) v_u_23, (copy) v_u_2, (copy) v_u_10, (copy) v_u_3, (copy) v_u_36, (copy) v_u_18, (ref) v_u_46
	local v58 = v_u_16.GetBoosts(v_u_1, "Faster Sprint")
	local v59 = v_u_23.CurrentGame.Value == "HideAndSeek" and v_u_1:GetAttribute("IsHider")
	if not v59 then
		if v_u_23.CurrentGame.Value == "HideAndSeek" then
			v59 = v_u_1:GetAttribute("IsHunter")
		else
			v59 = false
		end
	end
	if v_u_2:GetAttribute("WallyWestRun") then
		v_u_10:Create(v_u_3, TweenInfo.new(0.01), {
			["WalkSpeed"] = ((v_u_36.CanRunDuringStun or v_u_2:GetAttribute("WallyWestRun")) + v58) * v_u_18.Value
		}):Play()
		return
	elseif p57 then
		local v60 = v_u_3.Health / v_u_3.MaxHealth
		local v61 = math.clamp(v60, 0, 1) * 0.29999999999999993 + 0.85
		v_u_10:Create(v_u_3, TweenInfo.new(1.5, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
			["WalkSpeed"] = ((v_u_36.CanRunDuringStun or v_u_46) + v58) * v_u_18.Value * v61
		}):Play()
		return
	elseif v59 then
		local v62
		if v_u_1:GetAttribute("IsHider") then
			local v63 = v_u_3.Health / v_u_3.MaxHealth
			v62 = math.clamp(v63, 0, 1) * 0.14500000000000002 + 0.58
		else
			v62 = 0.785
		end
		v_u_10:Create(v_u_3, TweenInfo.new(0.65, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			["WalkSpeed"] = ((v_u_36.CanRunDuringStun or v_u_46) + v58) * v_u_18.Value * v62
		}):Play()
		return
	elseif p56 then
		v_u_10:Create(v_u_3, TweenInfo.new(0.65, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
			["WalkSpeed"] = ((v_u_36.CanRunDuringStun or v_u_46) + v58) * v_u_18.Value
		}):Play()
	else
		v_u_10:Create(v_u_3, TweenInfo.new(0.01), {
			["WalkSpeed"] = ((v_u_36.CanRunDuringStun or v_u_46) + v58) * v_u_18.Value
		}):Play()
	end
end
local function v_u_71(p65)
	-- upvalues: (copy) v_u_18, (copy) v_u_11, (copy) v_u_36
	local v66 = (p65 or 0.8) / v_u_18.Value
	local v67 = 0
	local v68 = 0
	while v67 < v66 do
		local v69 = v_u_11.RenderStepped:Wait()
		if v_u_36.InAir then
			v68 = v68 + v69
		else
			v67 = v67 + v69
		end
		local v70 = v66 - v68 * 0.25
		if math.max(0, v70) <= v67 or not v_u_36.Running then
			break
		end
	end
end
local function v_u_74(p72)
	-- upvalues: (copy) v_u_36, (copy) v_u_16, (copy) v_u_2, (copy) v_u_8, (copy) v_u_44, (copy) v_u_10
	if not v_u_36.FieldOfViewIncreased and (not v_u_16.CheckIfStunned(v_u_2, {
		["running"] = true
	}) and (v_u_8.CameraType ~= v_u_44 and not v_u_36.CantRun)) or p72 and (not v_u_16.CheckIfStunned(v_u_2, {
		["running"] = true
	}) and (v_u_8.CameraType ~= v_u_44 and not v_u_36.CantRun)) then
		v_u_36.FieldOfViewIncreased = tick()
		local v_u_73 = p72 or 10
		v_u_10:Create(v_u_8, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["FieldOfView"] = shared.BaseFOV + v_u_73 / 2
		}):Play()
		task.delay(0.25, function()
			-- upvalues: (ref) v_u_36, (ref) v_u_16, (ref) v_u_2, (ref) v_u_8, (ref) v_u_44, (ref) v_u_10, (copy) v_u_73
			if v_u_36.FieldOfViewIncreased and tick() - v_u_36.FieldOfViewIncreased >= 0.23 and (not v_u_16.CheckIfStunned(v_u_2, {
				["running"] = true
			}) and v_u_8.CameraType ~= v_u_44) then
				v_u_10:Create(v_u_8, TweenInfo.new(1, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {
					["FieldOfView"] = shared.BaseFOV + v_u_73
				}):Play()
			end
		end)
	end
end
local function v_u_76(p75)
	-- upvalues: (copy) v_u_36, (copy) v_u_10, (copy) v_u_8
	if v_u_36.FieldOfViewIncreased then
		v_u_36.FieldOfViewIncreased = nil
		v_u_10:Create(v_u_8, TweenInfo.new(p75 and 0.75 or 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
			["FieldOfView"] = shared.BaseFOV
		}):Play()
	end
end
local v_u_77 = {
	16,
	28,
	50,
	68,
	86
}
local v_u_78 = 0
local v_u_79 = {}
local function v_u_97()
	-- upvalues: (copy) v_u_36, (copy) v_u_16, (copy) v_u_2, (copy) v_u_1, (copy) v_u_23, (ref) v_u_17, (copy) v_u_3, (copy) v_u_15, (copy) v_u_13, (copy) v_u_18, (copy) v_u_10, (copy) v_u_6, (copy) v_u_64, (copy) v_u_74, (copy) v_u_4, (copy) v_u_71
	if not (v_u_36.Running or v_u_16.CheckIfStunned(v_u_2, {
		["running"] = true
	})) then
		if v_u_36.StaminaVal and (v_u_36.StaminaVal.Value <= 0.05 and (v_u_1:GetAttribute("IsHider") and (v_u_2:FindFirstChild("FASTERSPRINT") and v_u_23.CurrentGame.Value == "HideAndSeek"))) then
			if not v_u_2:FindFirstChild("FASTERSPRINT") then
				return
			end
			v_u_2:FindFirstChild("FASTERSPRINT"):Destroy()
		end
		if v_u_36.StaminaVal and (v_u_36.CantRunUntilFull and v_u_36.StaminaVal.Value < 75) then
			return
		end
		if v_u_36.CantRunUntilFull then
			v_u_36.CantRunUntilFull = nil
		end
		if not v_u_17 then
			v_u_17 = v_u_3:WaitForChild("Animator")
		end
		local v_u_80 = v_u_1:GetAttribute("IsHider") and v_u_2:FindFirstChild("FASTERSPRINT")
		if v_u_80 then
			v_u_80 = v_u_23.CurrentGame.Value == "HideAndSeek"
		end
		v_u_36.AttemptingToRun = true
		v_u_15.ChangedRunningState(true)
		if v_u_36.RecentRunAmount then
			local v81 = v_u_36
			v81.RecentRunAmount = v81.RecentRunAmount + 1
		else
			v_u_36.RecentRunAmount = 1
		end
		local v_u_82 = nil
		local v_u_83
		if v_u_36.RunningAnimCustom and not v_u_80 then
			v_u_82 = true
			local v84 = v_u_17
			local v85 = v_u_36.RunningAnimCustom
			v_u_83 = v84:LoadAnimation(typeof(v85) == "string" and v_u_13:FindFirstChild(v_u_36.RunningAnimCustom) or v_u_36.RunningAnimCustom)
			v_u_36.Running = v_u_83
			v_u_83:Play(0.25)
			if v_u_36.InAir then
				v_u_83:AdjustSpeed(0.25)
			elseif v_u_18 then
				v_u_83:AdjustSpeed(v_u_18.Value)
			end
			task.spawn(function()
				-- upvalues: (ref) v_u_83, (ref) v_u_36
				for _ = 1, 250 do
					if not (v_u_83 and (v_u_83.IsPlaying and v_u_36.AttemptingToRun)) then
						v_u_83:Stop()
						return
					end
					v_u_36.Running = v_u_83
					task.wait(0.01)
				end
			end)
		else
			local v86 = v_u_13.SprintStartup
			if v_u_80 and v_u_36.StaminaVal then
				local v87 = v_u_36.StaminaVal
				local v88 = v_u_1:GetAttribute("IsHunter") and 150 or 100
				local v89 = v_u_1:GetAttribute("IsHunter") and 3 or 9
				local v90 = v87.Value / v88 * v89
				local v91 = math.max(0.05, v90)
				v_u_36.StartedRunTick = tick()
				v_u_36.StartedFasterRun = true
				v_u_10:Create(v87, TweenInfo.new(v91), {
					["Value"] = 0
				}):Play()
				if v_u_2:FindFirstChild("FASTERSPRINT") then
					v_u_6:Fire(v_u_2:FindFirstChild("FASTERSPRINT"), v91)
				end
			end
			v_u_83 = v_u_17:LoadAnimation(v86)
			v_u_36.Running = v_u_83
			v_u_83:Play()
			if v_u_36.InAir then
				v_u_83:AdjustSpeed(0.25)
			elseif v_u_18 then
				v_u_83:AdjustSpeed(v_u_18.Value)
			end
		end
		v_u_64(true)
		v_u_74()
		if v_u_36.RecentRunAmount <= 2 then
			v_u_16.PlaySound(v_u_4, "rbxassetid://103020120937659", 4)
		end
		if v_u_80 then
			v_u_2:SetAttribute("RunningSound", true)
		end
		if not v_u_82 then
			if v_u_36.CurrentRunAmount then
				local v92 = v_u_36
				v92.CurrentRunAmount = v92.CurrentRunAmount + 1
			else
				v_u_36.CurrentRunAmount = 1
			end
		end
		task.spawn(function()
			-- upvalues: (ref) v_u_82, (copy) v_u_80, (ref) v_u_71, (ref) v_u_36, (ref) v_u_83, (ref) v_u_16, (ref) v_u_2, (ref) v_u_13, (ref) v_u_64, (ref) v_u_74, (ref) v_u_4, (ref) v_u_6, (ref) v_u_17, (ref) v_u_18, (ref) v_u_10
			if v_u_82 then
				task.wait(0.8)
				local v93 = v_u_36
				v93.RecentRunAmount = v93.RecentRunAmount - 1
				goto l23
			end
			v_u_71(v_u_80 and 0.1 or nil)
			local v94 = v_u_36
			v94.RecentRunAmount = v94.RecentRunAmount - 1
			if v_u_80 then
				v_u_83:Stop(0.25)
			else
				v_u_83:Stop()
			end
			if v_u_36.Running and (not v_u_16.CheckIfStunned(v_u_2, {
				["running"] = true
			}) and v_u_36.RecentRunAmount == 0) then
				local v95 = v_u_13.Sprint
				if v_u_80 then
					v_u_64(true, v_u_80)
					v_u_74(25)
					v_u_36.RunLoopSound = v_u_16.PlaySound(v_u_4, "rbxassetid://136737463626709", 5, {
						["Looped"] = true
					})
					v_u_6:Fire(v_u_36.RunLoopSound, 30)
					v95 = v_u_13.HasFootsteps.RunEscapeNormal
				end
				local v96 = v_u_17:LoadAnimation(v95)
				v_u_36.Running = v96
				if v_u_80 then
					v96:Play(0.25)
				else
					v96:Play()
				end
				if v_u_36.InAir then
					v96:AdjustSpeed(0.25)
				elseif v_u_18 then
					v96:AdjustSpeed(v_u_18.Value)
				end
				for _ = 1, 50 do
					if not (v96 and v96.IsPlaying) then
						v96:Stop()
						v_u_2:SetAttribute("RunningSound", nil)
						if v_u_36.RunLoopSound then
							v_u_10:Create(v_u_36.RunLoopSound, TweenInfo.new(0.3), {
								["Volume"] = 0
							}):Play()
							v_u_6:Fire(v_u_36.RunLoopSound, 0.5)
							return
						end
						::l23::
						return
					end
					v_u_36.Running = v96
					task.wait(0.01)
				end
				return
			else
				if v_u_36.RunLoopSound then
					v_u_10:Create(v_u_36.RunLoopSound, TweenInfo.new(0.3), {
						["Volume"] = 0
					}):Play()
					v_u_6:Fire(v_u_36.RunLoopSound, 0.5)
					v_u_2:SetAttribute("RunningSound", nil)
					return
				end
				goto l23
			end
		end)
	end
end
local function v_u_123(p98, _)
	-- upvalues: (copy) v_u_36, (copy) v_u_10, (copy) v_u_6, (copy) v_u_2, (copy) v_u_15, (copy) v_u_1, (copy) v_u_23, (copy) v_u_16, (copy) v_u_4, (copy) v_u_12, (copy) v_u_3, (ref) v_u_45, (copy) v_u_18, (ref) v_u_17, (copy) v_u_24, (copy) v_u_25, (copy) v_u_11, (copy) v_u_76
	if v_u_36.AttemptingToRun then
		v_u_36.AttemptingToRun = nil
	end
	if v_u_36.RunLoopSound then
		v_u_10:Create(v_u_36.RunLoopSound, TweenInfo.new(0.2), {
			["Volume"] = 0
		}):Play()
		v_u_6:Fire(v_u_36.RunLoopSound, 0.25)
		v_u_36.RunLoopSound = nil
		v_u_2:SetAttribute("RunningSound", nil)
	end
	if v_u_36.Running then
		v_u_15.ChangedRunningState()
		if p98 then
			v_u_36.Running:Stop(0.25)
		else
			v_u_36.Running:Stop()
		end
		v_u_36.Running = nil
		local v99 = v_u_1:GetAttribute("IsHider")
		if v99 then
			v99 = v_u_23.CurrentGame.Value == "HideAndSeek"
		end
		local v100 = nil
		if not v_u_36.IsStunned and (v99 and (not v_u_2:FindFirstChild("Dead") and v_u_36.StartedFasterRun)) then
			if v_u_36.StaminaVal then
				v_u_10:Create(v_u_36.StaminaVal, TweenInfo.new(0.01), {
					["Value"] = v_u_36.StaminaVal.Value
				}):Play()
			end
			if not v_u_36.RecentBVForStop and (v_u_36.StartedRunTick and tick() - v_u_36.StartedRunTick >= 0.5) then
				local _ = not v_u_1:GetAttribute("IsHunter")
			end
			if tick() - v_u_36.StartedRunTick >= 0.6 then
				local v101 = {}
				local v102 = v_u_1:GetAttribute("IsHunter")
				local v103 = v_u_16.PlaySound
				local v104 = v_u_4
				table.insert(v101, v103(v104, v102 and "rbxassetid://109544967780407" or "rbxassetid://125754880017796", 6))
				local v105 = v_u_16.StartupAbility
				local v106 = v_u_2
				local v107 = {
					["DontStun"] = true,
					["CanCreateFootsteps"] = true,
					["StunInterruption"] = true,
					["TimeLength"] = 1,
					["StunTime"] = 1,
					["CharacterAnimation"] = {
						["Track"] = v102 and v_u_12.Animations.HasFootsteps.RunEscapeKnifeStop or v_u_12.Animations:FindFirstChild("RunEscapeStop")
					},
					["DestroyTblIfInterrupted"] = v101,
					["StunAttributes"] = {
						["DisableHeadLookAt"] = true,
						["DoesntDisableLegsForASec"] = true
					}
				}
				local _, _, _ = v105(v106, v107)
				v_u_36.StartedFasterRun = nil
				v100 = true
			end
		end
		if v_u_36.IsStunned then
			local v108 = 999999999
			for _, v109 in pairs(v_u_2:GetChildren()) do
				if v109.Name == "Stun" and (v109:GetAttribute("CanRunDuringStun") and (v109:GetAttribute("Speed") and v109:GetAttribute("Speed") < v108)) then
					v108 = v109:GetAttribute("Speed")
				end
			end
			if v108 < 99999 then
				local v110 = v_u_16.GetBoosts(v_u_1, "Faster Sprint")
				v_u_10:Create(v_u_3, TweenInfo.new(0.01), {
					["WalkSpeed"] = (v108 + v110) * v_u_18.Value
				}):Play()
			end
		else
			local v111 = v_u_16.GetBoosts(v_u_1, "Faster Sprint")
			v_u_10:Create(v_u_3, TweenInfo.new(v100 and 1 or 0.01), {
				["WalkSpeed"] = (v_u_45 + v111) * v_u_18.Value
			}):Play()
		end
		if v_u_2:GetAttribute("WallyWestRun") and v_u_2:GetAttribute("WallyWestRun") >= 50 then
			local v_u_112 = v_u_17:LoadAnimation(v_u_12.Animations.WallyWhiff)
			v_u_112:Play(0.25)
			local v113 = (v_u_2:GetAttribute("WallyWestRun") - 50) / 36
			local v114 = math.clamp(v113, 0, 1)
			local v115 = v114 * 0.4 + 0.85
			local v_u_116 = v114 * 20 + 100
			local v_u_117 = v_u_24.CheckBVAndCreate(v_u_2, 1, {
				["Velocity"] = v_u_4.CFrame.LookVector * v_u_116,
				["MaxForce"] = Vector3.new(55000, 0, 55000),
				["Parent"] = v_u_4,
				["DebrisTime"] = v115
			})
			if not v_u_117 then
				return
			end
			v_u_16.PlaySound(v_u_4, "rbxassetid://108794431713541", 0.45, {
				["PlayInWorkspaceONCLIENT"] = true
			})
			v_u_16.CreateFolder(v_u_2, "Stun", v115, {
				["Attributes"] = {
					["Speed"] = 0
				}
			})
			local v_u_118 = v_u_16.CreateFolder(v_u_1, "NEWDASHROCKS", v115 - 0.25, {
				["Attributes"] = {}
			})
			task.spawn(function()
				-- upvalues: (ref) v_u_25, (ref) v_u_1, (copy) v_u_118
				local v119 = {
					["Player"] = v_u_1,
					["DashingFolder"] = v_u_118
				}
				v_u_25.RenderDashEffects(v119)
			end)
			v_u_112:GetMarkerReachedSignal("StopHere"):Connect(function()
				-- upvalues: (copy) v_u_112, (ref) v_u_116
				v_u_112:AdjustSpeed(0)
				repeat
					task.wait()
				until v_u_116 <= 40
				v_u_112:AdjustSpeed(1)
			end)
			local v_u_120 = 0
			local v_u_121 = nil
			v_u_121 = v_u_11.RenderStepped:Connect(function(p122)
				-- upvalues: (ref) v_u_120, (ref) v_u_116, (copy) v_u_117, (ref) v_u_4, (ref) v_u_121
				v_u_120 = v_u_120 + p122
				if v_u_120 >= 0.016666666666666666 then
					v_u_120 = v_u_120 - 0.016666666666666666
					v_u_116 = v_u_116 * 0.98
					v_u_117.Velocity = v_u_4.CFrame.LookVector * v_u_116
					if v_u_116 <= 25 then
						v_u_117.Velocity = Vector3.new(0, 0, 0)
						v_u_121:Disconnect()
					end
				end
			end)
		end
		v_u_76(v100)
	end
end
local function v_u_124()
	-- upvalues: (copy) v_u_36, (copy) v_u_23, (copy) v_u_15
	if not v_u_36.InAir then
		v_u_36.InAir = true
		shared.InAir = true
		if v_u_36.LandedAnim and v_u_23.CurrentGame.Value ~= "HideAndSeek" then
			if v_u_36.LandedAnim.IsPlaying then
				v_u_36.LandedAnim:Stop()
			end
			v_u_36.LandedAnim = nil
		end
		v_u_15.ChangeNeckLerpSpeed(0.01)
		if v_u_36.Running then
			v_u_36.Running:AdjustSpeed(0.25)
		end
	end
end
local function v_u_126()
	-- upvalues: (copy) v_u_36, (copy) v_u_23, (ref) v_u_17, (copy) v_u_13, (copy) v_u_18, (copy) v_u_15
	if v_u_36.InAir then
		v_u_36.InAir = nil
		shared.InAir = nil
		if not v_u_36.LandedAnim and v_u_23.CurrentGame.Value ~= "HideAndSeek" then
			local v125 = v_u_17:LoadAnimation(v_u_13.Land)
			v125:Play()
			v125:AdjustSpeed(v_u_18.Value)
			v_u_36.LandedAnim = v125
		end
		v_u_15.ChangeNeckLerpSpeed(nil)
		if v_u_36.Running then
			v_u_36.Running:AdjustSpeed(v_u_18 and v_u_18.Value or 1)
		end
	end
end
local function v_u_127(_) end
local function v_u_135(p128)
	-- upvalues: (copy) v_u_8, (copy) v_u_3
	local v129 = v_u_8.CFrame.LookVector
	local v130 = (v129 - Vector3.new(0, 1, 0) * v129.Y).Unit
	local v131 = CFrame.new(Vector3.new(0, 0, 0), v130)
	local v132 = v_u_3.MoveDirection:Dot(v131.RightVector) > 0.75 and "Right" or not p128 and "Forward"
	local v133 = v_u_3.MoveDirection:Dot(-v131.RightVector) > 0.75 and "Left" or v132
	local v134 = v_u_3.MoveDirection:Dot(v131.LookVector) > 0.6 and "Forward" or v133
	return v_u_3.MoveDirection:Dot(-v131.LookVector) > 0.6 and "Backwards" or v134
end
local function v_u_147(_)
	-- upvalues: (copy) v_u_16, (copy) v_u_2, (copy) v_u_1, (copy) v_u_36, (copy) v_u_24, (copy) v_u_4, (copy) v_u_23, (copy) v_u_9, (copy) v_u_135, (copy) v_u_15
	if not v_u_16.CheckIfStunned(v_u_2, {
		["ignoregettingshot"] = true
	}) then
		if (not v_u_1:FindFirstChild("Boosts") or (not v_u_1:FindFirstChild("Boosts"):FindFirstChild("Faster Sprint") or v_u_1:FindFirstChild("Boosts"):FindFirstChild("Faster Sprint").Value < 5)) and (not v_u_1:GetAttribute("_EquippedPower") or (v_u_1:GetAttribute("_EquippedPower") ~= "PHANTOM STEP" or workspace.Values.PowersDisabled.Value)) then
			return
		end
		local v136 = nil
		local v137 = v_u_1:GetAttribute("_EquippedPower")
		local v138 = workspace.Values.PowersDisabled.Value and "" or v137
		local v139
		if v138 and v138 == "PHANTOM STEP" then
			v139 = v_u_36.CDDASHSTACKS >= 2
		else
			v139 = v_u_36.DashCD and true or v136
		end
		if v139 then
			return
		end
		local v140 = v_u_24.CheckBVAndCreate(v_u_2, 1, {
			["Velocity"] = v_u_4.CFrame.LookVector * 1,
			["MaxForce"] = Vector3.new(55000, 0, 55000),
			["Parent"] = v_u_4,
			["DebrisTime"] = 0.63
		})
		if not v140 then
			return
		end
		local v141 = v_u_23.CurrentGame.Value == "HideAndSeek" and (v_u_1:GetAttribute("IsHider") and 2.75 or 3) or 1.5
		if v138 and v138 == "PHANTOM STEP" then
			local v_u_142 = 1
			if v_u_36.CDDASHSTACKS >= 2 or (v_u_23.CurrentGame.Value == "SquidGame" or v_u_23.CurrentGame.Value == "HideAndSeek") then
				v_u_16.CreateFolder(v_u_2, "CDDASHSTACKSCD", v141)
				v_u_142 = 2
			else
				v_u_16.CreateFolder(v_u_2, "CDDASHSTACKSCD", v141 / 2)
			end
			local v143 = v_u_36
			v143.CDDASHSTACKS = v143.CDDASHSTACKS + v_u_142
			task.delay(0.2 * v_u_36.CDDASHSTACKS, function()
				-- upvalues: (ref) v_u_2, (ref) v_u_36, (ref) v_u_142
				repeat
					task.wait(0.1)
				until not v_u_2:FindFirstChild("CDDASHSTACKSCD")
				local v144 = v_u_36
				v144.CDDASHSTACKS = v144.CDDASHSTACKS - v_u_142
			end)
		else
			v_u_36.DashCD = true
			task.delay(v141, function()
				-- upvalues: (ref) v_u_36
				v_u_36.DashCD = nil
			end)
		end
		local v145 = "Forward"
		local v146
		if v_u_9.TouchEnabled or (shared.controllerpressed or not shared.InShiftLock) then
			v146 = v_u_135()
		else
			v146 = v_u_36.SPressed and "Backwards" or (v_u_36.DPressed and "Right" or (v_u_36.APressed and "Left" or v145))
		end
		v_u_15.Roll(v140, v146)
	end
end
v19.Event:Connect(function(p148)
	-- upvalues: (copy) v_u_36, (copy) v_u_76, (copy) v_u_123, (copy) v_u_127, (copy) v_u_147
	if p148.RunningEnabled then
		v_u_36.ShiftPressed = p148.State
		if not p148.State then
			v_u_76()
			v_u_123(nil, true)
			return
		end
	else
		if p148.Crouching then
			v_u_127(p148.CrouchingState)
			return
		end
		if p148.Dashing then
			v_u_147()
		end
	end
end)
v_u_3.StateChanged:Connect(function(p149, p150)
	-- upvalues: (copy) v_u_3, (copy) v_u_41, (copy) v_u_36, (copy) v_u_124, (copy) v_u_42, (copy) v_u_126
	local v151 = string.gsub
	local v152 = v_u_3.FloorMaterial
	v151(tostring(v152), "Enum.Material.", "")
	if p150 == v_u_41 and not v_u_36.Ragdolled then
		v_u_124()
		return
	elseif p150 == v_u_42 and p149 == v_u_41 then
		v_u_126()
		return
	elseif p150 == v_u_42 and v_u_36.InAir or v_u_3.FloorMaterial ~= Enum.Material.Air and v_u_36.InAir then
		v_u_126()
	end
end)
v_u_9.TouchTapInWorld:Connect(function(_, p153)
	-- upvalues: (copy) v_u_21, (copy) v_u_36, (copy) v_u_22
	if not p153 then
		v_u_21:FireServer("Clicked")
		if v_u_36.ToolInChar then
			v_u_22:FireServer("UsingMoveCustom", v_u_36.ToolInChar, nil, {
				["Clicked"] = true,
				["IsRunning"] = v_u_36.Running and true
			})
		end
	end
end)
local function v_u_155(p154)
	-- upvalues: (copy) v_u_21, (copy) v_u_36, (copy) v_u_22, (copy) v_u_20, (copy) v_u_30, (copy) v_u_127, (copy) v_u_147, (copy) v_u_1, (copy) v_u_74
	if p154.UserInputType == Enum.UserInputType.MouseButton1 or p154.KeyCode == Enum.KeyCode.ButtonX then
		v_u_21:FireServer("Clicked")
		if v_u_36.ToolInChar then
			v_u_22:FireServer("UsingMoveCustom", v_u_36.ToolInChar, nil, {
				["Clicked"] = true,
				["IsRunning"] = v_u_36.Running and true
			})
		end
		v_u_20:Fire("Action")
		v_u_36.HoldingAction = true
		while task.wait() and v_u_36.HoldingAction do
			v_u_20:Fire("Action")
		end
		return
	else
		if table.find(v_u_30, p154.KeyCode) then
			v_u_36[p154.KeyCode == Enum.KeyCode.S and "SPressed" or (p154.KeyCode == Enum.KeyCode.D and "DPressed" or (p154.KeyCode == Enum.KeyCode.A and "APressed" or false))] = true
		end
		if p154.KeyCode == Enum.KeyCode.C then
			v_u_127(true)
		end
		if p154.KeyCode == Enum.KeyCode.Q or p154.KeyCode == Enum.KeyCode.ButtonY then
			v_u_147()
		end
		if p154.UserInputType == Enum.UserInputType.MouseButton2 or p154.KeyCode == Enum.KeyCode.ButtonL2 then
			v_u_20:Fire("ScopingIn")
		end
		if p154.KeyCode == Enum.KeyCode.F2 and v_u_1.Name == "adjute" then
			v_u_21:FireServer("AttemptToEnableExplorer")
		end
		if p154.KeyCode == Enum.KeyCode.LeftShift or p154.KeyCode == Enum.KeyCode.ButtonL3 then
			v_u_74()
			v_u_36.ShiftPressed = true
			return
		elseif p154.KeyCode == Enum.KeyCode.R or p154.KeyCode == Enum.KeyCode.ButtonB then
			v_u_20:Fire("Reload")
		end
	end
end
local function v_u_157(p156, _)
	-- upvalues: (copy) v_u_76, (copy) v_u_123, (copy) v_u_36, (copy) v_u_30, (copy) v_u_127, (copy) v_u_22, (copy) v_u_20
	if p156.KeyCode == Enum.KeyCode.LeftShift or p156.KeyCode == Enum.KeyCode.ButtonL3 then
		v_u_76()
		v_u_123(nil, true)
		v_u_36.ShiftPressed = nil
	end
	if table.find(v_u_30, p156.KeyCode) then
		v_u_36[p156.KeyCode == Enum.KeyCode.S and "SPressed" or (p156.KeyCode == Enum.KeyCode.D and "DPressed" or (p156.KeyCode == Enum.KeyCode.A and "APressed" or false))] = nil
	end
	if p156.KeyCode == Enum.KeyCode.C then
		v_u_127()
	end
	if p156.UserInputType == Enum.UserInputType.MouseButton1 or (p156.UserInputType == Enum.UserInputType.Touch or p156.KeyCode == Enum.KeyCode.ButtonX) then
		if v_u_36.ToolInChar then
			v_u_22:FireServer("UsingMoveCustom", v_u_36.ToolInChar, true, {
				["Clicked"] = true,
				["IsRunning"] = v_u_36.Running and true
			})
		end
		v_u_36.HoldingAction = false
	elseif p156.UserInputType == Enum.UserInputType.MouseButton2 or p156.KeyCode == Enum.KeyCode.ButtonL2 then
		v_u_20:Fire("ScopingInLetGo")
	end
end
v_u_9.InputBegan:Connect(function(p158, p159)
	-- upvalues: (copy) v_u_155
	if not p159 then
		v_u_155(p158)
	end
end)
v_u_9.JumpRequest:Connect(function()
	-- upvalues: (copy) v_u_21
	v_u_21:FireServer("AttempingToJump")
end)
v_u_9.InputEnded:Connect(function(p160, p161)
	-- upvalues: (copy) v_u_157
	v_u_157(p160, p161)
end)
local function v162()
	-- upvalues: (copy) v_u_1, (copy) v_u_36, (copy) v_u_16, (copy) v_u_4, (copy) v_u_15
	if v_u_1:GetAttribute("InQueue") and not v_u_36.InQueue then
		v_u_36.InQueue = true
		v_u_16.PlaySound(v_u_4, "rbxassetid://75207716801280", 10)
		v_u_15.QueueStateChanged(true)
	elseif not v_u_1:GetAttribute("InQueue") and v_u_36.InQueue then
		v_u_36.InQueue = nil
		v_u_16.PlaySound(v_u_4, "rbxassetid://133024109651816", 10)
		v_u_15.QueueStateChanged(nil)
	end
end
local function v163()
	-- upvalues: (copy) v_u_2, (copy) v_u_36, (copy) v_u_15
	if v_u_2:GetAttribute("DisableCameraLerp") and not v_u_36.DisableCameraLerp then
		v_u_36.DisableCameraLerp = true
		v_u_15.UpdateTBLForVariables("DisableCameraLerp", true)
	elseif not v_u_2:GetAttribute("DisableCameraLerp") and v_u_36.DisableCameraLerp then
		v_u_36.DisableCameraLerp = nil
		v_u_15.UpdateTBLForVariables("DisableCameraLerp", nil)
	end
end
v162()
v163()
v_u_1.AttributeChanged:Connect(v162)
v_u_2.AttributeChanged:Connect(v163)
shared.IsDead = nil
local v_u_164 = {}
local function v_u_170()
	-- upvalues: (ref) v_u_32, (copy) v_u_164, (copy) v_u_36, (copy) v_u_127, (copy) v_u_123, (copy) v_u_7, (copy) v_u_33, (copy) v_u_10, (copy) v_u_6, (copy) v_u_9, (copy) v_u_2, (copy) v_u_29
	if not v_u_32 then
		v_u_32 = true
		shared.IsDead = true
		for _, v165 in pairs(v_u_164) do
			if v165 then
				v165:Disconnect()
			end
		end
		if v_u_36.MoveAnimCustom then
			v_u_36.MoveAnimCustom:Stop(0)
		end
		if v_u_36.NumberChangedSpeed then
			v_u_36.NumberChangedSpeed:Destroy()
		end
		v_u_127()
		v_u_123()
		if shared.ProximityPrompts then
			for _, v166 in pairs(shared.ProximityPrompts) do
				if v166 then
					v166.Enabled = false
				end
			end
		end
		local v167 = v_u_7:FindFirstChild("ConsoleSupport"):FindFirstChild("GamepadControlsGui")
		if v167 then
			v167:FindFirstChild("Reload").Visible = false
		end
		if v_u_33 then
			v_u_7:FindFirstChild("MobileSupport"):FindFirstChild("ReloadButton").Visible = false
			v_u_7:FindFirstChild("MobileSupport"):FindFirstChild("ShootButton").Visible = false
			v_u_7:FindFirstChild("MobileSupport"):FindFirstChild("ZoomInButton").Visible = false
			if v_u_7:FindFirstChild("ImpactFrames"):FindFirstChild("MobileCrossHairEnabled") then
				v_u_7:FindFirstChild("ImpactFrames"):FindFirstChild("MobileCrossHairEnabled").Name = "MobileCrossHairEnabled"
				v_u_10:Create(v_u_7:FindFirstChild("ImpactFrames"):FindFirstChild("MobileCrossHairEnabled"), TweenInfo.new(0.5, Enum.EasingStyle.Circular, Enum.EasingDirection.InOut), {
					["Rotation"] = 360,
					["ImageTransparency"] = 1
				}):Play()
				v_u_6:Fire(v_u_7:FindFirstChild("ImpactFrames"):FindFirstChild("MobileCrossHairEnabled"), 0.6)
			end
		end
		if not v_u_9.TouchEnabled then
			v_u_9.MouseIconEnabled = true
		end
		for _, v168 in pairs(v_u_2:GetChildren()) do
			if v168:IsA("BasePart") and (table.find(v_u_29, v168.Name) and v168.Name ~= "HumanoidRootPart") then
				local v169 = v_u_10:Create(v168, TweenInfo.new(0.01, Enum.EasingStyle.Linear), {
					["LocalTransparencyModifier"] = 0
				})
				v169:Play()
				v169:Destroy()
			end
		end
	end
end
local v172 = v_u_3.HealthChanged:Connect(function(p171)
	-- upvalues: (copy) v_u_170
	if p171 <= 0 then
		v_u_170()
	end
end)
local v173 = v_u_3.Died:Connect(function()
	-- upvalues: (copy) v_u_170
	v_u_170()
end)
table.insert(v_u_164, v172)
table.insert(v_u_164, v173)
local function v_u_178(p174)
	-- upvalues: (copy) v_u_2, (copy) v_u_36, (copy) v_u_10, (copy) v_u_3, (copy) v_u_18
	local v175 = nil
	for _, v176 in pairs(v_u_2:GetChildren()) do
		if v176.Name == "Stun" and v176:GetAttribute("Speed") then
			if v176:GetAttribute("ForceThisSpeed") then
				v175 = v176:GetAttribute("Speed")
				break
			end
			v175 = v175 or v176:GetAttribute("Speed")
			if v176:GetAttribute("Speed") < v175 then
				v175 = v176:GetAttribute("Speed")
			end
		end
	end
	local v177 = p174 and p174:GetAttribute("CanRunDuringStun")
	if v177 then
		v177 = v_u_36.Running
	end
	if v175 and not v177 then
		v_u_10:Create(v_u_3, TweenInfo.new(0.01), {
			["WalkSpeed"] = v175 * v_u_18.Value
		}):Play()
		if v175 <= 0 then
			if v_u_2:FindFirstChild("RotateDisabled") or not p174:GetAttribute("DoesntDisableLegsForASec") then
				shared.WalkSpeedChangeTick = tick() - 1
			else
				shared.WalkSpeedChangeTick = tick()
			end
		end
		shared.WalkSpeedChangeTick = nil
	end
end
local function v181()
	-- upvalues: (copy) v_u_2
	for _, v179 in game:GetService("CollectionService"):GetTagged("DuoProximityPrompt") do
		local v180 = not v179:IsDescendantOf(v_u_2)
		if v_u_2:GetAttribute("CurrentEmote") then
			v180 = false
		end
		if v_u_2 and v_u_2:GetAttribute("Dead") then
			v180 = false
		end
		v179.Enabled = v180
	end
end
game:GetService("CollectionService"):GetInstanceAddedSignal("DuoProximityPrompt"):Connect(v181)
v_u_2:GetAttributeChangedSignal("CurrentEmote"):Connect(v181)
v181()
local function v_u_183(p182)
	-- upvalues: (copy) v_u_178, (copy) v_u_15, (copy) v_u_36, (copy) v_u_3
	v_u_178(p182)
	if p182:GetAttribute("NoLeaning") then
		v_u_15.UpdateTBLForVariables("NoLeaning", true)
	end
	if p182:GetAttribute("DisableHeadLookAt") then
		v_u_36.DisableHeadLookAtExists = true
		v_u_15.UpdateTBLForVariables("DisableHeadLookAt", true)
	end
	v_u_3.JumpPower = p182:GetAttribute("JumpPower") or 0
end
local function v_u_189()
	-- upvalues: (copy) v_u_36, (copy) v_u_16, (copy) v_u_1, (copy) v_u_10, (copy) v_u_3, (ref) v_u_45, (copy) v_u_18, (copy) v_u_15, (copy) v_u_2, (copy) v_u_27
	if not v_u_36.Running then
		local v184 = v_u_16.GetBoosts(v_u_1, "Faster Sprint")
		v_u_10:Create(v_u_3, TweenInfo.new(0.01), {
			["WalkSpeed"] = (v_u_45 + v184) * v_u_18.Value
		}):Play()
	end
	shared.WalkSpeedChangeTick = nil
	v_u_15.UpdateTBLForVariables("NoLeaning", nil)
	local v185 = v_u_36.DisableHeadLookAt
	for _, v186 in pairs(v_u_2:GetChildren()) do
		if v186.ClassName == "Tool" and v186:GetAttribute("DisableHeadLookAt") then
			v185 = true
			break
		end
	end
	if not v185 then
		v_u_15.UpdateTBLForVariables("DisableHeadLookAt", nil)
	end
	local v187 = v_u_3
	local v188 = v_u_27.Value
	v187.JumpPower = math.max(v188, 0)
end
local v_u_190 = {
	"rbxassetid://85904236253345",
	"rbxassetid://139718841394075",
	"rbxassetid://92521384102097",
	"rbxassetid://78918889905589",
	"rbxassetid://74687942428243"
}
v_u_2:GetAttributeChangedSignal("WallyWestRun"):Connect(function()
	-- upvalues: (copy) v_u_2, (copy) v_u_64, (copy) v_u_77, (ref) v_u_79, (ref) v_u_78, (copy) v_u_16, (copy) v_u_4, (copy) v_u_190, (copy) v_u_12, (copy) v_u_36, (ref) v_u_17, (copy) v_u_123
	local v191 = v_u_2:GetAttribute("WallyWestRun")
	if v191 then
		v_u_64()
		for v192, v193 in ipairs(v_u_77) do
			if v193 <= v191 and not v_u_79[v192] then
				v_u_78 = v192
				v_u_79[v192] = true
				v_u_2:FindFirstChild("Remotes"):FindFirstChild("Relay"):Fire({
					["EffectName"] = "MauioShake",
					["Length"] = 0.45,
					["Intensity"] = v_u_78 * 0.7,
					["TweenSpeed"] = 0.075,
					["AxisMultipliers"] = Vector3.new(1, 1, 1),
					["FadeStyle"] = "inQuad",
					["PositionStyle"] = "inCubic"
				})
				v_u_16.PlaySound(v_u_4, v_u_190[v192], 0.85, {
					["PlayInWorkspaceONCLIENT"] = true
				})
				local v194 = {
					["name"] = "SpeedsterVFX",
					["data"] = {
						["speed_level"] = v192
					}
				}
				v_u_12.Replication.Replicate:FireServer(v194)
			end
		end
		local v195 = v_u_12.Animations.Quicksilver:FindFirstChild("Run" .. v_u_78)
		if v195 and v_u_36.Running.Animation.AnimationId ~= v195.AnimationId then
			v_u_36.Running:Stop(0.35)
			v_u_36.Running = v_u_17:LoadAnimation(v195)
			v_u_36.Running:Play(0.35)
			if v_u_36.Running then
				if v_u_36.InAir then
					v_u_36.Running:AdjustSpeed(0.25)
				else
					v_u_36.Running:AdjustSpeed(1)
				end
			end
		end
	else
		if v_u_78 > 0 then
			v_u_78 = 0
			v_u_79 = {}
			local v196 = {
				["name"] = "SpeedsterVFX",
				["data"] = {
					["speed_level"] = v_u_78
				}
			}
			v_u_12.Replication.Replicate:FireServer(v196)
		end
		task.wait(0.01)
		v_u_123()
	end
end)
local function v231(p_u_197)
	-- upvalues: (copy) v_u_13, (copy) v_u_36, (copy) v_u_2, (copy) v_u_7, (copy) v_u_33, (ref) v_u_34, (copy) v_u_123, (ref) v_u_45, (ref) v_u_46, (copy) v_u_1, (copy) v_u_10, (copy) v_u_3, (copy) v_u_47, (copy) v_u_18, (copy) v_u_29, (copy) v_u_11, (ref) v_u_32, (copy) v_u_15, (copy) v_u_16, (copy) v_u_127, (copy) v_u_64, (copy) v_u_183, (copy) v_u_28, (copy) v_u_37, (ref) v_u_17, (copy) v_u_4, (copy) v_u_40, (copy) v_u_5, (copy) v_u_12, (copy) v_u_25, (copy) v_u_190
	if p_u_197:GetAttribute("Gun") and v_u_13:FindFirstChild("Run" .. p_u_197.Name) then
		v_u_36.RunningAnimCustom = "Run" .. p_u_197.Name
		if v_u_13:FindFirstChild("Walk" .. p_u_197.Name) then
			v_u_2:FindFirstChild("Animate"):FindFirstChild("walk"):FindFirstChild("WalkAnim").AnimationId = v_u_13:FindFirstChild("Walk" .. p_u_197.Name).AnimationId
		end
		local v198 = v_u_7:FindFirstChild("ConsoleSupport"):FindFirstChild("GamepadControlsGui")
		if v198 and not v_u_2:FindFirstChild("Dead") then
			v198:FindFirstChild("Reload").Visible = true
		end
		if v_u_33 and not v_u_2:FindFirstChild("Dead") then
			v_u_7:FindFirstChild("MobileSupport"):FindFirstChild("ReloadButton").Visible = true
			v_u_7:FindFirstChild("MobileSupport"):FindFirstChild("ShootButton").Visible = true
			v_u_7:FindFirstChild("MobileSupport"):FindFirstChild("ZoomInButton").Visible = true
		end
		if v_u_36.Running and v_u_36.Running.IsPlaying then
			v_u_34 = tick()
			v_u_123(true)
		end
	elseif p_u_197.ClassName == "Tool" and v_u_13:FindFirstChild("Walk" .. p_u_197.Name) then
		v_u_2:FindFirstChild("Animate"):FindFirstChild("walk"):FindFirstChild("WalkAnim").AnimationId = v_u_13:FindFirstChild("Walk" .. p_u_197.Name).AnimationId
		if v_u_13:FindFirstChild("Idle" .. p_u_197.Name) then
			v_u_2:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1").AnimationId = v_u_13:FindFirstChild("Idle" .. p_u_197.Name).AnimationId
		end
		if v_u_13:FindFirstChild("Run" .. p_u_197.Name) then
			v_u_36.RunningAnimCustom = "Run" .. p_u_197.Name
			if v_u_36.Running and v_u_36.Running.IsPlaying then
				v_u_34 = tick()
				v_u_123(true)
			end
		end
	elseif p_u_197.ClassName == "Tool" and v_u_13:FindFirstChild("Run" .. p_u_197.Name) then
		v_u_36.RunningAnimCustom = "Run" .. p_u_197.Name
		if v_u_36.Running and v_u_36.Running.IsPlaying then
			v_u_34 = tick()
			v_u_123(true)
		end
	end
	if p_u_197.Name == "NewBaseWalkSpeed" then
		v_u_45 = p_u_197.Value
		v_u_46 = 30 + p_u_197.Value
		if not v_u_36.StaminaVal then
			v_u_36.StaminaVal = Instance.new("NumberValue")
			v_u_36.StaminaVal.Name = "StaminaVal"
			v_u_36.StaminaVal.Parent = v_u_2
			v_u_36.StaminaVal.Value = 100
			local v_u_199 = true
			local v_u_200 = 0
			v_u_36.StaminaVal.Changed:Connect(function(p201)
				-- upvalues: (ref) v_u_200, (ref) v_u_36, (ref) v_u_34, (ref) v_u_123, (ref) v_u_1, (ref) v_u_10, (ref) v_u_199
				v_u_200 = v_u_200 + 1
				local v202 = v_u_200
				if p201 <= 0.01 and v_u_36.Running then
					v_u_34 = tick()
					v_u_123()
					if v_u_1:FindFirstChild("PlayerGui"):FindFirstChild("ImpactFrames"):FindFirstChild("StaminaBar") then
						v_u_10:Create(v_u_1:FindFirstChild("PlayerGui"):FindFirstChild("ImpactFrames"):FindFirstChild("StaminaBar"):FindFirstChild("ShowingWhatsNeeded"), TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
							["BackgroundTransparency"] = 0
						}):Play()
					end
				end
				if v_u_1:FindFirstChild("PlayerGui"):FindFirstChild("ImpactFrames"):FindFirstChild("StaminaBar") then
					v_u_10:Create(v_u_1:FindFirstChild("PlayerGui"):FindFirstChild("ImpactFrames"):FindFirstChild("StaminaBar"):FindFirstChild("Bar"), TweenInfo.new(1, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
						["Size"] = UDim2.new(p201 / 100, 0, 1, -3)
					}):Play()
				end
				if not v_u_199 and v_u_1:FindFirstChild("PlayerGui"):FindFirstChild("ImpactFrames"):FindFirstChild("StaminaBar") then
					v_u_199 = true
					for _, v203 in pairs(v_u_1:FindFirstChild("PlayerGui"):FindFirstChild("ImpactFrames"):FindFirstChild("StaminaBar"):GetDescendants()) do
						if v203:IsA("Frame") and v203:GetAttribute("SaveTransparency") then
							v_u_10:Create(v203, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["BackgroundTransparency"] = v203:GetAttribute("SaveTransparency")
							}):Play()
						elseif v203:IsA("ImageLabel") and v203:GetAttribute("ImageTransparency") then
							v_u_10:Create(v203, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["ImageTransparency"] = v203:GetAttribute("ImageTransparency")
							}):Play()
						elseif v203:IsA("UIStroke") and v203:GetAttribute("SavedStroke") then
							v_u_10:Create(v203, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
								["Transparency"] = v203:GetAttribute("SavedStroke")
							}):Play()
						end
					end
				end
				task.wait(3)
				if v202 == v_u_200 then
					v_u_10:Create(v_u_36.StaminaVal, TweenInfo.new(6, Enum.EasingStyle.Quad), {
						["Value"] = v_u_1:GetAttribute("IsHunter") and 150 or 100
					}):Play()
					if v_u_1:FindFirstChild("PlayerGui"):FindFirstChild("ImpactFrames"):FindFirstChild("StaminaBar") then
						v_u_10:Create(v_u_1:FindFirstChild("PlayerGui"):FindFirstChild("ImpactFrames"):FindFirstChild("StaminaBar"):FindFirstChild("ShowingWhatsNeeded"), TweenInfo.new(7, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
							["BackgroundTransparency"] = 1
						}):Play()
					end
					if v_u_1:FindFirstChild("PlayerGui"):FindFirstChild("ImpactFrames"):FindFirstChild("StaminaBar") then
						v_u_199 = false
						for _, v204 in pairs(v_u_1:FindFirstChild("PlayerGui"):FindFirstChild("ImpactFrames"):FindFirstChild("StaminaBar"):GetDescendants()) do
							if v204:IsA("Frame") and v204:GetAttribute("SaveTransparency") then
								v_u_10:Create(v204, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									["BackgroundTransparency"] = 1
								}):Play()
							elseif v204:IsA("ImageLabel") and v204:GetAttribute("ImageTransparency") then
								v_u_10:Create(v204, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									["ImageTransparency"] = 1
								}):Play()
							elseif v204:IsA("UIStroke") and v204:GetAttribute("SavedStroke") then
								v_u_10:Create(v204, TweenInfo.new(0.75, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {
									["Transparency"] = 1
								}):Play()
							end
						end
					end
				end
			end)
		end
		if not (v_u_36.IsStunned or v_u_36.Running) then
			v_u_3.WalkSpeed = (v_u_45 + v_u_47) * v_u_18.Value
		end
	end
	if p_u_197:GetAttribute("IsGunModel") then
		local v_u_205 = {}
		for _, v206 in pairs(p_u_197:GetDescendants()) do
			if v206:IsA("BasePart") then
				table.insert(v_u_205, v206)
			end
		end
		for _, v207 in pairs(v_u_2:GetChildren()) do
			if v207:IsA("BasePart") and (table.find(v_u_29, v207.Name) and (v207.Name ~= "HumanoidRootPart" and v207.Name ~= "Head")) then
				table.insert(v_u_205, v207)
			end
		end
		local v_u_208 = tick()
		local v_u_209 = 0
		local v_u_210 = nil
		v_u_210 = v_u_11.RenderStepped:Connect(function()
			-- upvalues: (copy) p_u_197, (ref) v_u_2, (ref) v_u_32, (ref) v_u_209, (ref) v_u_205, (copy) v_u_208, (ref) v_u_10, (ref) v_u_210
			if p_u_197 and (p_u_197.Parent and (v_u_2 and (v_u_2.Parent and (p_u_197.Parent == v_u_2 and (not v_u_32 and v_u_209 <= 30))))) then
				local v211 = nil
				for _, v212 in pairs(v_u_205) do
					if v212 and v212.Parent then
						v211 = v212.Name == "FireFrom" and true or v211
						if tick() - v_u_208 <= 1 then
							local v213 = v_u_10:Create(v212, TweenInfo.new(0.01, Enum.EasingStyle.Linear), {
								["LocalTransparencyModifier"] = 0
							})
							v213:Play()
							v213:Destroy()
						else
							v212.LocalTransparencyModifier = 0
						end
					end
				end
				if not v211 then
					v_u_209 = v_u_209 + 1
					for _, v214 in pairs(v_u_2:GetChildren()) do
						if v214:GetAttribute("IsGunModel") then
							for _, v215 in pairs(v214:GetDescendants()) do
								if v215:IsA("BasePart") then
									local v216 = v_u_205
									table.insert(v216, v215)
								end
							end
						end
					end
					return
				end
				v_u_209 = v_u_209 - 1
				if v_u_209 < 0 then
					v_u_209 = 0
					return
				end
			else
				v_u_210:Disconnect()
				table.clear(v_u_205)
				v_u_205 = nil
			end
		end)
	end
	if p_u_197.ClassName == "Tool" and p_u_197:GetAttribute("DisableHeadLookAt") then
		v_u_15.UpdateTBLForVariables("DisableHeadLookAt", true)
	end
	if not v_u_16.CheckIfStunnedChild(p_u_197) then
		if p_u_197.ClassName == "Tool" then
			v_u_36.ToolInChar = p_u_197
			if table.find(v_u_28, p_u_197.Name) and not p_u_197:GetAttribute("CantEquipOnClient") then
				if p_u_197:GetAttribute("ExtraWeapon") then
					v_u_16.EquipAnimation(v_u_2, nil, p_u_197:GetAttribute("ExtraWeapon"), true)
					if p_u_197:GetAttribute("ExtraWeaponUnEquipAfter") then
						task.delay(p_u_197:GetAttribute("ExtraWeaponUnEquipAfter"), function()
							-- upvalues: (copy) p_u_197, (ref) v_u_2, (ref) v_u_16
							if p_u_197 and (p_u_197.Parent and p_u_197.Parent == v_u_2) then
								v_u_16.UnEquippedWeapon(v_u_2, nil, p_u_197:GetAttribute("ExtraWeapon"), true)
							end
						end)
					end
				end
				v_u_16.EquipAnimation(v_u_2, nil, p_u_197.Name)
			end
		end
		local _ = p_u_197.Name == "PlayingJumpRope"
		if table.find(v_u_37, p_u_197.Name) then
			if not v_u_36[p_u_197.Name] then
				v_u_36[p_u_197.Name] = true
			end
			if p_u_197.Name == "InjuredWalking" then
				if v_u_36.MoveAnimCustom then
					v_u_36.MoveAnimCustom:Stop()
				end
				if v_u_36.NumberChangedSpeed then
					v_u_36.NumberChangedSpeed:Destroy()
				end
				local v_u_217 = Instance.new("NumberValue")
				v_u_217.Value = 0
				v_u_217.Parent = v_u_2
				local v218 = v_u_17:LoadAnimation(v_u_13.Hurt.InjuredLegWalk)
				v218:Play()
				v218:AdjustSpeed(v_u_217.Value)
				v_u_36.MoveAnimCustom = v218
				v_u_36.NumberChangedSpeed = v_u_217
				local v_u_219 = nil
				v_u_219 = v_u_217.Changed:Connect(function(p220)
					-- upvalues: (ref) v_u_36, (copy) v_u_217, (ref) v_u_219
					if v_u_36.NumberChangedSpeed and (v_u_36.NumberChangedSpeed.Parent and (v_u_217 and (v_u_217.Parent and (v_u_217.Parent.Parent and v_u_36.MoveAnimCustom)))) then
						v_u_36.MoveAnimCustom:AdjustSpeed(p220)
					else
						v_u_219:Disconnect()
					end
				end)
				return
			elseif p_u_197.Name == "RotateDisabled" then
				v_u_3.AutoRotate = false
			elseif p_u_197.Name == "Anchor" then
				if not v_u_4.Anchored then
					v_u_4.Anchored = true
					return
				end
			elseif p_u_197.Name == "DisableHeadLookAt" then
				v_u_15.UpdateTBLForVariables("DisableHeadLookAt", true)
			end
		elseif p_u_197.Name == "NewCollision" then
			if p_u_197.ClassName == "StringValue" then
				v_u_16.ChangeCollisionGBLONLY(v_u_2, p_u_197.Value)
			else
				v_u_16.ChangeCollisionGBLONLY(v_u_2, "NoCollision")
			end
		elseif p_u_197:GetAttribute("NEWUIDISPLAY") then
			v_u_15.DisplayNewUICD(p_u_197)
			return
		elseif p_u_197:GetAttribute("CD") then
			v_u_15.HandleCD(p_u_197)
			return
		elseif p_u_197.Name == "Ragdoll" then
			if not v_u_36.Ragdolled then
				v_u_36.Ragdolled = true
				v_u_36.InAir = nil
				shared.InAir = nil
				v_u_40:SetRagdollStatesClient(v_u_2, v_u_4, v_u_5, v_u_3)
			end
		elseif p_u_197.Name == "IsWallyWest" then
			if not v_u_12.Animations.Quicksilver:GetAttribute("PRELOADED") then
				v_u_12.Animations.Quicksilver:SetAttribute("PRELOADED", true)
				local v221 = {}
				for _, v222 in v_u_12.Animations.Quicksilver:GetChildren() do
					if v222:IsA("Animation") then
						local v223 = v222.AnimationId
						table.insert(v221, v223)
					end
				end
				task.spawn(v_u_25.PreloadAnim, {
					["TblOfAnims"] = v221
				})
				local v224 = task.spawn
				local v225 = v_u_25.PreloadSounds
				local v226 = {}
				local v227 = {}
				local v228 = v_u_190
				__set_list(v227, 1, {table.unpack(v228), "rbxassetid://108794431713541"})
				v226.SoundIds = v227
				v224(v225, v226)
			end
			v_u_36.RunningAnimCustom = v_u_12.Animations.Quicksilver.Run1
		end
	end
	v_u_36.IsStunned = true
	if not p_u_197:GetAttribute("DoesntInterruptCrouching") then
		v_u_127()
	end
	if p_u_197:GetAttribute("CanRunDuringStun") then
		v_u_36.CanRunDuringStun = p_u_197:GetAttribute("CanRunDuringStun")
		if v_u_36.Running then
			v_u_64()
		end
	end
	if p_u_197.Name == "Stun" then
		v_u_183(p_u_197)
	end
	if not p_u_197:GetAttribute("CanRunDuringStun") then
		v_u_34 = tick()
		v_u_123()
	end
	if p_u_197.Name == "Stun" then
		local v229 = 99999
		for _, v230 in pairs(v_u_2:GetChildren()) do
			if v230.Name == "Stun" and (v230:GetAttribute("JumpPower") and v230:GetAttribute("JumpPower") < v229) then
				v229 = v230:GetAttribute("JumpPower")
			elseif v230.Name == "Stun" and not v230:GetAttribute("JumpPower") then
				v229 = nil
				break
			end
		end
		if v229 and v229 <= 1000 then
			v_u_3.JumpPower = v229
		end
	end
end
v_u_4:GetPropertyChangedSignal("Velocity"):Connect(function()
	-- upvalues: (copy) v_u_4
	local v_u_232 = v_u_4
	if v_u_232.Velocity.Magnitude > 10000 then
		pcall(function()
			-- upvalues: (ref) v_u_4
			task.spawn(function()
				-- upvalues: (ref) v_u_4
				v_u_4.AssemblyLinearVelocity = Vector3.new(0, 0, 0)
			end)
		end)
		pcall(function()
			-- upvalues: (copy) v_u_232
			task.spawn(function()
				-- upvalues: (ref) v_u_232
				v_u_232.Velocity = Vector3.new(0, 0, 0)
			end)
		end)
		pcall(function()
			-- upvalues: (ref) v_u_4
			task.spawn(function()
				-- upvalues: (ref) v_u_4
				v_u_4.Anchored = true
				local v233 = workspace.Effects.SpawnLocation.Position + Vector3.new(0, 5, 0)
				for _ = 1, 50 do
					task.wait()
					v_u_4.CFrame = CFrame.new(v233)
				end
				v_u_4.Anchored = false
			end)
		end)
	end
end)
local function v_u_235()
	-- upvalues: (copy) v_u_2
	for _, v234 in pairs(v_u_2:GetChildren()) do
		if v234.Name == "Stun" and not v234:GetAttribute("CanRunDuringStun") then
			return true
		end
	end
end
local v_u_236 = 0
local v_u_237 = 0
local function v247(p238)
	-- upvalues: (copy) v_u_26, (ref) v_u_236, (copy) v_u_27, (copy) v_u_2, (copy) v_u_18, (ref) v_u_237
	if p238 and v_u_26.Value then
		if v_u_236 <= 1 then
			v_u_236 = v_u_236 + 0.3
		else
			v_u_236 = v_u_236 + 0.75
		end
		local v239 = v_u_27
		v239.Value = v239.Value - v_u_236 * 0.5
		local v_u_240 = v_u_236
		local v_u_241 = false
		local v_u_242 = nil
		v_u_242 = v_u_2.ChildAdded:Connect(function(p243)
			-- upvalues: (ref) v_u_242, (ref) v_u_241
			if p243.Name == "AlreadyDoneJump" then
				v_u_242:Disconnect()
				v_u_241 = true
			end
		end)
		task.delay(2.85, function()
			-- upvalues: (ref) v_u_242, (ref) v_u_2, (ref) v_u_236, (copy) v_u_240, (ref) v_u_241, (ref) v_u_27, (ref) v_u_18, (ref) v_u_237
			if v_u_242 then
				v_u_242:Disconnect()
			end
			local v244 = false
			for _, v245 in pairs(v_u_2:GetChildren()) do
				if v245.Name == "Stun" and v245:GetAttribute("Action") then
					v244 = true
					break
				end
			end
			if v_u_236 == v_u_240 and not v_u_241 then
				if not v244 then
					v_u_27.Value = shared.BaseJumpPower * v_u_18.Value
				end
				v_u_237 = 0
				v_u_236 = 0
				local v246 = Instance.new("Folder")
				v246.Name = "AlreadyDoneJump"
				v246.Parent = v_u_2
				shared.AddDebris(v246, 0.1)
			end
		end)
	end
end
v_u_3.Jumping:Connect(v247)
v_u_15.GiveConnection(SteppedCon, v38, function(_)
	-- upvalues: (ref) v_u_32, (copy) v_u_36, (copy) v_u_3, (copy) v_u_18, (copy) v_u_10, (copy) v_u_235, (copy) v_u_4, (copy) v_u_123, (copy) v_u_1, (ref) v_u_34, (copy) v_u_97
	if not v_u_32 then
		local v248 = v_u_36.MoveAnimCustom
		local v249
		if v248 then
			v249 = v_u_36.NumberChangedSpeed
		else
			v249 = v248
		end
		if v_u_3.MoveDirection.Magnitude > 0 and not v_u_32 then
			if v248 and (v249 and v249.Value < v_u_18.Value - 0.015) then
				local v250 = v_u_10:Create(v249, TweenInfo.new(0.5, Enum.EasingStyle.Quad), {
					["Value"] = v_u_18.Value
				})
				v250:Play()
				v250:Destroy()
			end
			local v251 = v_u_36.IsStunned
			if v251 and not v_u_235() then
				v251 = nil
			end
			local v252 = v_u_4.CFrame.LookVector
			local v253 = v_u_3.MoveDirection.X
			local v254 = v_u_3.MoveDirection.Z
			local v255 = Vector3.new(v253, 0, v254)
			local v256 = v255.Magnitude > 0 and v252:Dot(v255.Unit)
			if v256 then
				v256 = v252:Dot(v255.Unit) < -0.5
			end
			if v256 and (v_u_36.Running and shared.InShiftLock) then
				v_u_123(true, true)
			end
			local v257 = v_u_1:FindFirstChild("AutoRun")
			if not (v_u_36.Running or v251) and (v257 and v257.Value or v_u_36.ShiftPressed) and (not v_u_36.CantRun and (not v256 and tick() - v_u_34 >= 0.1)) then
				v_u_97()
				return
			end
		else
			if v248 and (v249 and v249.Value > 0.01) then
				local v258 = v_u_10:Create(v249, TweenInfo.new(0.35, Enum.EasingStyle.Quad), {
					["Value"] = 0
				})
				v258:Play()
				v258:Destroy()
			end
			v_u_123(nil, true)
		end
	end
end)
v_u_2.ChildAdded:Connect(v231)
v_u_2.ChildRemoved:Connect(function(p259)
	-- upvalues: (copy) v_u_13, (copy) v_u_36, (copy) v_u_2, (copy) v_u_7, (copy) v_u_33, (copy) v_u_123, (ref) v_u_45, (ref) v_u_46, (copy) v_u_3, (copy) v_u_47, (copy) v_u_18, (copy) v_u_15, (copy) v_u_16, (copy) v_u_64, (copy) v_u_178, (copy) v_u_189, (copy) v_u_170, (copy) v_u_28, (copy) v_u_40, (copy) v_u_4, (copy) v_u_27, (copy) v_u_37
	if p259:GetAttribute("Gun") and v_u_13:FindFirstChild("Run" .. p259.Name) then
		v_u_36.RunningAnimCustom = nil
		if v_u_13:FindFirstChild("Walk" .. p259.Name) then
			v_u_2:FindFirstChild("Animate"):FindFirstChild("walk"):FindFirstChild("WalkAnim").AnimationId = v_u_13:FindFirstChild("Walk").AnimationId
		end
		local v260 = v_u_7:FindFirstChild("ConsoleSupport"):FindFirstChild("GamepadControlsGui")
		local v261 = false
		for _, v262 in pairs(v_u_2:GetChildren()) do
			if v262:GetAttribute("Gun") and v262 ~= p259 then
				v261 = v262
				break
			end
		end
		if v260 and not v261 then
			v260:FindFirstChild("Reload").Visible = false
		end
		if v_u_33 and not v_u_2:FindFirstChild("Dead") then
			v_u_7:FindFirstChild("MobileSupport"):FindFirstChild("ReloadButton").Visible = false
			v_u_7:FindFirstChild("MobileSupport"):FindFirstChild("ShootButton").Visible = false
			v_u_7:FindFirstChild("MobileSupport"):FindFirstChild("ZoomInButton").Visible = false
		end
		if v_u_36.Running and v_u_36.Running.IsPlaying then
			v_u_123(true)
		end
	elseif p259.ClassName == "Tool" and v_u_13:FindFirstChild("Walk" .. p259.Name) then
		v_u_2:FindFirstChild("Animate"):FindFirstChild("walk"):FindFirstChild("WalkAnim").AnimationId = v_u_13:FindFirstChild("Walk").AnimationId
		if v_u_13:FindFirstChild("Idle" .. p259.Name) then
			v_u_2:FindFirstChild("Animate"):FindFirstChild("idle"):FindFirstChild("Animation1").AnimationId = v_u_13:FindFirstChild("Idle").AnimationId
		end
		if v_u_13:FindFirstChild("Run" .. p259.Name) then
			v_u_36.RunningAnimCustom = nil
			if v_u_36.Running and v_u_36.Running.IsPlaying then
				v_u_123(true)
			end
		end
	elseif p259.ClassName == "Tool" and v_u_13:FindFirstChild("Run" .. p259.Name) then
		v_u_36.RunningAnimCustom = nil
		if v_u_36.Running and v_u_36.Running.IsPlaying then
			v_u_123(true)
		end
	end
	if p259.Name == "NewBaseWalkSpeed" then
		v_u_45 = 14
		v_u_46 = 28
		if not (v_u_36.IsStunned or v_u_36.Running) then
			v_u_3.WalkSpeed = (v_u_45 + v_u_47) * v_u_18.Value
		end
		if v_u_36.StaminaVal then
			v_u_36.StaminaVal:Destroy()
		end
	end
	if p259.ClassName == "Tool" and (p259:GetAttribute("DisableHeadLookAt") and not (v_u_36.DisableHeadLookAtExists or v_u_36.DisableHeadLookAt)) then
		v_u_15.UpdateTBLForVariables("DisableHeadLookAt", nil)
	end
	if v_u_16.CheckIfStunnedChild(p259) then
		if p259.Name == "Stun" and p259:GetAttribute("DisableHeadLookAt") then
			local v263 = false
			for _, v264 in pairs(v_u_2:GetChildren()) do
				if v264.Name == "Stun" and v264:GetAttribute("DisableHeadLookAt") then
					v263 = true
				end
			end
			if not v263 then
				v_u_36.DisableHeadLookAtExists = nil
			end
		end
		if p259:GetAttribute("CanRunDuringStun") then
			v_u_36.CanRunDuringStun = nil
			if v_u_36.Running then
				v_u_64()
			end
		end
		v_u_178(p259)
		if v_u_16.CheckIfStunned(v_u_2, {
			["mainlocal"] = true
		}) then
			if not v_u_2:FindFirstChild("Stun") then
				v_u_189()
			end
		else
			v_u_36.IsStunned = nil
			v_u_189()
		end
		if p259.Name == "Stun" and v_u_2:FindFirstChild("Stun") then
			local v265 = 99999
			for _, v266 in pairs(v_u_2:GetChildren()) do
				if v266.Name == "Stun" and (v266:GetAttribute("JumpPower") and v266:GetAttribute("JumpPower") < v265) then
					v265 = v266:GetAttribute("JumpPower")
				elseif v266.Name == "Stun" and not v266:GetAttribute("JumpPower") then
					v265 = nil
					break
				end
			end
			if v265 and v265 <= 1000 then
				v_u_3.JumpPower = v265
			end
		end
	else
		if p259.Name == "HumanoidRootPart" or (p259.Name == "Head" or p259.Name == "Torso") then
			v_u_170()
			return
		end
		if p259.ClassName == "Tool" then
			if table.find(v_u_28, p259.Name) then
				v_u_16.UnEquippedWeapon(v_u_2, nil, p259.Name)
				if p259:GetAttribute("ExtraWeapon") then
					v_u_16.UnEquippedWeapon(v_u_2, nil, p259:GetAttribute("ExtraWeapon"), true)
				end
			end
			if v_u_36.ToolInChar and v_u_36.ToolInChar == p259 then
				v_u_36.ToolInChar = nil
			end
		end
		if p259.Name == "Ragdoll" then
			if not v_u_2:FindFirstChild("Ragdoll") then
				v_u_36.Ragdolled = nil
				v_u_40:UnragdollStatesClient(v_u_2, v_u_3, v_u_4)
				v_u_3:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
				local v267 = v_u_3
				local v268 = v_u_27.Value
				v267.JumpPower = math.max(v268, 0)
			end
			return
		end
		if p259.Name == "NewCollision" then
			if not v_u_2:FindFirstChild("NewCollision") then
				v_u_16.ChangeCollisionGBLONLY(v_u_2, "Players")
			end
			return
		end
		if not table.find(v_u_37, p259.Name) then
			return
		end
		if v_u_36[p259.Name] then
			local v269 = nil
			for _, v270 in pairs(v_u_2:GetChildren()) do
				if v270.Name == p259.Name then
					v269 = true
					break
				end
			end
			if not v269 then
				v_u_36[p259.Name] = nil
				if p259.Name == "InjuredWalking" then
					if v_u_36.MoveAnimCustom then
						v_u_36.MoveAnimCustom:Stop()
					end
					if v_u_36.NumberChangedSpeed then
						v_u_36.NumberChangedSpeed:Destroy()
					end
					v_u_3:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
					local v271 = v_u_3
					local v272 = v_u_27.Value
					v271.JumpPower = math.max(v272, 0)
					return
				end
				if p259.Name == "RotateDisabled" then
					v_u_3.AutoRotate = true
					return
				end
				if p259.Name == "Anchor" then
					if v_u_4.Anchored then
						v_u_4.Anchored = false
						return
					end
				elseif p259.Name == "DisableHeadLookAt" then
					local v273 = false
					for _, v274 in pairs(v_u_2:GetChildren()) do
						if v274.ClassName == "Tool" and v274:GetAttribute("DisableHeadLookAt") then
							v273 = true
							break
						end
					end
					if not (v_u_36.DisableHeadLookAtExists or (v_u_2:FindFirstChild("DisableHeadLookAt") or v273)) then
						v_u_15.UpdateTBLForVariables("DisableHeadLookAt", nil)
					end
				end
			end
		end
	end
end)
for _, v275 in pairs(v_u_2:GetChildren()) do
	v231(v275)
end
if v_u_1:WaitForChild("Boosts", 555) then
	if not v_u_1:FindFirstChild("Boosts"):FindFirstChild("Faster Sprint") then
		repeat
			task.wait(0.1)
		until v_u_1:FindFirstChild("Boosts"):FindFirstChild("Faster Sprint")
	end
	for _, v_u_276 in pairs(v_u_1:FindFirstChild("Boosts"):GetChildren()) do
		v_u_276.Changed:Connect(function(_)
			-- upvalues: (copy) v_u_54, (copy) v_u_276
			v_u_54(v_u_276)
		end)
		v_u_54(v_u_276, true)
	end
end
local function v_u_280()
	-- upvalues: (copy) v_u_1, (copy) v_u_49, (copy) v_u_9, (copy) v_u_7
	local v277 = v_u_1:GetAttribute("_EquippedPower")
	if v277 then
		if v277 == "PHANTOM STEP" then
			v_u_49()
			return
		end
		local v278 = v_u_1:FindFirstChild("Boosts")
		if v278 then
			v278 = v_u_1:FindFirstChild("Boosts"):FindFirstChild("Damage Boost")
		end
		if not v278 or v278 and v278.Value < 5 then
			if v_u_9.TouchEnabled then
				v_u_1.PlayerGui.MobileSupport.RollButton.Visible = false
				return
			end
			local v279 = v_u_7:FindFirstChild("ConsoleSupport"):FindFirstChild("GamepadControlsGui")
			if v279 and v279:FindFirstChild("Dash") then
				v279:FindFirstChild("Dash").Visible = false
			end
		end
	end
end
if v_u_1:GetAttribute("_EquippedPower") then
	v_u_280()
end
v_u_1:GetAttributeChangedSignal("_EquippedPower"):Connect(function()
	-- upvalues: (copy) v_u_280
	v_u_280()
end)
task.delay(3, function()
	-- upvalues: (copy) v_u_1, (copy) v_u_54
	for _, v281 in pairs(v_u_1:FindFirstChild("Boosts"):GetChildren()) do
		v_u_54(v281, true)
	end
end)
task.delay(5, function()
	game:GetService("ContextActionService"):UnbindAction("JumpRopeStruggle")
end)
