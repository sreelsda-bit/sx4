--[[
    SX4 HUB V2 - PREMIUM (FAKE UI)
    Cores: Preto & Branco
--]]

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local CoreGui = game:GetService("CoreGui")

local player = Players.LocalPlayer

-- Remove UI antiga se existir
local oldGui = CoreGui:FindFirstChild("SX4Hub")
if oldGui then oldGui:Destroy() end

-- Cria a ScreenGui
local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "SX4Hub"
ScreenGui.ResetOnSpawn = false
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.Parent = CoreGui

-- Janela Principal
local MainFrame = Instance.new("Frame")
MainFrame.Name = "Main"
MainFrame.Size = UDim2.new(0, 520, 0, 360)
MainFrame.Position = UDim2.new(0.5, -260, 0.5, -180)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true
MainFrame.Parent = ScreenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = UDim.new(0, 8)
UICorner.Parent = MainFrame

local UIStroke = Instance.new("UIStroke")
UIStroke.Color = Color3.fromRGB(255, 255, 255)
UIStroke.Thickness = 1
UIStroke.Transparency = 0.5
UIStroke.Parent = MainFrame

-- Topbar
local TopBar = Instance.new("Frame")
TopBar.Name = "TopBar"
TopBar.Size = UDim2.new(1, 0, 0, 35)
TopBar.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
TopBar.BorderSizePixel = 0
TopBar.Parent = MainFrame

local TopCorner = Instance.new("UICorner")
TopCorner.CornerRadius = UDim.new(0, 8)
TopCorner.Parent = TopBar

local Title = Instance.new("TextLabel")
Title.Name = "Title"
Title.Size = UDim2.new(1, -40, 1, 0)
Title.Position = UDim2.new(0, 15, 0, 0)
Title.BackgroundTransparency = 1
Title.Text = "SX4 HUB | PREMIUM V2.0"
Title.TextColor3 = Color3.fromRGB(255, 255, 255)
Title.Font = Enum.Font.GothamBold
Title.TextSize = 14
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = TopBar

-- Botão fechar
local CloseBtn = Instance.new("TextButton")
CloseBtn.Size = UDim2.new(0, 35, 1, 0)
CloseBtn.Position = UDim2.new(1, -35, 0, 0)
CloseBtn.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
CloseBtn.Text = "X"
CloseBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
CloseBtn.Font = Enum.Font.GothamBold
CloseBtn.TextSize = 14
CloseBtn.Parent = TopBar

local CloseCorner = Instance.new("UICorner")
CloseCorner.CornerRadius = UDim.new(0, 8)
CloseCorner.Parent = CloseBtn

-- Sidebar (Abas)
local Sidebar = Instance.new("Frame")
Sidebar.Name = "Sidebar"
Sidebar.Size = UDim2.new(0, 120, 1, -45)
Sidebar.Position = UDim2.new(0, 8, 0, 42)
Sidebar.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
Sidebar.BorderSizePixel = 0
Sidebar.Parent = MainFrame

local SidebarCorner = Instance.new("UICorner")
SidebarCorner.CornerRadius = UDim.new(0, 6)
SidebarCorner.Parent = Sidebar

local SidebarList = Instance.new("UIListLayout")
SidebarList.SortOrder = Enum.SortOrder.LayoutOrder
SidebarList.Padding = UDim.new(0, 6)
SidebarList.Parent = Sidebar

local SidebarPadding = Instance.new("UIPadding")
SidebarPadding.PaddingTop = UDim.new(0, 10)
SidebarPadding.Parent = Sidebar

-- Função pra criar botão de aba
local function CreateTab(name)
    local TabBtn = Instance.new("TextButton")
    TabBtn.Size = UDim2.new(1, -16, 0, 32)
    TabBtn.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    TabBtn.Text = name
    TabBtn.TextColor3 = Color3.fromRGB(200, 200, 200)
    TabBtn.Font = Enum.Font.GothamSemibold
    TabBtn.TextSize = 12
    TabBtn.Parent = Sidebar
    
    local TabCorner = Instance.new("UICorner")
    TabCorner.CornerRadius = UDim.new(0, 4)
    TabCorner.Parent = TabBtn
    
    return TabBtn
