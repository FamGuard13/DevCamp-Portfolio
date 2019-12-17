module SchoolsHelper
  def school_end_date(school)
    if school.end_date?
      school.end_date.strftime("%b, %Y")
    else
      'Current'
    end
  end
end
