locals {
    final_name = "${var.project}-${var.environment}-${var.component}" 
    ec2_tags = merge(
        var.common_tags,
        {
            environment = var.environment   
            name = var.component
        }
    )
}


##we use locals as we cannot call variables inside the variables to create or attach
