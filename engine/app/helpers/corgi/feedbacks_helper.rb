module Corgi

    module FeedbacksHelper
      def change_content(content)
        content = content[0..5] + '....'  
      end
    end

end
