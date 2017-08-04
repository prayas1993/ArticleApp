class FilterController < ApplicationController
  
  def activated
  	@articles=Article.where(:isactive=>true).paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def deactivated
  	@articles=Article.where(:isactive=>false).paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

  def pricefilter 
  end

  def apply_price_filter
    @articles = Article.in_price_range(params[:min_value], params[:max_value]).paginate(page: params[:page], per_page: 5).order('created_at DESC')
  end

end
