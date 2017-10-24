# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

client = Client.create({name: 'Ricardo', 
                        email: 'teste@teste.com',
                        observations: 'criado automaticamente',
                        phone: '1234'})
                        
discount = Discount.create([{title: 'Desconto Helloween',
                            value: 10,
                            discount: 1},
                            {title: 'Desconto Natal',
                            value: 20,
                            discount: 0}
                          ])

supplier = Supplier.create({name: 'Pedigree',
                            observations: 'Marca Tradicional',
                            email: 'pedigree@pedigree.com',
                            phone: 1234})

service = Service.create([{title:'Banho e Tosa',
                          description: 'Serviço de Banho e tosa para Cães e 
                          Gatos.',
                          price: 55.00,
                          observations: 'De segunda a sabado'},
                          {title:'Banho',
                          description: 'Serviço de Banho Cães e 
                          Gatos.',
                          price: 35.00,
                          observations: 'De segunda a sabado'},
                          {title:'Tosa',
                          description: 'Serviço de Tosa para Cães e 
                          Gatos.',
                          price: 35.00,
                          observations: 'De segunda a sabado'}
                          ])

product = Product.create({title: 'Ração Pedigree para Cães - 15kg',
                          description: 'A melhor ração para cães do Brasil!',
                          price: '140.00',
                          observations: 'Para cães adultos',
                          supplier: Supplier.last})


# campaign = Campaign.create({

# })