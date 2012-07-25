--[[

  Merchant Gilbert

  Copyright (C) 2012 Erik Schilling
  Copyright (C) 2012 Jessica Tölke

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <http://www.gnu.org/licenses/>.

--]]

local function merchantTalk(npc, ch)
    local function say(message)
        npc_message(npc, ch, message)
    end

    say("Welcome to my little shop! I'm sure you're interested in the high quality armor I'm selling. Do you really want to get into a battle with those wastage you got in the casern? Have a look at what I have to offer... it might save your life!")

    local choices = { "Show me your goods.",
                    "I'm not interested." }

    local res = npc_choice(npc, ch, choices)

    if res == 1 then
        npc_trade(npc, ch, false, {
            { "Iron Helmet", 10, 2000 },
            { "Iron Armor", 10, 5000 },
            { "Iron Gloves", 10, 1000 }})
    elseif res == 2 then
        say("Come back when you change your mind!")
    end
end

local merchant = create_npc_by_name("Gilbert", merchantTalk)
