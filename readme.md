## Steps

0. **Hi! 👋** Let’s get started!
 
----------------------
 
1. If you’re using GitHub CLI for the first time, Download and 
   install [GitHub CLI][2]. 
   ```sh
   # Authenticate by running the command:  
   gh auth login 
   # Verify the authentication status:  
   gh auth status
   ```

----------------------
 
2. Modify the [license file][101]. 
   ```sh
   # Get List of common repository licenses
   gh repo license list

   # Get template
   gh repo license view MIT > "license.md"
   ```
   > You can also **choose the type of license** you want to use by 
   visiting [ChooseALicense.com][3], and update the license section 
   accordingly.

----------------------

3. Modify [./CODEOWNERS][104] and [./.github/CODEOWNERS][105]

----------------------
 
4. Copy the template file [./src/terraform.tfvars.template][102].
   and paste the copied file into the same directory and rename 
   it to [./src/terraform.tfvars][103]:
   ```sh
   cp "./src/terraform.tfvars.template" "./src/terraform.tfvars"
   ```
 
----------------------
 
5. Create a [new GitHub Personal Access Token][1], and update the `github_token` 
   variable in [./src/terraform.tfvars][103] with the generated token.

## Note

### import existing repository
```sh
terraform import github_repository.$github_name $repo_name
# example
terraform import github_repository.tmslpm terra-gh
```
> https://registry.terraform.io/providers/integrations/github/latest/docs/resources/repository#import

<!-------------------------------------------------------------->
[1]: <https://github.com/settings/tokens> "Open GitHub Personal Access Tokens settings to create or manage tokens."
[2]: <https://cli.github.com/> "Open the official GitHub CLI page for installation and documentation." 
[3]: <https://choosealicense.com/> "Open the official ChooseALicense.com to choose an open source license."
[101]: <./license.md> "Path to the license file: `./license.md`. (local)"
[102]: <./src/terraform.tfvars.template> "Path to the template file used for initializing variables: `./src/terraform.tfvars.template`. (local)"
[103]: <./src/terraform.tfvars> "Path to the variables file: `./src/terraform.tfvars`. (local)"
[104]: <./CODEOWNERS> "Path to code owners file"
[105]: <./.github/CODEOWNERS> "Path to code owners file"
