class Schedule < ApplicationRecord
  include Fae::BaseModelConcern

  before_save :set_total
  after_save :schedule_service_email
  belongs_to :client
  has_many :schedule_statuses, dependent: :destroy
  accepts_nested_attributes_for :schedule_statuses, reject_if: :all_blank, allow_destroy: true

  def fae_display_field
    client.name
  end

  def self.for_fae_index
    order(:id)
  end

  def set_total
    self.total = schedule_statuses.inject(0){|sum, item| sum + item.service.price}
  end

  def schedule_service_email
      sch = Schedule.last
      services = sch.schedule_statuses
      service = services[0]
      #verificar o date ao atualizar o schedule
      if service.status == "Done"
        CampaignJob.perform_later(client, "Service: #{service.service.title} 
                  schedulled", 
                  "Successful scheduling for the day #{service.date}. \n
                  Status: #{service.status} \n
                  Price: #{sch.total}")
      elsif service.status == "Waiting"
        CampaignJob.perform_later(client, "Waiting for schedulled of service: 
                  #{service.service.title}", 
                  "Waiting for a vacancy for service #{service.service.title} 
                  for day #{service.date}. \n
                  Status: #{service.status} \n
                  Valor: #{sch.total}")
      else
        CampaignJob.perform_later(client, "Service: #{service.service.title} 
                  cancelled", 
                  "Unfortnelly the service #{service.service.title} 
                  schedulled for day #{service.date}. \n
                  has to be cancelled. \n
                  Status: #{service.status} \n
                  Valor: #{sch.total}")
      end
  end
end
