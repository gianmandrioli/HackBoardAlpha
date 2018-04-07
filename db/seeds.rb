# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#Comunidad Hack Grupo default
#Group.create(name: 'Comunidad Hack')



#**********************************************************************************************************
# QUERYS
# Mostrar todos los usuarios de un grupo:
# Group.find_by_id(id).groups_users  

# Mostrar todos los grupos de un usuario:
# Users.find_by_id(id).groups_users  

# Mostrar todos los post de un grupo:
# Group.find_by_id(id).posts

# mostrar los comentarios de un post:
# post.find_by_id(id).comments

# Mostrar todos los post de un usuario:
# user.find_by_id(id).posts

# Aplausos de un comentario en un post
# Post.find_by_id(id).comments.find_by_id(id).user_comment_claps

# Aplausos de un post
# Post.find_by_id(id).user_post_claps

# Marcadores de un usuario
# User.find_by_id(id).user_post_bookmarks
#************************************************************************************************************
AdminUser.create!(email:'admin@example.com', password: 'password', password_confirmation:'password')

User.create([{name: 'Gian Marco', email: 'gianmandrioli@gmail.com', title: 'Estudiante' , mobile: '0424-251-6179', password: '123456', password_confirmation: '123456'},
    {name: 'Fernanda', email: 'fernanda@gmail.com', title: 'Estudiante' , mobile: '0424-251-6178', password: '123456', password_confirmation: '123456'},
    {name: 'Gabriel', email: 'gabriel@gmail.com', title: 'Estudiante' , mobile: '0424-251-6177', password: '123456', password_confirmation: '123456'},
    {name: 'Nelson', email: 'nelson@gmail.com', title: 'Estudiante' , mobile: '0424-251-6176', password: '123456', password_confirmation: '123456'}])
# { name: 'Fernanda', email: 'ferlagrange', title: 0 , mobile: '123456', password: '123456'},
# { name: 'Gabriel', email: 'gaboburgazzi', title: 1 , mobile: '222', password: 'dfdffddf'}])


Group.create([{ name: 'Comunidad Hack'},{ name: 'Grupo 2'},{ name: 'Grupo 3'},{ name:'Grupo 24' }])




GroupsUser.create([{user_id: 1, group_id: 1}, {user_id: 1, group_id: 2}, {user_id: 2, group_id: 1}, {user_id: 2, group_id: 2}, {user_id: 3, group_id: 2}, {user_id: 4, group_id: 3}])

Post.create([{user_id: 1 , group_id: 1 , title: 'Post 1: Me quede en el viaje' , text: 'No se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turistase nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista se nada soy turista' , category: 2 },
{user_id: 1 , group_id: 1 , title: 'Post 2: Fernanditamakeup' , text: 'rimmel', category: 1},
{user_id: 1 , group_id: 1 , title: 'Post 3: Gabo', text: 'ijsdidsioisoios',  category: 0},
{user_id: 2 , group_id: 4, title: 'Post 4: Hola', text: 'jhdidhuidcih', category: 0},
{user_id: 2 , group_id: 3, title: 'Post 5: grupodistinto', text: 'sdjijsdisd', category: 1},
{user_id: 1 , group_id: 2, title: 'Post 6: ddf', text: 'djdj', category: 1}])


comments = Comment.create([{ user_id: 1, post_id: 2, text: 'Comentario Gian en el Post 2' },
{ user_id: 2, post_id: 1, text: 'Comentario Fernanda en el Post 1' },
{ user_id: 1, post_id: 3, text: 'Comentario Gian en el Post 3' },
{ user_id: 2, post_id: 1, text: 'Comentario Fernanda en el Post 1' }])


# clapspost = UserPostClap.create([{user_id: 1, post_id: 1}, {user_id: 2, post_id: 1}])

# clapscomment = UserCommentClap.create([{user_id: 1, comment_id: 1}, {user_id: 2, comment_id: 1}])

# bookmarkpost = UserPostBookmark.create([{user_id: 1, post_id: 1}, {user_id: 1, post_id:2}]) AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?