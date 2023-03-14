module ApplicationHelper

    def game_name(game)
        {
            'csgo': 'Counter Strike: Global Offensive',
            'lol': 'League of Legends',
            'dota-2': 'Dota 2',
            'apex': 'Apex Legends',
        }[game.to_sym]
    end
end
