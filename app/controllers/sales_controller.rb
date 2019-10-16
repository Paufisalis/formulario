class SalesController < ApplicationController

  def new
  end
  def create
    sale = Sale.new(sales_params)
    sale.total = sale.value.to_f * (1-(sale.discount.to_f/100))
    if sale.tax == 0
      sale.total = sale.total * 1.19
      sale.tax = 19
    else
      sale.tax = 0
    end
    sale.save
    if sale.save
      redirect_to sales_done_path
    end
  end

  def done
    @sales = Sale.all
  end

  private
  def sales_params
    params.require(:sale).permit(:cod, :detail, :category, :value, :discount, :tax)
  end
end