end

-- Cria as abas
local TabFarm = CreateTab("Auto Farm")
local TabPlayer = CreateTab("Player")
local TabMisc = CreateTab("Misc")

-- Área de conteúdo
local Content = Instance.new("ScrollingFrame")
Content.Name = "Content"
Content.Size = UDim2.new(1, -135, 1, -45)
Content.Position = UDim2.new(0, 130, 0, 42)
Content.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Content.BorderSizePixel = 0
Content.ScrollBarThickness = 2
Content.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
Content.Parent = MainFrame

local ContentList = Instance.new("UIListLayout")
ContentList.SortOrder = Enum.SortOrder.LayoutOrder
ContentList.Padding = UDim.new(0, 8)
ContentList.Parent = Content

local ContentPadding = Instance.new("UIPadding")
ContentPadding.PaddingTop = UDim.new(0, 10)
ContentPadding.PaddingLeft = UDim.new(0, 10)
ContentPadding.Parent = Content

-- Função pra criar toggle (botão liga/desliga)
local function CreateToggle(text, parent)
    local ToggleFrame = Instance.new("Frame")
    ToggleFrame.Size = UDim2.new(1, -10, 0, 38)
    ToggleFrame.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    ToggleFrame.Parent = parent
    
    local TFCorner = Instance.new("UICorner")
    TFCorner.CornerRadius = UDim.new(0, 6)
    TFCorner.Parent = ToggleFrame
    
    local TFLabel = Instance.new("TextLabel")
    TFLabel.Size = UDim2.new(1, -50, 1, 0)
    TFLabel.Position = UDim2.new(0, 12, 0, 0)
    TFLabel.BackgroundTransparency = 1
    TFLabel.Text = text
    TFLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
    TFLabel.Font = Enum.Font.Gotham
    TFLabel.TextSize = 13
    TFLabel.TextXAlignment = Enum.TextXAlignment.Left
    TFLabel.Parent = ToggleFrame
    
    local ToggleBtn = Instance.new("TextButton")
    ToggleBtn.Size = UDim2.new(0, 40, 0, 20)
    ToggleBtn.Position = UDim2.new(1, -52, 0.5, -10)
    ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    ToggleBtn.Text = ""
    ToggleBtn.Parent = ToggleFrame
    
    local TBCorner = Instance.new("UICorner")
    TBCorner.CornerRadius = UDim.new(1, 0)
    TBCorner.Parent = ToggleBtn
    
    local Circle = Instance.new("Frame")
    Circle.Size = UDim2.new(0, 16, 0, 16)
    Circle.Position = UDim2.new(0, 2, 0, 2)
    Circle.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
    Circle.Parent = ToggleBtn
    
    local CC = Instance.new("UICorner")
    CC.CornerRadius = UDim.new(1, 0)
    CC.Parent = Circle
    
    local toggled = false
    ToggleBtn.MouseButton1Click:Connect(function()
        toggled = not toggled
        if toggled then
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
            Circle.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
            Circle:TweenPosition(UDim2.new(1, -18, 0, 2), "Out", "Quad", 0.1)
        else
            ToggleBtn.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
            Circle.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
            Circle:TweenPosition(UDim2.new(0, 2, 0, 2), "Out", "Quad", 0.1)
        end
    end)
    
    return ToggleFrame
end

