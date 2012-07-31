--[[

  Libary for handling rebel patrols

  Copyright (C) 2012 Erik Schilling

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

require "scripts/functions/guardpatrol"
require "scripts/functions/reputation"

RebelPatrol = {}
setmetatable(RebelPatrol, {__index=GuardPatrol})
local mt = {__index=RebelPatrol}

function RebelPatrol:new(name, track_range, min_reputation)
    local patrol = GuardPatrol:new(name, track_range)
    setmetatable(patrol, mt)
    patrol.min_reputation = min_reputation
    return patrol
end

function RebelPatrol:isAggressiveAgainst(being)
    if not (being_type(being) == TYPE_CHARACTER and
            being_get_base_attribute(being, 13) > 0) then
        return false
    end

    local reputation = tonumber(chr_try_get_quest(being, "rebel_reputation"))
    if not reputation then
        return false
    end

    if reputation < self.min_reputation then
        return true
    end
    return false
end
