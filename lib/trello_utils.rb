require 'trello'

class TrelloUtils

  def initialize
    Trello.configure do |config|
      config.developer_public_key = ENV['TRELLO_DEVELOPER_PUBLIC_KEY']
      config.member_token = ENV['TRELLO_MEMBER_TOKEN']
    end
  end

  def fetch_cards(project)
    result = []
    board = fetch_board(project)
    board.cards.each do |card|
      result << { project_id: project.id, title: card.name, description: card.desc, uid: card.id, issue_url: card.url }
    end
    result
  end

  def fetch_board(project)
    Trello::Board.find(project.trello_board_uid)
  end

  def fetch_user
    bob = Trello::Member.find("bobtester")
  end
end