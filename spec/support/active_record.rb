require "active_record"
ActiveRecord::Base.establish_connection adapter: "sqlite3", database: ":memory:"

I18n.enforce_available_locales = false

ActiveRecord::Migrator.up "db/migrate"

module ActiveModel::Validations
  # Extension to enhance `should have` on AR Model instances.  Calls
  # model.valid? in order to prepare the object's errors object.
  #
  # You can also use this to specify the content of the error messages.
  #
  # @example
  #
  #     model.should have(:no).errors_on(:attribute)
  #     model.should have(1).error_on(:attribute)
  #     model.should have(n).errors_on(:attribute)
  #
  #     model.errors_on(:attribute).should include("can't be blank")
  def errors_on(attribute)
    valid?
    [errors[attribute]].flatten.compact
  end
  alias error_on errors_on
end
