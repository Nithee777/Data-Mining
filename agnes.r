# Read the dataset
data <- read.csv("C:/Users/LOHITH/Downloads/archive (6)/train.csv")

# Select relevant columns for clustering
selected_data <- data[, c("PassengerId", "Survived", "Pclass", "Age", "SibSp", "Parch", "Fare")]

# Handling missing values if necessary
selected_data <- na.omit(selected_data)

# Convert relevant columns to numeric if needed
selected_data <- sapply(selected_data, as.numeric)

# Perform CLARA clustering
library(cluster)
num_clusters <- 3  # Number of clusters
clara_result <- clara(selected_data, k = num_clusters)

# Extract cluster assignments
cluster_assignments <- clara_result$clustering

# Visualize the clustering result if needed
plot(selected_data, col = cluster_assignments)


# Select relevant columns for clustering
selected_data <- data[, c("PassengerId", "Survived", "Pclass", "Age", "SibSp", "Parch", "Fare")]

# Handling missing values if necessary
selected_data <- na.omit(selected_data)

# Convert relevant columns to numeric if needed
selected_data <- sapply(selected_data, as.numeric)

# Compute distance matrix
distance_matrix <- dist(selected_data)

# Perform AGNES clustering
library(cluster)
agnes_result <- agnes(distance_matrix)

# Plot the dendrogram
plot(agnes_result, main = "Dendrogram: Hierarchical Clustering (AGNES)")
