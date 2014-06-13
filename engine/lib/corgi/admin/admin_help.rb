def version_item(version)
  link = "admin_" + "#{version.item.class.to_s}".split(/(?=[A-Z])|::/).join('_').downcase + "_path(version.item)"
  if version.item
    link_to version.item, eval(link)
  else
    "#{version.item_type}##{version.item_id}"
  end
end

def admin_item(admin)
  if admin.whodunnit
    link_to AdminUser.find(admin.whodunnit).email, admin_admin_user_path(AdminUser.find(admin.whodunnit))
  else
    "admin_user destroy"
  end
end