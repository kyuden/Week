require 'date'

module ArticlesHelper

  def week_select
    array = []
    tday = Date.today

    if (tday.wday == 0)
      array <<  tday
    end

    while( tday < Date.today >> 1 ) do
      wday = tday.wday
      diff = wday - 6
      if(diff == 0)
        array << tday
        array << (tday + 1)
      else
        array << (tday - diff)
        array << (tday - diff + 1)
      end
      tday = (tday - diff + 1)
    end

    array.map{|t|[t.strftime("(#{%w(日 月 火 水 木 金 土)[t.wday]})%m月%d日/%Y年")]}
  end
end
