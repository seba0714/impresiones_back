class BrandsController < ApplicationController

  def index
    @brands = Brand.all
    render json: @brands.to_json
  end

  def show
    render json: brand.to_json
  end

  def create
    @brand = Brand.new(permitted_params)
    if @brand.save
      render json: @brand.to_json
    else render json: @brand.errors.to_json
    end
  end

  def update
    if brand.update(permitted_params)
      render json: brand.to_json
    else render json: brand.errors.to_json
    end
  end

  def destroy
    brand.destroy
    render json: brand.to_json
  end

  def permitted_params
    params.permit(:name)
  end

  def brand
    @brand ||= Brand.find(params[:id])
  end
end
