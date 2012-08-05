module LayoutHelper
  def title_tag(page_title, opts={})
    opts.reverse_merge!(:default_title => APP_NAME)
    content_tag :title, [opts[:default_title], page_title].
      reject { |x| x.to_s.strip.blank? }.
      join(' - ')
  end

  def body_tag(options={}, &block)
    controller_name = controller.controller_path.gsub('/', '-').gsub('_', '-')
    body_class = [controller_name, options[:class]].compact.join(' ')
    body_id = [controller_name, controller.action_name].join('-')

    content_tag(:body, capture(&block), :class => body_class, :id => body_id)
  end

  def nav_link(title, path, options={})
    current_controller = options[:controller] || title.downcase
    controller_name = controller.controller_name
    active = controller_name == current_controller
    content_tag :li, :class => ('active' if active) do
      link_to title, path
    end
  end
end
