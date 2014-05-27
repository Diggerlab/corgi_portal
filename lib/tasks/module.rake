desc "load service data"
task "create:service" => :environment do
  titles = ['users', 'logins', 'passwords_requests', 'build_versions', 'notices', 'friends', 
    'recharges', 'reponses', 'sessions', 'feedbacks']

  descriptions = ['用户注册相关模块', '用户登录模块', '找回用户密码模块', '游戏版本控制模块', '游戏公告模块', 
    '导入新浪好友模块', '苹果IAP内支付模块', '回复用户反馈模块', '第三方登录模块新浪&QQ', '玩家反馈模块']

  states = ['system', 'system', 'system', 'user', 'user', 'user', 'user', 'user', 'user', 'user']
  Service.delete_all
  titles.each_with_index do |content, i|
    Service.create!(code: "corgi_#{content}", title: content, description: descriptions[i], state: states[i])
  end

end 