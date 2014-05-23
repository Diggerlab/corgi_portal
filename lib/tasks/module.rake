desc "load service data"
task "create:service" => :environment do
  titles = ['build_versions', 'feedbacks', 'friends', 'logins', 'notices', 'passwords_requests', 
    'recharges', 'reponses', 'sessions', 'users']

  descriptions = ['游戏版本控制模块', '玩家反馈模块', '导入新浪好友模块', '用户登录模块', '游戏公告模块', 
    '找回用户密码模块', '苹果IAP内支付模块', '回复用户反馈模块', '第三方登录模块新浪&QQ', '用户注册相关模块']

  Service.delete_all
  titles.each_with_index do |content, i|
    Service.create!(code: "corgi_#{content}", title: content, description: descriptions[i])
  end

end 