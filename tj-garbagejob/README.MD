# Made By: TJ Developments (TKiljoy & KingJamesTheDev)

# GuidLines:
**You May NOT Repost This Script On ANY platform Without Our Written Consent To Do So.**
**You May NOT Take This Script And Say The Contents Are Yours And You Made It.**
**You May Make Your Own Addtions To This Script But You May NOT Repost This Script With Your Addtions To ANY Platform.**


# Notes:
* **Just A Little Note That We Are Always Open To Any Additions You Want To Make, But For Them To Be Added Publicly You May** 
* **Send Us These Additions So We Can Add Them To Our Updates With Credits To The Respective Collaborators.**


# Dependencies
* [QBCore-Framework] https://github.com/qbcore-framework
* [QB-Target] https://github.com/BerkieBb/qb-target



# How To Install:

**1:  Before Starting tj-garbagejob You Must Add The Job First, To Do So Go Into [qb]/qb-core/shared/jobs.lua**
    **And Paste The Following**
```lua
    ['garbageman'] = {
		label = 'GarbageMan',
		defaultDuty = false,
		offDutyPay = false,
		grades = {
            ['0'] = {
                name = 'Garbage Man',
                payment = 10
            },
        },
	},
```
**2: For tj-garbagejob to work you must also add this to your [qb]/qb-radialmenu/config.lua under Config.JobInteractions**
```lua
    ["garbageman"] = {
        {
            id = 'startroute',
            title = 'Start Route',
            icon = 'car',
            type = 'client',
            event = 'tj-garbagejob:client:startroute',
            shouldClose = true
        }
    },
```

**3: Install qb-target as this is a dependency if you want to use 'Third Eye Support"**
    **Info On How To Use Third Eye Support Will Be on The "How To Use" Section Of This README.MD**

**4: Paste tj-garbagejob In Your [qb] Folder In Resources And Ensure It To Your Server.cfg If [qb] Is Not Already Ensured** 






# How To Use:

**Everything Is Done Within The Config.lua, DO NOT Edit The Files Other Then The Config If You Don't Know What Your Are Doing. We Are Not Responsible If Something Breaks When You Do This.**


# Custom Work

**Want Custom Work From Us? Join Our Discord And Make A Ticket On What You Want And Pricing Will Be Discust Once An Agreement Is Made.**

# THANK YOU!
**Thanks For Downloading Our Script! This Script Is A ReCoded Version Of The QBCore Garbage Job With Extended Features.**
**Please Make Sure To Join Our Discord To Know When We Add More Resources To The CFX Community!** 

# **Discord:** https://discord.gg/P62dDZmqMY
