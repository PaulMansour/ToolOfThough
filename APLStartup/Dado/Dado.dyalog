:Namespace
   ⍝ *******************************************
   ⍝ This is a Dado system generated file.
   ⍝ *******************************************
   ⎕IO ⎕ML←0 3
   ∇z←List
   z←⎕NS¨28⍴⊂''
   z.Name←'AddRemote' 'About' 'Build' 'Commit' 'CreateProject' 'Checkout' 'CheckoutMaster' 'DeleteBranch' 'DependencyReport' 'NewFeatureBranch' 'MergeFeatureBranch' 'PushMaster' 'PullMaster' 'ReleaseNewVersion' 'RebaseFeatureBranch' 'RebaseContinue' 'RunGitCommand' 'RunTests' 'ShowBranches' 'ShowCommitSummary' 'ShowCommitDetail' 'SourceCode' 'ShowChanges' 'ShowHistory' 'ShowProjects' 'ShowTags' 'Version' 'OpenProject'
   z.Group←'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado' 'dado'
   z.Desc←'AddRemote' 'About' 'Build' 'Commit' 'CreateProject' 'Checkout' 'CheckoutMaster' 'DeleteBranch' 'DependencyReport' 'NewFeatureBranch' 'MergeFeatureBranch' 'PushMaster' 'PullMaster' 'ReleaseNewVersion' 'RebaseFeatureBranch' 'RebaseContinue' 'RunGitCommand' 'RunTests' 'ShowBranches' 'ShowCommitSummary' 'ShowCommitDetail' 'SourceCode' 'ShowChanges' 'ShowHistory' 'ShowProjects' 'ShowTags' 'Version' 'OpenProject'
   z.Parse←'' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' '' ''
   ∇
   Help←{
     (GetProject 0).UCMD.Help ⍵
   }
   Run←{
     (GetProject 0).UCMD.Run ⍵
   }
   GetProject←{
     f←SALT_Data.SourceFile
     n←1⊃⎕NPARTS f
     0=⎕SE.⎕NC 'zApps.',n:LoadProject f
     a←⎕SE.zApps⍎n
     a⍎n
   }
   LoadProject←{
      p n←2↑⎕NPARTS ⍵
      s←⍎('zApps.',n)⎕SE.⎕NS ''
      _←s.⎕CY p,n,'.dws'
      s.ApplicationFolder←p
      a←s.Dado.Main
      m←s⍎n
      c←m.AcreConfig
      _←⍎'⎕SE.',n,'←a.GetAPISpace m'
      m
   }
:EndNamespace
