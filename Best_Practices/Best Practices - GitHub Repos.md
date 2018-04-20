

## ICPI GitHub Repositories

### What is a repository?

[Github](https://help.github.com/articles/github-glossary/) defines a repository, or repo, as the following:
 > A repository is the most basic element of GitHub. They're easiest to imagine as a project's folder. A repository contains all of the project files (including documentation), and stores each file's revision history. Repositories can have multiple collaborators and can be either public or private.

Put simply, a repository is a substantive project. It hosts all (or most) of the code, data, and documentation used for a particular task or project. As a result, it makes your work (a) collaborative, (b) transparent, and (c) easily accessible, as well as (d) provides a source of version control.

ICPI has a organizational account on GitHub, which allows us to collaborate more easily by [grouping all of our repos in one location](https://github.com/ICPI) where we all have access to contribute to and collaborate with other ICPI analyst and their work.

### When should I create a repository?

At ICPI, we have stood up repositories for each of our clusters to improve project management, capitalizing on Github's functionality of tracking tasks via ["Issues"](https://guides.github.com/features/issues/). Typically, the standard practice is to have one repository for every project so that each project is self contained. We will have a proliferation of repos if we create one for every project that comes to ICPI, so we've tried to lay out a few guidelines as when it's best to create a new repo. And, if you are unsure, it's always good to ask and get a second opinion.
- Frequency
  - :no_entry_sign: One time requests, eg subsetting a dataset. This should instead be stored in the related cluster's repo.
  - :heavy_check_mark: Analysis that is ongoing or required quarterly/annually.
- Usage
  - :no_entry_sign: Analysis done for self or agency that doesn't serve the broader ICPI.
  - :moneybag: Scripts or tools that help other analysis or field members perform their tasks more efficiency.
  - :moneybag: Development around an ICPI tool or analysis.
- Complexity
  - :no_entry_sign: Code that is focused on relatively straight forward tasks such as simply subsetting a dataset.
  - :moneybag: Multiple data sources and scripts requires to conduct analysis.
  - :moneybag: R functions
- Audience
  - :no_entry_sign: Self
  - :no_entry_sign: Trainings where the product is simiply a presentation
  - :moneybag: ICPI or field colleagues

### What should I include in my repository?

After you create a repository, it's your role to populate it and maintain it. Below are some critical items that must be included in your repo.

- README - When you generate a repo, your first task should be to create a [README.md file](https://guides.github.com/features/wikis/). This file serves as documentation around what your project is about. Information here should be substantive and kept up to date.
- Link to source data - While much of the data we work with is SBU and cannot be posted, you still have an obligation to document what data you are using and where it is sourced. You should add this informnation to a README.md in your `RawData` folder.
- Code - The whole purpose of Github is around version control and collaboration of code. You should be posting your code in a relevant folder (eg `R`, `Scripts`, `DoFiles`, etc). This makes your code transparent and accessible.
- Documents (non-sbu) and other contextual information - If you need further space to document contextual information, do so by including documents or other relevant information in a `Documents` folder or in the GitHub wiki.
- .gitignore - Lastly, you should also include a .gitignore, which allows you to ignore certain types of files or folder on your git/GitHub commits
