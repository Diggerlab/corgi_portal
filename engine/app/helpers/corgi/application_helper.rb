module Corgi
  module ApplicationHelper
    def customize_time(time)
      time = time.strftime("%Y-%m-%d %H:%M:%S")
    end

    def perform_in_resque(class_name, params=[])
      if Rails.env.test?
        class_name.perform params
      else
        Resque.enqueue class_name, params
      end
      
    end

    # def version_item(version)
    #   if version.item
    #     link_to version.item, eval("admin_#{version.item.class.to_s.downcase}_path(version.item)")
    #   else
    #     "#{version.item_type}##{version.item_id}"
    #   end
    # end
    # def admin_item(admin)
    #   if admin.whodunnit
    #     link_to AdminUser.find(admin.whodunnit).email, admin_admin_user_path(AdminUser.find(admin.whodunnit))
    #   else
    #     "admin_user destroy"
    #   end
    # end
  end
end
