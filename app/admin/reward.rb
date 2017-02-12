ActiveAdmin.register Task do
permit_params :name, :age, :institution, :prize, :score, :paid, :number, :contest_id, :user_id
actions :index, :show, :destroy, :edit, :update, :new, :create
menu label: 'Задания'

filter :id
filter :user_id, label: "user id"

index do
  id_column
  column :contest_id, label: "id олимпиады"
  column :user_id, label: "id пользователя"
  column :name, label: "Имя"
  column :age, label: "Возраст"
  column :institution, label: "Школа"
  column :prize, label: "Место"
  column :paid, label: "Оплачено?"
  actions
end

show do
  attributes_table do
    row :id
    row :contest_id
    row :user_id
    row :name
    row :age
    row :institution
    row :prize
    row :score
    row :paid
    row :number
    row :created_at
    row :updated_at
  end
  active_admin_comments
end

end
