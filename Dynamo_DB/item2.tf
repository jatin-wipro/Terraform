resource "aws_dynamodb_table_item" "item2" {
    depends_on = [
               aws_dynamodb_table.basic-dynamodb-table
]

table_name = aws_dynamodb_table.basic-dynamodb-table.name
hash_key = aws_dynamodb_table.basic-dynamodb-table.hash_key
range_key = aws_dynamodb_table.basic-dynamodb-table.range_key


item =  <<ITEM
{
"UserId": {"N":"002"},
"GameTitle": {"S":"KnightRiders"},
"TopScore": {"N" : "20"}
}
ITEM
}

