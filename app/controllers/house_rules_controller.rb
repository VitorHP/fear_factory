class HouseRulesController < ApplicationController
  skip_before_filter :authenticate_user!, only: [:index, :show, :tags, :tag_cloud]

  respond_to :js, only: [:like, :favorite]

  authorize_resource

  def index
    @house_rules = Filter.new(HouseRule.accessible_by(current_ability), params).filter.sort_by{ |a| a.likes.size }.reverse
  end

  def new
    @house_rule = HouseRule.new
  end

  def create
    @house_rule = current_user.house_rules.build house_rule_params

    if @house_rule.save
      redirect_to house_rule_path(@house_rule)
    else
      render :new
    end
  end

  def edit
    @house_rule = HouseRule.friendly.find(params[:id])
  end

  def show
    @house_rule = HouseRule.friendly.find(params[:id])
  end

  def update
    @house_rule = HouseRule.friendly.find params[:id]

    if @house_rule.update_attributes house_rule_params
      redirect_to house_rule_path(@house_rule)
    else
      render :edit
    end
  end

  def tags
    @tags = ActsAsTaggableOn::Tagging.where(:context => :tags).joins(:tag).select('DISTINCT tags.name').map{ |t| t.name.split(/ ?, ?/) }.flatten.uniq
    render json: @tags
  end

  def tag_cloud
    render json: TagCloudBuilder.new(self, HouseRule).build_for(:tags)
  end

  def like
    @house_rule = HouseRule.friendly.find params[:id]

    if current_user.voted_for? @house_rule
      @house_rule.unliked_by current_user
    else
      @house_rule.liked_by current_user
    end

    render json: @house_rule
  end

  def favorite
    @house_rule = HouseRule.friendly.find params[:id]

    if @house_rule.favorited_by? current_user
      @house_rule.unfavorited_by current_user
    else
      @house_rule.favorited_by current_user
    end

    render json: @house_rule
  end

  def comment
    @house_rule = HouseRule.friendly.find params[:id]

    @comment = @house_rule.comments.create comment_params.merge(user: current_user)

    redirect_to house_rule_path(@house_rule)
  end

  def uncomment
    @house_rule = HouseRule.friendly.find params[:id]

    @house_rule.comments.find(params[:comment_id]).destroy

    redirect_to house_rule_path(@house_rule)
  end

  private

  def house_rule_params
    params.require(:house_rule).permit([
      :name, :thirty_second_version, :description, :type_tags, :idiom
    ])
  end

  def comment_params
    params.require(:comment).permit([
      :title, :comment
    ])
  end
end
