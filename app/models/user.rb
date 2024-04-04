# email:string
# password: string

class User < ApplicationRecord
    has_secure_password
end
