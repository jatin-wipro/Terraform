resource "aws_dynamodb_table_item" "item1" {
    depends_on = [
               aws_dynamodb_table.basic-dynamodb-table
]

table_name = aws_dynamodb_table.basic-dynamodb-table.name
hash_key = aws_dynamodb_table.basic-dynamodb-table.hash_key
range_key = aws_dynamodb_table.basic-dynamodb-table.range_key



item =  <<ITEM
{
"UserId": {"N":"001"},
"GameTitle": {"S":"GameChangers"},
"TopScore": {"N" : "10"}
}
ITEM
}
