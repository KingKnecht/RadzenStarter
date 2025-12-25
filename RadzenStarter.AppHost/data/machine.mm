%% Generated with Stately Studio
stateDiagram-v2
    Editing --> PrepareApproval : Request Approval
    PrepareApproval --> RestoreProject : Error
    RestoreProject.SetPreviousProjectCurrentProject --> Editing : Ok
    PrepareApproval.GenerateDocuments --> Approval : Ok
    Released --> PrepareNextEdit : Request Change
    PrepareNextEdit.CopyProject --> Editing : Ok
    Approval.WaitingApprove --> RestoreProject : Rejected
        state "PrepareApproval"  {
            PrepareApproval.CopyProject --> PrepareApproval.LockProject : Ok
            PrepareApproval.LockProject --> PrepareApproval.IncreaseVersion : Ok
            PrepareApproval.IncreaseVersion --> PrepareApproval.GenerateDocuments : Ok
        }
        state "Approval" as Approval {
            Approval.WaitingApprove --> Approval.WaitingApprove : Approved
        }
        state "RestoreProject" as RestoreProject {
            RestoreProject.DeleteProjectCopy --> RestoreProject.SetPreviousProjectCurrentProject : Ok
        }
