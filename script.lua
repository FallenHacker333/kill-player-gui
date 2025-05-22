-- أولاً: أنشئ ScreenGui في StarterGui
local player = game.Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

local screenGui = Instance.new("ScreenGui")
screenGui.Name = "KillGui"
screenGui.Parent = playerGui

-- صندوق النص (TextBox) لكتابة اسم اللاعب
local textBox = Instance.new("TextBox")
textBox.Size = UDim2.new(0, 200, 0, 30)
textBox.Position = UDim2.new(0.5, -100, 0.4, 0)
textBox.PlaceholderText = "اكتب اسم اللاعب هنا"
textBox.Parent = screenGui

-- زر تأكيد القتل
local killButton = Instance.new("TextButton")
killButton.Size = UDim2.new(0, 100, 0, 30)
killButton.Position = UDim2.new(0.5, -50, 0.5, 0)
killButton.Text = "تأكيد القتل"
killButton.Parent = screenGui

-- الحدث عند الضغط على الزر
killButton.MouseButton1Click:Connect(function()
    local targetName = textBox.Text
    local target = game.Players:FindFirstChild(targetName)
    if target and target.Character and target.Character:FindFirstChild("Humanoid") then
        target.Character.Humanoid.Health = 0
    else
        warn("اللاعب مش موجود أو ميت أصلاً")
    end
end)
