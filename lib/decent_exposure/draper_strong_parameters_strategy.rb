class DraperStrongParametersStrategy < DecentExposure::StrongParametersStrategy
  def resource
    super.decorate
  end
end
