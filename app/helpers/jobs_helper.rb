module JobsHelper
  def job_end_date(job)
    if job.end_date?
      job.end_date.strftime("%b, %Y")
    else
      'Current'
    end
  end
end
