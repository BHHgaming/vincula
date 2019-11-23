function randomkey(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end
function get_ui_lib() 
    local hideandshow = true
    if hideandshow == true then
        toggle = true
    end
    if game.CoreGui:FindFirstChild("RobloxUI") then
        game.ContextActionService:UnbindAction("SynexUI")
    toggle = true
    warn("Reloaded GUI API!")
    end
    local a,b=pcall(function()repeat wait()local a=game.Lighting;local b=a:FindFirstChild("SynexEMUI")if b then b:Destroy()end;local a=game.CoreGui;local a=a:FindFirstChild("RobloxUI")if a then a:Destroy()end until b==nil and a==nil;if blur==nil and ui==nil then return end end)if a==false then warn("UUHH something is fucked up in GUI API please report it to legitlike123#1337")end
    local defaultDelay = 0.5
    local tweenPosition = function (part,newpos,_delay, mode)
        if not _delay then _delay = defaultDelay end
        if not mode then mode = "Sine" end
        local ts = game:GetService("TweenService")
        local ti = TweenInfo.new(_delay, Enum.EasingStyle[mode], Enum.EasingDirection.Out, 0, false)
        local prop = {Position = newpos}
        local Tween = ts:Create(part, ti, prop)
        Tween:Play()
        wait(0.05)
    end

    local library = {
        windowcount = 0;
    }

    local dragger = {};
    local resizer = {};


    do
        local mouse = game:GetService("Players").LocalPlayer:GetMouse();
        local inputService = game:GetService('UserInputService');
        local heartbeat = game:GetService("RunService").Heartbeat;
    -- credits to Ririchi / Inori for this cute drag function :)
        function dragger.new(frame)
            local s, event = pcall(function()
                return frame.MouseEnter
            end)

            if s then
                frame.Active = true;

                event:connect(function()
                    local input = frame.InputBegan:connect(function(key)
                        if key.UserInputType == Enum.UserInputType.MouseButton1 then
                            local objectPosition = Vector2.new(mouse.X - frame.AbsolutePosition.X, mouse.Y - frame.AbsolutePosition.Y);
                            while heartbeat:wait() and inputService:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) do
                                frame:TweenPosition(UDim2.new(0, mouse.X - objectPosition.X + (frame.Size.X.Offset * frame.AnchorPoint.X), 0, mouse.Y - objectPosition.Y + (frame.Size.Y.Offset * frame.AnchorPoint.Y)), 'Out', 'Quad', 0.1, true);
                            end
                        end
                    end)

                    local leave;
                    leave = frame.MouseLeave:connect(function()
                        input:disconnect();
                        leave:disconnect();
                    end)
                end)
            end
        end

        function resizer.new(p, s)
            p:GetPropertyChangedSignal('AbsoluteSize'):connect(function()
                s.Size = UDim2.new(s.Size.X.Scale, s.Size.X.Offset, s.Size.Y.Scale, p.AbsoluteSize.Y);
            end)
        end
    end

    local defaults = {
        txtcolor = Color3.fromRGB(255, 255, 255),
        underline = Color3.fromRGB(0, 255, 140),
        barcolor = Color3.fromRGB(40, 40, 40),
        bgcolor = Color3.fromRGB(30, 30, 30),
    }

    function library:Create(class, props)
        local object = Instance.new(class);

        for i, prop in next, props do
            if i ~= "Parent" then
                object[i] = prop;
            end
        end

        object.Parent = props.Parent;
        return object;
    end

    function library:CreateWindow(options)
        assert(options.text, "no name");
        local window = {
            count = 0;
            toggles = {},
            closed = false;
        }

        local options = options or {};
        setmetatable(options, {__index = defaults})

        self.windowcount = self.windowcount + 1;

        library.gui = library.gui or self:Create("ScreenGui", {Name = "UILibrary", Parent = game:GetService("CoreGui")})
        window.frame = self:Create("Frame", {
            Name = options.text;
            Parent = self.gui,
            Active = true,
            BackgroundTransparency = 0,
            Size = UDim2.new(0, 150, 0, 30),
            Position = UDim2.new(0, (5 + ((150 * self.windowcount) - 150)), 0, 5),
            BackgroundColor3 = options.barcolor,
            BorderSizePixel = 0;
        })

        window.background = self:Create('Frame', {
            Name = 'Background';
            Parent = window.frame,
            BorderSizePixel = 0;
            BackgroundColor3 = options.bgcolor,
            Position = UDim2.new(0, 0, 1, 0),
            Size = UDim2.new(1, 0, 0, 25),
            BackgroundTransparency = 1,
            ClipsDescendants = true;
        })

        window.container = self:Create('Frame', {
            Name = 'Container';
            Parent = window.frame,
            BorderSizePixel = 0;
            BackgroundColor3 = options.bgcolor,
            Position = UDim2.new(0, 0, 1, 0),
            Size = UDim2.new(1, 0, 0, 25),
            BackgroundTransparency = 0.30,
            ClipsDescendants = true;
        })

        window.organizer = self:Create('UIListLayout', {
            Name = 'Sorter';
            SortOrder = Enum.SortOrder.LayoutOrder;
            Parent = window.container;
        })

        window.padder = self:Create('UIPadding', {
            Name = 'Padding';
            PaddingLeft = UDim.new(0, 10);
            PaddingTop = UDim.new(0, 5);
            Parent = window.container;
        })

        local underline = self:Create("Frame", {
            Name = 'Underline';
            Size = UDim2.new(1, 0, 0, 3),
            Position = UDim2.new(0, 0, 1, -1),
            BorderSizePixel = 0;
            BackgroundColor3 = options.underline;
            Parent = window.frame
        })

        spawn(function() -- Rainbow underline
            while window.frame and wait() do
                local r = (math.sin(workspace.DistributedGameTime/2)/2)+0.5
        local g = (math.sin(workspace.DistributedGameTime)/2)+0.5
        local b = (math.sin(workspace.DistributedGameTime*1.5)/2)+0.5
                local color = Color3.new(r, g, b)
                underline.BackgroundColor3 = color
            end
        end)

        local togglebutton = self:Create("TextButton", {
            Name = 'Toggle';
            ZIndex = 2,
            BackgroundTransparency = 1;
            Position = UDim2.new(1, -25, 0, 0),
            Size = UDim2.new(0, 25, 1, 0),
            Text = "-",
            TextSize = 17,
            TextColor3 = options.txtcolor,
            Font = Enum.Font.SourceSans;
            Parent = window.frame,
        });

        togglebutton.MouseButton1Click:connect(function()
            window.closed = not window.closed
            togglebutton.Text = (window.closed and "+" or "-")
            if window.closed then
                window:Resize(true, UDim2.new(1, 0, 0, 0))
            else
                window:Resize(true)
            end
        end)

        self:Create("TextLabel", {
            Size = UDim2.new(1, 0, 1, 0),
            BackgroundTransparency = 1;
            BorderSizePixel = 0;
            TextColor3 = options.txtcolor,
            TextColor3 = (options.bartextcolor or Color3.fromRGB(255, 255, 255));
            TextSize = 17,
            Font = Enum.Font.SourceSansSemibold;
            Text = options.text or "window",
            Name = "Window",
            Parent = window.frame,
        })
        local open = {}
        local isRunning = false
        function onSynexUIPress(actionName, userInputState, inputObject)
            if isRunning then return end
            isRunning = true
            if userInputState == Enum.UserInputState.Begin then
                if toggle then
                    toggle = not toggle
                    for i = 1, self.windowcount do
                        open[i] = game.CoreGui.UILibrary:GetChildren()[i].Position
                        tweenPosition(game.CoreGui.UILibrary:GetChildren()[i], open[i] + UDim2.new(0, 0, -2, 0))
                    end
                else
                    toggle = not toggle
                    for i = 1, self.windowcount do
                        tweenPosition(game.CoreGui.UILibrary:GetChildren()[i], open[i])
                    end
                end
            end
            wait(0.05 * self.windowcount)
            isRunning = false
        end

        if hideandshow == true then
            game.ContextActionService:BindAction("SynexUI", onSynexUIPress, false, Enum.KeyCode.RightShift)
        end

        do
            dragger.new(window.frame)
            resizer.new(window.background, window.container);
        end

        local function getSize()
            local ySize = 0;
            for i, object in next, window.container:GetChildren() do
                if (not object:IsA('UIListLayout')) and (not object:IsA('UIPadding')) then
                    ySize = ySize + object.AbsoluteSize.Y
                end
            end
            return UDim2.new(1, 0, 0, ySize + 10)
        end

        function window:Resize(tween, change)
            local size = change or getSize()
            self.container.ClipsDescendants = true;

            if tween then
                self.background:TweenSize(size, "Out", "Sine", 0.5, true)
            else
                self.background.Size = size
            end
        end

        function window:AddToggle(text, callback)
            self.count = self.count + 1

            callback = callback or function() end
            local label = library:Create("TextLabel", {
                Text =  text,
                Size = UDim2.new(1, -10, 0, 20);
                Position = UDim2.new(0, 5, 0, ((20 * self.count) - 20) + 5),
                BackgroundTransparency = 1;
                TextColor3 = Color3.fromRGB(255, 255, 255);
                TextXAlignment = Enum.TextXAlignment.Left;
                LayoutOrder = self.Count;
                TextSize = 16,
                Font = Enum.Font.SourceSans,
                Parent = self.container;
            })

            local button = library:Create("TextButton", {
                Text = "OFF",
                TextColor3 = Color3.fromRGB(255, 25, 25),
                BackgroundTransparency = 1;
                Position = UDim2.new(1, -25, 0, 0),
                Size = UDim2.new(0, 25, 1, 0),
                TextSize = 17,
                Font = Enum.Font.SourceSansSemibold,
                Parent = label;
            })

            button.MouseButton1Click:connect(function()
                self.toggles[text] = (not self.toggles[text])
                button.TextColor3 = (self.toggles[text] and Color3.fromRGB(0, 255, 140) or Color3.fromRGB(255, 25, 25))
                button.Text =(self.toggles[text] and "ON" or "OFF")

                callback(self.toggles[text])
            end)

            self:Resize()
            return button
        end

        function window:AddBox(text, callback)
            self.count = self.count + 1
            callback = callback or function() end

            local box = library:Create("TextBox", {
                PlaceholderText = text,
                Size = UDim2.new(1, -10, 0, 20);
                Position = UDim2.new(0, 5, 0, ((20 * self.count) - 20) + 5),
                BackgroundTransparency = 0.75;
                BackgroundColor3 = options.boxcolor,
                TextColor3 = Color3.fromRGB(255, 255, 255);
                TextXAlignment = Enum.TextXAlignment.Center;
                TextSize = 16,
                Text = "",
                Font = Enum.Font.SourceSans,
                LayoutOrder = self.Count;
                BorderSizePixel = 0;
                Parent = self.container;
            })

            box.FocusLost:connect(function(...)
                callback(box, ...)
            end)

            self:Resize()
            return box
        end

        function window:AddButton(text, callback)
            self.count = self.count + 1

            callback = callback or function() end
            local button = library:Create("TextButton", {
                Text = text,
                Size = UDim2.new(1, -10, 0, 20);
                BackgroundTransparency = 1;
                TextColor3 = Color3.fromRGB(255, 255, 255);
                TextXAlignment = Enum.TextXAlignment.Left;
                TextSize = 16,
                Font = Enum.Font.SourceSans,
                LayoutOrder = self.Count;
                Parent = self.container;
            })

            button.MouseButton1Click:connect(callback)
            self:Resize()
            return button
        end

        function window:AddLabel(text)
            self.count = self.count + 1;

            local tSize = game:GetService('TextService'):GetTextSize(text, 16, Enum.Font.SourceSans, Vector2.new(math.huge, math.huge))

            local button = library:Create("TextLabel", {
                Text =  text,
                Size = UDim2.new(1, -10, 0, tSize.Y + 5);
                TextScaled = false;
                BackgroundTransparency = 1;
                TextColor3 = Color3.fromRGB(255, 255, 255);
                TextXAlignment = Enum.TextXAlignment.Left;
                TextSize = 16,
                Font = Enum.Font.SourceSans,
                LayoutOrder = self.Count;
                Parent = self.container;
            })

            self:Resize()
            return button
        end

        function window:AddDropdown(options, callback)
            self.count = self.count + 1
            local default = options[1] or "";

            callback = callback or function() end
            local dropdown = library:Create("TextLabel", {
                Size = UDim2.new(1, -10, 0, 20);
                BackgroundTransparency = 0.75;
                BackgroundColor3 = options.boxcolor,
                TextColor3 = Color3.fromRGB(255, 255, 255);
                TextXAlignment = Enum.TextXAlignment.Center;
                TextSize = 16,
                Text = default,
                Font = Enum.Font.SourceSans,
                BorderSizePixel = 0;
                LayoutOrder = self.Count;
                Parent = self.container;
            })

            local button = library:Create("ImageButton",{
                BackgroundTransparency = 1;
                Image = 'rbxassetid://3234893186';
                Size = UDim2.new(0, 18, 1, 0);
                Position = UDim2.new(1, -20, 0, 0);
                Parent = dropdown;
            })

            local frame;

            local function isInGui(frame)
                local mloc = game:GetService('UserInputService'):GetMouseLocation();
                local mouse = Vector2.new(mloc.X, mloc.Y - 36);

                local x1, x2 = frame.AbsolutePosition.X, frame.AbsolutePosition.X + frame.AbsoluteSize.X;
                local y1, y2 = frame.AbsolutePosition.Y, frame.AbsolutePosition.Y + frame.AbsoluteSize.Y;

                return (mouse.X >= x1 and mouse.X <= x2) and (mouse.Y >= y1 and mouse.Y <= y2)
            end

            local function count(t)
                local c = 0;
                for i, v in next, t do
                    c = c + 1
                end
                return c;
            end

            button.MouseButton1Click:connect(function()
                if count(options) == 0 then
                    return
                end

                if frame then
                    frame:Destroy();
                    frame = nil;
                end

                self.container.ClipsDescendants = false;

                frame = library:Create('Frame', {
                    Position = UDim2.new(0, 0, 1, 0);
                    BackgroundColor3 = Color3.fromRGB(40, 40, 40);
                    Size = UDim2.new(0, dropdown.AbsoluteSize.X, 0, (count(options) * 21));
                    BorderSizePixel = 0;
                    Parent = dropdown;
                    ClipsDescendants = true;
                    ZIndex = 2;
                })

                library:Create('UIListLayout', {
                    Name = 'Layout';
                    Parent = frame;
                })

                for i, option in next, options do
                    local selection = library:Create('TextButton', {
                        Text = option;
                        BackgroundColor3 = Color3.fromRGB(40, 40, 40);
                        TextColor3 = Color3.fromRGB(255, 255, 255);
                        BorderSizePixel = 0;
                        TextSize = 16;
                        Font = Enum.Font.SourceSans;
                        Size = UDim2.new(1, 0, 0, 21);
                        Parent = frame;
                        ZIndex = 2;
                    })

                    selection.MouseButton1Click:connect(function()
                        dropdown.Text = option;
                        callback(option)
                        frame.Size = UDim2.new(1, 0, 0, 0);
                        game:GetService('Debris'):AddItem(frame, 0.1)
                    end)
                end
            end);

            game:GetService('UserInputService').InputBegan:connect(function(m)
                if m.UserInputType == Enum.UserInputType.MouseButton1 then
                    if frame and (not isInGui(frame)) then
                        game:GetService('Debris'):AddItem(frame);
                    end
                end
            end)

            callback(default);
            self:Resize()
            return {
                Refresh = function(self, array)
                    game:GetService('Debris'):AddItem(frame);
                    options = array
                    dropdown.Text = options[1];
                end
            }
        end

        return window

    end
    return library
