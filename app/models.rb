
class Crash < ActiveRecord::Base
  self.primary_key = :crash_id
  self.table_name = :crash

  # default_scope { order('crash_dt DESC') }

  alias_attribute :injuries, :tot_inj_cnt
  alias_attribute :major_injuries, :tot_inj_lvl_a_cnt
  alias_attribute :moderate_injuries, :tot_inj_lvl_b_cnt
  alias_attribute :minor_injuries, :tot_inj_lvl_c_cnt
  alias_attribute :fatalities, :tot_fatal_cnt

  has_many :participants, :join_table => :partic
  has_many :vehicles, :join_table => :vhcl

  scope :pedestrians, -> { where("crash_typ_cd = '3'") }
  scope :cyclist, -> { where("crash_typ_cd = '6'") }
  scope :pedestrians_and_cyclist, -> { where("crash_typ_cd in('3', '6')") }

  def errors
    participants.map(&:errors).flatten
  end

  def events
    CrashEvent.find([crash_evnt_1_cd, crash_evnt_2_cd, crash_evnt_3_cd].compact)
  end
end

class Participant < ActiveRecord::Base
  self.primary_key = :partic_id
  self.table_name  = :partic

  has_one :vehicle,
    :foreign_key => :vhcl_id,
    :primary_key => :vhcl_id

  def causes
    Cause.find([partic_cause_1_cd, partic_cause_2_cd, partic_cause_3_cd])
  end

  def errors
    CrashError.find([partic_err_1_cd, partic_err_2_cd, partic_err_3_cd])
  end

  def events
    CrashEvent.find([partic_evnt_1_cd, partic_evnt_2_cd, partic_evnt_3_cd].compact)
  end
end

class Vehicle < ActiveRecord::Base
  self.primary_key = :vhcl_id
  self.table_name  = :vhcl

  alias_attribute :ownership, :vhcl_ownshp_short_desc
  alias_attribute :kind, :vhcl_typ_short_desc

  has_one :movement,
    :foreign_key => :mvmnt_cd,
    :primary_key => :mvmnt_cd

  has_one :action,
    :foreign_key => :actn_cd,
    :primary_key => :actn_cd
end

class Movement < ActiveRecord::Base
  self.primary_key = :mvmnt_cd
  self.table_name = :mvmnt
end

class Action < ActiveRecord::Base
  self.primary_key = :actn_cd
  self.table_name = :actn

  alias_attribute :description, :actn_long_desc
end

class Cause < ActiveRecord::Base
  self.primary_key = :cause_cd
  self.table_name = :cause

  alias_attribute :description, :cause_long_desc
end

class Event < ActiveRecord::Base
  self.primary_key = :event_cd
  self.table_name  = :evnt

  alias_attribute :description, :evnt_long_desc
end

class CrashError < ActiveRecord::Base
  self.primary_key = :crash_err_cd
  self.table_name  = :err

  alias_attribute :description, :crash_err_long_desc
end

class CrashEvent < ActiveRecord::Base
  self.primary_key = :evnt_cd
  self.table_name  = :evnt

  alias_attribute :description, :evnt_long_desc
end
