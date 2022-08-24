class RankingsJob < ApplicationJob
  queue_as :default

  def perform(*args)
    reset_rankings

    rankings.each do |ranked_team|
      Team.find_by(school: ranked_team['school']).update!(rank: ranked_team['rank'])
    end
  end

  private

  def reset_rankings
    Team.where.not(rank: nil).each do |team|
      team.update!(rank: nil)
    end
  end

  def rankings
    @rankings ||= CfbDataApi::Client.get_rankings
  end
end