end
local ws = game:GetService("Workspace")
local ps = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")
local uis = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local p = ps.LocalPlayer
local LocalScript = decompile(p.PlayerScripts.LocalScript)
local RocketLauncherScript = decompile(rs.Game.ItemModule.RocketLauncher)
local GarageScript = decompile(rs.Game.Garage.GarageUI)
local MuseumScript = decompile(rs.Game.Museum)
local Paraglide = decompile(rs.Game.Paraglide)
local JetPackScript = decompile(rs.Game.JetPack.JetPack)
local BasicScript = decompile(rs.Game.ItemModule.Basic)
if getgenv().isniggaenabled then return end
local uilib = get_ui_lib()
local loop = {}
local Players = game:GetService("Players")
local loops = {}
local UIS = game:GetService("UserInputService")
local Camera = workspace.CurrentCamera
local mouse = Players.LocalPlayer:GetMouse()
function loop:CreateLoop(name, waitobj, func) 
    loops[name] = {}
    loops[name]["running"] = false
    loops[name]["destroy"] = false
    spawn(function() 
        while true do 
            if typeof(waitobj) == "userdata" then waitobj:Wait() else waitobj() end
            if loops[name]["running"] then 
                local nugger, n = pcall(func)
                if not nugger then 
                    --p:Kick("Report the error to stroketon: "..n)
                end
            end
            if loops[name]["destroy"] then 
                loops[name] = nil
                break
            end
        end
    end)
