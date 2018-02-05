# This migration comes from active_storage (originally 20170806125915)
class CreateActiveStorageTables < ActiveRecord::Migration[5.2]
  def change
    enable_extension "plpgsql"
    enable_extension "uuid-ossp"
    enable_extension "pgcrypto"

    create_table :active_storage_blobs, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string   :key,        null: false
      t.string   :filename,   null: false
      t.string   :content_type
      t.text     :metadata
      t.bigint   :byte_size,  null: false
      t.string   :checksum,   null: false
      t.datetime :created_at, null: false

      t.index [ :key ], unique: true
    end

    create_table :active_storage_attachments, id: :uuid, default: -> { "gen_random_uuid()" } do |t|
      t.string :name,     null: false
      t.uuid :record_id, null: false
      t.string :record_type, null: false
      t.uuid :blob_id,     null: false
      t.datetime :created_at, null: false

      t.index [ :record_type, :record_id, :name, :blob_id ], name: "index_active_storage_attachments_uniqueness", unique: true
    end

    create_table "posts", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string "title"
      t.jsonb "data"
      t.timestamps
    end

    create_table "episodes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
      t.string "title"
      t.jsonb "data"
      t.timestamps
    end
  end
end
