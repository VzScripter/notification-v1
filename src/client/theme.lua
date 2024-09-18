Theme = {}

function Theme:constructor()
    self.themes = {
        ['white'] = {
            background = {210, 210, 210, 1};
            text = {48, 48, 48, 1};
            div = {0, 0, 0, 0.05};

            defaultType = {17, 17, 17};

            next = 'dark';
        };

        ['dark'] = {
            background = {17, 17, 17, 1};
            text = {154, 154, 154, 1};
            div = {255, 255, 255, 0.05};

            defaultType = {255, 255, 255};

            next = 'white';
        };
    };

    local defaultTheme = (self.themes[settings.defaultTheme] and settings.defaultTheme or 'dark')

    if (fileExists('theme.json')) then
        local saveFile = fileOpen('theme.json')
        local data = fileRead(saveFile, fileGetSize(saveFile))
        fileClose(saveFile)

        if (data) then
            local data = fromJSON(data)

            if (data.theme) then
                if (self.themes[data.theme]) then
                    self.theme = data.theme
                else
                    self.theme = defaultTheme
                end
            end
        end
    else
        local saveFile = fileCreate('theme.json')

        fileWrite(saveFile, toJSON({theme = defaultTheme}))
        fileClose(saveFile)

        self.theme = defaultTheme
    end
end

function Theme:set(theme)
    if (theme == 'next') then
        if (not self.themes[self.theme].next) then
            return
        end

        self.theme = self.themes[self.theme].next
    else
        self.theme = theme
    end

    local saveFile = (fileExists('theme.json') and fileOpen('theme.json') or fileCreate('theme.json'))

    fileWrite(saveFile, toJSON({theme = self.theme}))
    fileClose(saveFile)

    return Notification:updateTheme(self.themes[self.theme])
end

function Theme:get()
    return self.themes[self.theme]
end