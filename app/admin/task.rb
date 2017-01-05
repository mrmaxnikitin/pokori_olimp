ActiveAdmin.register Task do
permit_params :text, :var1, :var2, :var3, :var4, :answer, :image, :contest_id, :classroom
actions :index, :show, :destroy, :edit, :update, :new, :create
menu label: 'Задания'

filter :id
filter :classroom, label: "Класс"
filter :contest_id, label: "Олимпиада"

index do
  id_column
  column :contest_id, label: "id олимпиады"
  column :classroom, label: "Класс"
  column :text, label: "Текст вопроса"
  actions
end

show do
  attributes_table do
    row :id
    row :contest_id
    row :classroom
    row :text
    row :var1
    row :var2
    row :var3
    row :var4
    row :answer
    row :created_at
    row :updated_at
    row (:image) { |t| image_tag(t.image.to_s) }
  end
  active_admin_comments
end

end
