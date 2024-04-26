# Read the dataset
data <- read.csv("C:/Users/LOHITH/Downloads/archive (6)/train.csv")

# Select relevant columns for clustering
selected_data <- data[, c("PassengerId", "Survived", "Pclass", "Sex", "Age", "SibSp", "Parch", "Fare")]


# Handling missing values if necessary
selected_data <- na.omit(selected_data)

# Convert categorical variables to factors if needed
selected_data$Sex <- as.factor(selected_data$Sex)

# Compute dissimilarity matrix using appropriate distance metric
library(cluster)
dissimilarity_matrix <- daisy(selected_data, metric = "gower")

# Perform k-medoids clustering
num_clusters <- 3  # Change this value as needed
kmedoids_result <- pam(dissimilarity_matrix, k = num_clusters)

# Extract cluster assignments
cluster_assignments <- kmedoids_result$clustering

# Visualize the clustering result if needed
plot(selected_data, col = cluster_assignments)
