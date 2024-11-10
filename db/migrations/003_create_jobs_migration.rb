Sequel.migration do
  change do
    create_table!(:jobs, :ignore_index_errors=>true) do
      primary_key :id
      String :name, :text=>true, :null => false
      String :place, :text=>true, :null => false
      Integer :company_id, :null => false

      DateTime :created_at
      DateTime :upated_at

      index :id
    end
  end
end