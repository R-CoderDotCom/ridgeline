#' @title Ridgeline plot
#'
#' @param x Numeric variable.
#' @param y Categorical variable.
#' @param bw Bandwidth value or method. See `?density` for more details.
#' @param mode Whether to display the modes or not
#' @param main Title of the plot
#' @param xlab X-axis title of the plot
#' @param ylab Y-axis title of the plot
#' @param col Color of the horizontal lines for each group
#' @param border Color of the borders of the densities
#' @param lty Line type of the border of the densities
#' @param lwd Line width of the border of the densities
#' @param bty Box type of the plot
#' @param labels If specified, overrides the labels of the Y-axis
#' @param palette Color, colors or a color palette for the density areas
#'
#' @importFrom grDevices hcl.colors
#' @importFrom graphics abline axis box mtext par plot.new plot.window polygon segments title
#' @importFrom stats density
#'
#' @export
ridgeline <- function(x, y, bw = "nrd0", mode = FALSE, main, xlab, ylab, col = "gray", border,
                      lty = 1, lwd = 1, bty = "o", labels = NULL, palette) {

  if(missing(main)){
    main <- NULL
  }

  if(missing(xlab)){
    xlab <- NULL
  }

  if(missing(ylab)){
    ylab <- NULL
  }

  dens <- tapply(x, y, density, bw = bw)

  xs <- Map(getElement, dens, "x")
  ys <- Map(getElement, dens, "y")
  ys <- Map(function(x) (x - min(x)) / max(x - min(x)) * 1.5, ys)
  ys <- Map(`+`, ys, length(ys):1)

  op <- par(no.readonly = TRUE)
  par(mar = c(5.1, 5.1, 4.1, 2.1))
  plot.new()
  plot.window(xlim = range(xs), ylim = c(1, length(ys) + 1.5))
  abline(h = length(ys):1, col = col)

  if(missing(palette)) {
    cols <- hcl.colors(length(ys), "Zissou", alpha = 0.8)
  } else {

    if(length(palette) == 1) {
      cols <- rep(palette, length(ys))
    } else {
      cols <- palette
    }

  }

  if(missing(border)) {
    border <- rep(1, length(ys))
  } else {

    if(length(border) == 1) {
      border <- rep(border, length(ys))
    } else {
      border <- border
    }

  }

  if(isTRUE(mode)) {
    modes <-  unlist(Map(which.max, ys))

    sapply(1:length(dens), function(i) {
      polygon(xs[[i]], ys[[i]], col = cols[i], border = border[i], lty = lty, lwd = lwd)
      segments(x0 = xs[[i]][modes[i]], x1 = xs[[i]][modes[i]], y0 = (length(ys):1)[i], y1 = as.numeric(Map(max, ys))[i], col = 1, lty = 2, lwd = 2)
    })


  } else {
    Map(polygon, xs, ys, col = cols, border = border)
  }

  axis(1, tck = -0.015)

  if(!is.null(labels)) {
    if(length(labels) != length(names(dens))){
      stop("The number of labels must be equal to the number of groups")
    } else {
      mtext(labels, 2, at = length(ys):1, las = 2, padj = 0, line = 0.5)
    }
  } else {
    mtext(names(dens), 2, at = length(ys):1, las = 2, padj = 0, line = 0.5)
  }

  title(main, xlab, ylab, adj = 0, cex = 0.8)
  box(bty = bty)
  par(op)
}