end
function loop:RunLoop(name) 
    if loops[name] then 
        loops[name]["running"] = true
    end
end
function loop:StopLoop(name) 
    if loops[name] then 
        loops[name]["running"] = false
    end
end
function loop:DestroyLoop(name) 
    if loops[name] then 
        loops[name]["destroy"] = true
    end
end
function loop:GetRunningLoops() 
    local looplist = {}
    for i, v in next, loops do 
        if v["running"] then 
            table.insert(looplist, i)
        end
    end
    return table.concat(looplist, ", ")
end
function getThemeProperty(name)
    if getgenv().JailTapper ~= nil then
        for i, v in pairs(getgenv().JailTapper) do
            if i == name then return v end
            if i == nil then return nil end
        end
    end
end
local playercheats = uilib:CreateWindow({text = "Character Cheats"})
local gamehooks = uilib:CreateWindow({text = "Game Hooks"})
local carhacks = uilib:CreateWindow({text = "Car Hacks"})
local debugging = uilib:CreateWindow({text = "Debug Info"})
local trolls = uilib:CreateWindow({text = "Trolls"})
local robberies = uilib:CreateWindow({text = "Robberies"})
local playerstuff = uilib:CreateWindow({text = "Player Stuff"})
local gunmodsettings = uilib:CreateWindow({text = "Gun Mod Settings"})
local settings = {
    ["Punch Spam"] = false,
    ["No Wait"] = false,
    ["Horn Spam"] = false,
    ["Ragdoll Bypass"] = false,
    ["God Mode"] = false,
    ["Gun Mod"] = false,
    ["Click Fire"] = false,
    ["Noclip"] = false,
    ["Fire Trail"] = false,
    ["Inf Nitro"] = false,
    ["Fast WalkSpeed"] = false,
    ["Kill Aura"] = false,
    ["Click Tp"] = false,
    ["Horn Spam"] = false,
    ["Self Drive"] = false,
    ["Injan Horn"] = false,
    ["Auto Arrest"] = false,
    ["Annoy"] = false,
    ["No Fall Damage"] = false,
    ["Break Cars"] = false
}
local gunmodstuff = {
    ["Auto Fire"] = false
}
gamehooks:AddToggle("Super Punch", function(toggle) 
    settings["Punch Spam"] = toggle 
end)
local blacklistedloops = {"Tp Method Hide", "Update Mouse", "Update parapee"}
local killingplrs = {}
gamehooks:AddToggle("No Wait", function(toggle) settings["No Wait"] = toggle end)
gamehooks:AddToggle("Ragdoll Bypass", function(toggle) settings["Ragdoll Bypass"] = toggle end)
gamehooks:AddToggle("God Mode", function(toggle) settings["God Mode"] = toggle end)
gamehooks:AddToggle("Gun Mod", function(toggle) settings["Gun Mod"] = toggle end)
gamehooks:AddToggle("Click Fire", function(toggle) settings["Click Fire"] = toggle end)
gamehooks:AddToggle("Fire Trail", function(toggle) settings["Fire Trail"] = toggle end)
playercheats:AddToggle("Noclip", function(toggle) settings["Noclip"] = toggle end)
carhacks:AddToggle("Inf Nitro", function(toggle) settings["Inf Nitro"] = toggle end)
carhacks:AddToggle("Injan Horn", function(toggle) settings["Injan Horn"] = toggle end)
trolls:AddToggle("Horn Spam", function(toggle) settings["Horn Spam"] = toggle end)
trolls:AddToggle("Annoy Server", function(toggle) settings["Annoy"] = toggle end)
gamehooks:AddToggle("Kill Aura", function(toggle) settings["Kill Aura"] = toggle end)
gamehooks:AddToggle("Click Tp", function(toggle) settings["Click Tp"] = toggle end)
gamehooks:AddToggle("No Fall Damage", function(toggle) settings["No Fall Damage"] = toggle end)
gamehooks:AddToggle("Eject All", function(toggle) settings["Break Cars"] = toggle end)
gunmodsettings:AddToggle("Auto Fire", function(toggle) gunmodstuff["Auto Fire"] = toggle end)
debugging:AddButton("Copy Running loops", function() 
    setclipboard(loop:GetRunningLoops())
end)
local gameeditor = {}
local serversidedfunctions = {}
function gameeditor:getregistry(name)
	for i,v in next, debug.getregistry() do
		if typeof(v) == "function" then 
            for i2,v2 in next, debug.getupvalues(v) do 
                if i2 == name then 
                    return v2
                end
            end
		end
	end
