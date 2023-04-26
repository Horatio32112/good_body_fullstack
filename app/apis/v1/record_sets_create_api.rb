module V1

    class RecordSetsCreateApi < Grape::API
  
        resource :record_sets_create do

            # 新增健身紀錄
            params do
            requires :user_id, type: Integer
            requires :contents, type: String
            requires :sets, type: Integer # 組數
            requires :reps, type: Integer # 次數
            requires :weight, type: Float # 重量
            end
            
            post do
            record_function = RecordSetsCreate.new(
                params[:user_id],
                params[:contents], 
                params[:sets], 
                params[:reps], 
                params[:weight]
            )
            record_function.create_set_record
            end
        end
    end
end    