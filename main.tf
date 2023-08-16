resource "aws_ecr_repository" "this" {
  name                 = join("-", [var.name])
  image_tag_mutability = var.image_tag_mutability
}

resource "aws_ecr_lifecycle_policy" "main" {
  repository = aws_ecr_repository.this.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = var.description
      action = {
        type = "expire"
      }
      selection = {
        tagStatus   = "any"
        countType   = "imageCountMoreThan"
        countNumber = var.countnumber
      }
    }]
  })
}
