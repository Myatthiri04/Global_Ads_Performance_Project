#check you working directory
getwd()
#import your .csv file to your Global Enivornment. 
GlobalPerformance<-read.csv("Global_Ads_CSV")
#can import from Excel as well by using "import dataset"
read_csv("global_ads_performance_dataset")
library()
ads_data<-read_csv("global_ads_performance_dataset.csv")
#you have to add .csv to read csv files
str(ads_data)
summary(ads_data)
ads_data<-na.omit(ads_data)
ads_data$date<-as.Date(ads_data$date,format("%Y-%m-%d"))
#changing the date format to year,month and day
ads_data$CTR_percent<-ads_data$CTR*100
#changing the CTR into percentages since they are in decimals,also for ROAS
ads_data$ROAS_percent<-ads_data$ROAS*100
head(ads_data[,c("CTR", "CTR_percent","ROAS", "ROAS_percent")])
#checking the  first few rows, looking if the codes are working and have made new ones or not
summary(ads_data)
str(ads_data)
revenue_by_country <- aggregate(revenue~country,data = ads_data,sum)
#aggregate revenue by country 
revenue_by_country<-revenue_by_country[order(-revenue_by_country$revenue),]
#sort desecending 
head(revenue_by_country)
#showing top rows
revenue_by_platform<-aggregate(revenue~platform,data = ads_data,sum)
revenue_by_platform<-revenue_by_platform[order(-revenue_by_platform$revenue),]
head(revenue_by_platform)
revenue_by_campaign<-aggregate(revenue~campaign_type,data = ads_data,sum)
revenue_by_campaign<-revenue_by_campaign[order(-revenue_by_campaign$revenue),]
head(revenue_by_campaign)
revenue_by_industry<-aggregate(revenue~industry,data = ads_data,sum)
revenue_by_industry<-revenue_by_industry[order(-revenue_by_industry$revenue),]
top_5_industries<-head(revenue_by_industry,5)
top_5_industries
#checking the top 5
head(top_5_industries)
model<-lm(revenue~impressions+clicks+ad_spend,data = ads_data)
summary(model)
predicted<-predict(model,ads_data)
#making predict revenue using the model
plot(ads_data$revenue,predicted,
     xlab = "Actual Revenue",
     ylab = "Predicted Revenue",
     main = "Actual vs Predicted Revennue",
     col="blue",pch=16)
#making the scatter graph
abline(0,1,col="red")
#putting the perfect prediction line 

#Aggregate Data for Tableau
summary_table<-aggregate(cbind(impressions,clicks,conversions,revenue,CPC,CPA,ROAS)~
                           platform+country+campaign_type+industry,
                         data = ads_data,sum)
#creating average CTPR and ROAS percentages 
summary_table$Avg_CTR<-aggregate(CTR~platform+country+campaign_type+industry,
                                 data = ads_data,FUN=mean)$CTR*100
summary_table$Avg_ROAS<-aggregate(ROAS~platform+country+campaign_type+industry,
                                 data = ads_data,FUN=mean)$ROAS*100
head(summary_table)
#saving as CSV for Tableau
write.csv(summary_table,"ads_summary_for_tableau.csv",row.names=FALSE)
getwd()
