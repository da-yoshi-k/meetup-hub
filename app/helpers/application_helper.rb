module ApplicationHelper
  FLASH_CLASSES = {
    notice: 'bg-blue-100 text-blue-800',
    success: 'bg-green-100 text-green-800',
    error: 'bg-red-100 text-red-800',
    alert: 'bg-yellow-100 text-yellow-800'
  }.freeze

  def flash_class(level)
    FLASH_CLASSES[level.to_sym] || 'bg-gray-100 text-gray-800'
  end
end
