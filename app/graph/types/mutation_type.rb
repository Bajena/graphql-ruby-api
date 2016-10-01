MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :CreateWod, field: WodMutations::CreateWod.field
  field :CreateWodFromPreset, field: WodMutations::CreateWodFromPreset.field

  field :RegisterUser, field: UserMutations::RegisterUser.field
end
