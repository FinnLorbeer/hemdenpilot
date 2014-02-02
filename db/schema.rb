ActiveRecord::Schema.define(version: 20140202164139) do

  create_table "shirts", force: true do |t|
    t.string   "code"
    t.string   "label"
    t.string   "description"
    t.string   "ean"
    t.string   "profile"
    t.string   "collar"
    t.string   "breast_pocket"
    t.string   "wristband"
    t.string   "color"
    t.string   "cloth"
    t.float    "price"
    t.string   "link"
    t.string   "affiliate"
    t.string   "picture"
    t.float    "size_collar"
    t.float    "size_bust"
    t.float    "size_waist"
    t.float    "size_body"
    t.float    "size_arm"
    t.float    "size_shoulder"
    t.float    "size_back"
    t.float    "size_wrist"
    t.string   "sleeve"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
