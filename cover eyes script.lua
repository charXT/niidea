local NOGUI    = true
local Message = false
local IntroMessage = false -- this help to not let you get exposed online

--// main //--

local CoverTool = Instance.new("Tool")
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()
local ImgUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. player.UserId .. "&width=100&height=100&format=png"
local humanoid = char:WaitForChild("Humanoid")
local PreSpeed 
local CoverAnim = Instance.new("Animation")

local UsingExec

if identifyexecutor then
    UsingExec = tostring(identifyexecutor())
elseif getexecutor then
    UsingExec = tostring(getexecutor())
else
    UsingExec = "getexecutor/identifyexecutor Function Faliure."
end

game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "Script By RumNewbie0", 
    Text = "Executor : " .. UsingExec, 
    Icon = ImgUrl,
    Duration = 5, 
    Button1 = "Ok",
    Button2 = "IDC" 
})


--// Main Script //--


CoverAnim.AnimationId = "rbxassetid://183696478"
CoverAnim.Parent = char --i put this so the instance doesnt feel sad and lonely :)
local CoverAnimTrack = humanoid:LoadAnimation(CoverAnim)
local BlackGui = Instance.new("ScreenGui")
BlackGui.IgnoreGuiInset = true
BlackGui.Enabled = false
BlackGui.Parent = player.PlayerGui
BlackGui.Name = "CoverEyesGUI"
local BlackFrame = Instance.new("Frame")
BlackFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
BlackFrame.Parent = BlackGui
BlackFrame.Size = UDim2.new(1, 0, 1,0)
BlackFrame.ZIndex = 9999
if NOGUI then
    BlackFrame.BackgroundTransparency = 1
end
PreSpeed = humanoid.WalkSpeed

CoverTool.Parent = player.Backpack
CoverTool.Name = "Cover Eyes"
CoverTool.RequiresHandle = false

CoverTool.Equipped:Connect(function()
   BlackGui.Enabled = true
   CoverAnimTrack:Play()
   PreSpeed = humanoid.WalkSpeed
   humanoid.WalkSpeed = 3
end)

CoverTool.Unequipped:Connect(function()
   BlackGui.Enabled = false
   CoverAnimTrack:Stop()
   humanoid.WalkSpeed = PreSpeed
end)