end
function gameeditor:getregistrytable(name)
	for i,v in next, debug.getregistry() do
		if typeof(v) == "table" then 
			local func = v[name]
			if func then 
				return func
			end
		end
	end
end
function gameeditor:replacefunc(name, newfunc)
	for i,v in next, debug.getregistry() do
		if typeof(v) == "function" then 
			local func = debug.getupvalue(v, name)
            if func and typeof(v) == "function" then 
				debug.setupvalue(v, name, newfunc)
			end
		end
	end
end
function gameeditor:replacevalue(name, newvalue)
	for i,v in next, debug.getregistry() do
		if typeof(v) == "function" then 
			local value = debug.getupvalue(v, name)
            if value then 
				debug.setupvalue(v, name, newvalue)
			end
		end
	end
end
function serversidedfunctions:getfunc(const) 
    for i,v in next, getgc() do 
        if typeof(v) == "function" and not is_synapse_function(v) then
            for i2,v2 in next, debug.getupvalues(v) do 
                if typeof(v2) == "table" then 
                    for i3, v3 in next, v2 do 
                        if tostring(i3):len() == 8 then
                            if typeof(v3) == "function" and islclosure(v3) then
                                for i4, v4 in next, debug.getconstants(v3) do 
                                    if v4 == const then
                                        return v3;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
function serversidedfunctions:overwritefunc(const, newfunc) 
    for i,v in next, getgc() do 
        if typeof(v) == "function" and not is_synapse_function(v) then
            for i2,v2 in next, debug.getupvalues(v) do 
                if typeof(v2) == "table" then 
                    for i3, v3 in next, v2 do 
                        if tostring(i3):len() == 8 then
                            if typeof(v3) == "function" and islclosure(v3) then
                                for i4, v4 in next, debug.getconstants(v3) do 
                                    if v4 == const then
                                        v2[i3] = newfunc;
                                    end;
                                end;
                            end;
                        end;
                    end;
                end;
            end;
        end;
    end;
