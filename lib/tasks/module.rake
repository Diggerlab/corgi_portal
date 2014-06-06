desc "load service data"
task "create:service" => :environment do
  titles = ['users', 'build_versions', 'notices', 'friends', 'recharges', 'feedbacks', 'sessions']

  descriptions = ['用户模块','游戏版本控制模块', '游戏公告模块', '导入新浪好友模块', '苹果IAP内支付模块', '用户反馈模块', '第三方登录模块新浪&QQ']

  states = ['system', 'user', 'user', 'user', 'user', 'user', 'user']

  Service.delete_all
  titles.each_with_index do |content, i|
    Service.create!(code: "corgi_#{content}", title: content, description: descriptions[i], state: states[i])
  end

end 


desc "load service_functions data"
task "create:service_functions" => :environment  do
  user_titles = ['用户注册', '用户登录', '修改密码', '忘记密码发送邮件', '通过邮箱修改密码']
  user_api = ['http://gts.api.engine.com:3001/corgi/users/new,方法:get', 'http://gts.api.engine.com:3001/corgi/login,方法:get', 'http://gts.api.engine.com:3001/corgi/users/:token/change_password,参数：token, 方法:get ',
   'http://gts.api.engine.com:3001/corgi/password_requests/new,方法:get', 'http://gts.api.engine.com:3001/corgi/password_requests/new_password,方法:get']
  user_instructions = ['通过调用API接口可以使游戏用户注册', '通过调用API接口可以登录游戏', 
    '通过调用API接口可以使游戏用户以自行修改密码', '通过调用API接口可以使游戏用户找回密码', '通过调用API接口可以使游戏通过邮箱链接修改密码']

  build_versions_titles = ['获取版本更新']
  build_versions_api = ['http://gts.api.engine.com:3001/corgi/build_versions.json,参数:publisher 游戏号 build 版本号，方法:get']
  build_versions_instructions = ['通过调用API接口可以使游戏用户更新游戏']

  notices_titles = ['获取公告(多语言)']
  notices_api = ['http://gts.api.engine.com:3001/corgi/notices.json, 参数:lag(en,ja,zn),方法:get']
  notices_instructions = ['通过调用API接口获取公告信息']

  friends_titles = ['获取好友列表', '导入好友']
  friends_api = ['http://gts.api.engine.com:3001/corgi/friends.json, 参数:token,方法:get', 'http://gts.api.engine.com:3001/corgi/friends/import, 参数:token 用户 token :email 用户 email, :code 用户唯一 code, 方法:post']
  friends_instructions = ['通过调用API接口获取好友列表', '通过调用API接口导入新浪好友']

  recharges_titles = ['获取iap产品列表', '购买 iap 产品回调接口']
  recharges_api = ['http://gts.api.engine.com:3001/corgi/recharges.json, 参数:token,方法:get', 'http://gts.api.engine.com:3001/corgi/recharges.json, 参数:token,方法:post']
  recharges_instructions = ['通过调用API接口获取好友列表', '通过调用API接口导入新浪好友']


  feedbacks_titles = ['反馈', '回复']
  feedbacks_api = ['http://gts.api.engine.com:3001/corgi/feedbacks/new, 参数:token,方法:get', 'http://gts.api.engine.com:3001/corgi/feedbacks/feedback_id/responses/new, 参数:token,:feedback_id回复feedback的id,方法:get']
  feedbacks_instructions = ['通过调用API接口用户可以提交反馈', '通过调用API接口可以进行回复用户']

  sessions_titles = ['qq账号登录', '新浪账号登录']
  sessions_api = ['http://gts.api.engine.com:3001/corgi/sessions/qq_callback, 参数:weibo_access_token:qq 登录成功后返回的 Access Token;client_id: your app_id;open_id: your open_id; expires_in_sec:Access Token 将要过期的秒数,方法:post',
   'http://gts.api.engine.com:3001/corgi/sessions/sina_callback, 参数:weibo_access_token:sina 登录成功后返回的 Access Token; expires_in_sec:Access Token 将要过期的秒数,方法:post']
  sessions_instructions = ['通过调用API接口可以提供QQ登录', '通过调用API接口可以提供新浪登录']

  services = Service.all   
  ServiceFunction.delete_all
  user_titles.each_with_index do |content, i|
    ServiceFunction.create!(title: content, api: user_api[i], service_id: services[0].id, instruction: user_instructions[i])
  end

  build_versions_titles.each_with_index do |content, i|
     ServiceFunction.create!(title: content, api: build_versions_api[i], service_id: services[1].id, instruction: build_versions_instructions[i])
  end

  notices_titles.each_with_index do |content, i|
    ServiceFunction.create!(title: content, api: notices_api[i], service_id: services[2].id, instruction: notices_instructions[i])
  end

  friends_titles.each_with_index do |content, i|
    ServiceFunction.create!(title: content, api: friends_api[i], service_id: services[3].id, instruction: friends_instructions[i])
  end

  recharges_titles.each_with_index do |content, i|
    ServiceFunction.create!(title: content, api: recharges_api[i], service_id: services[4].id, instruction: recharges_instructions[i])
  end

  feedbacks_titles.each_with_index do |content, i|
    ServiceFunction.create!(title: content, api: feedbacks_api[i], service_id: services[5].id, instruction: feedbacks_instructions[i])
  end

  sessions_titles.each_with_index do |content, i|
    ServiceFunction.create!(title: content, api: sessions_api[i], service_id: services[6].id, instruction: sessions_instructions[i])
  end


end

