os.loadAPI("sys/mtext")
os.loadAPI("sys/help")
os.loadAPI("system_notes")
if fs.exists("sys/bluenet") then --functions/wireless
    bluenet=os.loadAPI("sys/bluenet")
end
--[[
if fs.exists(?) then
    os.loadAPI(?)
end]]--

function dolua(inputb, user)
    if inputb=="help" then --note, make an array for the help list. maybe make it its own file too.
            help.help()
        
        elseif inputb=="chat" then 
                if not bluenet then
                    if not http then
                        mtext.mprint("This function requires an undownloaded library and HTTP is inacessable")
                    end
                    mtext.mprint("Warning; This function requires an undownloaded library. Download now?")
                    mtext.mwrite(" y / n ")
                    input=read()
                    if string.lower(input)=='y' then
                            github(system_notes.dir,'function/wireless')
                            bluenet.Internet()
                    elseif string.lower(input)=='n' then
                            mtext.mprint("Aborting.")
                    else
                            mtext.mprint("Unknown input")
                    end

                elseif fs.exists("bluenet") then
                    bluenet.Internet()
                else
                    permerr()
                end

        elseif inputb=="exit" then 
            if user>=2 then
                    error("Process forcefully ended")
                else
                    os.shutdown()
            end
        
        elseif inputb=="run" then 
            if user>=1 then
                    mtext.mprint("What do you wish to run?")
                    mwrite("Note: type the whole command, like \n'>chat host Internet Link'\n>") --too lazy to check for args.
                    shell.openTab(read())
                else
                    permerr()
            end
            
        elseif inputb=="discord" then 
            mtext.mprint("Join the discord that i for some reason made for this repo!")
            mtext.mprint("https://discord.gg/MYyHVzB")

        elseif inputb=="reboot" then 
            os.reboot()
                            
        elseif inputb=="clear" then
            term.clear()

        elseif inputb=="timer" then
            if monitors then
                    mon.clear()
                    timer()
                    mon.clear()
				else
					timer()
			end

        elseif inputb=="math" then
            shell.openTab(calc.calc())

        elseif inputb=="function" then 
            if user>=1 then
                    shell.openTab(dofun())
                else
                    permerr()
            end

        elseif inputb=="logistic" then
            LPmonitor()
		elseif inputb=="license" then
            github("","",nil,nil,nil,"r")
        else
            printError("what")
    end
end

function permerr()
    mtext.mprint("WARNING: INSUFFICIENT PERMMISIONS\n YOUR LEVEL: "..user.."\n>")
end