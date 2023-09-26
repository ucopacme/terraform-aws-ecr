output "arn" {
  description = "Full ARN of the repository."
  value       = aws_ecr_repository.this.arn
}
output "name" {
  description = "Name of the repository."
  value       = aws_ecr_repository.this.name
}
output "registry_id" {
  description = "The account ID of the registry holding the repository."
  value       = aws_ecr_repository.this.registry_id
}
output "repository_url" {
  description = "The URL of the repository."
  value       = aws_ecr_repository.this.repository_url
}
