function ToggleBroadcast(title, msg, bottom, time)
    local scaleform = RequestScaleformMovie("breaking_news")

    while not HasScaleformMovieLoaded(scaleform) do
        Wait(10)
    end
    
    title = title or Config.DefaultTitle
    msg = msg or Config.DefaultMessage
    bottom = bottom or Config.DefaultBottomMessage
    time = time or Config.DefaultTime

    PushScaleformMovieFunction(scaleform, "breaking_news")
    PopScaleformMovieFunctionVoid()
    
    BeginScaleformMovieMethod(scaleform, 'SET_TEXT')
    PushScaleformMovieMethodParameterString(msg)
    PushScaleformMovieMethodParameterString(bottom)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, 'SET_SCROLL_TEXT')
    PushScaleformMovieMethodParameterInt(0)
    PushScaleformMovieMethodParameterInt(0)
    PushScaleformMovieMethodParameterString(title)
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scaleform, 'DISPLAY_SCROLL_TEXT')
    PushScaleformMovieMethodParameterInt(0)
    PushScaleformMovieMethodParameterInt(0)
    EndScaleformMovieMethod()

    Citizen.CreateThread(function()
        local time = time * 1000
        local start = GetGameTimer()
        while GetGameTimer() - start < time do
            DrawScaleformMovieFullscreen(scaleform, 255, 255, 255, 255)
            Citizen.Wait(0)
        end
    end)
end

function displayNews(title, msg, bottom, time)
    TriggerServerEvent("cfx-tcd-newsDisplay:Server:Broadcast", title, msg, bottom, time)
end

RegisterNetEvent("cfx-tcd-newsDisplay:Client:Broadcast")
AddEventHandler("cfx-tcd-newsDisplay:Client:Broadcast", function(title, msg, bottom, time)
    ToggleBroadcast(title, msg, bottom, time)
end)

exports("displayNews", displayNews)

RegisterCommand("news", function(source, args)
    displayNews("Test Title", "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", "Test Bottom Message", 10)
end, false)