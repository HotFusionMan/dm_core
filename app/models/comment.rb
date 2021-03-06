# Generated from acts_as_commentable
#------------------------------------------------------------------------------
class Comment < ActiveRecord::Base
  include           ActsAsCommentable::Comment

  self.table_name   = 'core_comments'
  attr_accessible   :body, :title, :user_id

  belongs_to        :commentable, :polymorphic => true, :counter_cache => true
  has_ancestry      :cache_depth => true

  #--- don't add ordering to default scope, as it messes with calculating recent_comment
  default_scope     { where(account_id: Account.current.id) }

  #--- NOTE: install the acts_as_votable plugin to vote on the quality of comments
  #acts_as_voteable

  #--- don't use a counter cache until you can seperate users per account
  belongs_to        :user #, :counter_cache => true
  
  self.per_page = 10

end
