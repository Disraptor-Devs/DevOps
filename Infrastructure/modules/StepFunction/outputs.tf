// Outputs for the IAM Role
output "iam_role_name" {
  description = "The name of the IAM role created for Step Functions"
  value       = aws_iam_role.step_function_role.name
}

output "iam_role_arn" {
  description = "The ARN of the IAM role created for Step Functions"
  value       = aws_iam_role.step_function_role.arn
}

output "iam_role_id" {
  description = "The ID of the IAM role created for Step Functions"
  value       = aws_iam_role.step_function_role.id
}

// Outputs for the IAM Policy
output "iam_policy_name" {
  description = "The name of the IAM policy created for Step Functions"
  value       = aws_iam_policy.sf_policy.name
}

output "iam_policy_arn" {
  description = "The ARN of the IAM policy created for Step Functions"
  value       = aws_iam_policy.sf_policy.arn
}

output "iam_policy_id" {
  description = "The ID of the IAM policy created for Step Functions"
  value       = aws_iam_policy.sf_policy.id
}

// Outputs for the IAM Role Policy Attachment
output "role_policy_attachment_role" {
  description = "The name of the IAM role to which the policy is attached"
  value       = aws_iam_role_policy_attachment.policy_sf_attach.role
}

output "role_policy_attachment_policy_arn" {
  description = "The ARN of the policy attached to the IAM role"
  value       = aws_iam_role_policy_attachment.policy_sf_attach.policy_arn
}

// Outputs for the Step Function State Machine
output "state_machine_name" {
  description = "The name of the Step Function state machine"
  value       = aws_sfn_state_machine.state_machine.name
}

output "state_machine_arn" {
  description = "The ARN of the Step Function state machine"
  value       = aws_sfn_state_machine.state_machine.arn
}

output "state_machine_id" {
  description = "The ID of the Step Function state machine"
  value       = aws_sfn_state_machine.state_machine.id
}
