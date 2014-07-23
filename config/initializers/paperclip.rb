# Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
# Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id_partition/:style/:filename'
# Paperclip.interpolates(:s3_sg_url) do |att, style|
#   "#{att.s3_protocol}://s3-ap-southeast-1.amazonaws.com/#{att.bucket_name}/#{att.path(style)}"
# end