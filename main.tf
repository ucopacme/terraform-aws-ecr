data "aws_iam_policy_document" "assume_by_ecr" {
  statement {
    sid     = ""
    effect  = "Allow"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["codebuild.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "ecr" {
  name               = "${var.name}-ECR-role"
  assume_role_policy = data.aws_iam_policy_document.assume_by_ecr.json
}

resource "aws_ecr_repository" "this" {
  name                 = join("-", [var.name, "ecr"])
  image_tag_mutability = var.image_tag_mutability
}

resource "aws_ecr_lifecycle_policy" "main" {
  repository = aws_ecr_repository.this.name

  policy = jsonencode({
    rules = [{
      rulePriority = 1
      description  = "keep last 10 images"
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
