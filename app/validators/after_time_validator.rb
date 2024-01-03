class AfterTimeValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    compared_with = record.public_send(options.fetch(:with))

    return if compared_with.blank?

    if value <= compared_with
      record.errors.add(attribute, (options[:message] || "must be after #{options[:with].to_s.humanize}"))
    end
  end
end
