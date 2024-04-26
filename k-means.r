
# Read the dataset
data <- read.csv("C:/Users/LOHITH/Downloads/archive (6)/train.csv")

# Select relevant columns for clustering
selected_data <- data[, c("PassengerId", "Survived", "Pclass", "Age", "SibSp", "Parch", "Fare")]

# Handling missing values if necessary
selected_data <- na.omit(selected_data)

# Convert relevant columns to numeric if needed
selected_data <- sapply(selected_data, as.numeric)

# Perform k-means clustering
k <- 3  # Number of clusters
kmeans_result <- kmeans(selected_data, centers = k)

# Extract cluster assignments
cluster_assignments <- kmeans_result$cluster

# Visualize the clustering result if needed
plot(selected_data, col = cluster_assignments)
