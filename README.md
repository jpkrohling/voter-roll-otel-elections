# Voter roll for the OpenTelemetry Governance Committee elections

This repository contains scripts and instructions on how to get and prepare the voter roll for an OpenTelemetry Governance Committee election.

The `voter-roll.csv` file in this repository was obtained in the following manner:

1. Go to the "[Developer Activity Counts by Repository group](https://opentelemetry.devstats.cncf.io/d/9/developer-activity-counts-by-repository-group-table?orgId=1)" dashboard
2. Select "Last year" as the time range
3. On the data panel, open the drop-down menu and click "Edit". 
![image](https://user-images.githubusercontent.com/13387/193104317-f392ce5c-282c-4810-8898-9c54a672138d.png)
4. Use the query from the `query.sql` file.
5. Download the CSV file as `voter-roll.csv`

Once we know who is eligible to vote, we need to upload that to Helios and notify people on the related GitHub issue.

## Uploading to Helios

1. Run the `./generate-data-for-helios.sh` script
2. Open the election in Helios, click on "voters and ballots" and upload the generated file

## Preparing the GitHub comments

We want to notify eligible folks about the election, and the best way to achieve that is by pinging them via GitHub. The election should have an issue already that can be used for that, like [#852](https://github.com/open-telemetry/community/issues/852). However, GitHub limits the number of notifications sent per comment.

The script `create-github-comments.sh` will make comments on a specified issue, with 50 people being mentioned in each comment. The script has defaults that would work for the 2022 elections, except that it defaults to the "dry-run mode". In this mode, it will print out the messages that it would comment. To run the script so that it actually makes the comments, run:

```
./create-github-comments.sh -d false
```