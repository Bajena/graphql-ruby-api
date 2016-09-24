QueryType = GraphQL::ObjectType.define do
  name "Query"
  description "The query root for this schema"
  field :node, field: NodeIdentification.field

  field :wod do
    type WodType
    argument :id, !types.ID

    resolve -> (_obj, args, _ctx) { Wod.find(args[:id]) }
  end

  connection :wods, WodType.connection_type do
    resolve -> (_obj, _args, _ctx) { Wod.all }
  end

  connection :movements, MovementType.connection_type do
    resolve -> (_obj, _args, _ctx) { Movement.all }
  end

  field :user do
    type UserType
    argument :id, !types.ID
    resolve -> (_obj, args, _ctx) { User.find(args[:id]) }
  end
end
