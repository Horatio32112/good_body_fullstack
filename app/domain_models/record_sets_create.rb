require_relative 'common_error'

class RecordSetsCreate

    attr_accessor :user_id, :user, :content, :set, :rep, :weight

    def initialize(user_id, content, set, rep, weight)
        @user_id = user_id
        @content = content
        @set = set
        @rep = rep
        @weight = weight
        @user = User.find_by(id: user_id)
    end

    def create_set_record
        user_not_found!
        content_is_wrong!
        set_is_wrong!
        rep_is_wrong!
        weight_is_wrong!
        succeed_to_create_set
    end

    private

    def user_not_found!
        raise NoUseridError.new if user.blank?
    end

    def content_is_wrong!
        raise NoContentError.new if content.blank?
    end

    def set_is_wrong!
        raise NoSetError.new(set) if set.blank? || set == 0 || set.negative? || set > 100
    end

    def rep_is_wrong!
        raise NoRepError.new(rep) if rep.blank? || rep == 0 || rep.negative? || rep > 100
    end

    def weight_is_wrong!
        raise NoWeightError.new(weight) if weight.blank? || weight ==0 || weight.negative? || weight > 300

    end
    
    def succeed_to_create_set
        RecordSetRepository.create_set_record(user_id, content, set, rep, weight)
    end

end