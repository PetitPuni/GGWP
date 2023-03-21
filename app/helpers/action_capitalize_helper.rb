module ActionCapitalizeHelper
  def action_capitalize(action)
    {
      hit: 'Hit',
      shot: 'Shot',
      kill: 'Kill'
    }[action.to_sym]
  end
end
