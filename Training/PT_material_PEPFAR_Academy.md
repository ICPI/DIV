### Intro to Data Manipulation
#### Section 1: How to look at MER data in Excel

1.  Your mission, should you choose to accept **(Imran)**
    - aka background story, but fun!
    - sample 'real-life' question to solve
    - quick note on excel version
1.  [What is a pivot table? **(Aaron)**](https://github.com/ICPI/DIV/blob/master/Training/PT_material_PEPFAR_Academy.md#2-what-is-a-pivot-table-aaron)
    - Appearance - could look similar, but purpose is different
    - Raw data compared to summary
    - Purpose/Benefits
      - summarize Data
      - unique values
      - dyanmic tables
      - filtering
      - updates with new datasets
1.  Why and when to use a pivot table? **(Catherine)**
    - difference between standard platforms
1.  [Data structure (tidy data) **(Aaron)**](https://github.com/ICPI/DIV/blob/master/Training/PT_material_PEPFAR_Academy.md#4-data-structure-tidy-data-aaron)
    - standard/consistent way to organize data in datasets
    - facilitate data exploration
    - principles (Wickham)
      - Each variable must have its own column.
      - Each observation must have its own row.
      - Each value must have its own cell.
1. Accessing and downloading data **(Shazad)**
    - MSD (will use training dataset)- see release notes in Pano
    - Accessing through Panorama
    - Accessing throough DATIM Genie extracts
    - Unzipping downloaded dataset and renaming, if needed (for scripts)
    - Import text file steps
1. How to create a pivot table  **(Shazad)**
    - 'Insert pivot table' button
    - Ensure correct range is picked up
    - Mention conversion to excel table will be discussed in different vid
1. Different parts of a pivot table  **(Katya)**
1. Structural options **(Katya)**
    - different views - tabular, outline
1. Filtering **(Shaylee)**
    - adding fields to "FILTER" box
1. Including Slicers **(Shaylee)**
    - SLICER button
    - reporting connections
1. What are calculated indicators and how to create them **(Imran)**
    - percent achievement
    - yield
1. Building pivot charts **(Shazad)**
    - Benefits of pivot chart
    - Pivot chart button
    - Hiding all fields
1. Components to consider when building an Excel tool **(Shazad)**
    - converting raw data to 'excel table' first
    - naming the pivot tables
    - tab structure of Excel tool
    - 'refresh' the data
1. Link to resources (ICPI Onboarding Training) **( )**


###  2. What is a pivot table? **(Aaron)**

Pivoting is the process of shifting something around with the aim of repositioning it for another use or for access.

Pivot tables are a built in feature or Excel that allow the user to start exploring larger datasets/tables. Setting up or working with a pivot table may seem like a daunting task for those unfamiliar but they are actually quite intuitive and user friendly.

What’s required is having Excel and data in it. To make your data more useable, you’ll want to have a long and tidy dataset which will better facilitate the process of exploring your data. We’ll get into this in later modules.

A pivot table is important because it takes large amounts of data and summarizes it for us, breaking into groups to better answer our questions.

For instance, we may have a partners dataset on testing over a 3 month period in a the districts it works in. Reviewing the raw data or trying to count it manually is highly inefficient and only become more inefficient the larger the data is.

We can use a pivot table to summarize this dataset. By using a pivot table, we can quickly see that there were X number of tests in the quarter. We can break this down and see that X were Males. We can even quickly see the positivity across the quarter is X% and X% for males and females respectively.

An additional benefit of pivot tables is their structure. If we get new data for the second quarter, we can pop that in and update or refresh the pivot tables. This allows us to setup our exploratory analysis once instead of repeating the same process each quarter.

In sum, pivot tables allow us to take raw data, aggregate it up, and summarize it across different groupings or filters.

### 4. Data structure (tidy data) **(Aaron)**

Structure is important across any data used, but particularly important when using pivot tables. It create consistency, which makes it easy to use, understand, and explore the variables and their relationships.

As data consumers, we are mostly presented with summary tables in reports or graphics. It’s a bit difficult to get use to changing hats to be a data user and having to think about and use “raw.” To assist in our data exploration and usage, we need to structure the data in a (a) long and (b) tidy format.

Let start with long. We can think about this as a vertically oriented. This structure may seem foreign and more difficult for you, the human to read, but it facilitates manipulating via the computer. [show example of long v wide].

A more difficult piece for a newcomer to get their head around is tidy data. data tables can be structured a number of different ways and still contain the same underlying data. That said, we want to make the data easy to manipulate and use.

> A dataset is a collection of values, usually either numbers (if quantitative) or strings (if qualitative). Values are organised in two ways. Every value belongs to a variable and an observation. A variable contains all values that measure the same underlying attribute (like height, temperature, duration) across units. An observation contains all values measured on the same unit (like a person, or a day, or a race) across attributes....
> A general rule of thumb is that it is easier to describe functional relationships between variables (e.g., z is a linear combination of x and y, density is the ratio of weight to volume) than between rows, and it is easier to make comparisons between groups of observations (e.g., average of group a vs. average of group b) than between groups of columns.... -H.Wickham

I tidy data set then is defined as the following:

1. Each variable forms a column.
1. Each observation forms a row.
1. Each type of observational unit forms a table.

Tidy data makes it easy to scan the dataset as a human and analyze for the computer as “... the layout ensures that values of different variables from the same observation are always paired.”

Common problems we see with messy datasets:
- Column headers are values, not variable names.
- Multiple variables are stored in one column.
- Variables are stored in both rows and columns.
- Multiple types of observational units are stored in the same table.
- A single observational unit is stored in multiple tables.

[examples]

Structuring the data you’re using to be long and tidy, will make it much easier to use pivot tables.

[examples of messy v tidy data with a pivot table]

[Reference: Hadley Wickham’s Tidy Data](https://vita.had.co.nz/papers/tidy-data.pdf)
