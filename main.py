from Model.usuarios import Users

if __name__ == '__main__':
    u = Users("suporte", "@suporte")
    u.login()

    u1 = Users("admin", "admin")
    u1.login()