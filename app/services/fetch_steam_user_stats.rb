class FetchSteamUserStats < ApplicationService
  attr_reader :steam_id, :game_id, :options
  def initialize(steam_id:, game_id:, options:)
    @steam_id = steam_id
    @game_id = game_id
    @options = options
  end

  def call
    make_request
    @stats
  end


  private

  def make_request
    ap "je dois faire make request"
    # @data = SteamService.call(steam_id: @steam_id, game_id: @game_id)
    extract_stats
  end


  def extract_stats
    ap "je suis dans extract_stats"
    ap 'jai acces a @data'
    # ap @data
    @data = values = [{"steamID"=>"76561197981067382",
        "gameName"=>"ValveTestApp260",
        "stats"=>
         [{"name"=>"total_kills", "value"=>157},
          {"name"=>"total_deaths", "value"=>218},
          {"name"=>"total_time_played", "value"=>11287},
          {"name"=>"total_planted_bombs", "value"=>3},
          {"name"=>"total_wins", "value"=>38},
          {"name"=>"total_damage_done", "value"=>21720},
          {"name"=>"total_money_earned", "value"=>280300},
          {"name"=>"total_kills_glock", "value"=>4},
          {"name"=>"total_kills_elite", "value"=>5},
          {"name"=>"total_kills_xm1014", "value"=>4},
          {"name"=>"total_kills_ump45", "value"=>6},
          {"name"=>"total_kills_p90", "value"=>4},
          {"name"=>"total_kills_awp", "value"=>2},
          {"name"=>"total_kills_ak47", "value"=>32},
          {"name"=>"total_kills_aug", "value"=>3},
          {"name"=>"total_kills_famas", "value"=>5},
          {"name"=>"total_kills_g3sg1", "value"=>1},
          {"name"=>"total_kills_headshot", "value"=>57},
          {"name"=>"total_kills_enemy_weapon", "value"=>7},
          {"name"=>"total_wins_pistolround", "value"=>5},
          {"name"=>"total_wins_map_cs_office", "value"=>8},
          {"name"=>"total_wins_map_de_cbble", "value"=>16},
          {"name"=>"total_wins_map_de_dust2", "value"=>4},
          {"name"=>"total_weapons_donated", "value"=>4},
          {"name"=>"total_broken_windows", "value"=>8},
          {"name"=>"total_kills_against_zoomed_sniper", "value"=>7},
          {"name"=>"total_dominations", "value"=>3},
          {"name"=>"total_domination_overkills", "value"=>1},
          {"name"=>"total_revenges", "value"=>3},
          {"name"=>"total_shots_hit", "value"=>699},
          {"name"=>"total_shots_fired", "value"=>3335},
          {"name"=>"total_rounds_played", "value"=>109},
          {"name"=>"total_shots_glock", "value"=>53},
          {"name"=>"total_shots_elite", "value"=>71},
          {"name"=>"total_shots_awp", "value"=>5},
          {"name"=>"total_shots_ak47", "value"=>564},
          {"name"=>"total_shots_aug", "value"=>23},
          {"name"=>"total_shots_famas", "value"=>104},
          {"name"=>"total_shots_g3sg1", "value"=>21},
          {"name"=>"total_shots_p90", "value"=>65},
          {"name"=>"total_shots_mac10", "value"=>36},
          {"name"=>"total_shots_ump45", "value"=>146},
          {"name"=>"total_shots_xm1014", "value"=>161},
          {"name"=>"total_hits_glock", "value"=>7},
          {"name"=>"total_hits_elite", "value"=>25},
          {"name"=>"total_hits_awp", "value"=>2},
          {"name"=>"total_hits_ak47", "value"=>111},
          {"name"=>"total_hits_aug", "value"=>15},
          {"name"=>"total_hits_famas", "value"=>24},
          {"name"=>"total_hits_g3sg1", "value"=>1},
          {"name"=>"total_hits_p90", "value"=>19},
          {"name"=>"total_hits_mac10", "value"=>5},
          {"name"=>"total_hits_ump45", "value"=>34},
          {"name"=>"total_hits_xm1014", "value"=>28},
          {"name"=>"total_rounds_map_cs_office", "value"=>24},
          {"name"=>"total_rounds_map_de_cbble", "value"=>23},
          {"name"=>"total_rounds_map_de_dust2", "value"=>15},
          {"name"=>"last_match_t_wins", "value"=>0},
          {"name"=>"last_match_ct_wins", "value"=>1},
          {"name"=>"last_match_wins", "value"=>1},
          {"name"=>"last_match_max_players", "value"=>15},
          {"name"=>"last_match_kills", "value"=>2},
          {"name"=>"last_match_deaths", "value"=>1},
          {"name"=>"last_match_mvps", "value"=>0},
          {"name"=>"last_match_favweapon_id", "value"=>10},
          {"name"=>"last_match_favweapon_shots", "value"=>43},
          {"name"=>"last_match_favweapon_hits", "value"=>13},
          {"name"=>"last_match_favweapon_kills", "value"=>2},
          {"name"=>"last_match_damage", "value"=>349},
          {"name"=>"last_match_money_spent", "value"=>7750},
          {"name"=>"last_match_dominations", "value"=>0},
          {"name"=>"last_match_revenges", "value"=>0},
          {"name"=>"total_mvps", "value"=>2},
          {"name"=>"total_rounds_map_de_lake", "value"=>6},
          {"name"=>"total_rounds_map_de_safehouse", "value"=>1},
          {"name"=>"total_gun_game_rounds_won", "value"=>1},
          {"name"=>"total_gun_game_rounds_played", "value"=>6},
          {"name"=>"total_wins_map_de_lake", "value"=>4},
          {"name"=>"total_matches_won", "value"=>2},
          {"name"=>"total_matches_played", "value"=>13},
          {"name"=>"total_gg_matches_played", "value"=>8},
          {"name"=>"total_contribution_score", "value"=>831},
          {"name"=>"last_match_contribution_score", "value"=>2},
          {"name"=>"last_match_rounds", "value"=>1},
          {"name"=>"total_kills_hkp2000", "value"=>5},
          {"name"=>"total_shots_hkp2000", "value"=>66},
          {"name"=>"total_hits_hkp2000", "value"=>18},
          {"name"=>"total_shots_p250", "value"=>34},
          {"name"=>"total_kills_sg556", "value"=>4},
          {"name"=>"total_shots_sg556", "value"=>55},
          {"name"=>"total_hits_sg556", "value"=>10},
          {"name"=>"total_shots_ssg08", "value"=>31},
          {"name"=>"total_hits_ssg08", "value"=>13},
          {"name"=>"total_kills_ssg08", "value"=>3},
          {"name"=>"total_shots_mp7", "value"=>72},
          {"name"=>"total_hits_mp7", "value"=>16},
          {"name"=>"total_kills_mp7", "value"=>2},
          {"name"=>"total_kills_mp9", "value"=>5},
          {"name"=>"total_shots_mp9", "value"=>61},
          {"name"=>"total_hits_mp9", "value"=>19},
          {"name"=>"total_hits_nova", "value"=>4},
          {"name"=>"total_shots_nova", "value"=>54},
          {"name"=>"total_hits_negev", "value"=>9},
          {"name"=>"total_kills_negev", "value"=>2},
          {"name"=>"total_shots_negev", "value"=>49},
          {"name"=>"total_shots_sawedoff", "value"=>64},
          {"name"=>"total_hits_sawedoff", "value"=>7},
          {"name"=>"total_kills_sawedoff", "value"=>1},
          {"name"=>"total_shots_bizon", "value"=>137},
          {"name"=>"total_hits_bizon", "value"=>50},
          {"name"=>"total_kills_bizon", "value"=>3},
          {"name"=>"total_shots_mag7", "value"=>214},
          {"name"=>"total_hits_mag7", "value"=>32},
          {"name"=>"total_kills_mag7", "value"=>1},
          {"name"=>"total_gun_game_contribution_score", "value"=>61},
          {"name"=>"last_match_gg_contribution_score", "value"=>0},
          {"name"=>"total_kills_m4a1", "value"=>66},
          {"name"=>"total_kills_galilar", "value"=>2},
          {"name"=>"total_shots_m4a1", "value"=>1237},
          {"name"=>"total_shots_galilar", "value"=>50},
          {"name"=>"total_shots_taser", "value"=>2},
          {"name"=>"total_hits_m4a1", "value"=>290},
          {"name"=>"total_hits_galilar", "value"=>3},
          {"name"=>"GI.lesson.csgo_instr_explain_buymenu", "value"=>16},
          {"name"=>"GI.lesson.csgo_instr_explain_buyarmor", "value"=>16},
          {"name"=>"GI.lesson.csgo_instr_explain_plant_bomb", "value"=>16},
          {"name"=>"GI.lesson.csgo_instr_explain_bomb_carrier", "value"=>1},
          {"name"=>"GI.lesson.bomb_sites_A", "value"=>1},
          {"name"=>"GI.lesson.defuse_planted_bomb", "value"=>1},
          {"name"=>"GI.lesson.csgo_instr_explain_follow_bomber", "value"=>1},
          {"name"=>"GI.lesson.csgo_instr_explain_pickup_bomb", "value"=>1},
          {"name"=>"GI.lesson.csgo_instr_explain_prevent_bomb_pickup", "value"=>1},
          {"name"=>"GI.lesson.Csgo_cycle_weapons_kb", "value"=>16},
          {"name"=>"GI.lesson.csgo_instr_explain_zoom", "value"=>16},
          {"name"=>"GI.lesson.csgo_instr_explain_reload", "value"=>17},
          {"name"=>"GI.lesson.bomb_sites_B", "value"=>1},
          {"name"=>"GI.lesson.version_number", "value"=>16},
          {"name"=>"GI.lesson.find_planted_bomb", "value"=>1},
          {"name"=>"GI.lesson.csgo_instr_rescue_zone", "value"=>1},
          {"name"=>"GI.lesson.csgo_instr_explain_inspect", "value"=>16}],
        "achievements"=>
         [{"name"=>"KILL_ENEMY_LOW", "achieved"=>1},
          {"name"=>"WIN_ROUNDS_LOW", "achieved"=>1},
          {"name"=>"GIVE_DAMAGE_LOW", "achieved"=>1},
          {"name"=>"EARN_MONEY_LOW", "achieved"=>1},
          {"name"=>"KILL_ENEMY_LAST_BULLET", "achieved"=>1},
          {"name"=>"DAMAGE_NO_KILL", "achieved"=>1},
          {"name"=>"KILL_LOW_DAMAGE", "achieved"=>1},
          {"name"=>"KILL_ENEMY_RELOADING", "achieved"=>1},
          {"name"=>"HIP_SHOT", "achieved"=>1},
          {"name"=>"WIN_PISTOLROUNDS_LOW", "achieved"=>1},
          {"name"=>"LOSSLESS_EXTERMINATION", "achieved"=>1},
          {"name"=>"UNSTOPPABLE_FORCE", "achieved"=>1},
          {"name"=>"IMMOVABLE_OBJECT", "achieved"=>1},
          {"name"=>"HEADSHOTS_IN_ROUND", "achieved"=>1},
          {"name"=>"KILL_WHILE_IN_AIR", "achieved"=>1},
          {"name"=>"DOMINATIONS_LOW", "achieved"=>1},
          {"name"=>"DOMINATION_OVERKILLS_LOW", "achieved"=>1},
          {"name"=>"REVENGES_LOW", "achieved"=>1},
          {"name"=>"AVENGE_FRIEND", "achieved"=>1},
          {"name"=>"GUN_GAME_KILL_KNIFER", "achieved"=>1},
          {"name"=>"BASE_SCAMPER", "achieved"=>1}]}]

    ap "et avec les otpions je cherches les valuers"
    ap @options
    @stats = {}
    @options.each do |option|
      if @data[0].nil?
        end_value = 0
      else
        ap "je cherche la valeur de #{option[1][:action]}s_#{option[1][:gun]}"
        value = @data[0]["stats"].find { |stat| stat['name'].include?("#{option[1][:action]}s_#{option[1][:gun]}") }
        ap value
        end_value = value.blank? ? 0 : value['value']
      end
      @stats[option[0].to_s] = end_value
    end
    @stats
  end
end