-- Função pra criar botão normal
local function CreateButton(text, parent)
    local Btn = Instance.new("TextButton")
    Btn.Size = UDim2.new(1, -10, 0, 38)
    Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    Btn.Text = text
    Btn.TextColor3 = Color3.fromRGB(220, 220, 220)
    Btn.Font = Enum.Font.Gotham
    Btn.TextSize = 13
    Btn.Parent = parent
    
    local BC = Instance.new("UICorner")
    BC.CornerRadius = UDim.new(0, 6)
    BC.Parent = Btn
    
    Btn.MouseEnter:Connect(function()
        Btn.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
    end)
    Btn.MouseLeave:Connect(function()
        Btn.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
    end)
    
    Btn.MouseButton1Click:Connect(function()
        -- Simula a execução sem fazer nada
        Btn.Text = "Executando..."
        task.wait(1)
        Btn.Text = text
    end)
    
    return Btn
end

-- Coloca as coisas na aba de Farm
CreateToggle("Auto Farm Level (Fast)", Content)
CreateToggle("Auto Farm Beli", Content)
CreateToggle("Auto Farm Fragments", Content)
CreateToggle("Auto Raid (Solo)", Content)
CreateButton("Teleport to Sea Beast", Content)

-- Aba de Player
local function ShowPlayerTab()
    for _, v in pairs(Content:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    CreateToggle("Godmode (Bypass)", Content)
    CreateToggle("Infinite Energy", Content)
    CreateToggle("Speed Hack (120)", Content)
    CreateButton("Reset Character", Content)
end

-- Aba de Misc
local function ShowMiscTab()
    for _, v in pairs(Content:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    CreateButton("Redeem All Codes", Content)
    CreateButton("Join Discord Server", Content)
    CreateToggle("Anti-AFK", Content)
end

TabFarm.MouseButton1Click:Connect(function()
    for _, v in pairs(Content:GetChildren()) do
        if v:IsA("Frame") or v:IsA("TextButton") then v:Destroy() end
    end
    CreateToggle("Auto Farm Level (Fast)", Content)
    CreateToggle("Auto Farm Beli", Content)
    CreateToggle("Auto Farm Fragments", Content)
    CreateToggle("Auto Raid (Solo)", Content)
    CreateButton("Teleport to Sea Beast", Content)
end)

TabPlayer.MouseButton1Click:Connect(ShowPlayerTab)
TabMisc.MouseButton1Click:Connect(ShowMiscTab)

CloseBtn.MouseButton1Click:Connect(function()
    ScreenGui:Destroy()
end)

-- Notificação fake de inicialização
local NotifyGui = Instance.new("ScreenGui")
NotifyGui.Name = "SX4Notify"
NotifyGui.ResetOnSpawn = false
NotifyGui.Parent = CoreGui

local Notify = Instance.new("Frame")
Notify.Size = UDim2.new(0, 260, 0, 60)
Notify.Position = UDim2.new(0.5, -130, 1, 20)
Notify.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
Notify.Parent = NotifyGui

local NC = Instance.new("UICorner")
NC.CornerRadius = UDim.new(0, 6)
NC.Parent = Notify

local NS = Instance.new("UIStroke")
NS.Color = Color3.fromRGB(255, 255, 255)
NS.Thickness = 1
NS.Parent = Notify

local NT = Instance.new("TextLabel")
NT.Size = UDim2.new(1, -10, 1, -10)
NT.Position = UDim2.new(0, 5, 0, 5)
NT.BackgroundTransparency = 1
NT.Text = "✅ SX4 Hub Carregado com sucesso!\nExecute em Blox Fruits."
NT.TextColor3 = Color3.fromRGB(255, 255, 255)
NT.Font = Enum.Font.GothamSemibold
NT.TextSize = 13
NT.Parent = Notify

Notify:TweenPosition(UDim2.new(0.5, -130, 1, -80), "Out", "Quad", 0.5)

task.delay(3, function()
    Notify:TweenPosition(UDim2.new(0.5, -130, 1, 20), "In", "Quad", 0.5)
    task.wait(0.5)
    NotifyGui:Destroy()
end)