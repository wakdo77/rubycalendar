class Calendar < Struct.new(:view, :date, :callback)
    # HEADER = %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday]
    HEADER = %w[# Mon Tues Wed Thu Fri Sat Sun]
    START_DAY = :monday

    delegate :content_tag, to: :view

    def table
      content_tag :table, class: "calendar table table-bordered table-striped" do
        header + week_rows
      end
    end

    def header
      content_tag :tr do
        HEADER.map { |day| content_tag :th, day }.join.html_safe
      end
    end

    def week_rows
      weeks.map do |week|
        content_tag :tr do
          #weeknumber = content_tag :td, week.first.cweek
          week_cell(week.first) + week.map { |day| day_cell(day) }.join.html_safe
        end
      end.join.html_safe
    end

    def week_cell(day)
      weeknumbers = content_tag :td, day.cweek, class: "week-numbers small"
    end

    def day_cell(day)
      days = content_tag :td, view.capture(day, &callback), class: day_classes(day)
    end

    def day_classes(day)
      classes = []
      classes << "today" if day == Date.today
      classes << "not-month" if day.month != date.month
      classes.empty? ? nil : classes.join(" ")
    end

    def weeks
      first = date.beginning_of_month.beginning_of_week(START_DAY)
      last = date.end_of_month.end_of_week(START_DAY)
      (first..last).to_a.in_groups_of(7)
    end
end
