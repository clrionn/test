local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "Clarion Project | https://discord.gg/fMeunfVf",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(530, 350),
    Acrylic = true, 
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl 
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main", Icon = "rbxassetid://10723407389" }),
    Farm = Window:AddTab({ Title = "Autofarm", Icon = "truck" }),
    Security = Window:AddTab({ Title = "Security", Icon = "rbxassetid://10734951847" }),
    Webhook = Window:AddTab({ Title = "Webhook", Icon = "rbxassetid://10709781460" }),
    Environment = Window:AddTab({ Title = "Environment", Icon = "rbxassetid://10723404337" }),
    Miscellaneous = Window:AddTab({ Title = "Miscellaneous", Icon = "rbxassetid://10723424235" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" }),
}

local InfoSec = Tabs.Main:AddSection("Information")

local ClientCash = InfoSec:AddParagraph({Title = "Balance", Content = ""})
local ClientEarnings = InfoSec:AddParagraph({Title = "Cash Earned", Content = ""})
shared.ClientTime = InfoSec:AddParagraph({Title = "Time Elapsed", Content = "You Haven't Started AutoFarming"})
shared.ClientInformation = InfoSec:AddParagraph({Title = "Status", Content = "AutoFarm Is Idle"})

-- Tambahkan Tombol Start Autofarm di Tab Autofarm
local FarmSec = Tabs.Farm:AddSection("Autofarm Controls")

FarmSec:AddButton({
    Title = "Start Autofarm",
    Tooltip = "Mulai proses Autofarm",
    Callback = function()
        -- Autofarm
        local args = {
            [1] = "Truck"
        }
        
        game:GetService("ReplicatedStorage").NetworkContainer.RemoteEvents.Job:FireServer(unpack(args))

        -- Teleportasi ke posisi tertentu
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        -- Posisi tujuan teleportasi
        local targetPosition = Vector3.new(-21799, 1042, -26795)

        -- Teleportasi pemain ke posisi target
        humanoidRootPart.CFrame = CFrame.new(targetPosition)

        local VirtualInputManager = game:GetService('VirtualInputManager')

        -- Fungsi untuk mengirim penekanan tombol 'E' sekali
        local function sendKeyE()
        VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
        wait(0.1)
        VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        end

        -- Mengirim penekanan tombol 'E' dua kali
        sendKeyE()
        wait(1)  -- Menunggu 1 detik sebelum penekanan kedua (sesuaikan sesuai kebutuhan)
        sendKeyE()

        -- Teleportasi ke posisi tertentu
        local player = game.Players.LocalPlayer
        local character = player.Character or player.CharacterAdded:Wait()
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        -- Posisi tujuan teleportasi
        local targetPosition = Vector3.new(-21785, 1042, -26786)

        -- Teleportasi pemain ke posisi target
        humanoidRootPart.CFrame = CFrame.new(targetPosition)
         
        --function untuk penekanan tombol f spawn mobil job
        local function sendKeyF()
            VirtualInputManager:SendkeyEvent(true, Enum.KeyCode.E, false, game)
            wait(1)
        end

        -- Fungsi untuk menekan dan menahan tombol 'E'
        local function holdKeyE(duration)
            -- Mendapatkan waktu saat ini
            local startTime = tick()
    
            -- Loop untuk menahan tombol 'E' selama durasi yang ditentukan
            while tick() - startTime < duration do
                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.E, false, game)
                RunService.Stepped:Wait()
            end
    
            -- Melepaskan tombol 'E' setelah durasi berakhir
            VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.E, false, game)
        end

        -- Menahan tombol 'E' selama 4 detik
        holdKeyE(4)
        
        shared.ClientInformation:Set({Content = "AutoFarm Is Running"})
    end
})
