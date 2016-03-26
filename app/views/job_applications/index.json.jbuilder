json.array!(@job_applications) do |job_application|
  json.extract! job_application, :id, :applicant, :listing
  json.url job_application_url(job_application, format: :json)
end