end;
function RandomVariable(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end
local locations = {
	Stores = {
	{'Jewelry Out', CFrame.new(156.103851, 18.540699, 1353.72388)},
	{'Jewelry In', CFrame.new(133.300705, 17.9375954, 1316.42407)},
	{'Bank Out', CFrame.new(11.6854906, 17.8929214, 788.188171)},
	{'Bank In', CFrame.new(24.6513691, 19.4347649, 853.291687)},
	{'Museum Out', CFrame.new(1103.53406, 138.152878, 1246.98511)},
	{'Museum In', CFrame.new(1071.72, 102.8, 1191.9)},
	{'Donut Shop', CFrame.new(270.763885, 18.4229183, -1762.90149)},
	{'Gas Station', CFrame.new(-1584.1051, 18.4732189, 721.38739)},
	},
	
	Locations = {
	{'Prison Cells', CFrame.new(-1461.07605, -0.318537951, -1824.14917)},
	{'Prison Yard', CFrame.new(-1219.36316, 17.7750931, -1760.8584)},
	{'Prison Sewer', CFrame.new(-1050.70667, 0.7002424, -1498.72766)},
	{'Prison Parking', CFrame.new(-1173.36951, 18.698061, -1533.47656)},
	{'Gun Shop', CFrame.new(-27.8670673, 17.7929249, -1774.66882)},
	{'1M Shop', CFrame.new(388.804688, 17.5929279, -1701.1698)},
	{'Volcano Base', CFrame.new(1726.72266, 50.4146309, -1745.76196)},
	{'City Base', CFrame.new(-244.824478, 17.8677788, 1573.81616)},
	{'Police HQ1', CFrame.new(-1134.69604, 17.9251575, -1586.79395)},
	{'Police HQ2', CFrame.new(738.103577, 38.1275024, 1134.48059)},
	{'Military Base', CFrame.new(766.283386, 18.0144463, -324.15921)},
	{'Evil Lair', CFrame.new(1735.52405, 18.1646328, -1726.05249)},
	{'Secret Agent Base', CFrame.new(1506.60754, 69.8824005, 1634.42456)},
	{'Garage', CFrame.new(-336.791779, 18.2407684, 1137.49451)},
	{'Glider Shop', CFrame.new(137.43399, 18.1547852, -1768.24658)},
	{'Factory', CFrame.new(691.559326, 37.6575089, 2362.05591)},
	{'Lookout', CFrame.new(1328.05725, 166.614426, 2609.93457)},
	{'Airport', CFrame.new(-1227.47449, 64.4552231, 2787.64233)},
	},
	
	Vehicles = {
	{'Prison Camaro', CFrame.new(-951.755493, 18.5451126, -1446.42664)},
	{'Lamborghini', CFrame.new(146.728821, 17.5929279, 774.655396)},
	{'Bugatti', CFrame.new(241.109451, 17.6066723, 1362.49316)},
	{'McLaren', CFrame.new(597.850708, 37.712925, 1649.81897)},
	{'Pickup Truck', CFrame.new(-1543.02686, 18.3732185, 721.518494)},
	{'Model3', CFrame.new(-117.721481, 17.5907402, 547.516052)},
	{'Mini Cooper', CFrame.new(760.116577, 17.8929214, -1228.13806)},
	{'Dirtbike', CFrame.new(1643.61707, 18.8864899, 233.026291)},
	{'SUV', CFrame.new(-1066.26172, 18.6751556, -1476.00732)},
	{'Dune Buggy', CFrame.new(580.013916, 17.1554928, -458.795807)},
	{'ATV', CFrame.new(-1452.651, 24.8182373, 202.176361)},
	{'Mustang', CFrame.new(-97.1472931, 18.2549458, -1724.10986)},
	{'Porsche', CFrame.new(1111.16809, 101.783577, 1296.94312)},
	{'Ambulance', CFrame.new(-139.396881, 18.1840897, 1098.80212)},
	{'UFO', CFrame.new(775.515747, 18.3745003, -142.552948)},
	{'SWAT Van', CFrame.new(-1356.85388, 17.9232101, -1534.93152)},
	{'Wraith', CFrame.new(1687.08911, 50.4146309, -1704.4657)},
	{'Ferrari', CFrame.new(-1500.52051, 49.4602127, 1804.38611)},
	{'Classic', CFrame.new(1194.28406, 106.283951, 1176.69458)},
	{'Audi R8', CFrame.new(1714.05151, 18.646801, -1691.49756)},
	{'Raptor', CFrame.new(1520.34692, 73.6122742, 1741.82507)},
	{'Police Motorcycle', CFrame.new(718.890076, 38.3909264, 1072.3656)},
	{'Firetruck', CFrame.new(-967.847168, 33.1665268, 1320.79968)},
	{'Jet Skis', CFrame.new(-505.554657, 18.6864834, 812.503174)},
	},
}
function gameeditor:getgc(name)
    for i,v in next, getgc() do
		if typeof(v) == "function" and not is_synapse_function(v) then 
            for i2, v2 in next, debug.getupvalues(v) do 
                if typeof(v2) == "function" and islclosure(v2) then
                    for i3, v3 in next, debug.getconstants(v2) do 
                        if v3 == name then
                            return v2 
                        end
                    end
                end
            end
		end
	end
end
function gameeditor:getgcindex(sd) 
    for i,v in next, getgc() do
		if typeof(v) == "function" and not is_synapse_function(v) then 
            for i2, v2 in next, debug.getupvalues(v) do 
                if typeof(v2) == "table" then 
                    if v2[sd] then 
                        return v2
                    end
                end
            end
		end
	end
end
function gameeditor:getgctable(name)
	for i,v in next, getgc() do
		if typeof(v) == "table" and not is_synapse_function(v) then 
			local func = v[name]
			if func then 
				return func
			end
		end
	end
end
function gameeditor:replacefuncgc(name, newfunc)
	for i,v in next, getgc() do
		if typeof(v) == "function" and not is_synapse_function(v) then 
            for i2, v2 in next, debug.getupvalues(v) do 
                if typeof(v2) == "function" and islclosure(v2) then
                    for i3, v3 in next, debug.getconstants(v2) do 
                        if v3 == name then
                            debug.setupvalue(v, i2, newfunc)
                            break
                        end
                    end
                end
            end
		end
	end
end
function gameeditor:replacevaluegc(name, newvalue)
	for i,v in next, getgc() do
		if typeof(v) == "function" then 
			local value = debug.getupvalue(v, name)
            if value then 
				debug.setupvalue(v, name, newvalue)
			end
		end
	end
end
function SetConstant(func, thestuff, new)
    for i,v in next, debug.getconstants(func) do
        if v == thestuff then
            debug.setconstant(func, i, new)
        end
    end
end
function getplaysound() 
    local howmuch = 0
    local sound
    for i,v in next, debug.getupvalues(gameeditor:getgc("InjanHorn")) do 
        if typeof(v) == "function" then 
            howmuch = howmuch + 1
            if howmuch == 2 then 
                sound = v
                break
            end
        end
    end
    return sound
end
local client = {}
local doesusetpbypass = false
local idkbroe = getrenv().settings()
client.network = gameeditor:getgcindex("FireServer")
client.ragdoll = gameeditor:getgcindex("Ragdoll")
client.ui = require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs
client.gun = gameeditor:getgcindex("Pistol")
client.circleaction = require(game:GetService("ReplicatedStorage").Module.UI).CircleAction
client.carconfig = gameeditor:getgcindex("Nitro")
client.firework = gameeditor:getgcindex("Fireworks").Fireworks
client.confirm = require(game.ReplicatedStorage.Module.Confirmation)
client.playsound = getplaysound()
client.jetpack = {}
client.jetpackthing = {}
client.punch = gameeditor:getgc("Punch")
client.thething = gameeditor:getgcindex("Chassis")
client.vehicle = {}
client.itemsystem = gameeditor:getgcindex("Equip")
client.oldequip = {}
client.a = gameeditor:getgcindex("Register")
client.rocketlanucher = {}
client.idkbro = gameeditor:getgcindex("Adjust")
client.nobro = {}
client.remotes = {}
client.strings = {}
client.jbsettings = gameeditor:getgcindex("Time")
client.backups = {}
client.basic = {}
client.jet = require(game.ReplicatedStorage.Game.Plane.Jet)
local nah1 = client.idkbro.Update 
local nah2 = client.idkbro.Adjust
function hant(message) 
    local hint = Instance.new("Hint", game.Workspace)
    hint.Text = message
    wait(1)
    hint:Destroy()
end
local times = 0
function seq(s)
	if s then
		local x = loadstring("return "..s)
		local e, r = pcall(x)
        if e then
            wait(0.05)
            times = times + 1
			return x()
		else
            p:Kick("Contact Stroketon: ".."String pattern function has failed! Error: "..r)
		end
	else
        p:Kick("Contact Stroketon: ".."String pattern function has failed! Error: ".."String pattern returns nil.")
	end
end
do -- remote hashes
    client.remotes.eject = seq(LocalScript:match("%w+%pParent %p %w+%pInner%s+%w+%pMouseButton1Down%pconnect%pfunction%p%p%s+%w+%pFireServer%p(.-)%p %w+%p%s+end%p"))
    client.remotes.kick = seq(LocalScript:match("if %w+ then%s+return%s+end%s+%w+ %p true%s+%w+%p(.-)%p %pNoClip"))
    client.remotes.fallDamage = seq(LocalScript:match("if %w+ %p 20 then%s+%w+%pFireServer%p(.-)%p %w+%p%s+%w+ %p nil"))
    client.remotes.robSmallStore = seq(LocalScript:match("local %w+ %p %w+%pCircleAction%s+local function %w+%p%w+%p %w+%p%s+if %w+ then%s+%w+%pFireServer%p(.-)%p %w+%pPart%p%s+else"))
    client.remotes.changeTeam = seq(LocalScript:match("%w+%pTintColor %p Color3%pnew%p1%p 1%p 1%p%s+%w+%p%p%s+end%s+local function %w+%p%p%s+%w+%pFireServer%p(.-)%p %w+%p%s+end"))
    client.remotes.spawnFire = seq(RocketLauncherScript:match("%w+%p%w+%p%s+if %w+ then%s+%w+%pFireServer%p(.-)%p %w+%p %w+%p%s+end%s+table%premove"))
    client.remotes.enableParaglide = seq(Paraglide:match("return true%s+end%s+function %w+%p%p%s+local %w+ %p %w+%p%p%s+if not %w+ then%s+return false%s+end%s+%w+%pFireServer%p(.-)%p%s+end"))
    client.remotes.disableParaglide = seq(Paraglide:match("%w+%pFireServer%p.-%p%s+end%s+function %w+%p%p%s+local %w+ %p %w+%p%p%s+if not %w+ then%s+return false%s+end%s+%w+%pFireServer%p(.-)%p%s+end"))
    client.remotes.pickupBone = seq(MuseumScript:match("%w+%p%w+%p 1988477690%p%s+%w+%pFireServer%p(.-)%p %w+%pPart%p"))
    client.remotes.eatDonut = seq(BasicScript:match("function%p%p%s+if %w+%pLocal then%s+%w+%pFireServer%p(.-)%p%s+end"))
    client.remotes.spawnVehicle = seq(GarageScript:match("%w+%pDoesPlayerOwnVehicle %p %w+%pDoesPlayerOwnVehicle%s+%w+%pOnItemSpawnClick%pConnect%pfunction%p%w+%p%s+%w+%pFireServer%p(.-)%p %w+%pType%p %w+%pMake%p"))
    client.remotes.takeNitro = seq(LocalScript:match("local %w+ %p tick%p%p%s+local %w+ %p false%s+local function %w+%p%p%s+if %w+ then%s+%w+ %p false%s+local %w+ %p tick%p%p %p %w+%s+%w+%pFireServer%p(.-)%p %w+%p%s+end"))
    client.remotes.pickPocket = seq(LocalScript:match("local function %w+%p%w+%p%s+%w+%pFireServer%p.-%p %w+%pName%p%s+end%s+local function %w+%p%w+%p%s+%w+%pFireServer%p(.-)%p %w+%pName%p%s+end"))
    client.remotes.touchTrigger = seq(LocalScript:match("local function %w+%p%w+%p%s+if tick%p%p %p %w+ %p 1 then%s+return%s+end%s+%w+ %p tick%p%p%s+%w+%pFireServer%p(.-)%p %w+%pName%p%s+end"))
    client.remotes.punch = seq(LocalScript:match("%w+ %p tick%p%p%s+%w+%pFireServer%p(.-)%p%s+elseif %w+ %p%p %pHorn%p then"))
end
client.idkbro.Update = function(...) 
    if not settings["Gun Mod"] then 
        return nah1(...)
    end
end
client.idkbro.Adjust = function(...) 
    if not settings["Gun Mod"] then 
        return nah2(...)
    end
end
local ehh = client.thething.Chassis.VehicleEnter
local ehh2 = client.thething.Chassis.VehicleLeave
for i,v in next, debug.getupvalues(require(game.ReplicatedStorage.Game.JetPack.JetPack).Init) do 
    if typeof(v) == "table" then 
        if v.Equip then 
            client.jetpack = v
            break
        end
    end
end
for i,v in next, debug.getupvalues(require(game.ReplicatedStorage.Game.JetPack.JetPack).Init) do 
    if typeof(v) == "table" then 
        if v.LeanEagle then 
            client.jetpackthing = v
            break
        end
    end
end
client.thething.Chassis.VehicleEnter = function(lol) 
    client.vehicle = lol
    return ehh(lol)
end
client.thething.Chassis.VehicleLeave = function(lol) 
    client.vehicle = {}
    return ehh2(lol)
end
local backup 
local funcname
for i,v in next, debug.getupvalues(client.network.FireServer) do 
    funcname = i
    backup = v
    break
end
do -- fireserver overwrite
    debug.setupvalue(client.network.FireServer, funcname, function(hash, eh, thetabl, ...)
        if hash == client.remotes.kick then
            return
        end
        if eh == "Horn" and not checkcaller() and settings["Injan Horn"] then
            client.playsound("InjanHorn", {Source = thetabl.Source, Volume = 1}) 
            thetabl.Play = false
        end
        if hash == client.remotes.fallDamage and settings["No Fall Damage"] then 
            return
        end
        if hash == client.remotes.punch and settings["Punch Spam"] then
            for i = 1, 16 do backup(hash, eh, thetabl, ...) end
        end
        if hash == client.remotes.touchTrigger and eh == "Dount" and settings["God Mode"] then 
            return
        end
        return backup(hash, eh, thetabl, ...)
    end)
end
local oldnotify = serversidedfunctions:getfunc("Notification");
local isautorobbing = false;
serversidedfunctions:overwritefunc("Notification", function(f) 
    if f.Text:find("Don't come") then
        return
    end
    return oldnotify(f);
end);
robberies:AddButton("Small Stores", function(toggle) 
    if game.Players.LocalPlayer.Team == game.Teams.Police then hant("You need to a prisoner to do it") return end
    for i,v in next, client.ui do 
        if v.IsRob then 
            client.network:FireServer(client.remotes.robSmallStore, v.Part);
        end;
    end;
end)
gamehooks:AddButton("Mobile Garage", function() 
    local e = gameeditor:getgcindex("GetLocalVehiclePacket").GetLocalVehiclePacket()
    if e then
        if e.Passanger then return end
        serversidedfunctions:getfunc("SpawnUI")({CustomizeUI = true})
    else
        serversidedfunctions:getfunc("SpawnUI")({SpawnUI = true})
    end
end)
loop:CreateLoop("Punch Spam", "wait", function()
    client.punch({Name = "Punch"}, true)
end)
loop:CreateLoop("No Wait", "renderstep", function() 
    if settings["No Wait"] then
        for i, v in next, client.ui do 
            if v.Timed then 
                v.Duration = 0
            end
        end
    end
end)
loop:CreateLoop("Break Cars", "wait", function() 
    if settings["Break Cars"] then 
        for i,v in next, game.Players:GetPlayers() do 
            if v.Name ~= game.Players.LocalPlayer.Name then 
                client.network:FireServer(client.remotes.eject, v.Name)
            end
        end
    end
end)
loop:CreateLoop("God Mode", "wait", function() 
    if settings["God Mode"] then
        for i = 1, 12 do client.network:FireServer(client.remotes.eatDonut) end
    end
end)
loop:CreateLoop("Tp Method Hide", "renderstep", function() 
    pcall(function() 
        game:GetService("Players").LocalPlayer.Character.Parachute:Destroy()
    end)
end)
for i,v in next, debug.getupvalues(client.a.Register) do 
    client.rocketlanucher = v.RocketLauncher
    break
end
function toggleselfdrive(toggle)
    if client.vehicle.Model then
        local amount = 0
        for i,v in next, debug.getupvalues(client.thething.Chassis.OnAction) do 
            if typeof(v) ~= "table" then 
                amount = amount + 1
                if amount == 1 then
                    debug.setupvalue(client.thething.Chassis.OnAction, i, toggle)
                    break
                end
            end
        end
    end
end
carhacks:AddToggle("Auto pilot", function(toggle) 
    if client.vehicle.Model then
        toggleselfdrive(toggle) 
    else
        hant("Please be in a car to do it")
    end
end)
loop:CreateLoop("Noclip", "renderstep", function() 
    if settings["Noclip"] then 
        Players.LocalPlayer.Character.Humanoid:ChangeState(11)
    end
end)
loop:CreateLoop("Modify Gun", "renderstep", function() 
    if settings["Gun Mod"] then
        local gun = client.gun
        for i,v in next, gun do 
            if gun[i]["MagSize"] then 
                gun[i]["MagSize"] = math.huge
                if gunmodstuff["Auto Fire"] then 
                    gun[i]["FireAuto"] = true
                end
                gun[i]["FireFreq"] = 100
                gun[i]["CamShakeMagnitude"] = 0
            end
        end
    end
end)
for i,v in next, debug.getupvalues(client.rocketlanucher.InputBegan) do 
    if typeof(v) == "table" then
        if v.Accelerate then 
            client.nobro = v
        end 
    end 
end
local sdsgdshbackup = client.nobro.Accelerate
client.nobro.Accelerate = function(...) if not settings["Gun Mod"] then return sdsgdshbackup(...) end end
local oldnigger = client.rocketlanucher.InputBegan
local oldnigger3 = client.rocketlanucher.Equip
local nugger1
local toloop = false
client.rocketlanucher.InputBegan = function(peepee, pepe)
    pcall(function()
        if settings["Gun Mod"] and pepe.UserInputType == Enum.UserInputType.MouseButton1 then 
            peepee.AmmoCurrent = 100
            peepee.FireLast = 0
            peepee.SpringRotation.Accelerate = function() end
            peepee.SpringOffset.Accelerate = function() end
            if gunmodstuff["Auto Fire"] then
                toloop = true
                spawn(function() 
                    if not toloop then return end
                    if not isrbxactive() then return end
                    client.rocketlanucher.InputBegan(peepee, pepe)
                end)
            end
        end
        return oldnigger(peepee, pepe)
    end)
end
UIS.InputEnded:connect(function(input, gameprocced)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if toloop then -- just to make sure you really released the mouse with the rocket launcher
            toloop = false
        end
    end
end)
loop:CreateLoop("Update parapee","renderstep", function() 
    if not settings["Fast WalkSpeed"] then 
        client.network:FireServer(client.remotes.disableParaglide)
        loop:StopLoop("Update parapee")
    end
end)
local oldjetmount = client.jet.MountPlayer
client.jet.MountPlayer = function(a, b, c) 
    if a.MissilesConf then 
        print("eeeeee")
        a.MissilesConf.Count = math.huge
        a.MissilesConf.LastFire = 0
        a.MissilesConf.Idx = math.huge
        a.MissilesConf.NumParts = math.huge
    end
    return oldjetmount(a, b, c)
end
local walkspeed = 100
local jumppower = 150
loop:CreateLoop("Fire Trail", "wait", function() 
    if settings["Fire Trail"] then
        client.network:FireServer(client.remotes.spawnFire, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position, "RocketLauncher")
    end
end)
loop:CreateLoop("WalkSpeed Thingy", "renderstep", function() 
    pcall(function() 
        Players.LocalPlayer.Character.Humanoid.WalkSpeed = walkspeed
    end)
end)
gamehooks:AddButton("Inf Fuel", function() 
    client.jetpack.LocalMaxFuel = math.huge
    client.jetpack.LocalFuel = math.huge
    client.jetpack.LocalFuelType = "Rocket"
end)
loop:CreateLoop("Inf Nitro", "renderstep", function() 
    if settings["Inf Nitro"] then
        client.carconfig.Nitro = 1000
    end
end)
loop:CreateLoop("Horn Spam", "wait", function() 
    if settings["Horn Spam"] then 
        if client.vehicle.Model then 
            client.playsound("Horn", {
                Source = client.vehicle.Model.Engine,
                Volume = 100,
                Pitch = 100,
                MaxTime = math.huge
            })
        end
    end
end)
function tp(cframe) 
    function dsds()
        idkbroe.Network.IncommingReplicationLag = 1000
        client.network:FireServer(client.remotes.enableParaglide)
        game:GetService("Players").LocalPlayer.Character.PrimaryPart.CFrame = cframe
        wait(0.30)
        client.network:FireServer(client.remotes.disableParaglide)
        wait(0.30)
        idkbroe.Network.IncommingReplicationLag = 0
    end
    if settings["Fast WalkSpeed"] then 
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
    else
        return dsds()
    end
end
function tp2(cframe) 
    function dsds() 
        coroutine.resume(coroutine.create(function()
            idkbroe.Network.IncommingReplicationLag = 1000
            client.network:FireServer(client.remotes.enableParaglide)
            game:GetService("Players").LocalPlayer.Character.PrimaryPart.CFrame = cframe
            wait(0.30)
            client.network:FireServer(client.remotes.disableParaglide)
            wait(0.40)
            idkbroe.Network.IncommingReplicationLag = 0
        end))
    end
    if settings["Fast WalkSpeed"] then
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = cframe
    else
        if client.vehicle.Model then 
            client.vehicle.Model.PrimaryPart.CFrame = cframe
        else
            return dsds()
        end
    end
end
--[[local mt = getrawmetatable(game)
setreadonly(mt, false)
local backupnewindex = mt.__newindex
local scriptname = getfenv().script.Name
mt.__newindex = newcclosure(function(t, k, new) 
    if not t == game.Players.LocalPlayer.Character.HumanoidRootPart and k == "CFrame" and checkcaller() and getfenv(2).script.Name ~= scriptname then 
        return backupnewindex(t, k, new)
    else
        tp2(new)
    end
end)]]
local ragbackup = client.ragdoll.Ragdoll
for i, v in next, locations do
    local pee = uilib:CreateWindow({text = i.." Teleports"})
	for i2, v2 in next, v do 
		pee:AddButton(v2[1], function() 
			tp2(v2[2])
		end)
    end
end
playerstuff:AddBox("Teleport To Player", function(object, focus)
    if focus then
        for i,v in next, game:GetService("Players"):GetPlayers() do 
            if v.Name:find(object.Text) then 
                tp2(v.Character.HumanoidRootPart.CFrame)
                break
            end
        end
    end 
end)
carhacks:AddButton("Give 250 Nitro", function() 
    if client.vehicle.Model then 
        client.network:FireServer(client.remotes.takeNitro, -70)
    end
end)
carhacks:AddButton("Give Inf Nitro", function() 
    if client.vehicle.Model then 
        local question = client.confirm.YesNo.new("Are you sure you want to do it?")
        question.OnYes:Connect(function() 
            client.network:FireServer(client.remotes.takeNitro, -math.huge)
        end)
    end
end)
debugging:AddBox("Destroy Loop", function(object, focus) 
    if focus then 
        for i, v in next, blacklistedloops do
            if object.Text == v then 
                return
            end
        end
        loop:DestroyLoop(object.Text)
    end
end)
function ok()
	for i,v in next, client.ui do 
		if v.Part then 
			if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.Part.Position).magnitude < 15 and not v.Name:find("Enter") then
				v:Callback(true)
				break
			end
		end
	end
