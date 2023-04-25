# Taylor Swift Spotify Popularity Analysis
###### By: Aidan Rogers
###### Date: 4/25/2023

View this analysis here as an article.

## Table of Contents
* [Introduction](https://github.com/aidanrogers02/Taylor-Swift-Spotify-Popularity-Analysis/blob/main/README.md#introduction)
* [Ask](https://github.com/aidanrogers02/Taylor-Swift-Spotify-Popularity-Analysis/blob/main/README.md#ask)
* [Prepare](https://github.com/aidanrogers02/Taylor-Swift-Spotify-Popularity-Analysis/blob/main/README.md#prepare)
* [Process](https://github.com/aidanrogers02/Taylor-Swift-Spotify-Popularity-Analysis/blob/main/README.md#process)
* [Analyze](https://github.com/aidanrogers02/Taylor-Swift-Spotify-Popularity-Analysis/blob/main/README.md#analyze)
* [Share](https://github.com/aidanrogers02/Taylor-Swift-Spotify-Popularity-Analysis/blob/main/README.md#share)
* [Act](https://github.com/aidanrogers02/Taylor-Swift-Spotify-Popularity-Analysis/blob/main/README.md#act)

## Introduction
I love listening to Taylor Swift and I know many others do, seeing as how she is one of the most popular musicians in the world. I wanted to know what sort of factors influenced Taylor Swift’s popularity, and more specifically which of Taylor Swift’s albums are more popular than one another and why. Spotify offers data for artists that are on their platform and statistics that relate to the sonic qualities of the songs that these artists release. Using multiple data sets on Kaggle that feature these spotify statistics for Taylor Swift’s songs I decided to try and use my data analysis skills to find out if any of the sonic qualities of Taylor Swift’s songs lead to more popularity for her different albums. I performed this data analysis on Taylor Swift’s Spotify data following a common data analysis roadmap of ask, prepare, process, analysis, share, and act. 

The sonic qualities that I am referring to are… 

**Acousticness**: A confidence measure from 0.0 to 1.0 of whether the track is acoustic. 1.0 represents high confidence the track is acoustic.
**Danceability**: Describes how suitable a track is for dancing based on a combination of musical elements including tempo, rhythm stability, beat strength, and overall regularity. A value of 0.0 is least danceable and 1.0 is most danceable.
Loudness: The overall loudness of a track in decibels (dB). Loudness values are averaged across the entire track and are useful for comparing relative loudness of tracks.
**Energy**: Energy is a measure from 0.0 to 1.0 and represents a perceptual measure of intensity and activity. Typically, energetic tracks feel fast, loud, and noisy.
**Instrumentalness**: Predicts whether a track contains no vocals. “Ooh” and “aah” sounds are treated as instrumental in this context. Rap or spoken word tracks are clearly “vocal.” 
**Liveness**: Detects the presence of an audience in the recording. Higher liveness values represent an increased probability that the track was performed live. A value above 0.8 provides strong likelihood that the track is live.
**Speechiness**: This detects the presence of spoken words in a track. The more exclusively speech-like the recording (e.g. talk show, audio book, poetry), the closer to 1.0 the attribute value.
**Tempo**: The overall estimated tempo of a track in beats per minute (BPM). In musical terminology, tempo is the speed or pace of a given piece and derives directly from the average beat duration.
**Valence**: A measure from 0.0 to 1.0 describing the musical positiveness conveyed by a track. Tracks with high valence sound more positive (e.g. happy, cheerful, euphoric), while tracks with low valence sound more negative (e.g. sad, depressed, angry).

## Ask
To start I declared a guiding question to provide an aim for my analysis and work towards an ultimate goal like one would do in the industry as a data analyst. I created a business task as to how I would tackle this guided question.

**Guiding Question**: “How do the sonic qualities of Taylor Swift’s albums affect their popularity?”

**Business Task**: Determine if there are any trends that indicate if any of the sonic qualities of Taylor Swift’s albums impact their overall popularity. This could provide insights into what sounds Taylor Swift fans enjoy the most. 

**Hypothesis**: I think that popularity will be positively related to energy and will be negatively related to acousticness. Meaning that more energetic albums will be more popular and more acoustic albums will be less popular. 

## Prepare
My next step after initial questions was to prepare my data for processing and analysis. I looked into where the data came from, how it was formatted, and what the positive and negative qualities of the data were. 

### Data Location
* Data is stored in a CSV file 
* Data was pulled from a dataset on Kaggle

### Pros
* Data is mostly clean
* Data is pulled from a reliable source (Spotify)
* Data is on the smaller side and easier to work with
* No missing data for songs present

### Cons
* 3 of the albums I want to analyze are not included
* Some of the text is formatted poorly 
* Data has inconsistent types in some places

### Steps Moving Forward 
Trim white space from data 
Include 3 missing albums manually from another Kaggle data set
Make data for song names all string type
Make all data for dates date type

## Process 
After ensuring that the data was prepared I moved onto the processing phase. In the processing phase I decided what tools I was going to use moving forward in my analysis and data cleaning. Along with deciding what tools to use I cleaned my data and documented the process as I went to keep track of changes. Much of the data cleaning I did was performed in Excel, SQL, and R.

### Tools:
* Excel
* R
* SQL
* Tableau

### Cleaning Process
#### Excel
* Use the TRIM() function to trim the song names and remove unnecessary white space
* Use data from another csv file to include the 3 albums missing from this set of data, make sure all data from both sources are consistent with each other
* Change data type for all song names to be string
* Change release dates to be in date type format in YYYY-MM-DD format to make loading the data into R easier
#### SQL 
* Split data up into songs and albums tables
* Use two tables to normalize the data more and keep it consistent. This way the database will be ready to add more albums as Taylor Swift releases them
* Alter data types as needed 
#### R
* Load data into data frame
* Rename columns to use in R
* Split date values into year, month, day, and weekday to allow for working with these specific values in R

Here is a preview of the data to give an idea of how it looks 

![Preview of Clean Data](/data/clean_data_snapshot.PNG)

## Analysis
For this analysis I will specifically be trying to answer the guiding question of “How do the sonic qualities of Taylor Swift’s albums affect their popularity?” This guiding question gives us a goal to focus on and gives direction to the analysis. When you want to have a structured analysis that has more actionable insights, having a specific end goal in mind can be very useful.

For my analysis to find how the sonic qualities quantified by Spotify impacted the popularity of Taylor Swift’s albums I used all of the tools I decided on in the process phase (Excel, SQL, R, and Tableau) as well as different methods of analysis such as descriptive statistics and linear regression.

### Exploratory Analysis

I started with some exploratory analysis of the Taylor Swift data in Excel to find some trends when it came to popularity. I wanted to see where I should look to find what influences the popularity of her albums. A quick exploratory analysis of a data set gives you an idea of where to go next to reach the answer to your initial guided questions, and it gives you time to get more comfortable with the data. 

#### Average Popularity Per Album

I first started this exploration by plotting the popularity of Taylor’s albums and putting them in the order of release date. I found this measure of popularity by averaging out the popularity of every song in each album.

![tableau bar graph of popularity averages](/charts_graphs/Popularity_w_outlier.png)

As one can immediately notice there seems to be a general trend that the popularity of Taylor’s albums increase over time as the release dates become more recent, though there is a peak in popularity toward the middle of her discography with the albums reputation and Lover. This is an immediate sign that release date could very well be one of the contributing factors that impacts the popularity of Taylor Swift’s albums, but we will look more into this idea later.

#### Most Popular Song Per Album

Next, I wanted to look at some more stats when it came to popularity itself, for example seeing the most popular and least popular song on each of Taylor’s albums to see the range of popularity that each album seems to bring. 

![SQL most popular song on each album order by release_date](/charts_graphs/max_pop_song.PNG)

With this SQL query we find that 1989, Taylor Swift’s 2014 release, has the most popular of the most popular songs. Taylor Swift’s original 2008 version of Fearless features the least popular of the most popular songs. 

#### Least Popular Song Per Album

Next we look at the least popular song featured on each album.

![SQL least popular song on each album order by release_date](/charts_graphs/min_pop_album.PNG)

With this query we find that Midnights, Taylor’s most recent release, has the most popular song from this list and seems to have a very small range of popularity for its songs, only having a range of 77 to 70 with its most popular and least popular songs. We also find that 1989, the album featuring Taylor Swift’s most popular song also features her least popular with a popularity of 0. This popularity of 0 is likely an outlier though so we will look further into this song that has such a low popularity. Other than the 0 popularity song featured on 1989 the next least popular spot goes once again to the 2008 version of Fearless.

#### 0 Popularity Outliers

Let’s look further into that 0 popularity song that showed up on 1989 to see if there is some mistake with the data or simply an outlier we should keep in mind.

![SQL 0 popularity songs](/charts_graphs/0_popularity_songs.PNG)

When we query for all songs in Taylor’s discography that have a popularity of 0 we find that every one of these songs is a voice memo that is featured on the “deluxe” version of 1989. Seeing as how all of the voice memos have a popularity of 0 it seems as if the data is likely correct but an outlier we should look out for.

#### Least Popular Song Per Album Without Outliers

![SQL least popular song on each album order by release_date w/o 0](/charts_graphs/min_pop_album_no_0.PNG)

When we look at the minimum popularity song on each album once again this result seems much more in line with where the least popular song on 1989 would be.

#### Median and Average Populartiy Per Album Without Outliers

![SQL median and average popularity of songs w/o 0 pop](/charts_graphs/median_and_avg_pop.PNG)

And when we look at this table of the median and average popularity of each album in Taylor’s catalog, once we have taken the 0 popularity songs out, the average and median are nearly the same which indicates fewer outliers. As we can see, taking out the voice memos from our analysis seems to put 1989’s popularity more in line with where it should be, so we will exclude those songs from the rest of this analysis.

#### Taylor Swift's 10 Most Popular Songs

Now let us look a little further at the 10 most popular and 10 least popular songs in Taylor Swift’s catalog to get an idea of the songs in these extremes on either side.

![SQL 10 most popular](/charts_graphs/top_10_pop_songs.PNG)

Across the 10 most popular songs only 5 albums make an appearance: 1989, Lover, Red (Taylor’s Version), reputation, and Midnights. 1989 holds down the most popular song, with Blank Space, while Lover covers 4 spots in the top 10.

#### Taylor Swift's 10 Least Popular Songs

![SQL 10 least popular](/charts_graphs/10_least_pop.PNG)

Looking at the 10 least popular songs in Taylor’s discography we see a very apparent trend that her second album, Fearless (Platinum Edition), features all 10 of her least popular songs. We can clearly see why the original Fearless comes in last in popularity by a decent margin.

#### Distribution of Popularity Across Taylor Swift's Albums

Now, to observe the distribution of popularity for Taylor’s albums I put them into a box and whisker plot. As you can see the popularity of songs across their respective albums do seem to be pretty evenly distributed, especially after the songs with 0 popularity on 1989 were removed. You can notice this even distribution with how most of the albums in Taylor’s catalog have a small range for the whiskers (the lines protruding from the top and bottom of each album’s box)

![Tableau box and whisker plot of popularity w/o outliers](/charts_graphs/Popular_Box_Plot.png)

This even distribution should help to see if stylistic variances in albums truly do affect popularity across different albums. 

### Sonic Qualities vs Popularity 

Now that we have completed some basic exploratory analysis when it comes to the popularity of Taylor Swift’s albums, let’s move onto some slightly more advanced analysis. We will be utilizing linear regression in R to find if any of the sonic qualities that Spotify defines tend to have a relationship with the popularity of Talyor’s songs.

When using scatter plots with linear regression lines I found that most of the different sonic qualities do not have much of a strong trend. If there were a strong trend between popularity and any of the other variables the trend line seen on the graph would go straight towards the upper right corner of the graph but this does not tend to happen.

#### Valence vs Popularity

![Valence vs Popularity](/charts_graphs/R_pop_vs_valence.png)

As you can see this plot does not show any real trend relating the variable of valence to popularity and this occurs for most of the sound qualities as you can see below, with tempo and energy.

#### Tempo vs Popularity & Energy vs Popularity

![Tempo vs Popularity](/charts_graphs/R_pop_vs_tempo.png)
![Energy vs Popularity](/charts_graphs/R_pop_vs_energy.png)

The only sonic qualities that really do seem to relate positively to popularity are two I wanted to look more closely at, acousticness and danceability. 

#### Acousticness vs Popularity

![Acousticness vs Popularity in R](/charts_graphs/R_pop_vs_acoustic.png)

As we can see from this graph acousticess seems to be very slightly positively correlated with popularity, which runs contrary to my hypothesis that acousticness would have a negative relation to popularity of Taylor Swift’s songs and albums. The trend line is still not strong enough to consider that acousticness and popularity are closely related but they certainly are not inversely related either. 

#### Loudness vs Popularity

![Loudness vs Popularity](/charts_graphs/R_pop_vs_loud.png)

We were looking for which sonic qualities tend to be positively related to the popularity of Taylor Swift’s Music but it appears that we have found one that is decently inversely related. Loudness seems to be related to popularity in some way, but the louder a song is the less popular it is. This could be a key finding to keep in mind as songs being less loud might help them gain more popularity.  

#### Average Loudness Per Album

![Average Loudness Per Album Tableau](/charts_graphs/Average_Loudness.png)

Looking at the average loudness of albums you can notice that the less loud albums do tend to be more popular than the louder albums. Though, looking at this graph it might appear that Folklore and Evermore should be two of Taylor’s most popular, but looking below we can see that they are only Taylor’s eighth and sixth most popular albums respectively (notice how we are using the averages of popularity with outliers removed).

![Ranked Popularity Tableau](/charts_graphs/Ranked_Popularity.png)

So while loudness does have a relation with popularity it cannot really predict the most popular albums.

#### Danceability vs Popularity

Moving back to what attributes that are positively related to popularity we can take a look at how danceability is related to popularity (some labels were added to show some examples of the most and least danceable songs).

![Danceability vs Popularity in R](/charts_graphs/R_pop_vs_dance_w_points.png)

When we look at the plot of danceability vs popularity above we see that the closest positive relation between popularity and any of the sonic qualities of Taylor’s songs comes from danceability. There is not a super strong relation but the trend line seems to indicate there may be a slight relation between the danceability and the popularity of Taylor’s songs.

#### Average Danceabilty and Popularity & Median Danceability and Popularity

If we dig deeper into this relation between popularity and danceability in Taylor’s songs we start to notice there appears to be some sort of connection. Such as the average and median danceability being highest in the albums where the average and median popularity are the highest. 

![SQL showing average danceability and average popularity](/charts_graphs/avg_pop_avg_dance.PNG)

![SQL showing median danceability and median popularity](/charts_graphs/med_pop_med_dance.PNG)

Looking at these tables we do notice that the most danceable albums do seem to be the most popular, but the least danceable albums are not always the least popular. To look more closely at this relation let’s put it into a box and whisker plot to see a distribution of individual songs.

#### Danceability Distribution

![Danceability Distribution Plot](/charts_graphs/Danceability_Box_Plot.png)

As we see in the plot above, the most popular albums (1989, Lover, and Midnights) tend to have a majority of their songs over the median line of danceability across Taylor Swift’s albums. This might show that the secret ingredient in reaching the highest point of popularity for Taylor’s songs is how danceable they are, but once again these trends are not strong enough to be completely certain, nor does a lack of danceability necessarily reflect if an album will be unpopular seeing as how Taylor’s least popular albums are not her least danceable. 

### Release Date vs Popularity 

After going through how all of the sonic qualities of Taylor Swift’s albums relate to their popularity I saw that there was no strong enough trend to really know what the real key to each of her album’s popularity was besides maybe danceability and quietness helping a little. Not having found what sonic quality strongly relates to the popularity of Taylor’s albums I wanted to try and find another key factor tied to her albums that did in fact relate strongly to popularity. And looking back to our exploratory analysis it looked like that key factor might just be the release date.

#### Release Date vs Popularity

![Release Date vs Popularity in R](/charts_graphs/release_date_vs_pop.png)

Looking at this above chart it seems like we have found the strongest key element when it comes to one of Taylor’s songs. We had noticed before that release date seemed like a probable factor related to popularity, because although it is not a perfect measure the popularity of Taylor’s albums has generally increased over time. And as we noted earlier it does not necessarily mean that every subsequent album is more popular than the last, simply that Taylor’s later releases tend to be more popular than her earlier ones.

And now with the strongest trend shown in any of the scatter plots, release date seems to be the key to a song or album’s popularity. Knowing this fact in relation to how the Spotify defined sonic qualities relate to the popularity of a song we seem to be able to reach a solid conclusion to our popularity analysis. 

### Conclusion

Looking at the analysis we have done it would appear that the main thing relating to the popularity of a Taylor Swift album or song is when it was released. If one of Taylor’s songs or albums was released earlier in her career it is likely to be less popular than one that was released more recently, or later, in her career. 

Two other things that might impact the popularity of a Taylor Swift song or album are how loud or danceable either is. Less loud songs seem to be much more popular across Taylor’s song catalog. To be fair many of Taylor’s louder songs are in her earlier released albums, so popularity is still likely tied more to release date, but loudness does have some level of relation that we can see. And when it comes to danceability relating to popularity, this trend makes sense since a lot of popular radio singles are very danceable songs and many of Taylor’s biggest hits have this quality too. So, it might be possible that danceability could be an important factor in pushing a Taylor Swift song to be one of her most popular in relation to other songs released at a similar time. But, we must also keep in mind that danceability does not seem to have anywhere the level of impact on popularity as release date does, so release date remains the most important factor in terms of popularity.

With this analysis we can see that Taylor Swift has built a place for herself as a true mainstay in popular modern music. She has given herself the room to experiment with her sound or release new versions of old albums, like the Taylor’s Versions of Fearless and Red, with not just the same level of popularity as her older albums, but an increasing level of popularity. Taylor Swift has created a name and legacy for herself that only increases her popularity as she continues her career, no matter the stylistic changes she brings to her sound between albums. 

## Share 
With all of the preparation and analysis complete I put a brief summary of my key findings into a PowerPoint to make the results easily presentable. This way I could more quickly and easily communicate the results I had to any interested parties. You can find the link to the PowerPoint below.

PowerPoint Link: https://drive.google.com/file/d/1gnRda8p8otkFVySlm9vDFtNCEACyHW2I/view?usp=sharing

Along with the PowerPoint I created a Tableau Dashboard as another summary of the data I found, but this one is interactive if the user wants to dig deeper into the results I found.

Tableau Link: https://public.tableau.com/app/profile/aidanrogers02/viz/TaylorSwiftPopularityDataAnalysis/TaylorSwiftAlbumAnalysis3

## Act 
To wrap up the analysis of Taylor Swift’s Spotify data I will end with a reminder of the key findings of our analysis and steps that I could take moving forward to learn even more.

### Key Findings
1. Acousticness does not seem to have any apparent relationship with popularity
2. Loudness seems to have slight negative relationship with popularity 
3. Danceability seems to have a slight positive relationship with popularity 
4. Release date is the biggest key factor when it comes to the popularity of a Taylor Swift release

### Steps Moving Forward
* Add new albums to the analysis as they come out
* Look into how the Spotify defined sonic qualities related to one another
* Look further into popularity trends across Taylor Swift’s career

## References
Kaggle Dataset 1: 
Kaggle Dataset 2: 
Spotify Definitions

## Important files
R code file: 
SQL code file: 
Tableau file: 
