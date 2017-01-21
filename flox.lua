local flox = {}

flox.version = "0.1"
flox.baseURL = "https://www.flox.cc/api"

-- b, c, h = http.request("http://www.example.com/private/index.html")
	
local sInitialized = false

local sGameID,sGameKey,sGameVersion
local sRestService

local function createRestService(baseURL, gameID, gameKey)
	local svc = {
		url = baseURL,
		gameID = gameID,
		gameKey = gameKey,
		alwaysFail = false,
		processingQueue = false
		-- TODO create queue
		-- TODO create cache
	}

	return svc
end

local function startNewGameSession()

end

local function playerLogin()

end


-----------------------------------
-- PUBLIC API ---------------------
-----------------------------------

flox.init = function(gameID, gameKey, gameVersion)
	if sInitialized then error("Flox is already initialized!") end
	if gameID == nil or gameKey == nil or gameVersion == nil then error("All arguments must have a value") end

	-- if ("preventBackup" in SharedObject)
	-- SharedObject["preventBackup"] = true;

	-- registerClassAlias(GameSession);
	-- registerClassAlias(Authentication);
	-- registerClassAlias(Player);
	-- registerClassAlias(Score);

	-- monitorNativeApplicationEvents(true);
	-- SharedObjectPool.startAutoCleanup();

	sInitialized = true
	sGameID = gameID
	sGameKey = gameKey
	sGameVersion = gameVersion

	sRestService = createRestService(baseURL, gameID, gameKey);
	--sPersistentData = SharedObject.getLocal("Flox." + gameID);

	if sPlayer == nil or sAuthentication == null then playerLogin() end

	startNewGameSession();

	flox.logInfo("Game started");
end

flox.logInfo = function(msg)
	-- TODO save this log to the server
	print("Flox::[Info] "..msg)
end

return flox
