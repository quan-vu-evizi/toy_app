# REFACTOR:
#
module PaperclipOptions
  PATH_FORMAT = ":attachment/:id/:style:fingerprint.:extension"

  def self.options
    if Rails.env.test? || Rails.env.development?
      {
        path: ":rails_root/public/system/#{ PATH_FORMAT }",
        url: "/system/#{ PATH_FORMAT }",
        use_timestamp: false,
      }
    else
      values = {
        bucket:          Secrets.aws_bucket,
        convert_options: { all: '-strip -quality 80' }, # strip EXIF data
        path:            PATH_FORMAT,
        s3_credentials:  { access_key_id:     Secrets.aws_access_key,
                           secret_access_key: Secrets.aws_secret_key },
        s3_headers:      -> (_) { { "Cache-Control" => "public,max-age=#{365.days}" } },
        s3_protocol:     "https",
        storage:         :s3,
        use_timestamp:   false,
        preserve_files:  true
      }

      values.merge!(
        s3_host_alias:   Secrets.asset_host.presence,
        url:             ":s3_alias_url"
      ) if Secrets.asset_host.present?

      values
    end
  end
end
