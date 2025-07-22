-- Decompiled by Krnl

local v_u_1 = game:GetService("TweenService")
local v_u_2 = game:GetService("ReplicatedStorage")
v_u_2:FindFirstChild("Remotes")
local v3 = game:GetService("Players")
v_u_2:FindFirstChild("Effects"):FindFirstChild("Particles")
game:GetService("Lighting")
local v_u_4 = game:GetService("RunService")
game:GetService("SoundService")
local v_u_5 = game:GetService("UserInputService")
game:GetService("GuiService")
game:GetService("GamepadService")
Random.new()
local v_u_6 = v3.LocalPlayer
v_u_6:WaitForChild("DebrisBD")
local _ = game:GetService("Players").LocalPlayer
return function(p7, p_u_8)
	-- upvalues: (copy) v_u_6, (copy) v_u_2, (copy) v_u_4, (copy) v_u_1, (copy) v_u_5
	local v_u_9 = workspace.CurrentCamera
	local v_u_10 = v_u_6.Character
	if v_u_10 then
		local v_u_11 = v_u_10:FindFirstChild("HumanoidRootPart")
		local v_u_12 = require(v_u_2.Modules.SharedFunctions)
		local v_u_13 = require(v_u_2.Modules.Effects)
		local v_u_14 = require(v_u_2.Modules.VelocityFunctions)
		local v_u_15 = p7.NewRem
		local v_u_16 = {}
		local v_u_17 = {}
		local v_u_18 = false
		local function v_u_21()
			-- upvalues: (ref) v_u_18, (copy) v_u_16, (copy) v_u_17
			v_u_18 = true
			for _, v19 in pairs(v_u_16) do
				if v19 then
					v19:Disconnect()
				end
			end
			for _, v20 in pairs(v_u_17) do
				if v20 then
					v20:Destroy()
				end
			end
		end
		local v_u_22 = false
		local function v_u_23()
			-- upvalues: (ref) v_u_22, (ref) v_u_18, (copy) v_u_12, (copy) v_u_10, (copy) v_u_11, (copy) p_u_8, (copy) v_u_13, (copy) v_u_15, (copy) v_u_21
			if not v_u_22 then
				v_u_22 = true
				v_u_18 = true
				v_u_12.CreateFolder(v_u_10, "Ragdoll", 5)
				v_u_12.PlaySound(v_u_11, "rbxassetid://105500507301442", 0.4, {
					["PlayInWorkspaceONCLIENT"] = true
				})
				task.spawn(function()
					-- upvalues: (ref) p_u_8
					p_u_8.CamLOOKAT({
						["MaxWait"] = 2.15,
						["StartAbove"] = true
					})
				end)
				task.delay(1.6, function()
					-- upvalues: (ref) v_u_13
					v_u_13.ScreenHighlight({
						["Color"] = Color3.fromRGB(255, 0, 0),
						["TweenTimeBack"] = 3.5
					})
				end)
				task.delay(1.6, function()
					-- upvalues: (ref) v_u_13
					v_u_13.ScreenHighlight({
						["Color"] = Color3.fromRGB(255, 0, 0),
						["TweenTimeBack"] = 3.5
					})
				end)
				task.spawn(function()
					-- upvalues: (ref) v_u_13
					v_u_13.FovOut({
						["FOV"] = 120,
						["TweenTime1"] = 1.6
					})
				end)
				task.delay(1.6, function()
					-- upvalues: (ref) v_u_13
					v_u_13.FovOut({
						["FOV"] = 60
					})
				end)
				task.delay(1.6, function()
					-- upvalues: (ref) p_u_8
					p_u_8.MauioShake({
						["Length"] = 0.45,
						["Intensity"] = 4,
						["TweenSpeed"] = 0.075,
						["AxisMultipliers"] = Vector3.new(1, 1.5, 1),
						["FadeStyle"] = "inQuad",
						["PositionStyle"] = "inCubic",
						["TSFalloffPercent"] = 0.4,
						["EndIntensity"] = 0
					})
				end)
				v_u_15:FireServer({
					["FallingPlayer"] = true
				})
				v_u_21()
			end
		end
		local v_u_24 = workspace:FindFirstChild("JumpRope"):FindFirstChild("FallColllisionYClient")
		local v25 = v_u_4.RenderStepped:Connect(function()
			-- upvalues: (copy) v_u_11, (copy) v_u_10, (copy) v_u_24, (ref) v_u_6, (copy) v_u_23, (copy) v_u_21
			if v_u_11 and (v_u_10 and (v_u_10.Parent and v_u_11.Parent)) then
				if v_u_11.Position.Y <= v_u_24.Position.Y and not v_u_6:FindFirstChild("RecentSpawn") then
					v_u_23()
					return
				end
			else
				v_u_21()
			end
		end)
		local v27 = v_u_10.ChildRemoved:Connect(function(p26)
			-- upvalues: (copy) v_u_21
			if p26.Name == "PlayingJumpRope" then
				v_u_21()
			end
		end)
		task.spawn(function()
			-- upvalues: (copy) v_u_13
			local v28 = {
				"rbxassetid://82620424175239",
				"rbxassetid://101797422168650",
				"rbxassetid://92109634903185",
				"rbxassetid://86628572132354",
				"rbxassetid://102188123916535",
				"rbxassetid://85191886269218",
				"rbxassetid://107785926946806",
				"rbxassetid://92002804457650",
				"rbxassetid://120603590083204",
				"rbxassetid://94329481278435"
			}
			local v29 = { "rbxassetid://87357224313284", "rbxassetid://94328971188069" }
			for _, v30 in script:GetDescendants() do
				if v30:IsA("ImageLabel") then
					local v31 = v30.Image
					table.insert(v28, v31)
				end
			end
			task.spawn(v_u_13.PrepFrame, {
				["ImageTable"] = v28
			})
			task.spawn(v_u_13.PreloadSounds, {
				["SoundIds"] = v29
			})
		end)
		local v_u_32 = {}
		local v_u_33 = v_u_10.Humanoid
		local function v_u_98()
			-- upvalues: (copy) v_u_12, (copy) v_u_11, (copy) v_u_32, (copy) v_u_10, (ref) v_u_2, (ref) v_u_1, (ref) v_u_6, (ref) v_u_5, (copy) v_u_15, (copy) v_u_14, (copy) v_u_33, (copy) v_u_13, (copy) v_u_9, (ref) v_u_4, (ref) v_u_18
			v_u_12.PlaySound(v_u_11, "rbxassetid://87357224313284", 0.4, {
				["PlayInWorkspaceONCLIENT"] = true
			})
			v_u_12.PlaySound(v_u_11, "rbxassetid://93242704110333", 0.35, {
				["PlayInWorkspaceONCLIENT"] = true
			})
			for _, v34 in v_u_32 do
				if typeof(v34) == "RBXScriptConnection" then
					v34:Disconnect()
				elseif typeof(v34) == "function" then
					task.spawn(v34)
				else
					v34:Destroy()
				end
			end
			table.clear(v_u_32)
			local v_u_35 = v_u_12.CreateFolder(v_u_10, "Stun", 20, {
				["Attributes"] = {
					["Speed"] = 0
				}
			})
			local v_u_36 = Random.new():NextInteger(1, 2) == 1
			local v_u_37 = v_u_36 and 1 or -1
			local v38 = ({ v_u_2.Animations.JumpRope:FindFirstChild("AboutToFall" .. (v_u_36 and "Right" or "Left") .. "1"), v_u_2.Animations.JumpRope:FindFirstChild("AboutToFall" .. (v_u_36 and "Right" or "Left") .. "2") })[Random.new():NextInteger(1, 2)]
			local v_u_39 = v_u_10.Humanoid:LoadAnimation(v38)
			v_u_39:Play(1.25, nil, 1.75)
			local v_u_40 = Instance.new("NumberValue")
			local v_u_41 = script.Main:Clone()
			local v_u_42 = script.Arrows:Clone()
			v_u_40:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: (copy) v_u_40, (ref) v_u_1, (copy) v_u_41
				local v43 = v_u_40.Value + 100
				local v44 = math.clamp(v43, 0, 200) / 200
				local v45 = TweenInfo.new(0.15, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
				v_u_1:Create(v_u_41.Indicator, v45, {
					["Position"] = UDim2.new(v44, 0, 0.5, 0)
				}):Play()
			end)
			v_u_40.Value = v_u_37 * 30
			local v46 = v_u_32
			local function v48()
				-- upvalues: (copy) v_u_42, (ref) v_u_1
				for _, v47 in v_u_42:GetChildren() do
					if v47:IsA("ImageLabel") then
						v_u_1:Create(v47, TweenInfo.new(0.325, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["ImageTransparency"] = 1
						}):Play()
					end
				end
				shared.AddDebris(v_u_42, 0.325)
				v_u_42:Destroy()
			end
			table.insert(v46, v48)
			local v49 = {}
			local v_u_50 = not v_u_36
			for _, v51 in v_u_42:GetDescendants() do
				if v51:IsA("ImageLabel") then
					if v_u_36 then
						v51.Image = "rbxassetid://92109634903185"
					else
						v51.Image = "rbxassetid://86628572132354"
					end
					v51.ImageColor3 = Color3.fromRGB(255, 255, 255)
					v51.ImageTransparency = 1
					table.insert(v49, v51)
				end
			end
			for _, v52 in v49 do
				v_u_1:Create(v52, TweenInfo.new(0.125, Enum.EasingStyle.Exponential, Enum.EasingDirection.Out), {
					["ImageTransparency"] = 0
				}):Play()
			end
			v_u_42.Position = v_u_36 and UDim2.new(0.45, 0, 0.1, 0) or UDim2.new(0.55, 0, 0.1, 0)
			v_u_1:Create(v_u_42, TweenInfo.new(0.325, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, -1, true), {
				["Position"] = v_u_36 and UDim2.new(0.55, 0, 0.1, 0) or UDim2.new(0.45, 0, 0.1, 0)
			}):Play()
			v_u_42.Parent = v_u_6.PlayerGui.ImpactFrames
			local v53 = Color3.fromRGB(255, 255, 255)
			local v54 = ({
				["Mobile"] = {
					["Left"] = {
						["Button"] = "rbxassetid://102188123916535",
						["Text"] = "TAP ON THE <b>RIGHT</b> OF THE SCREEN!!"
					},
					["Right"] = {
						["Button"] = "rbxassetid://85191886269218",
						["Text"] = "TAP ON THE <b>LEFT</b> OF THE SCREEN!!"
					},
					["CorrectColor"] = Color3.fromRGB(65, 65, 65)
				},
				["Console"] = {
					["Left"] = {
						["Button"] = "rbxassetid://107785926946806",
						["Text"] = "PRESS <b>X</b>!!"
					},
					["Right"] = {
						["Button"] = "rbxassetid://92002804457650",
						["Text"] = "PRESS <b>B</b>!!"
					}
				},
				["PC"] = {
					["Left"] = {
						["Button"] = "rbxassetid://120603590083204",
						["Text"] = "PRESS <b>D</b>!!"
					},
					["Right"] = {
						["Button"] = "rbxassetid://94329481278435",
						["Text"] = "PRESS <b>A</b>!!"
					}
				}
			})[v_u_5.TouchEnabled and "Mobile" or (v_u_5.GamepadEnabled and "Console" or "PC")][v_u_36 and "Right" or "Left"]
			local _ = v54.Button
			local v55 = v54.Text
			v_u_41.Frame.Main.ImageColor3 = v53
			v_u_41.WarningLabel.Text = v55
			v_u_41.WarningLabel.TextLabelShadow.Text = v_u_41.WarningLabel.Text
			local v56 = {}
			for _, v57 in v_u_41:GetDescendants() do
				if v57:IsA("ImageLabel") then
					v57.ImageTransparency = 1
					table.insert(v56, v57)
				end
			end
			local v58 = v_u_32
			local function v62()
				-- upvalues: (copy) v_u_41, (ref) v_u_1
				local v59 = {}
				local v60 = v_u_41
				__set_list(v59, 1, {v_u_41, table.unpack(v60:GetDescendants())})
				for _, v61 in v59 do
					if v61:IsA("ImageLabel") then
						v_u_1:Create(v61, TweenInfo.new(0.325, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
							["ImageTransparency"] = 1
						}):Play()
					end
				end
				shared.AddDebris(v_u_41, 0.325)
			end
			table.insert(v58, v62)
			v_u_41.Parent = v_u_6.PlayerGui.ImpactFrames
			for _, v63 in v56 do
				v_u_1:Create(v63, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
					["ImageTransparency"] = 0
				}):Play()
			end
			local v64 = v_u_32
			table.insert(v64, v_u_40)
			local v_u_65 = 0
			local function v76(_, p66, p67)
				-- upvalues: (ref) v_u_12, (ref) v_u_11, (copy) v_u_36, (copy) v_u_50, (copy) v_u_41, (ref) v_u_1, (ref) v_u_10, (ref) v_u_65, (ref) v_u_6, (copy) v_u_40
				if p66 == Enum.UserInputState.Begin then
					local function v72(p68)
						-- upvalues: (ref) v_u_12, (ref) v_u_11, (ref) v_u_36, (ref) v_u_50, (ref) v_u_41, (ref) v_u_1, (ref) v_u_10, (ref) v_u_65, (ref) v_u_6, (ref) v_u_40
						v_u_12.PlaySound(v_u_11, "rbxassetid://94328971188069", 0.35, {
							["PlayInWorkspaceONCLIENT"] = true
						})
						local v_u_69
						if v_u_36 then
							v_u_69 = p68 > 0 and 70 or -30
						else
							v_u_69 = v_u_50 and (p68 < 0 and -70 or 30) or p68
						end
						if v_u_69 < 0 and v_u_36 then
							v_u_41.Frame.Main.ImageColor3 = Color3.fromRGB(255, 0, 0)
							v_u_1:Create(v_u_41.Frame.Main, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
								["ImageColor3"] = Color3.fromRGB(255, 255, 255)
							}):Play()
						elseif v_u_69 > 0 and v_u_50 then
							v_u_41.Frame.Main.ImageColor3 = Color3.fromRGB(255, 0, 0)
							v_u_1:Create(v_u_41.Frame.Main, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
								["ImageColor3"] = Color3.fromRGB(255, 255, 255)
							}):Play()
						end
						v_u_10:WaitForChild("Remotes"):WaitForChild("Relay"):Fire({
							["Length"] = 0.45,
							["Intensity"] = 0.9,
							["TweenSpeed"] = 0.075,
							["AxisMultipliers"] = v_u_69 > 0 and Vector3.new(0, 0, 1) or Vector3.new(0, 0, -1),
							["FadeStyle"] = "inQuad",
							["PositionStyle"] = "inCubic"
						})
						local v_u_70 = v_u_69 > 0 and Random.new():NextNumber(1, 999) or Random.new():NextInteger(-999, -1)
						v_u_65 = v_u_70
						if v_u_69 > 0 then
							v_u_41.ArrowRight.Image = "rbxassetid://73140030116516"
						else
							v_u_41.ArrowLeft.Image = "rbxassetid://125642995079190"
						end
						task.delay(0.15, function()
							-- upvalues: (ref) v_u_65, (copy) v_u_70, (ref) v_u_69, (ref) v_u_50, (ref) v_u_41, (ref) v_u_6
							if v_u_65 == v_u_70 or (v_u_69 <= 0 or v_u_70 >= 0) and (not v_u_50 or v_u_70 <= 0) then
								if v_u_41 and (v_u_41.Parent and v_u_41.Parent == v_u_6.PlayerGui.ImpactFrames) then
									if v_u_69 < 0 then
										v_u_41.ArrowRight.Image = "rbxassetid://126865255648730"
									else
										v_u_41.ArrowLeft.Image = "rbxassetid://71277299871145"
									end
								else
									return
								end
							else
								return
							end
						end)
						local v71 = v_u_40
						v71.Value = v71.Value + v_u_69
						v_u_65 = tick()
					end
					if p67.UserInputType == Enum.UserInputType.Keyboard then
						if p67.KeyCode == Enum.KeyCode.A then
							v72(-1)
							return
						end
						if p67.KeyCode == Enum.KeyCode.D then
							v72(1)
							return
						end
					else
						if p67.UserInputType == Enum.UserInputType.Touch then
							local v73 = Instance.new("Frame")
							v73.BackgroundTransparency = 0
							v73.AnchorPoint = Vector2.new(0.5, 0.5)
							v73.Size = UDim2.new(0, 0, 0, 0)
							Instance.new("UICorner", v73).CornerRadius = UDim.new(10, 0)
							local v74 = game:GetService("GuiService"):GetGuiInset()
							v73.Position = UDim2.new(0, p67.Position.X + v74.X, 0, p67.Position.Y + v74.Y)
							v73.Parent = v_u_6.PlayerGui.ImpactFrames
							v_u_1:Create(v73, TweenInfo.new(0.25, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {
								["Size"] = UDim2.new(0, 70, 0, 70),
								["BackgroundTransparency"] = 1
							}):Play()
							shared.AddDebris(v73, 0.4)
							local v75 = workspace.CurrentCamera.ViewportSize.X
							if p67.Position.X < v75 / 2 then
								v72(-1)
							else
								v72(1)
							end
						end
						if p67.UserInputType == Enum.UserInputType.Gamepad1 then
							if p67.KeyCode == Enum.KeyCode.ButtonX then
								v72(-1)
								return
							end
							if p67.KeyCode == Enum.KeyCode.ButtonB then
								v72(1)
							end
						end
					end
				end
			end
			local v_u_77 = false
			local function v83()
				-- upvalues: (ref) v_u_32, (ref) v_u_77, (ref) v_u_15, (ref) v_u_14, (ref) v_u_10, (copy) v_u_37, (ref) v_u_11, (copy) v_u_39, (copy) v_u_35, (ref) v_u_33
				for _, v78 in v_u_32 do
					if typeof(v78) == "RBXScriptConnection" then
						v78:Disconnect()
					elseif typeof(v78) == "function" then
						task.spawn(v78)
					else
						v78:Destroy()
					end
				end
				table.clear(v_u_32)
				if v_u_77 then
					v_u_15:FireServer({
						["FallingPlayer"] = true
					})
					local v79 = v_u_14.CheckBVAndCreate
					local v80 = v_u_10
					local v81 = {}
					local v82 = v_u_37 * 15
					v81.Velocity = vector.create(0, 0, v82)
					v81.MaxForce = Vector3.new(0, 0, 55000)
					v81.Parent = v_u_11
					v81.DebrisTime = 0.85
					v79(v80, 1, v81)
					v_u_39:Stop(0.45)
				else
					v_u_39:Stop(0.45)
					task.delay(0.45, function()
						-- upvalues: (ref) v_u_35
						v_u_35:Destroy()
					end)
					v_u_33:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
				end
			end
			local v_u_84 = tick()
			task.spawn(function()
				-- upvalues: (ref) v_u_13
				v_u_13.FovOut({
					["EffectName"] = "FovOut",
					["FOV"] = 80
				})
			end)
			local _ = v_u_10.Humanoid
			local v_u_85 = 0
			local v86 = v_u_32
			local v87 = v_u_4.RenderStepped
			local function v91(p88)
				-- upvalues: (ref) v_u_77, (ref) v_u_18, (ref) v_u_85, (copy) v_u_40, (copy) v_u_37, (copy) v_u_41, (ref) v_u_84, (ref) v_u_13
				if v_u_77 or v_u_18 then
					return
				else
					v_u_85 = v_u_85 + p88
					if v_u_85 >= 0.016666666666666666 then
						v_u_85 = v_u_85 - 0.016666666666666666
						local v89 = Random.new():NextInteger(50, 60)
						local v90 = v_u_40
						v90.Value = v90.Value + v_u_37 * v89 * p88
						v_u_41.Indicator.Rotation = v_u_40.Value / 14
						if tick() - v_u_84 >= 0.4 then
							v_u_84 = tick()
							task.spawn(function()
								-- upvalues: (ref) v_u_13
								v_u_13.ScreenHighlight({
									["Color"] = Color3.fromRGB(255, 0, 0),
									["WaitTime"] = 0.4
								})
							end)
						end
						if v_u_40.Value >= 80 or v_u_40.Value <= -80 then
							v_u_77 = true
							print("oh na blud G-G-GONE!")
						end
					end
				end
			end
			table.insert(v86, v87:Connect(v91))
			game:GetService("ContextActionService"):BindActionAtPriority("JumpRopeStruggle", v76, false, 1, Enum.UserInputType.Touch, Enum.UserInputType.Gamepad1, Enum.UserInputType.Keyboard)
			local v92 = v_u_32
			table.insert(v92, function()
				game:GetService("ContextActionService"):UnbindAction("JumpRopeStruggle")
			end)
			local v93 = tick()
			local v94 = Random.new():NextNumber(1.4, 2)
			local v95 = v_u_77
			local v96 = false
			repeat
				task.wait()
				local v97 = (v95 or v_u_18) and true or (v94 <= tick() - v93 and true or v96)
				v96 = (v_u_36 and v_u_40.Value <= 0 or not v_u_36 and v_u_40.Value >= 0) and true or v97
			until v96
			v83()
		end
		local v_u_99 = nil
		local v100 = v_u_33.StateChanged
		local function v102(_, p101)
			-- upvalues: (ref) v_u_99, (copy) v_u_33, (copy) v_u_10, (copy) v_u_12, (copy) v_u_98
			if p101 == Enum.HumanoidStateType.Jumping then
				if not v_u_99 then
					v_u_99 = true
					v_u_33:SetStateEnabled(Enum.HumanoidStateType.Jumping, false)
					if v_u_10:GetAttribute("JumpRopeZone") then
						v_u_12.CreateFolder(v_u_10, "JumpRopeJumped", 0.45)
						return
					end
				end
			elseif p101 == Enum.HumanoidStateType.Landed and v_u_99 then
				v_u_99 = false
				if v_u_10:GetAttribute("JumpRopeZone") then
					v_u_98()
				end
				v_u_33:SetStateEnabled(Enum.HumanoidStateType.Jumping, true)
			end
		end
		table.insert(v_u_16, v100:Connect(v102))
		table.insert(v_u_16, v27)
		table.insert(v_u_16, v25)
	end
end
