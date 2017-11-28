class Machine < ApplicationRecord
  belongs_to :company
  has_many :machine_categories, dependent: :destroy
  has_many :categories, through: :machine_categories
  validates :address, presence: true
  has_attachment :building_photo
  has_attachment :machine_photo
  has_attachment :qr_code

  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  after_create :create_qrcode



  def create_qrcode
    text = self.id.to_s
    code = RQRCode::QRCode.new(text, size: 3)
    file = Dir.tmpdir + "/qrcode-#{SecureRandom.hex}.png"
    png = code.as_png(
     resize_gte_to: false,
     resize_exactly_to: false,
     fill: 'white',
     color: 'black' ,
     size: 120,
     border_modules: 4,
     module_px_size: 6,
     file: file # path to write
    )
    self.qr_code = File.open(file, 'r')
end

end