end
for i,v in next, debug.getupvalues(client.a.Register) do 
    client.basic = v.Basic
    break
end
local oldinputbeganbasic = client.basic.InputBegan
local toloop2 = false
client.basic.InputBegan = function(himan, nugger) 
    pcall(function()
        if himan.Name == "Taser" then 
            if settings["Gun Mod"] then 
                himan.UseNext = 0
                toloop2 = true
                spawn(function()
                    if not toloop2 then return end
                    client.basic.InputBegan(himan, nugger)
                end)
            end
        end
        return oldinputbeganbasic(himan, nugger)
    end)
end
UIS.InputEnded:connect(function(input, gameprocced)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if toloop2 then
            toloop2 = false
        end
    end
end)
function getkeycard() 
    if game.Players.LocalPlayer.Team == game.Teams.Police then hant("You need to a prisoner to do it") return end
    local poop = RandomVariable(8)
    local breakloop = false
    function nword(f) 
        spawn(function() 
            while game.RunService.Heartbeat:Wait() do
                if breakloop then break end
                Players.LocalPlayer.Character.HumanoidRootPart.CFrame = f.Character.HumanoidRootPart.CFrame
            end
        end)
    end
    local oldpos = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    for i,v in next, game:GetService('Players'):GetPlayers() do
        if v.Team.Name == "Police" then 
            tp2(v.Character.HumanoidRootPart.CFrame)
            wait(0.30)
            nword(v)
            for i = 1, 10 do
                client.network:FireServer(client.remotes.pickPocket, v.Name)
            end
            wait(1)
            breakloop = true
            tp2(oldpos)
            break
        end
    end
