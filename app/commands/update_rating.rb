class UpdateRating
  prepend SimpleCommand

  def initialize(id, user_rating)
    @rating = Rating.find(id)
    @user_rating = user_rating
  end

  def call
    if @rating.update(stars: @user_rating)
      return @rating
    else
      errors.add(:base, :failure)
    end
  end
end