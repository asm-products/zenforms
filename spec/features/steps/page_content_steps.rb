module PageContentSteps
  extend RSpec::Matchers::DSL


  def display_flash_message(message_type, message_i18n_token, message_params={}, class_prefix= :alert, class_sep="-")
    text = I18n.t(message_i18n_token, message_params)
    have_tag(:div, text:/#{text}/, with: {class: "#{class_prefix} #{class_prefix}#{class_sep}#{message_type}"})
  end

  def display_error_message(error_token, params={})
    display_flash_message(:danger, "errors.#{error_token}", params)
  end

  def submit_form
    click_link_or_button('submit_form')
  end

  shared_examples 'an errored form page' do
    it 'displays the right # of errors' do
     sentence = I18n.t("errors.messages.not_saved",
      count: error_messages.count,
      resource: 'user')
     expect(page).to have_form(form_action, form_method) do
      have_tag(:div,
       text: /#{sentence}/,
       with: {id: 'error_explanation'})
    end
  end
  it 'displays expected error messages' do
    error_messages.each_pair do | attribute, message|
      if attribute == :base
        msg = message
      else
        if message.is_a? Hash
          params = message
          message = message[:key]
        else
          params = {}
        end
        msg = I18n.t('errors.format',
         attribute: attribute.to_s.humanize,
         message: I18n.t("errors.messages.#{message}", params))
      end
      msg_regex = Regexp.new(Regexp.quote(msg), Regexp::IGNORECASE)
      expect(page).to have_css('#error_explanation', text: msg_regex )
    end
  end

  it 'displays the right fields as errored' do
    error_fields.each do |field|
      if defined?(form_resource)
        field = "#{form_resource}_#{field}"
      end
      expect(page).to have_css("div.has-error ##{field}")
    end
  end
end


shared_examples 'a page with a form' do
  it 'with the right actions' do
    expect(page).to have_form(form_action, form_method), 'couldnt find form'
  end
  it 'that has expected fields' do
    expect(page).to have_form(form_action, form_method) do
      form_fields.each_pair do |field_name, field_type|
        if defined?(form_resource)
          field_name = "#{form_resource}[#{field_name}]"
        end
        if field_type.is_a? Hash
          type = field_type[:type]
          field_type[:values].each do |value|
            options = form_tag_options(type,field_name,value)
            should_have_input(options)
          end
        elsif field_type == :select || field_type == :textarea
          options = {with: {name: field_name}}
          with_tag(field_type, options)
        else
          options = form_tag_options(field_type, field_name)
          should_have_input(options)
        end
      end
    end
  end
  it 'has a submit button' do
    expect(page).to have_form(form_action, form_method) do
      with_submit form_submit
    end
  end
end



end