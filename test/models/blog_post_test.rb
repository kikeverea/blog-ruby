require "test_helper"

class BlogPostTest < ActiveSupport::TestCase

  #### draft? ####

  test "draft? returns true for BlogPosts with nil 'publised_at' date " do
    # binding.irb
    assert blog_posts(:draft).draft?
  end

  test "draft? returns false for BlogPosts with future 'publised_at' date " do
    refute blog_posts(:scheduled).draft?
  end

  test "draft? returns false for BlogPosts with past 'publised_at' date " do
    refute blog_posts(:published).draft?
  end

  #### scheduled? ####

  test "scheduled? returns true for BlogPosts with future 'publised_at' date " do
    assert blog_posts(:scheduled).scheduled?
  end

  test "scheduled? returns false for BlogPosts with past 'publised_at' date " do
    refute blog_posts(:published).scheduled?
  end

  test "scheduled? returns false for BlogPosts with nil 'publised_at' date " do
    refute blog_posts(:draft).scheduled?
  end

  #### published? ####

  test "published? returns true for BlogPosts with past 'publised_at' date " do
    assert blog_posts(:published).scheduled?
  end

  test "published? returns false for BlogPosts with future 'publised_at' date " do
    refute blog_posts(:scheduled).scheduled?
  end

  test "published? returns false for BlogPosts with nil 'publised_at' date " do
    refute blog_posts(:draft).scheduled?
  end
end
