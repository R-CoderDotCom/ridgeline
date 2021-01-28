# ridgeline
A function for creating ridgeline plots in base R

## Why this package?

I created this package beacause I wanted to add the function on a document without displaying the full code and because I think there is no other package implementing ridgeline plots in base R. However, I recommend you using [ggridges](https://cran.r-project.org/web/packages/ggridges/) (for ggplto2), which have more features than this package.

The package is based on [a code by Karolis Koncevicius](http://karolis.koncevicius.lt/posts/r_base_plotting_without_wrappers/).

## Installation

```r
# install.packages("remotes")
remotes::install_github("R-CoderDotCom/ridgeline@main")
```

## Usage

### Basic ridgeline plot
```r
# Numeric variable
x <- chickwts$weight

# Categorical variable
y <- chickwts$feed

# Default ridgeline plot
ridgeline(x, y)
```

<p align="center">
 <img src="https://user-images.githubusercontent.com/67192157/106154522-fb500b80-617f-11eb-87ea-dd0e6c67e7e8.png">
</p>

### Bandwidth selection
```r
# Numeric variable
x <- chickwts$weight

# Categorical variable
y <- chickwts$feed

# Default ridgeline plot
ridgeline(x, y, bw = 50)
```

<p align="center">
 <img src="https://user-images.githubusercontent.com/67192157/106157056-9649e500-6182-11eb-9578-deb3d6f426c2.png">
</p>



### Colors customization

```r
# Numeric variable
x <- chickwts$weight

# Categorical variable
y <- chickwts$feed

# Default ridgeline plot
ridgeline(x, y,
          palette = hcl.colors(6, palette = "viridis", alpha = 0.9), # Colors of the areas
          border = hcl.colors(6, palette = "viridis", alpha = 0.9))  # Border colors for the areas
```

<p align="center">
 <img src="https://user-images.githubusercontent.com/67192157/106155408-f17ad800-6180-11eb-86dd-f014000a10fb.png">
</p>

```r
# Numeric variable
x <- chickwts$weight

# Categorical variable
y <- chickwts$feed

# Default ridgeline plot
ridgeline(x, y,
          col = 4) # Color of the horizontal lines
```

<p align="center">
 <img src="https://user-images.githubusercontent.com/67192157/106155704-40287200-6181-11eb-832b-c81a093681c2.png">
</p>



### Custom labels

```r
# Numeric variable
x <- chickwts$weight

# Categorical variable
y <- chickwts$feed

ridgeline(x, y,
          labels = c("c", "h", "l", "m", "s", "s"))
```

<p align="center">
 <img src="https://user-images.githubusercontent.com/67192157/106156908-669add00-6182-11eb-92e0-c15bc51616bb.png">
</p>

### Add the mode

```r
# Numeric variable
x <- chickwts$weight

# Categorical variable
y <- chickwts$feed

ridgeline(x, y,
          mode = TRUE)
```

<p align="center">
 <img src="https://user-images.githubusercontent.com/67192157/106157163-b5487700-6182-11eb-96f4-46532612930d.png">
</p>


