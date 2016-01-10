# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160109163863) do

  create_table "refinery_blog_categories", force: :cascade do |t|
    t.string   "title",      limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",       limit: 255
  end

  add_index "refinery_blog_categories", ["id"], name: "index_refinery_blog_categories_on_id", using: :btree
  add_index "refinery_blog_categories", ["slug"], name: "index_refinery_blog_categories_on_slug", using: :btree

  create_table "refinery_blog_categories_blog_posts", force: :cascade do |t|
    t.integer "blog_category_id", limit: 4
    t.integer "blog_post_id",     limit: 4
  end

  add_index "refinery_blog_categories_blog_posts", ["blog_category_id", "blog_post_id"], name: "index_blog_categories_blog_posts_on_bc_and_bp", using: :btree

  create_table "refinery_blog_category_translations", force: :cascade do |t|
    t.integer  "refinery_blog_category_id", limit: 4,   null: false
    t.string   "locale",                    limit: 255, null: false
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.string   "title",                     limit: 255
    t.string   "slug",                      limit: 255
  end

  add_index "refinery_blog_category_translations", ["locale"], name: "index_refinery_blog_category_translations_on_locale", using: :btree
  add_index "refinery_blog_category_translations", ["refinery_blog_category_id"], name: "index_a0315945e6213bbe0610724da0ee2de681b77c31", using: :btree

  create_table "refinery_blog_comments", force: :cascade do |t|
    t.integer  "blog_post_id", limit: 4
    t.boolean  "spam"
    t.string   "name",         limit: 255
    t.string   "email",        limit: 255
    t.text     "body",         limit: 65535
    t.string   "state",        limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "refinery_blog_comments", ["blog_post_id"], name: "index_refinery_blog_comments_on_blog_post_id", using: :btree
  add_index "refinery_blog_comments", ["id"], name: "index_refinery_blog_comments_on_id", using: :btree

  create_table "refinery_blog_post_translations", force: :cascade do |t|
    t.integer  "refinery_blog_post_id", limit: 4,     null: false
    t.string   "locale",                limit: 255,   null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.text     "body",                  limit: 65535
    t.text     "custom_teaser",         limit: 65535
    t.string   "custom_url",            limit: 255
    t.string   "slug",                  limit: 255
    t.string   "title",                 limit: 255
  end

  add_index "refinery_blog_post_translations", ["locale"], name: "index_refinery_blog_post_translations_on_locale", using: :btree
  add_index "refinery_blog_post_translations", ["refinery_blog_post_id"], name: "index_refinery_blog_post_translations_on_refinery_blog_post_id", using: :btree

  create_table "refinery_blog_posts", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.text     "body",             limit: 65535
    t.boolean  "draft"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id",          limit: 4
    t.string   "custom_url",       limit: 255
    t.text     "custom_teaser",    limit: 65535
    t.string   "source_url",       limit: 255
    t.string   "source_url_title", limit: 255
    t.integer  "access_count",     limit: 4,     default: 0
    t.string   "slug",             limit: 255
  end

  add_index "refinery_blog_posts", ["access_count"], name: "index_refinery_blog_posts_on_access_count", using: :btree
  add_index "refinery_blog_posts", ["id"], name: "index_refinery_blog_posts_on_id", using: :btree
  add_index "refinery_blog_posts", ["slug"], name: "index_refinery_blog_posts_on_slug", using: :btree

  create_table "refinery_settings", force: :cascade do |t|
    t.string   "name",            limit: 255
    t.text     "value",           limit: 65535
    t.boolean  "destroyable",                   default: true
    t.string   "scoping",         limit: 255
    t.boolean  "restricted",                    default: false
    t.string   "form_value_type", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug",            limit: 255
    t.string   "title",           limit: 255
  end

  add_index "refinery_settings", ["name"], name: "index_refinery_settings_on_name", using: :btree

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id",        limit: 4
    t.integer  "taggable_id",   limit: 4
    t.string   "taggable_type", limit: 255
    t.integer  "tagger_id",     limit: 4
    t.string   "tagger_type",   limit: 255
    t.string   "context",       limit: 255
    t.datetime "created_at"
  end

  add_index "taggings", ["tag_id", "taggable_id", "taggable_type", "context", "tagger_id", "tagger_type"], name: "taggings_idx", unique: true, using: :btree

  create_table "tags", force: :cascade do |t|
    t.string  "name",           limit: 255
    t.integer "taggings_count", limit: 4,   default: 0
  end

  add_index "tags", ["name"], name: "index_tags_on_name", unique: true, using: :btree

end
