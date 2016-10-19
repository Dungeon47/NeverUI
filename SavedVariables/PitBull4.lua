
PitBull4DB = {
	["namespaces"] = {
		["LeaderIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["position"] = 1.00002,
						},
						["Player"] = {
							["position"] = 1.00002,
						},
						["FocusTarget"] = {
							["enabled"] = false,
							["position"] = 1.00002,
						},
						["Raid"] = {
							["position"] = 1.00002,
						},
					},
				},
			},
		},
		["LibDualSpec-1.0"] = {
		},
		["RangeFader"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["enabled"] = true,
						},
						["Player"] = {
							["enabled"] = true,
						},
						["FocusTarget"] = {
							["enabled"] = true,
						},
						["Raid"] = {
							["enabled"] = true,
							["check_method"] = "helpful",
						},
					},
				},
			},
		},
		["Border"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["normal_texture"] = "Blizzard Tooltip",
							["size"] = 20,
							["normal_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
							},
							["padding"] = 5,
							["boss_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
							},
						},
						["Player"] = {
							["normal_texture"] = "Blizzard Tooltip",
							["padding"] = 5,
							["normal_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
							},
							["size"] = 20,
						},
						["FocusTarget"] = {
							["normal_texture"] = "Blizzard Tooltip",
							["size"] = 20,
							["normal_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
							},
							["padding"] = 5,
							["boss_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
							},
						},
						["Raid"] = {
							["normal_texture"] = "Blizzard Tooltip",
							["size"] = 20,
							["normal_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
							},
							["padding"] = 5,
							["boss_color"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
							},
						},
					},
				},
			},
		},
		["PhaseIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["position"] = 1.00001,
						},
						["Player"] = {
							["position"] = 1.00001,
						},
						["FocusTarget"] = {
							["enabled"] = false,
							["position"] = 1.00001,
						},
						["Raid"] = {
							["position"] = 1.00001,
						},
					},
				},
			},
		},
		["ComboPoints"] = {
			["profiles"] = {
				["NeverUI_HE"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI_test"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
			},
		},
		["RoleIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["enabled"] = false,
							["position"] = 1.00001,
							["location"] = "edge_left",
							["size"] = 1.2,
						},
						["Player"] = {
							["enabled"] = false,
							["location"] = "edge_left",
							["size"] = 1.2,
						},
						["FocusTarget"] = {
							["enabled"] = false,
							["location"] = "edge_left",
						},
						["Raid"] = {
							["location"] = "edge_left",
							["size"] = 0.8,
						},
					},
				},
			},
		},
		["LuaTexts"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Normal"] = {
							["first"] = false,
							["elements"] = {
								["Lua:Eclipse"] = {
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "return math.abs(Power(unit,SPELL_POWER_ECLIPSE))\n",
									["location"] = "center",
									["attach_to"] = "Eclipse",
								},
								["Lua:Power"] = {
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return \"%s/%s\",Power(unit),max\nend",
									["location"] = "right",
									["attach_to"] = "PowerBar",
								},
								["Lua:Reputation"] = {
									["events"] = {
										["UNIT_FACTION"] = true,
										["UPDATE_FACTION"] = true,
									},
									["exists"] = true,
									["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode() \nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
									["location"] = "center",
									["attach_to"] = "ReputationBar",
								},
								["Lua:Name"] = {
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
										["UNIT_NAME_UPDATE"] = true,
									},
									["exists"] = true,
									["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
									["location"] = "left",
									["attach_to"] = "HealthBar",
								},
								["Lua:Threat"] = {
									["events"] = {
										["UNIT_THREAT_LIST_UPDATE"] = true,
										["UNIT_THREAT_SITUATION_UPDATE"] = true,
									},
									["exists"] = true,
									["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ThreatBar",
								},
								["Lua:Experience"] = {
									["events"] = {
										["UNIT_PET_EXPERIENCE"] = true,
										["PLAYER_XP_UPDATE"] = true,
									},
									["exists"] = true,
									["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ExperienceBar",
								},
								["Lua:Cast"] = {
									["events"] = {
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
									},
									["exists"] = true,
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell \n  end\nend\nreturn ConfigMode()",
									["location"] = "left",
									["attach_to"] = "CastBar",
								},
								["Lua:Alternate power"] = {
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "AltPowerBar",
								},
								["Lua:Cast time"] = {
									["events"] = {
										["UNIT_SPELLCAST_SUCCEEDED"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
									["exists"] = true,
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "CastBar",
								},
								["Lua:Health"] = {
									["events"] = {
										["UNIT_HEALTH"] = true,
										["UNIT_AURA"] = true,
										["UNIT_MAXHEALTH"] = true,
									},
									["exists"] = true,
									["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nlocal cur, max = HP(unit), MaxHP(unit)\nreturn \"%s/%s || %s%%\",Short(cur,true),Short(max,true),Percent(cur,max)",
									["location"] = "right",
									["attach_to"] = "HealthBar",
								},
								["Lua:PVPTimer"] = {
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
									},
									["exists"] = true,
									["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
									["location"] = "out_right_top",
								},
								["Lua:Class"] = {
									["events"] = {
										["UNIT_LEVEL"] = true,
										["UNIT_CLASSIFICATION_CHANGED"] = true,
										["UNIT_AURA"] = true,
									},
									["exists"] = true,
									["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
									["location"] = "left",
									["attach_to"] = "PowerBar",
								},
								["Lua:Druid mana"] = {
									["events"] = {
										["UNIT_DISPLAYPOWER"] = true,
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
									["location"] = "center",
									["attach_to"] = "DruidManaBar",
								},
								["Lua:Demonic fury"] = {
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "return \"%s/%s\",Power(unit,SPELL_POWER_DEMONIC_FURY),MaxPower(unit,SPELL_POWER_DEMONIC_FURY)\n",
									["location"] = "center",
									["attach_to"] = "DemonicFury",
								},
							},
						},
						["Player"] = {
							["first"] = false,
							["elements"] = {
								["Lua:Eclipse"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_POWER_FREQUENT"] = true,
										["UNIT_MAXPOWER"] = true,
									},
									["code"] = "return math.abs(Power(unit,SPELL_POWER_ECLIPSE))\n",
									["location"] = "center",
									["attach_to"] = "Eclipse",
								},
								["Lua:Name"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
										["UNIT_NAME_UPDATE"] = true,
									},
									["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
									["location"] = "left",
									["attach_to"] = "HealthBar",
								},
								["Lua:Reputation"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_FACTION"] = true,
										["UPDATE_FACTION"] = true,
									},
									["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode() \nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
									["location"] = "center",
									["attach_to"] = "ReputationBar",
								},
								["Lua:Power"] = {
									["exists"] = true,
									["events"] = {
										["UNIT_POWER_FREQUENT"] = true,
										["UNIT_MAXPOWER"] = true,
									},
									["code"] = "local miss = MaxPower(unit) - Power(unit)\nif miss ~= 0 then\n  return Power(unit)\nend",
									["location"] = "right",
									["attach_to"] = "HealthBar",
								},
								["Lua:Threat"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_THREAT_LIST_UPDATE"] = true,
										["UNIT_THREAT_SITUATION_UPDATE"] = true,
									},
									["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ThreatBar",
								},
								["Lua:Druid mana"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_DISPLAYPOWER"] = true,
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
									["location"] = "center",
									["attach_to"] = "DruidManaBar",
								},
								["Lua:Cast time"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_SPELLCAST_SUCCEEDED"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "CastBar",
								},
								["Lua:PVPTimer"] = {
									["exists"] = true,
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
									},
									["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
									["location"] = "out_left_top",
								},
								["Lua:Cast"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell \n  end\nend\nreturn ConfigMode()",
									["location"] = "left",
									["attach_to"] = "CastBar",
								},
								["Lua:Health"] = {
									["position"] = 1.00001,
									["events"] = {
										["UNIT_HEALTH"] = true,
										["UNIT_AURA"] = true,
										["UNIT_MAXHEALTH"] = true,
									},
									["code"] = "local miss = MaxHP(unit) - HP(unit)\nif miss ~= 0 then\n  return HP(unit)\nend",
									["location"] = "left",
									["exists"] = true,
									["attach_to"] = "HealthBar",
								},
								["Lua:Alternate power"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_POWER_FREQUENT"] = true,
										["UNIT_MAXPOWER"] = true,
									},
									["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "AltPowerBar",
								},
								["Lua:Class"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_LEVEL"] = true,
										["UNIT_CLASSIFICATION_CHANGED"] = true,
										["UNIT_AURA"] = true,
									},
									["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
									["location"] = "left",
									["attach_to"] = "PowerBar",
								},
								["Lua:Experience"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_PET_EXPERIENCE"] = true,
										["PLAYER_XP_UPDATE"] = true,
									},
									["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ExperienceBar",
								},
								["Lua:Demonic fury"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_POWER_FREQUENT"] = true,
										["UNIT_MAXPOWER"] = true,
									},
									["code"] = "return \"%s/%s\",Power(unit,SPELL_POWER_DEMONIC_FURY),MaxPower(unit,SPELL_POWER_DEMONIC_FURY)\n",
									["location"] = "center",
									["attach_to"] = "DemonicFury",
								},
							},
						},
						["Target"] = {
							["first"] = false,
							["elements"] = {
								["Lua:Eclipse"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "return math.abs(Power(unit,SPELL_POWER_ECLIPSE))\n",
									["location"] = "center",
									["attach_to"] = "Eclipse",
								},
								["Lua:Experience"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_PET_EXPERIENCE"] = true,
										["PLAYER_XP_UPDATE"] = true,
									},
									["exists"] = true,
									["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ExperienceBar",
								},
								["Lua:Power"] = {
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return VeryShort(Power(unit))\nend",
									["location"] = "in_right",
									["size"] = 0.8,
								},
								["Lua:Reputation"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_FACTION"] = true,
										["UPDATE_FACTION"] = true,
									},
									["exists"] = true,
									["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode() \nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
									["location"] = "center",
									["attach_to"] = "ReputationBar",
								},
								["Lua:Name"] = {
									["position"] = 1.00001,
									["exists"] = true,
									["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
									["location"] = "edge_top",
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
										["UNIT_NAME_UPDATE"] = true,
									},
								},
								["Lua:Threat"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_THREAT_LIST_UPDATE"] = true,
										["UNIT_THREAT_SITUATION_UPDATE"] = true,
									},
									["exists"] = true,
									["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ThreatBar",
								},
								["Lua:Class"] = {
									["events"] = {
										["UNIT_LEVEL"] = true,
										["UNIT_CLASSIFICATION_CHANGED"] = true,
										["UNIT_AURA"] = true,
									},
									["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s |cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",Classification(unit) or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s |cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",Classification(unit) or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s |cff%02x%02x%02x%s|r (%s) %s\",Classification(unit) or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s |cff%02x%02x%02x%s|r %s\",Classification(unit) or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
									["location"] = "center",
									["exists"] = true,
									["attach_to"] = "PowerBar",
									["size"] = 0.65,
								},
								["Lua:Alternate power"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "AltPowerBar",
								},
								["Lua:Cast"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
									},
									["exists"] = true,
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell \n  end\nend\nreturn ConfigMode()",
									["location"] = "left",
									["attach_to"] = "CastBar",
								},
								["Lua:Cast time"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_SPELLCAST_SUCCEEDED"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
									["exists"] = true,
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "CastBar",
								},
								["Lua:Health"] = {
									["events"] = {
										["UNIT_MAXHEALTH"] = true,
										["UNIT_HEALTH"] = true,
									},
									["exists"] = true,
									["code"] = "return VeryShort(HP(unit))",
									["location"] = "in_left",
									["position"] = 1.00001,
									["size"] = 0.9,
								},
								["Lua:PVPTimer"] = {
									["position"] = 1.00001,
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
									},
									["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
									["location"] = "out_left_top",
									["exists"] = true,
								},
								["Lua:HealthPercent"] = {
									["exists"] = true,
									["position"] = 1.00001,
									["location"] = "center",
									["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nreturn \"%s%%\",Percent(HP(unit),MaxHP(unit))",
									["attach_to"] = "HealthBar",
									["size"] = 0.8,
								},
								["Lua:Druid mana"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_DISPLAYPOWER"] = true,
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
									["location"] = "center",
									["attach_to"] = "DruidManaBar",
								},
								["Lua:Demonic fury"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "return \"%s/%s\",Power(unit,SPELL_POWER_DEMONIC_FURY),MaxPower(unit,SPELL_POWER_DEMONIC_FURY)\n",
									["location"] = "center",
									["attach_to"] = "DemonicFury",
								},
							},
						},
						["Raid"] = {
							["first"] = false,
							["elements"] = {
								["Lua:Eclipse"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_POWER_FREQUENT"] = true,
										["UNIT_MAXPOWER"] = true,
									},
									["code"] = "return math.abs(Power(unit,SPELL_POWER_ECLIPSE))\n",
									["location"] = "center",
									["attach_to"] = "Eclipse",
								},
								["Lua:Name"] = {
									["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
									["attach_to"] = "HealthBar",
									["font"] = "Friz Quadrata TT",
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
										["UNIT_NAME_UPDATE"] = true,
									},
									["location"] = "center",
									["exists"] = true,
									["size"] = 0.7,
								},
								["Lua:Reputation"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_FACTION"] = true,
										["UPDATE_FACTION"] = true,
									},
									["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode() \nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
									["location"] = "center",
									["attach_to"] = "ReputationBar",
								},
								["Lua:Power"] = {
									["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return VeryShort(Power(unit))\nend",
									["attach_to"] = "PowerBar",
									["font"] = "Friz Quadrata TT",
									["events"] = {
										["UNIT_POWER_FREQUENT"] = true,
										["UNIT_MAXPOWER"] = true,
									},
									["location"] = "right",
									["exists"] = true,
									["size"] = 0.55,
								},
								["Lua:Threat"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_THREAT_LIST_UPDATE"] = true,
										["UNIT_THREAT_SITUATION_UPDATE"] = true,
									},
									["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ThreatBar",
								},
								["Lua:Druid mana"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_DISPLAYPOWER"] = true,
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
									["location"] = "center",
									["attach_to"] = "DruidManaBar",
								},
								["Lua:Cast time"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_SPELLCAST_SUCCEEDED"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "CastBar",
								},
								["Lua:PVPTimer"] = {
									["enabled"] = false,
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
									},
									["exists"] = true,
									["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
									["location"] = "out_right_top",
								},
								["Lua:Cast"] = {
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell \n  end\nend\nreturn ConfigMode()",
									["attach_to"] = "CastBar",
									["font"] = "Friz Quadrata TT",
									["events"] = {
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
									["location"] = "center",
									["exists"] = true,
									["size"] = 0.6,
								},
								["Lua:Health"] = {
									["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nreturn VeryShort(HP(unit))",
									["attach_to"] = "PowerBar",
									["font"] = "Friz Quadrata TT",
									["events"] = {
										["UNIT_HEALTH"] = true,
										["UNIT_AURA"] = true,
										["UNIT_MAXHEALTH"] = true,
									},
									["position"] = 1.00001,
									["location"] = "left",
									["exists"] = true,
									["size"] = 0.65,
								},
								["Lua:Alternate power"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_POWER_FREQUENT"] = true,
										["UNIT_MAXPOWER"] = true,
									},
									["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "AltPowerBar",
								},
								["Lua:Class"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_LEVEL"] = true,
										["UNIT_CLASSIFICATION_CHANGED"] = true,
										["UNIT_AURA"] = true,
									},
									["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
									["location"] = "left",
									["attach_to"] = "PowerBar",
								},
								["Lua:Experience"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_PET_EXPERIENCE"] = true,
										["PLAYER_XP_UPDATE"] = true,
									},
									["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ExperienceBar",
								},
								["Lua:Demonic fury"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["UNIT_POWER_FREQUENT"] = true,
										["UNIT_MAXPOWER"] = true,
									},
									["code"] = "return \"%s/%s\",Power(unit,SPELL_POWER_DEMONIC_FURY),MaxPower(unit,SPELL_POWER_DEMONIC_FURY)\n",
									["location"] = "center",
									["attach_to"] = "DemonicFury",
								},
							},
						},
						["FocusTarget"] = {
							["first"] = false,
							["elements"] = {
								["Lua:Eclipse"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "return math.abs(Power(unit,SPELL_POWER_ECLIPSE))\n",
									["location"] = "center",
									["attach_to"] = "Eclipse",
								},
								["Lua:Power"] = {
									["code"] = "local max = MaxPower(unit)\nif max > 0 then\n  return VeryShort(Power(unit))\nend",
									["attach_to"] = "PowerBar",
									["font"] = "Friz Quadrata TT",
									["exists"] = true,
									["location"] = "right",
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["size"] = 0.55,
								},
								["Lua:Reputation"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_FACTION"] = true,
										["UPDATE_FACTION"] = true,
									},
									["exists"] = true,
									["code"] = "local name, _, min , max, value, id = GetWatchedFactionInfo()\nif IsMouseOver() then\n  return name or ConfigMode() \nelse\n  local fs_id, fs_rep, _, _, _, _, _, fs_threshold, next_fs_threshold = GetFriendshipReputation(id)\n  if fs_id then\n    if next_fs_threshold then\n      min, max, value = fs_threshold, next_fs_threshold, fs_rep\n    else\n      min, max, value = 0, 1, 1\n    end\n  end\n  local bar_cur,bar_max = value-min,max-min\n  return \"%d/%d (%s%%)\",bar_cur,bar_max,Percent(bar_cur,bar_max)\nend",
									["location"] = "center",
									["attach_to"] = "ReputationBar",
								},
								["Lua:Name"] = {
									["code"] = "return '%s %s%s%s',Name(unit),Angle(AFK(unit) or DND(unit))",
									["attach_to"] = "HealthBar",
									["font"] = "Friz Quadrata TT",
									["exists"] = true,
									["location"] = "center",
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
										["UNIT_NAME_UPDATE"] = true,
									},
									["size"] = 0.7,
								},
								["Lua:Threat"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_THREAT_LIST_UPDATE"] = true,
										["UNIT_THREAT_SITUATION_UPDATE"] = true,
									},
									["exists"] = true,
									["code"] = "local unit_a,unit_b = ThreatPair(unit)\nif unit_a and unit_b then\n  local _,_,percent = UnitDetailedThreatSituation(unit_a, unit_b)\n  if percent and percent ~= 0 then\n    return \"%s%%\",Round(percent,1)\n  end\nend\nreturn ConfigMode()",
									["location"] = "center",
									["attach_to"] = "ThreatBar",
								},
								["Lua:Experience"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_PET_EXPERIENCE"] = true,
										["PLAYER_XP_UPDATE"] = true,
									},
									["exists"] = true,
									["code"] = "local cur, max, rest = XP(unit), MaxXP(unit), RestXP(unit)\nif rest then\n  return \"%s/%s (%s%%) R: %s%%\",cur,max,Percent(cur,max),Percent(rest,max)\nelse\n  return \"%s/%s (%s%%)\",cur,max,Percent(cur,max)\nend",
									["location"] = "center",
									["attach_to"] = "ExperienceBar",
								},
								["Lua:Cast"] = {
									["enabled"] = false,
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  local spell,stop_message,target = cast_data.spell,cast_data.stop_message,cast_data.target\n  local stop_time,stop_duration = cast_data.stop_time\n  if stop_time then\n    stop_duration = GetTime() - stop_time\n  end\n  Alpha(-(stop_duration or 0) + 1)\n  if stop_message then\n    return stop_message\n  elseif target then\n    return \"%s (%s)\",spell,target\n  else\n    return spell \n  end\nend\nreturn ConfigMode()",
									["attach_to"] = "CastBar",
									["font"] = "Friz Quadrata TT",
									["exists"] = true,
									["location"] = "center",
									["events"] = {
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
									},
									["size"] = 0.6,
								},
								["Lua:Alternate power"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "local max = MaxPower(unit,ALTERNATE_POWER_INDEX)\nif max > 0 then\n  return \"%s%%\",Percent(Power(unit,ALTERNATE_POWER_INDEX),max)\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "AltPowerBar",
								},
								["Lua:Cast time"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_SPELLCAST_SUCCEEDED"] = true,
										["UNIT_SPELLCAST_START"] = true,
										["UNIT_SPELLCAST_CHANNEL_START"] = true,
										["UNIT_SPELLCAST_DELAYED"] = true,
										["UNIT_SPELLCAST_CHANNEL_STOP"] = true,
										["UNIT_SPELLCAST_CHANNEL_UPDATE"] = true,
										["UNIT_SPELLCAST_STOP"] = true,
										["UNIT_SPELLCAST_INTERRUPTED"] = true,
										["UNIT_SPELLCAST_FAILED"] = true,
									},
									["exists"] = true,
									["code"] = "local cast_data = CastData(unit)\nif cast_data then\n  if not cast_data.stop_time then\n    local delay,end_time = cast_data.delay, cast_data.end_time\n    local duration\n    if end_time then\n      duration = end_time - GetTime()\n    end\n    if delay and delay ~= 0 then\n      local delay_sign = '+'\n      if delay < 0 then\n        delay_sign = ''\n      end\n      if duration and duration >= 0 then\n        return \"|cffff0000%s%s|r %.1f\",delay_sign,Round(delay,1),duration\n      else\n        return \"|cffff0000%s%s|r\",delay_sign,Round(delay,1)\n      end\n    elseif duration and duration >= 0 then\n      return \"%.1f\",duration\n    end\n  end\nend\nreturn ConfigMode()",
									["location"] = "right",
									["attach_to"] = "CastBar",
								},
								["Lua:Health"] = {
									["code"] = "local s = Status(unit)\nif s then\n  return s\nend\nreturn VeryShort(HP(unit))",
									["attach_to"] = "PowerBar",
									["font"] = "Friz Quadrata TT",
									["exists"] = true,
									["position"] = 1.00001,
									["location"] = "left",
									["events"] = {
										["UNIT_HEALTH"] = true,
										["UNIT_AURA"] = true,
										["UNIT_MAXHEALTH"] = true,
									},
									["size"] = 0.65,
								},
								["Lua:PVPTimer"] = {
									["enabled"] = false,
									["exists"] = true,
									["events"] = {
										["PLAYER_FLAGS_CHANGED"] = true,
									},
									["code"] = "if unit == \"player\" then\n  local pvp = PVPDuration()\n  if pvp then\n    return \"|cffff0000%s|r\",FormatDuration(pvp)\n  end\nend",
									["location"] = "out_right_top",
								},
								["Lua:Class"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_LEVEL"] = true,
										["UNIT_CLASSIFICATION_CHANGED"] = true,
										["UNIT_AURA"] = true,
									},
									["exists"] = true,
									["code"] = "local dr,dg,db = DifficultyColor(unit)\nlocal form = DruidForm(unit)\nlocal classification = Classification(unit)\nif UnitIsPlayer(unit) or (not UnitIsFriend(unit,\"player\") and not IsPet(unit)) then\n  local cr,cg,cb = ClassColor(unit)\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r |cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),cr,cg,cb,Class(unit),SmartRace(unit) or ''\n  end\nelse\n  if form then\n    return \"%s%s|cff%02x%02x%02x%s|r (%s) %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),form,SmartRace(unit) or ''\n  else\n    return \"%s%s|cff%02x%02x%02x%s|r %s\",classification or '',classification and ' ' or '',dr,dg,db,Level(unit),SmartRace(unit) or ''\n  end\nend",
									["location"] = "left",
									["attach_to"] = "PowerBar",
								},
								["Lua:Druid mana"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_DISPLAYPOWER"] = true,
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "if UnitPowerType(unit) ~= 0 then\n  return \"%s/%s\",Power(unit,0),MaxPower(unit,0)\nend",
									["location"] = "center",
									["attach_to"] = "DruidManaBar",
								},
								["Lua:Demonic fury"] = {
									["enabled"] = false,
									["events"] = {
										["UNIT_MAXPOWER"] = true,
										["UNIT_POWER_FREQUENT"] = true,
									},
									["exists"] = true,
									["code"] = "return \"%s/%s\",Power(unit,SPELL_POWER_DEMONIC_FURY),MaxPower(unit,SPELL_POWER_DEMONIC_FURY)\n",
									["location"] = "center",
									["attach_to"] = "DemonicFury",
								},
							},
						},
					},
				},
			},
		},
		["SoulShards"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Player"] = {
							["click_through"] = true,
							["location"] = "in_center",
							["background_color"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								0, -- [4]
							},
							["position"] = 1.00001,
						},
					},
				},
			},
		},
		["HostilityFader"] = {
		},
		["MasterLooterIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["FocusTarget"] = {
							["enabled"] = false,
						},
					},
				},
			},
		},
		["CombatText"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["enabled"] = false,
							["position"] = 1.00001,
						},
						["Player"] = {
							["enabled"] = false,
							["position"] = 1.00002,
						},
						["FocusTarget"] = {
							["enabled"] = false,
							["position"] = 1.00001,
						},
						["Raid"] = {
							["enabled"] = false,
							["position"] = 1.00001,
						},
					},
				},
			},
		},
		["ReadyCheckIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["position"] = 1.00002,
						},
						["Raid"] = {
							["position"] = 1.00002,
						},
						["FocusTarget"] = {
							["enabled"] = false,
							["position"] = 1.00002,
						},
					},
				},
			},
		},
		["Totems"] = {
			["profiles"] = {
				["NeverUI_HE"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI_test"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
			},
		},
		["Chi"] = {
		},
		["Portrait"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["FocusTarget"] = {
							["enabled"] = true,
							["side"] = "center",
							["full_body"] = true,
							["fallback_style"] = "two_dimensional",
							["bar_size"] = 10,
						},
					},
				},
			},
		},
		["ExperienceBar"] = {
			["profiles"] = {
				["NeverUI_HE"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI_test"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
			},
		},
		["RaidTargetIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["location"] = "in_center",
							["size"] = 1.5,
						},
						["Player"] = {
							["location"] = "in_center",
							["size"] = 1.5,
						},
						["FocusTarget"] = {
							["location"] = "in_center",
							["size"] = 1.5,
						},
						["Raid"] = {
							["location"] = "in_center",
						},
					},
				},
			},
		},
		["HolyPower"] = {
			["profiles"] = {
				["NeverUI_HE"] = {
					["layouts"] = {
						["Player"] = {
							["active_color"] = {
								0.949019607843137, -- [1]
								0.901960784313726, -- [2]
							},
							["click_through"] = true,
							["location"] = "out_right",
							["inactive_color"] = {
								0.501960784313726, -- [1]
								0.501960784313726, -- [2]
								0.501960784313726, -- [3]
								0, -- [4]
							},
							["background_color"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								0, -- [4]
							},
							["size"] = 1.55,
						},
					},
				},
			},
		},
		["Aggro"] = {
		},
		["Sounds"] = {
			["profiles"] = {
				["NeverUI_HE"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI_test"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
			},
		},
		["CastBar"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["enabled"] = false,
						},
						["Player"] = {
							["enabled"] = false,
						},
						["FocusTarget"] = {
							["background_alpha"] = 0,
							["show_icon"] = false,
							["enabled"] = false,
						},
						["Raid"] = {
							["background_alpha"] = 0,
							["show_icon"] = false,
						},
					},
				},
			},
		},
		["RestIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["position"] = 1.00001,
							["location"] = "edge_bottom_right",
						},
						["Player"] = {
							["position"] = 1.00001,
							["location"] = "edge_bottom_right",
						},
						["FocusTarget"] = {
							["enabled"] = false,
							["position"] = 1.00001,
							["location"] = "edge_bottom_right",
						},
						["Raid"] = {
							["position"] = 1.00001,
							["location"] = "edge_bottom_right",
						},
					},
				},
			},
		},
		["DruidManaBar"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["enabled"] = false,
						},
						["Player"] = {
							["enabled"] = false,
						},
						["FocusTarget"] = {
							["enabled"] = false,
						},
						["Raid"] = {
							["enabled"] = false,
						},
					},
				},
			},
		},
		["Aura"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Normal"] = {
							["enabled_debuffs"] = false,
							["enabled_buffs"] = false,
						},
						["Player"] = {
							["enabled_debuffs"] = false,
							["enabled_buffs"] = false,
						},
						["Target"] = {
							["enabled_debuffs"] = false,
							["enabled_buffs"] = false,
						},
						["Raid"] = {
							["enabled_debuffs"] = false,
							["enabled_buffs"] = false,
						},
						["FocusTarget"] = {
							["enabled_debuffs"] = false,
							["enabled_buffs"] = false,
						},
					},
				},
			},
		},
		["ReputationBar"] = {
			["profiles"] = {
				["NeverUI_HE"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI_test"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
			},
		},
		["Background"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["color"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								1, -- [4]
							},
						},
						["Player"] = {
							["color"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								1, -- [4]
							},
						},
						["FocusTarget"] = {
							["color"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								1, -- [4]
							},
						},
						["Raid"] = {
							["color"] = {
								nil, -- [1]
								nil, -- [2]
								nil, -- [3]
								1, -- [4]
							},
						},
					},
				},
			},
		},
		["PowerBar"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["background_alpha"] = 0,
							["texture"] = "Minimalist",
						},
						["Player"] = {
							["background_alpha"] = 0,
							["texture"] = "Minimalist",
							["size"] = 3,
						},
						["FocusTarget"] = {
							["background_alpha"] = 0,
							["texture"] = "Minimalist",
							["enabled"] = false,
							["size"] = 1,
						},
						["Raid"] = {
							["background_alpha"] = 0,
							["texture"] = "Minimalist",
							["size"] = 1,
						},
					},
				},
			},
		},
		["HideBlizzard"] = {
		},
		["Runes"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Raid"] = {
							["enabled"] = false,
						},
					},
				},
			},
		},
		["CombatIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["location"] = "edge_bottom_right",
						},
						["Player"] = {
							["location"] = "edge_right",
						},
						["FocusTarget"] = {
							["enabled"] = false,
							["position"] = 1.00001,
							["location"] = "edge_right",
						},
						["Raid"] = {
							["position"] = 1.00001,
							["location"] = "edge_right",
						},
					},
				},
			},
		},
		["HealthBar"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["color_pvp_by_class"] = true,
							["background_alpha"] = 0,
							["size"] = 7,
						},
						["Player"] = {
							["hostility_color_npcs"] = false,
							["background_alpha"] = 0,
							["hostility_color"] = false,
							["size"] = 12,
						},
						["FocusTarget"] = {
							["position"] = 1.00001,
							["background_alpha"] = 0,
							["size"] = 1,
						},
						["Raid"] = {
							["hostility_color_npcs"] = false,
							["hostility_color"] = false,
							["background_alpha"] = 0,
							["size"] = 12,
						},
					},
				},
			},
		},
		["PvPIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["position"] = 1.00001,
							["location"] = "edge_right",
						},
						["Player"] = {
							["position"] = 1.00001,
						},
						["FocusTarget"] = {
							["enabled"] = false,
							["position"] = 1.00001,
						},
						["Raid"] = {
							["position"] = 1.00001,
						},
					},
				},
			},
		},
		["QuestIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["position"] = 1.00002,
						},
						["Player"] = {
							["position"] = 1.00002,
						},
						["FocusTarget"] = {
							["position"] = 1.00002,
						},
						["Raid"] = {
							["position"] = 1.00002,
						},
					},
				},
			},
		},
		["VoiceIcon"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["FocusTarget"] = {
							["enabled"] = false,
						},
					},
				},
			},
		},
		["VisualHeal"] = {
			["profiles"] = {
				["NeverUI"] = {
					["global"] = {
						["outgoing_color_overheal"] = {
							nil, -- [1]
							nil, -- [2]
							nil, -- [3]
							0.497589528560638, -- [4]
						},
						["absorb_color"] = {
							nil, -- [1]
							0.258823529411765, -- [2]
							0.619607843137255, -- [3]
							0.497589528560638, -- [4]
						},
					},
				},
			},
		},
		["CastBarLatency"] = {
			["profiles"] = {
				["NeverUI_HE"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI_test"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
			},
		},
		["CombatFader"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["target_opacity"] = 0.5,
							["hurt_opacity"] = 0.85,
							["out_of_combat_opacity"] = 0,
						},
						["Player"] = {
							["enabled"] = true,
							["target_opacity"] = 0.5,
							["hurt_opacity"] = 0.85,
							["out_of_combat_opacity"] = 0,
						},
					},
				},
			},
		},
		["BattlePet"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["enabled"] = false,
							["position"] = 1.00003,
						},
						["Player"] = {
							["enabled"] = false,
							["position"] = 1.00003,
						},
						["FocusTarget"] = {
							["enabled"] = false,
							["position"] = 1.00003,
						},
						["Raid"] = {
							["enabled"] = false,
							["position"] = 1.00003,
						},
					},
				},
			},
		},
		["AltPowerBar"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Target"] = {
							["enabled"] = false,
						},
						["Player"] = {
							["enabled"] = false,
						},
						["FocusTarget"] = {
							["enabled"] = false,
							["background_alpha"] = 0,
							["size"] = 1,
						},
						["Raid"] = {
							["background_alpha"] = 0,
							["size"] = 1,
						},
					},
				},
			},
		},
		["BlankSpace"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Normal"] = {
							["first"] = false,
							["elements"] = {
								["Default"] = {
									["exists"] = true,
								},
							},
						},
						["Player"] = {
							["first"] = false,
							["elements"] = {
								["Default"] = {
									["exists"] = true,
								},
							},
						},
						["Target"] = {
							["first"] = false,
							["elements"] = {
								["Default"] = {
									["exists"] = true,
								},
							},
						},
						["Raid"] = {
							["first"] = false,
							["elements"] = {
								["Default"] = {
									["exists"] = true,
								},
							},
						},
						["FocusTarget"] = {
							["first"] = false,
							["elements"] = {
								["Default"] = {
									["exists"] = true,
								},
							},
						},
					},
				},
			},
		},
		["ThreatBar"] = {
			["profiles"] = {
				["NeverUI_HE"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI_test"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
				["NeverUI"] = {
					["global"] = {
						["enabled"] = false,
					},
				},
			},
		},
		["Highlight"] = {
		},
		["ArcaneCharges"] = {
		},
		["ArtifactPowerBar"] = {
			["profiles"] = {
				["NeverUI"] = {
					["layouts"] = {
						["Normal"] = {
							["enabled"] = false,
						},
						["Player"] = {
							["enabled"] = false,
						},
						["Target"] = {
							["enabled"] = false,
						},
						["Raid"] = {
							["enabled"] = false,
						},
						["FocusTarget"] = {
							["enabled"] = false,
						},
					},
				},
			},
		},
	},
	["global"] = {
		["config_version"] = 2,
	},
	["profileKeys"] = {
		["Worksfortips - Wyrmrest Accord"] = "NeverUI",
		["Hermy - Wyrmrest Accord"] = "NeverUI",
		["Neversane - Uldum"] = "NeverUI",
		["Ashidakim - Wyrmrest Accord"] = "NeverUI",
		["Worksfortips - Beta Leveling Realm 01"] = "NeverUI",
		["Zeldarya - Wyrmrest Accord"] = "NeverUI",
		["Shakkleford - Wyrmrest Accord"] = "NeverUI",
		["Neversage - Wyrmrest Accord"] = "NeverUI",
		["Haarlod - Wyrmrest Accord"] = "NeverUI",
		["Mygraine - Wyrmrest Accord"] = "NeverUI",
		["Neversage - Beta Leveling Realm 01"] = "NeverUI",
		["Novalon - Wyrmrest Accord"] = "NeverUI",
	},
	["profiles"] = {
		["NeverUI"] = {
			["class_order"] = {
				"WARRIOR", -- [1]
				"DEATHKNIGHT", -- [2]
				"PALADIN", -- [3]
				"MONK", -- [4]
				"PRIEST", -- [5]
				"SHAMAN", -- [6]
				"DRUID", -- [7]
				"ROGUE", -- [8]
				"MAGE", -- [9]
				"WARLOCK", -- [10]
				"HUNTER", -- [11]
				"DEMONHUNTER", -- [12]
			},
			["layouts"] = {
				["Normal"] = {
					["exists"] = true,
				},
				["Player"] = {
					["bar_spacing"] = 1,
					["opacity_min"] = 0,
					["size_y"] = 30,
					["font"] = "Friz Quadrata TT",
					["exists"] = true,
					["size_x"] = 220,
					["bar_texture"] = "Melli Dark Rough",
				},
				["Target"] = {
					["bar_spacing"] = 1,
					["size_y"] = 30,
					["font"] = "Friz Quadrata TT",
					["exists"] = true,
					["size_x"] = 220,
					["bar_texture"] = "Melli Dark Rough",
				},
				["Raid"] = {
					["bar_spacing"] = 1,
					["size_y"] = 20,
					["exists"] = true,
					["size_x"] = 105,
					["bar_texture"] = "Melli Dark Rough",
				},
				["FocusTarget"] = {
					["bar_spacing"] = 1,
					["size_y"] = 100,
					["exists"] = true,
					["size_x"] = 105,
					["bar_texture"] = "Melli Dark Rough",
				},
			},
			["made_groups"] = true,
			["units"] = {
				["targettargettarget"] = {
					["enabled"] = false,
					["position_x"] = 332.000610351563,
					["position_y"] = -74.0000915527344,
				},
				["focustarget"] = {
					["position_x"] = 385,
					["layout"] = "FocusTarget",
					["position_y"] = -335,
					["size_y"] = 0.55,
					["size_x"] = 1.2,
				},
				["targettarget"] = {
					["size_x"] = 1.2,
					["layout"] = "Raid",
					["position_y"] = -295,
					["position_x"] = 385,
				},
				["player"] = {
					["position_x"] = -210,
					["position_y"] = -290,
					["layout"] = "Player",
				},
				["focus"] = {
					["size_x"] = 1.2,
					["layout"] = "Raid",
					["position_y"] = -375,
					["position_x"] = 385,
				},
				["target"] = {
					["position_x"] = 210,
					["position_y"] = -290,
					["layout"] = "Target",
				},
				["pettarget"] = {
					["enabled"] = false,
					["position_x"] = -565.999908447266,
					["position_y"] = -285.999725341797,
				},
				["focustargettarget"] = {
					["enabled"] = false,
					["position_x"] = 416.000732421875,
					["position_y"] = -191.000152587891,
				},
				["pet"] = {
					["size_x"] = 1.2,
					["layout"] = "Raid",
					["position_y"] = -295,
					["position_x"] = -385,
				},
			},
			["groups"] = {
				["Raid"] = {
					["vertical_spacing"] = 0,
					["direction"] = "up_right",
					["position_x"] = 153,
					["units_per_column"] = 5,
					["enabled"] = true,
					["horizontal_spacing"] = 2,
					["layout"] = "Raid",
					["size_y"] = 1.15,
					["include_player"] = true,
					["exists"] = true,
					["position_y"] = -494,
					["unit_group"] = "raid",
					["show_when"] = {
						["party"] = false,
						["raid40"] = true,
						["raid25"] = true,
						["raid10"] = true,
						["raid"] = true,
						["raid20"] = true,
						["raid15"] = true,
					},
				},
				["Party"] = {
					["vertical_spacing"] = 0,
					["direction"] = "up_right",
					["position_x"] = 153,
					["units_per_column"] = 5,
					["enabled"] = true,
					["horizontal_spacing"] = 0,
					["layout"] = "Raid",
					["size_y"] = 1.15,
					["include_player"] = true,
					["exists"] = true,
					["position_y"] = -494,
				},
			},
			["lock_movement"] = true,
			["colors"] = {
				["class"] = {
					["ROGUE"] = {
						nil, -- [1]
						0.858823529411765, -- [2]
						0.286274509803922, -- [3]
					},
				},
				["power"] = {
					["ENERGY"] = {
						nil, -- [1]
						0.603921568627451, -- [2]
					},
					["MANA"] = {
						nil, -- [1]
						0.643137254901961, -- [2]
					},
					["LUNAR_POWER"] = {
						0.556862745098039, -- [1]
						0.725490196078431, -- [2]
						1, -- [3]
					},
					["RAGE"] = {
						nil, -- [1]
						0.16078431372549, -- [2]
					},
				},
			},
			["minimap_icon"] = {
				["hide"] = true,
			},
			["frame_snap"] = false,
		},
	},
}
