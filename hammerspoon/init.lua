-- -- 自动重新加载config
function reloadConfig(files)
	local doReload = false
	for _, file in pairs(files) do
		if file:sub(-4) == ".lua" then
			doReload = true
		end
	end
	if doReload then
		hs.reload()
	end
end
hs.pathwatcher.new(os.getenv("HOME") .. "/.hammerspoon/", reloadConfig):start()

function searchFromClipboard(url)
	-- 获取剪贴板内容
	local clipboardContent = hs.pasteboard.getContents()
	if clipboardContent then
		-- 对剪贴板内容进行 URL 编码
		local encodedContent = hs.http.encodeForQuery(clipboardContent)
		-- 构造谷歌搜索 URL
		local searchURL = url .. encodedContent
		-- 在默认浏览器中打开 URL
		hs.urlevent.openURL(searchURL)
	else
		-- 如果剪贴板为空，则显示通知
		hs.notify.new({ title = "Hammerspoon", informativeText = "Clipboard is empty" }):send()
	end
end

function searchGoogleFromClipboard()
	searchFromClipboard("https://www.google.com/search?q=")
end

function searchYoutubeFromClipboard()
	searchFromClipboard("https://www.youtube.com/results?search_query=")
end

hs.hotkey.bind({ "cmd", "ctrl" }, "g", searchGoogleFromClipboard)
hs.hotkey.bind({ "cmd", "ctrl" }, "y", searchYoutubeFromClipboard)

-- 从剪贴板获取内容并模仿打字出来
hs.hotkey.bind({ "cmd", "ctrl" }, "v", function()
	hs.eventtap.keyStrokes(hs.pasteboard.getContents())
end)

-- 加载 Caffeine.spoon
hs.loadSpoon("Caffeine")

-- 在菜单栏添加一个图标来控制 Caffeine.spoon
spoon.Caffeine:bindHotkeys({
	toggle = { { "cmd", "ctrl" }, "C" },
})

-- 启动 Caffeine.spoon 并设置默认状态
spoon.Caffeine:start()

-- 显示通知以确认配置已加载
hs.notify.new({ title = "Hammerspoon", informativeText = "Configuration Loaded" }):send()