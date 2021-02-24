resource "aws_route_table" "public-crt" {
    vpc_id = aws_vpc.main.id
    route {
        //associated subnet can reach everywhere
        cidr_block = "0.0.0.0/0" 
        //CRT uses this IGW to reach internet
        gateway_id = aws_internet_gateway.igw.id
    }
    
    tags = {
        Name = "public-crt"
    }
}

resource "aws_route_table_association" "prod-crta-public-subnet-1"{
    subnet_id = aws_subnet.subnet-public-1.id
    route_table_id = aws_route_table.public-crt.id
}

resource "aws_route_table_association" "prod-crta-public-subnet-2"{
    subnet_id = aws_subnet.subnet-public-2.id
    route_table_id = aws_route_table.public-crt.id
}

resource "aws_route_table_association" "prod-crta-public-subnet-3"{
    subnet_id = aws_subnet.subnet-public-3.id
    route_table_id = aws_route_table.public-crt.id
}

resource "aws_route_table_association" "prod-crta-public-subnet-4"{
    subnet_id = aws_subnet.subnet-public-4.id
    route_table_id = aws_route_table.public-crt.id
}