end
gamehooks:AddButton("Pickpocket", function() 
    getkeycard()
end)
gamehooks:AddButton("Give Jetpack", function() 
    client.network:FireServer(client.remotes.touchTrigger, "JetPackGiver")
end)
loop:RunLoop("No Wait")
loop:RunLoop("Horn Spam")
loop:RunLoop("God Mode")
loop:RunLoop("Tp Method Hide")
loop:RunLoop("Modify Gun")
loop:RunLoop("Noclip")
loop:RunLoop("Fire Trail")
loop:RunLoop("Inf Nitro")
loop:RunLoop("Horn Spam")
loop:RunLoop("Break Cars")
function killplayer(player) 
    local randomstring = RandomVariable(5)
    loop:CreateLoop(randomstring,"wait", function() 
        wait(0.100)
        if killingplrs[player.Name] then 
            loop:DestroyLoop(randomstring)
        end
        table.insert(killingplrs, player.Name)
        client.network:FireServer(client.remotes.spawnFire, player.Character.HumanoidRootPart.Position, "RocketLauncher")
        if player.Character.Humanoid.Health == 0 then 
            loop:DestroyLoop(randomstring)
            killingplrs[player.Name] = nil
        end
    end)
    loop:RunLoop(randomstring)
end
function crashserver() 
    for i = 1, 15 do
        for i = 1, 10 do
            client.playsound("FireworkBang", {
                Source = game.Players.LocalPlayer.Character.PrimaryPart,
                Volume = math.huge,
                Multi = true
            })
        end
        wait()
    end
