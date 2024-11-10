Sequel.migration do
  change do
    create_table!(:applies, :ignore_index_errors=>true) do
      primary_key :id
      Boolean :read, :default => false
      Boolean :invited, :default => false
      Integer :job_id, :null => false
      Integer :geek_id, :null => false

      DateTime :created_at
      DateTime :upated_at

      index :id
    end
  end
end