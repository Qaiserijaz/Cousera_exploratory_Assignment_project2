# Read PM2.5 emissions dataset
emissions.df <- readRDS('summarySCC_PM25.rds')

# Read emission source classification dataset
scc.df <- readRDS('Source_Classification_Code.rds')


# Get the emissions in Baltimore City
baltimore.emissions.df = emissions.df[emissions.df$fips == '24510', ]

# Get the total emissions in Baltimore City by year
baltimore.emission.totals.by.year <- aggregate(Emissions ~ year, data = baltimore.emissions.df, FUN = sum)


# Open png device
png(filename='plot2.png', width=480, height=480, units='px')

# Print numeric values in fixed notation
options(scipen=10)

with(baltimore.emission.totals.by.year, {
        plot(year, Emissions, type = 'b',
             xlab="Year",
             ylab='PM2.5 Emissions (tons)',
             main='Total PM2.5 Emissions in Baltimore City')
})

# Close png device
dev.off()