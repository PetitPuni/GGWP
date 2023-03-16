module ApplicationHelper

    def game_name(game)
        {
            'csgo': 'Counter Strike: Global Offensive',
            'TF2': 'Team Fortress 2',
            'dota-2': 'Dota 2',
            'apex': 'Apex Legends',
        }[game.to_sym]
    end
end
