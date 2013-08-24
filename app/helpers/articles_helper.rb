require 'date'

module ArticlesHelper
  def week_select
    proposed_date = []
    tday = Date.today

    3.times do
      if tday.saturday?
        proposed_date << tday
        proposed_date << tday.next_day
        tday = next_saturday(tday)

      elsif tday.sunday?
        proposed_date << tday
        tday = next_next_saturday(tday)

      else
        proposed_date << next_saturday(tday)
        proposed_date << next_sanday(tday)
        tday = next_next_saturday(tday)
      end
    end

    proposed_date.map{|t|[t.strftime("(#{%w(日 月 火 水 木 金 土)[t.wday]})%m月%d日/%Y年")]}
  end

  def next_saturday(tday)
    if tday.saturday?
      tday.next_day(7)
    else
      tday += (6 - tday.wday)
    end
  end

  def next_sanday(tday)
    tday += (6 - tday.wday)
    tday + 1
  end

  def next_next_saturday(tday)
    next_saturday next_saturday tday
  end
end
