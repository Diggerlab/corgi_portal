ActiveAdmin.register_page "Dashboard" do

  # menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  # content title: proc{ I18n.t("active_admin.dashboard") } do
    

  #   section "Recently updated content" do
  #     table_for PaperTrail::Version.order('id desc').limit(20) do # Use PaperTrail::Version if this throws an error
  #       column "Item" do |v| version_item(v) end
  #       column "Event" do |v| v.event end  # Uncomment to display as link
  #       column "Type" do |v| v.item_type.underscore.humanize end
  #       column "Modified at" do |v| v.created_at.to_s :long end
  #       column "Admin" do |v| admin_item(v) end
  #     end
  #   end
  # end # content

end