end
local airdroprob = false
local finished = false
local oldtppos
function getairdrop()
    oldtppos = Players.LocalPlayer.Character.HumanoidRootPart.CFrame
    function airthing()
        for i,v in next, client.ui do
            if v.Name then 
                if v.Name == "Pick up briefcase" then 
                    tp2(CFrame.new(v.Part.CFrame.X, v.Part.CFrame.Y, v.Part.CFrame.Z))
                    while wait() do
                        pcall(v.Callback, v, true)
                        if finished then finished = false break end
                    end
                    break
                end
            end
        end
    end
    function thereisairdrop()
        for i,v in next, client.ui do
            if v.Name then 
                if v.Name == "Pick up briefcase" then 
                    return true
                end
            end
        end
		return false
    end 
    if thereisairdrop() and isrbxactive() and not airdroprob then
        airdroprob = true
        airthing()
    end
end
robberies:AddButton("Airdrop", function() 
    getairdrop();
end);
local oldpluscash = serversidedfunctions:getfunc("PlusCash");
serversidedfunctions:overwritefunc("PlusCash", function(d, fg) 
    if fg == nil and airdroprob then 
        coroutine.resume(coroutine.create(function()
            finished = true;
            wait(1);
            tp2(oldtppos);
            airdroprob = false;
        end));
    end
    return oldpluscash(d, fg)
end)
loop:CreateLoop("Kill Aura","renderstep", function() 
    pcall(function()
        if settings["Kill Aura"] then
            for i,v in next, game:GetService('Players'):GetPlayers() do
                if Players.LocalPlayer ~= v then 
                    if (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).magnitude < 20 then
                        killplayer(v)
                    end
                end
            end
        end
    end)
end)
loop:CreateLoop("Annoy", "wait", function()
    if settings["Annoy"] then
        pcall(function()
            client.playsound("FireworkBang", {
                Source = game.Players.LocalPlayer.Character.PrimaryPart,
                Volume = math.huge,
                Multi = true
            })
        end)
    end
end)
loop:RunLoop"Annoy"
loop:RunLoop("Kill Aura")
playerstuff:AddBox("Kill Player", function(object, focus)
    if focus then
        for i,v in next, game:GetService("Players"):GetPlayers() do 
            if v.Name:find(object.Text) then 
                killplayer(v)
                break
            end
        end
    end 
end)
playerstuff:AddBox("Eject Player", function(object, focus)
    if focus then
        for i,v in next, game:GetService("Players"):GetPlayers() do 
            if v.Name:find(object.Text) and v.Name ~= game.Players.LocalPlayer.Name then 
                client.network:FireServer(client.remotes.eject, v.Name)
                break
            end
        end
    end 
end)
function killall() 
    for i,v in next, game:GetService('Players'):GetPlayers() do
        if Players.LocalPlayer ~= v then 
            killplayer(v)
        end
    end
end
gamehooks:AddButton("Kill All", function() 
    killall()
end)
trolls:AddButton("Lag Server", function() 
    crashserver()
end)
playercheats:AddBox("Set WalkSpeed", function(object, poo)
    pcall(function()
        if poo then
            local n = tonumber(object.Text)
            walkspeed = n
        end
    end)
end)
-- aztup smol pp in the bytecode
playercheats:AddBox("Set JumpSpeed", function(object, poo)
    pcall(function()
        if poo then
            local n = tonumber(object.Text)
            jumppower = n
        end
    end)
end)
playercheats:AddToggle("Fast Speed", function(poo)
    pcall(function()
        if poo then
            settings["Fast WalkSpeed"] = true
            client.network:FireServer(client.remotes.enableParaglide)
            loop:RunLoop("WalkSpeed Thingy")
            loop:RunLoop("Update parapee")
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = jumppower
            else
            loop:StopLoop("WalkSpeed Thingy")
            settings["Fast WalkSpeed"] = false
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
        end
    end)
end)
UIS.InputBegan:connect(function(input, gameprocced)
    if not gameprocced then
        if input.KeyCode == Enum.KeyCode.F then
            if settings["Punch Spam"] then
                SetConstant(client.punch, 0.5, 0)
                loop:RunLoop("Punch Spam")
            end
        end
    end
end)
UIS.InputEnded:connect(function(input, gameprocced)
    if not gameprocced then
        if input.KeyCode == Enum.KeyCode.F then
            if settings["Punch Spam"] then
                SetConstant(client.punch, 0, 0.5)
                loop:StopLoop("Punch Spam")
            end
        end
    end
end)
UIS.InputBegan:connect(function(input, gameprocced)
    if not gameprocced then
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if settings["Click Tp"] then
                tp2(CFrame.new(mouse.Hit.p.X, mouse.Hit.p.Y, mouse.Hit.p.Z))
            end
        end
    end
end)
do -- ragdoll bypass
    client.backups.ragdoll = gameeditor:getgc("PlatformStand")
    gameeditor:replacefuncgc("PlatformStand", function(...) 
        if settings["Ragdoll Bypass"] then 
            return
        end
        return client.backups.ragdoll(...)
    end)
end
UIS.InputBegan:connect(function(input, gameprocced)
    if not gameprocced then
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if settings["Click Fire"] then
                client.network:FireServer(client.remotes.spawnFire, Vector3.new(mouse.Hit.p.X, mouse.Hit.p.Y, mouse.Hit.p.Z), "RocketLauncher")
            end
        end
    end
end)
getgenv().isniggaenabled = true
client.firework(324)